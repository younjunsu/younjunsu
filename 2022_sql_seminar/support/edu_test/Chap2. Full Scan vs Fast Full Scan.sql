�� Index Full Scan vs. Index Fast Full Scan
#####################################################################################################

Multiblock I/O, ���� ��ĵ ����(��, �ε����� ���Ե� �÷����θ� ��ȸ�� �� ��밡��)
ALTER SESSION SET EVENTS '10046 trace name context forever, level 12'; �� Wait Event ����

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

(���)
Index Full Scan�� Index Fast Full Scan�� ����ð����� �׷��� ���� ���̴� ���� ������ Index Full Scan �ÿ���
db file sequential read(single block io)�� 4,887ȸ �����Ͽ���, Index Fast Full Scan �ô� db file scattered
read(multi block io)�� �� 55ȸ �߻��Ͽ���. �� Index Fast Full Scan ������� ����ÿ��� �ѹ� Disk I/O��
�߻��� ������ ��� 89���� ����� �� �ø� ���� �� �� �ִ�.(4911/55 = 89)