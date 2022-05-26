�ڡڡ� dbms_rowid �ڡڡ�

[�׽�Ʈ �ó�����]
������ �ԷµǾ� �ִ� Source ���̺��� �������� emp_hash ���̺��� empno �÷��� �������� Hash Partition(16�� Partition), 
emp_tong ���̺��� �Ϲ� ���̺� ���·� Source ���̺��� empno �÷��� Order By ó���ؼ� �Է���

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
(...�߰� ����)                                                    (...�߰� ����)                                               

1�� ���� ����� ���� Block 1���� �� �ִ� empno�� ���� ������ ���� ������� �� �� ����
�� �ش� Block�� ������ �� �ִ� empno ������ ������ ���캸�� ������ ����

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

(���)
2�� ���̺��� �������� �׽�Ʈ �غ��� Hash ��Ƽ���� ��� 1���� Block���� Hash Partition Key Column �������� 
�����Ͱ� �л�Ǿ� ������ �Ϲ� ���̺��� ��� empno �÷��� ������� ���� Block�� �� ������ �� �� �ִ�.
Hot Block�� �߻��� ��� Hash Partition���� �л��Ű�� ������ ���⿡ ����

- Tibero : Tibero�� Oracle�� dbms_rowid�� ��Ű�� ������ �� �ٸ�
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
(...�߰� ����)                                                    (...�߰� ����)                                               

���� ������ �������� Ȯ���� ���� �Ʒ��� ���� 

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
