[환경 구성]
drop index emp_ix01;
drop index emp_ix02;
drop index emp_ix03;
drop index emp_ix04;

create index emp_ix01 on emp (sal   );
create index emp_ix02 on emp (deptno);
create index emp_ix03 on emp (deptno, sal  );
create index emp_ix04 on emp (deptno,	ename, sal desc);

[공통]
delete plan_table where statement_id = 'tune_test';

commit;

explain plan set statement_id = 'tune_test' into plan_table
for
select /*+ 힌트 사용 */ 
       e.sal, d.dname
  from emp e, dept d
 where e.deptno = d.deptno;
 
select lpad(' ', 2 * level) || operation 
    || decode(object_owner, '', '' , ' ' || object_owner || '.')
    || decode(object_name , '', '' , object_name)
    || decode(cost        , '', '' , ' (cost=' || cost)  
    || decode(cardinality , '', ')', ', card=' || cardinality || ')') as plan
  from plan_table
 start with id = 1 and statement_id = 'tune_test'
 connect by prior id = parent_id and statement_id = 'tune_test'
 order by id;

[Quiz 1] 위의 쿼리를 사용하여 아래의 결과를 도출하시오(힌트 사용)
 ① INDEX JOIN
 ② DEPT 테이블 FULL SCAN 유도
 ③ EMP의 EMP_IX04 인덱스 사용 유도

PLAN
---------------------------------------------------------
  INDEX JOIN (cost=24, card=14)
    TABLE ACCESS (FULL) TIBERO.DEPT (cost=23, card=4)
    INDEX (RANGE SCAN) TIBERO.EMP_IX04 (cost=2, card=3)  

[Quiz 2] 위의 쿼리를 사용하여 아래의 결과를 도출하시오(힌트 사용)
 ① HASH JOIN
 ② DEPT 테이블 FULL SCAN 유도
 ③ EMP의 EMP_IX04 인덱스 사용 유도(Index Range Scan이 아닌 Index Fast Full Scan)

PLAN
--------------------------------------------------------------
  HASH JOIN (cost=29, card=14)
    TABLE ACCESS (FULL) TIBERO.DEPT (cost=23, card=4)
    INDEX (FAST FULL SCAN) TIBERO.EMP_IX04 (cost=6, card=14)  

[Quiz 3] 위의 쿼리를 사용하여 아래의 결과를 도출하시오
 ① INDEX JOIN
 ② DEPT 테이블 INDEX SCAN 유도
 ③ EMP의 EMP_IX04 인덱스 사용 유도(Index Range Scan)
 ④ 인덱스 스캔시 사용된 컬럼의 구성과 사용된 컬럼의 개수를 표시

PLAN                                                                                      SEARCH_COLUMNS
----------------------------------------------------------------------------------------- --------------
  INDEX JOIN (cost=4, card=14)
    TABLE ACCESS (ROWID) TIBERO.DEPT (cost=3, card=4)
      INDEX (FULL) TIBERO.PK_DEPT (cost=2, card=4) - DEPTNO
    INDEX (RANGE SCAN) TIBERO.EMP_IX04 (cost=2, card=3) - DEPTNO, ENAME, SAL DESC                      1  



################################################################################################
answer Quiz 1
################################################################################################
delete plan_table where statement_id = 'tune_test';
commit;
explain plan set statement_id = 'tune_test' into plan_table
for
select /*+ INDEX(e emp_ix04) FULL(d) LEADING(d,e)  */ 
       e.sal, d.dname
  from emp e, dept d
 where e.deptno = d.deptno;
 
 
select lpad(' ', 2 * level) || operation 
    || decode(object_owner, '', '' , ' ' || object_owner || '.')
    || decode(object_name , '', '' , object_name)
    || decode(cost        , '', '' , ' (cost=' || cost)  
    || decode(cardinality , '', ')', ', card=' || cardinality || ')') as plan
  from plan_table
 start with id = 1 and statement_id = 'tune_test'
 connect by prior id = parent_id and statement_id = 'tune_test'
 order by id;
PLAN
--------------------------------------------------------------------------------
  INDEX JOIN (cost=13, card=14)
    TABLE ACCESS (FULL) SCOTT.DEPT (cost=12, card=4)
    INDEX (RANGE SCAN) SCOTT.EMP_IX03 (cost=2, card=3)

