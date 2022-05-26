▶ Index Skip Scan을 이용한 I/O 비효율 해소
#####################################################################################################

2008년 1월~12월까지 월별로 10만개(총 120만개) 판매 데이터
판매구분은 'A'가 10만개, 'B'가 110만개
  
create table cust_sales
as
select rownum                                      cust_id
     , '2008' || lpad(ceil(rownum/100000), 2, '0') month
     , decode(mod(rownum, 12), 1, 'A', 'B')        idx
     , round(dbms_random.value(1000,100000), -2)   amount
  from dual
connect by level <= 1200000 ;

exec dbms_stats.gather_table_stats(user, 'CUST_SALES');

select /*+ gather_plan_statistics */ count(*)
  from cust_sales t
 where idx = 'A'
   and month between '200801' and '200812';

--------------------------------------------------------------------------------------------------
| Id  | Operation          | Name            | E-Rows | Cost (%CPU)| E-Time   | A-Rows | Buffers |
--------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |                 |        |  1068 (100)|          |      1 |    3836 |
|   1 |  SORT AGGREGATE    |                 |      1 |            |          |      1 |    3836 |
|*  2 |   TABLE ACCESS FULL| CUST_SALES      |  94048 |  1068   (1)| 00:00:13 |    100K|    3836 |
--------------------------------------------------------------------------------------------------

create index cust_sales_idx1 on cust_sales(idx, month) tablespace example_idx1;

select /*+ index(t(idx, month)) */ count(*)
  from cust_sales t
 where idx = 'A'
   and month between '200801' and '200812';

--------------------------------------------------------------------------------------------------
| Id  | Operation          | Name            | E-Rows | Cost (%CPU)| E-Time   | A-Rows | Buffers |
--------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |                 |        |   266 (100)|          |      1 |     281 |
|   1 |  SORT AGGREGATE    |                 |      1 |            |          |      1 |     281 |
|*  2 |   INDEX RANGE SCAN | CUST_SALES_IDX1 |  94048 |   266  (1) | 00:00:04 |    100K|     281 |
--------------------------------------------------------------------------------------------------
▶281개의 블럭 I/O 발생, 테이블 액세스는 발생하지 않음

select /*+ index_ss(t(idx, month)) */ count(*)
  from cust_sales t
 where idx = 'A'
   and month between '200801' and '200812';

------------------------------------------------------------------------------------------------
| Id  | Operation        | Name            | E-Rows | Cost (%CPU)| E-Time   | A-Rows | Buffers |
------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT |                 |        |  5724 (100)|          |      1 |     281 |
|   1 |  SORT AGGREGATE  |                 |      1 |            |          |      1 |     281 |
|*  2 |   INDEX SKIP SCAN| CUST_SALES_IDX1 |    103K|  5724   (1)| 00:01:09 |    100K|     281 |
------------------------------------------------------------------------------------------------


create index cust_sales_idx2 on cust_sales(month, idx) tablespace example_idx1;

select /*+ opt_param('_optimizer_skip_scan_enabled','FALSE') index(t(month, idx)) */ count(*)
  from cust_sales t
 where idx = 'A'
   and month between '200801' and '200812';

--------------------------------------------------------------------------------------------------
| Id  | Operation          | Name            | E-Rows | Cost (%CPU)| E-Time   | A-Rows | Buffers |
--------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |                 |        |  3353 (100)|          |      1 |    3090 |
|   1 |  SORT AGGREGATE    |                 |      1 |            |          |      1 |    3090 |
|*  2 |   INDEX RANGE SCAN | CUST_SALES_IDX2 |  94048 |  3353  (1) | 00:00:41 |    100K|    3090 |
--------------------------------------------------------------------------------------------------
▶테이블 액세스는 발생하지 않지만 3,090개의 블럭 I/O 발생함
  이유는 인덱스 선두 컬럼이 Between 조건이어서 판매구분이 'B' 인 레코드까지 모두 스캔했기 때문임

select /*+ index(t(month, idx)) */ count(*)
  from cust_sales t
 where idx = 'A'
   and month in ('200801', '200802', '200803', '200804', '200805', '200806'
                ,'200807', '200808', '200809', '200810', '200811', '200812' ) ;

--------------------------------------------------------------------------------------------------
| Id  | Operation          | Name            | E-Rows | Cost (%CPU)| E-Time   | A-Rows | Buffers |
--------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |                 |        |   257 (100)|          |      1 |     304 |
|   1 |  SORT AGGREGATE    |                 |      1 |            |          |      1 |     304 |
|   2 |   INLIST ITERATOR  |                 |        |            |          |    100K|     304 |
|*  3 |    INDEX RANGE SCAN| CUST_SALES_IDX2 |  94039 |   257   (0)| 00:00:04 |    100K|     304 |
--------------------------------------------------------------------------------------------------
▶IN List로 변환에는 3,090개의 블럭 I/O가 304개로 감소(인덱스 브랜치 블럭을 12번 반복탐색하는 비효율)

select /*+ index_ss(t(month, idx)) */ count(*)
  from cust_sales t
 where idx = 'A'
   and month between '200801' and '200812' ;
   
--------------------------------------------------------------------------------------------------
| Id  | Operation          | Name            | E-Rows | Cost (%CPU)| E-Time   | A-Rows | Buffers |
--------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |                 |        |  1690 (100)|          |      1 |     300 |
|   1 |  SORT AGGREGATE    |                 |      1 |            |          |      1 |     300 |
|*  2 |   INDEX SKIP SCAN  | CUST_SALES_IDX2 |  97060 |  1690   (1)| 00:00:21 |    100K|     300 |
--------------------------------------------------------------------------------------------------
▶300개의 블럭 I/O 발생함. 선두 컬럼이 Between 이어서 나머지 검색 조건을 만족하는 데이터들이 멀리 떨어진
  경우 Index Skip Scan 으로써 효과를 볼 수 있는 전형적인 케이스

▶인덱스 CF
INDEX_NAME        TABLE_BLOCKS      NUM_ROWS         CLUSTERING_FACTOR
----------------- ----------------- ---------------- -----------------
CUST_SALES_IDX1                3899          1200000              7660
CUST_SALES_IDX2                3899          1200000              7670