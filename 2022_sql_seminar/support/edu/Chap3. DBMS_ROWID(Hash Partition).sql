★★★ dbms_rowid ★★★

[테스트 시나리오]
기존에 입력되어 있는 Source 테이블을 기준으로 emp_hash 테이블은 empno 컬럼을 기준으로 Hash Partition(16개 Partition), 
emp_tong 테이블은 일반 테이블 형태로 Source 테이블을 empno 컬럼을 Order By 처리해서 입력함

- Oracle
select block_no                                                  select block_no                                              
     , count(distinct empno) as cnt                                   , count(distinct empno) as cnt                          
  from (select empno                                               from (select empno                                         
             , dbms_rowid.rowid_object(rowid) object                          , dbms_rowid.rowid_object(rowid) object         
             , dbms_rowid.rowid_relative_fno(rowid) file_no                   , dbms_rowid.rowid_relative_fno(rowid) file_no  
             , dbms_rowid.rowid_block_number(rowid) block_no                  , dbms_rowid.rowid_block_number(rowid) block_no 
             , dbms_rowid.rowid_row_number(rowid) row_number                  , dbms_rowid.rowid_row_number(rowid) row_number 
          from emp_hash e ) a                                              from emp_tong e ) a                                
 group by block_no                                                group by block_no                                           
 order by 2 desc;                                                 order by 2 desc;                                            
                                                                                                                              
 BLOCK_NO  CNT                                                    BLOCK_NO  CNT                                               
--------- ----                                                   --------- ----                                               
    32036    5                                                       45897    5                                               
    33137    5                                                       44637    4                                               
    30505    5                                                       44669    4                                               
    31001    5                                                       45119    4                                               
    31249    5                                                       46049    4                                               
(...중간 생략)                                                    (...중간 생략)                                               

1차 쿼리 결과를 보면 Block 1개당 들어가 있는 empno의 값들 갯수는 거의 비슷함을 알 수 있음
각 해당 Block에 실제로 들어가 있는 empno 값들의 분포를 살펴보면 다음과 같음

select empno, count(*) as cnt                                   select empno, count(*) as cnt                                 
  from (select empno                                              from (select empno                                        
             , dbms_rowid.rowid_object(rowid) object                         , dbms_rowid.rowid_object(rowid) object        
             , dbms_rowid.rowid_relative_fno(rowid) file_no                  , dbms_rowid.rowid_relative_fno(rowid) file_no 
             , dbms_rowid.rowid_block_number(rowid) block_no                 , dbms_rowid.rowid_block_number(rowid) block_no
             , dbms_rowid.rowid_row_number(rowid) row_number                 , dbms_rowid.rowid_row_number(rowid) row_number
          from emp_hash e ) a                                             from emp_tong e ) a                               
 where block_no = 32036                                          where block_no = 45897                                     
 group by empno                                                  group by empno                                             
 order by 1;                                                     order by 1;                                                

   EMPNO  CNT                                                      EMPNO  CNT 
-------- ----                                                   -------- ----
     144    5                                                       5012    1
     272    9                                                       5013   60
     280   60                                                       5014   60
     304   60                                                       5015   60
     305   43                                                       5016    1 

(결론)
2개 테이블을 기준으로 테스트 해보면 Hash 파티션의 경우 1개의 Block내에 Hash Partition Key Column 기준으로 
데이터가 분산되어 있지만 일반 테이블의 경우 empno 컬럼의 순서대로 동일 Block에 들어가 있음을 알 수 있다.
Hot Block이 발생할 경우 Hash Partition으로 분산시키는 이유가 여기에 있음

- Tibero : Tibero는 Oracle과 dbms_rowid의 패키지 사용법이 좀 다름
select block_no                                                select block_no                                                
     , count(distinct empno) as cnt                                 , count(distinct empno) as cnt                            
  from (select empno                                             from (select empno                                           
             , dbms_rowid.rowid_segment(rowid) object                       , dbms_rowid.rowid_segment(rowid) object          
             , dbms_rowid.rowid_to_relative_fno(rowid) file_no              , dbms_rowid.rowid_to_relative_fno(rowid) file_no 
             , dbms_rowid.rowid_block_number(rowid) block_no                , dbms_rowid.rowid_block_number(rowid) block_no   
             , dbms_rowid.rowid_row_number(rowid) row_number                , dbms_rowid.rowid_row_number(rowid) row_number   
          from emp_hash e ) a                                            from emp_tong e ) a                                  
 group by block_no                                              group by block_no                                             
 order by 2 desc;                                               order by 2 desc;                                              

 BLOCK_NO  CNT                                                    BLOCK_NO  CNT                                               
--------- ----                                                   --------- ----                                               
       69  338                                                       13618  335
      117  337                                                       13617  335
      101  337                                                       13622  335
       85  337                                                       13623  334
       53  337                                                       13613  334
(...중간 생략)                                                    (...중간 생략)                                               

위와 동일한 패턴으로 확인해 보면 아래와 같음 

   EMPNO  CNT                                                      EMPNO  CNT
-------- ----                                                   -------- ----
       1   56                                                         81   40
       2   56                                                         82   56
       5   56                                                         83   56
       7   56                                                         84   18
      11   56                                                       2870   37
      21    1                                                       2871   56
      22   56                                                       2872   56
      42    1                                                       2873   16