################################################################################################
# TIBERO 7
SQL ID: 85kdyw8vjj18g
Child number: 91
Plan hash value: 2713919349
Execution Plan
--------------------------------------------------------------------------------
   1  INDEX JOIN (Cost:13, %%CPU:0, Rows:14) 
   2    TABLE ACCESS (FULL): DEPT (Cost:12, %%CPU:0, Rows:4) 
   3    INDEX (RANGE SCAN): EMP_IX04 (Cost:2, %%CPU:0, Rows:3) 

Predicate Information
--------------------------------------------------------------------------------
   3 - access: ("E"."DEPTNO" = "D"."DEPTNO") (0.250)

Note
--------------------------------------------------------------------------------
   2 - dynamic sampling used for this table (13 blocks)
   3 - dynamic sampling used for this table (13 blocks)

NAME                                VALUE
------------------------------ ----------
db block gets                         294
consistent gets                        53
physical reads                          0
redo size                               0
sorts (disk)                            0
sorts (memory)                          5
rows processed                         14
################################################################################################
# TIBERO 6
SQL ID: 85kdyw8vjj18g
Child number: 1233
Plan hash value: 3803283235
Execution Plan
--------------------------------------------------------------------------------
   1  INDEX JOIN (Cost:23, %%CPU:0, Rows:1) 
   2    TABLE ACCESS (FULL): DEPT (Cost:22, %%CPU:0, Rows:1) 
   3    INDEX (RANGE SCAN): EMP_IX04 (Cost:2, %%CPU:0, Rows:1) 

Predicate Information
--------------------------------------------------------------------------------
   3 - access: ("E"."DEPTNO" = "D"."DEPTNO") (0.002)

NAME                                VALUE
------------------------------ ----------
db block gets                         294
consistent gets                       213
physical reads                          0
redo size                             360
sorts (disk)                            0
sorts (memory)                          5
rows processed                          0
SQL> 


################################################################################################
# ORACLE 11.2.0.1.0
Execution Plan
----------------------------------------------------------
Plan hash value: 111163845
-------------------------------------------------------------------------------
| Id  | Operation    | Name     | Rows  | Bytes | Cost (%CPU)| Time     |
-------------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |        |    14 |   280 |     5  (20)| 00:00:01 |
|*  1 |  HASH JOIN      |        |    14 |   280 |     5  (20)| 00:00:01 |
|   2 |   TABLE ACCESS FULL| DEPT     |     4 |    52 |     3  (0)| 00:00:01 |
|   3 |   INDEX FULL SCAN  | EMP_IX04 |    14 |    98 |     1  (0)| 00:00:01 |
-------------------------------------------------------------------------------
Predicate Information (identified by operation id):
---------------------------------------------------
   1 - access("E"."DEPTNO"="D"."DEPTNO")

Statistics
----------------------------------------------------------
     1  recursive calls
     0  db block gets
     9  consistent gets
     0  physical reads
     0  redo size
   781  bytes sent via SQL*Net to client
   524  bytes received via SQL*Net from client
     2  SQL*Net roundtrips to/from client
     0  sorts (memory)
     0  sorts (disk)
    14  rows processed




################################################################################################
answer Quiz 2
################################################################################################
delete plan_table where statement_id = 'tune_test';
commit;
explain plan set statement_id = 'tune_test' into plan_table
for
select /*+ INDEX_FFS(e emp_ix04) FULL(d) LEADING(d,e) USE_HASH(d,e)  */ 
       e.sal, d.dname
  from emp e, dept d
 where e.deptno = d.deptno;
 
 
select lpad(' ', 2 * level) || operation 
    || decode(object_owner, '', '' , ' ' || object_owner || '.')
    || decode(object_name , '', '' , object_name)
    || decode(cost        , '', '' , ' (cost=' || cost)  
    || decode(cardinality , '', ')', ', card=' || cardinality || ')') as plan
  from plan_table
 start with id = 1 and statement_id = 'tune_test'
 connect by prior id = parent_id and statement_id = 'tune_test'
 order by id;
