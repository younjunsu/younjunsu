▶ Index Full Scan vs. Index Fast Full Scan
#####################################################################################################

Multiblock I/O, 병렬 스캔 가능(단, 인덱스에 포함된 컬럼으로만 조회할 때 사용가능)
ALTER SESSION SET EVENTS '10046 trace name context forever, level 12'; 로 Wait Event 측정

create index big_table_idx on big_table (object_name);
show parameter multiblock;

NAME                                 TYPE                   VALUE
------------------------------------ ---------------------- ------------------------------
db_file_multiblock_read_count        integer                128

alter system flush buffer_cache;
alter session set events '10046 trace name context forever, level 12';
select /*+ index(b, big_table_idx) */ count(object_name)
  from big_table b;
alter session set events '10046 trace name context off';

call     count       cpu    elapsed       disk      query    current        rows
------- ------  -------- ---------- ---------- ---------- ----------  ----------
Parse        1      0.00       0.00          3          3          0           0
Execute      1      0.00       0.00          0          0          0           0
Fetch        2      0.33       0.33       4887       4887          0           1
------- ------  -------- ---------- ---------- ---------- ----------  ----------
total        4      0.33       0.34       4890       4890          0           1

Rows     Row Source Operation
-------  ---------------------------------------------------
      1  SORT AGGREGATE (cr=4887 pr=4887 pw=0 time=0 us)
1000000   INDEX FULL SCAN BIG_TABLE_IDX (cr=4887 pr=4887 pw=0 time=1485599 us cost=5005 card=915932)


Elapsed times include waiting on following events:
  Event waited on                             Times   Max. Wait  Total Waited
  ----------------------------------------   Waited  ----------  ------------
  SQL*Net message to client                       2        0.00          0.00
  db file sequential read                      4887        0.00          0.06
  SQL*Net message from client                     2        0.00          0.00
********************************************************************************

alter system flush buffer_cache;
alter session set events '10046 trace name context forever, level 12';
select /*+ index_ffs(b, big_table_idx) */ count(object_name)
  from big_table b;
alter session set events '10046 trace name context off';

call     count       cpu    elapsed       disk      query    current        rows
------- ------  -------- ---------- ---------- ---------- ----------  ----------
Parse        1      0.00       0.00          3          3          0           0
Execute      1      0.00       0.00          0          0          0           0
Fetch        2      0.20       0.19       4908       4923          0           1
------- ------  -------- ---------- ---------- ---------- ----------  ----------
total        4      0.20       0.20       4911       4926          0           1

Rows     Row Source Operation
-------  ---------------------------------------------------
      1  SORT AGGREGATE (cr=4923 pr=4908 pw=0 time=0 us)
1000000   INDEX FAST FULL SCAN BIG_TABLE_IDX (cr=4923 pr=4908 pw=0 time=1147573 us cost=1360 card=915932)


Elapsed times include waiting on following events:
  Event waited on                             Times   Max. Wait  Total Waited
  ----------------------------------------   Waited  ----------  ------------
  SQL*Net message to client                       2        0.00          0.00
  db file scattered read                         55        0.00          0.01
  SQL*Net message from client                     2        0.00          0.00
********************************************************************************

(결과)
Index Full Scan과 Index Fast Full Scan의 실행시간에는 그렇게 많은 차이는 나지 않지만 Index Full Scan 시에는
db file sequential read(single block io)가 4,887회 발행하였고, Index Fast Full Scan 시는 db file scattered
read(multi block io)가 단 55회 발생하였음. 즉 Index Fast Full Scan 방식으로 수행시에는 한번 Disk I/O가
발생할 때마다 평균 89개의 블록을 퍼 올린 것을 알 수 있다.(4911/55 = 89)