PLAN
--------------------------------------------------------------------------------
  HASH JOIN (cost=24, card=14)
    TABLE ACCESS (FULL) SCOTT.DEPT (cost=12, card=4)
    COLUMN PROJECTION (cost=12, card=14)
      INDEX (FAST FULL SCAN) SCOTT.EMP_IX04 (cost=12, card=14)
################################################################################################
# TIBERO 7
Execution Plan
--------------------------------------------------------------------------------
   1  HASH JOIN (Cost:24, %%CPU:0, Rows:14) 
   2    TABLE ACCESS (FULL): DEPT (Cost:12, %%CPU:0, Rows:4) 
   3    COLUMN PROJECTION (Cost:12, %%CPU:0, Rows:14) 
   4      INDEX (FAST FULL SCAN): EMP_IX04 (Cost:12, %%CPU:0, Rows:14) 

Predicate Information
--------------------------------------------------------------------------------
   1 - access: ("D"."DEPTNO" = "E"."DEPTNO") (0.250)

Note
--------------------------------------------------------------------------------
   2 - dynamic sampling used for this table (13 blocks)
   4 - dynamic sampling used for this table (13 blocks)
################################################################################################
# TIBERO 6
SQL ID: 4p2wsbcmwt791
Child number: 1240
Plan hash value: 4213423823
Execution Plan
--------------------------------------------------------------------------------
   1  HASH JOIN (Cost:28, %%CPU:0, Rows:1) 
   2    TABLE ACCESS (FULL): DEPT (Cost:22, %%CPU:0, Rows:1) 
   3    INDEX (FAST FULL SCAN): EMP_IX04 (Cost:6, %%CPU:0, Rows:1) 

Predicate Information
--------------------------------------------------------------------------------
   1 - access: ("D"."DEPTNO" = "E"."DEPTNO") (0.002)

NAME                                VALUE
------------------------------ ----------
db block gets                         294
consistent gets                         7
physical reads                          0
redo size                               0
sorts (disk)                            0
sorts (memory)                          5
rows processed                          0


################################################################################################
# ORACLE 11.2.0.1.0
Execution Plan
----------------------------------------------------------
Plan hash value: 3336678769
----------------------------------------------------------------------------------
| Id  | Operation       | Name    | Rows  | Bytes | Cost (%CPU)| Time    |
----------------------------------------------------------------------------------
|   0 | SELECT STATEMENT      |   |    14 |   280 |     6  (17)| 00:00:01 |
|*  1 |  HASH JOIN         |   |    14 |   280 |     6  (17)| 00:00:01 |
|   2 |   TABLE ACCESS FULL   | DEPT    |     4 |    52 |     3   (0)| 00:00:01 |
|   3 |   INDEX FAST FULL SCAN| EMP_IX04 |    14 |    98 |     2   (0)| 00:00:01 |
----------------------------------------------------------------------------------
Predicate Information (identified by operation id):
---------------------------------------------------
   1 - access("E"."DEPTNO"="D"."DEPTNO")

Statistics
----------------------------------------------------------
     0  recursive calls
     0  db block gets
    12  consistent gets
     0  physical reads
     0  redo size
   781  bytes sent via SQL*Net to client
   523  bytes received via SQL*Net from client
     2  SQL*Net roundtrips to/from client
     0  sorts (memory)
     0  sorts (disk)
    14  rows processed
NAME                                VALUE
------------------------------ ----------
db block gets                           3
consistent gets                        16
physical reads                          0
redo size                               0
sorts (disk)                            0
sorts (memory)                          0
rows processed                         14



################################################################################################
answer Quiz 3
################################################################################################
delete plan_table where statement_id = 'tune_test';
commit;
explain plan set statement_id = 'tune_test' into plan_table
for
select /*+ INDEX(d PK_DEPT, e emp_ix04) LEADING(d,e) */ 
       e.sal, d.dname
  from emp e, dept d
 where e.deptno = d.deptno;
 
 
select lpad(' ', 2 * level) || operation 
    || decode(object_owner, '', '' , ' ' || object_owner || '.')
    || decode(object_name , '', '' , object_name)
    || decode(cost        , '', '' , ' (cost=' || cost)  
    || decode(cardinality , '', ')', ', card=' || cardinality || ')') as plan
  from plan_table
 start with id = 1 and statement_id = 'tune_test'
 connect by prior id = parent_id and statement_id = 'tune_test'
 order by id;
PLAN
--------------------------------------------------------------------------------
  INDEX JOIN (cost=4, card=14)
    TABLE ACCESS (ROWID) SCOTT.DEPT (cost=3, card=4)
      INDEX (FULL) SCOTT.PK_DEPT (cost=2, card=4)
    INDEX (RANGE SCAN) SCOTT.EMP_IX03 (cost=2, card=3)
################################################################################################
# TIBERO 7
SQL ID: gazqgwg53ufw7
Child number: 92
Plan hash value: 362762573
Execution Plan
--------------------------------------------------------------------------------
   1  INDEX JOIN (Cost:4, %%CPU:0, Rows:14) 
   2    TABLE ACCESS (ROWID): DEPT (Cost:3, %%CPU:0, Rows:4) 
   3      INDEX (FULL): PK_DEPT (Cost:2, %%CPU:0, Rows:4) 
   4    INDEX (RANGE SCAN): EMP_IX03 (Cost:2, %%CPU:0, Rows:3) 

Predicate Information
--------------------------------------------------------------------------------
   4 - access: ("D"."DEPTNO" = "E"."DEPTNO") (0.250)

Note
--------------------------------------------------------------------------------
   3 - dynamic sampling used for this table (13 blocks)
   4 - dynamic sampling used for this table (13 blocks)

NAME                                VALUE
------------------------------ ----------
db block gets                         298
consistent gets                        55
physical reads                          0
redo size                               0
sorts (disk)                            0
sorts (memory)                          5
rows processed                         14

################################################################################################
# TIBERO 6
SQL ID: 5h9xan8bpzc7w
Child number: 1242
Plan hash value: 830222451
Execution Plan
--------------------------------------------------------------------------------
   1  INDEX JOIN (Cost:4, %%CPU:0, Rows:1) 
   2    TABLE ACCESS (ROWID): DEPT (Cost:3, %%CPU:0, Rows:1) 
   3      INDEX (FULL): PK_DEPT (Cost:2, %%CPU:0, Rows:1) 
   4    INDEX (RANGE SCAN): EMP_IX03 (Cost:2, %%CPU:0, Rows:1) 

Predicate Information
--------------------------------------------------------------------------------
   4 - access: ("D"."DEPTNO" = "E"."DEPTNO") (0.002)

NAME                                VALUE
------------------------------ ----------
db block gets                         304
consistent gets                        22
physical reads                          0
redo size                               0
sorts (disk)                            0
sorts (memory)                          5
rows processed                          0


################################################################################################
# ORACLE 11.2.0.1.0
Execution Plan
----------------------------------------------------------
Plan hash value: 2640160718
-----------------------------------------------------------------------------------------
| Id  | Operation         | Name | Rows   | Bytes | Cost (%CPU)| Time   |
-----------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT        |      |    14 |   280 |     4  (25)| 00:00:01 |
|   1 |  MERGE JOIN          |      |    14 |   280 |     4  (25)| 00:00:01 |
|   2 |   TABLE ACCESS BY INDEX ROWID| DEPT  |     4 |    52 |     2   (0)| 00:00:01 |
|   3 |    INDEX FULL SCAN      | PK_DEPT |     4 |   |     1   (0)| 00:00:01 |
|*  4 |   SORT JOIN          |      |    14 |    98 |     2  (50)| 00:00:01 |
|   5 |    INDEX FULL SCAN      | EMP_IX03 |    14 |    98 |     1   (0)| 00:00:01 |
-----------------------------------------------------------------------------------------
Predicate Information (identified by operation id):
---------------------------------------------------
   4 - access("E"."DEPTNO"="D"."DEPTNO")
       filter("E"."DEPTNO"="D"."DEPTNO")

Statistics
----------------------------------------------------------
     0  recursive calls
     0  db block gets
     5  consistent gets
     0  physical reads
     0  redo size
   774  bytes sent via SQL*Net to client
   524  bytes received via SQL*Net from client
     2  SQL*Net roundtrips to/from client
     1  sorts (memory)
     0  sorts (disk)
    14  rows processed

