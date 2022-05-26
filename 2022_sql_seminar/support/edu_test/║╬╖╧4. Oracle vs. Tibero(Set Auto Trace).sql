[오라클]
yoon@ORCL11G> select * from TB$OBJECTS_HASH where object_name = 'TB$OBJECTS_HASH';

Elapsed: 00:00:00.05

Execution Plan
----------------------------------------------------------

---------------------------------------------------------------------------------------------------------------
| Id  | Operation                          | Name                | Rows  | Bytes | Cost (%CPU)| Pstart| Pstop |
---------------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                   |                     |     5 |  1035 |     5   (0)|       |       |
|   1 |  PARTITION HASH ALL                |                     |     5 |  1035 |     5   (0)|     1 |     4 |
|   2 |   TABLE ACCESS BY LOCAL INDEX ROWID| TB$OBJECTS_HASH     |     5 |  1035 |     5   (0)|     1 |     4 |
|*  3 |    INDEX RANGE SCAN                | TB$OBJECTS_HASH_IX1 |     5 |       |     2   (0)|     1 |     4 |
---------------------------------------------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   3 - access("OBJECT_NAME"='TB$OBJECTS_HASH')

Note
-----
   - 'PLAN_TABLE' is old version


Statistics
----------------------------------------------------------
          9  recursive calls
          0  db block gets
         95  consistent gets
          0  physical reads
          0  redo size
       1866  bytes sent via SQL*Net to client
        524  bytes received via SQL*Net from client
          2  SQL*Net roundtrips to/from client
          0  sorts (memory)
          0  sorts (disk)
          5  rows processed


[티베로]
티베로에서 Xplan 형태의 Autotrace를 보여주지 못하는 이유는 ? 
티베로는 Xplan이 아직 xplan.display_cursor만 존재하기 때문인 것으로 판단됨


SQL> select * from TB$OBJECTS_HASH where object_name = 'TB$OBJECTS_HASH';

SQL ID: 86fa3397b6c39
Child number: 10104
Plan hash value: 2772482250

Execution Plan
--------------------------------------------------------------------------------
   1  PARTITION HASH (ALL PART) (Cost:166, %%CPU:0, Rows:165) (PS:1, PE:4)
   2    TABLE ACCESS (ROWID) LOCAL: TB$OBJECTS_HASH (Cost:166, %%CPU:0, Rows:165)
   3      INDEX (RANGE SCAN): TB$OBJECTS_HASH_IX1 (Cost:9, %%CPU:0, Rows:165)


Predicate Information
--------------------------------------------------------------------------------
   3 - access: ("TB$OBJECTS_HASH"."OBJECT_NAME" = 'TB$OBJECTS_HASH') (0.001)


NAME                                VALUE
------------------------------ ----------
db block gets                           0
consistent gets                        22
physical reads                          0
redo size                               0
sorts (disk)                            0
sorts (memory)                          2
rows processed                          0


SQL> select * from TB$OBJECTS_HASH where object_name = 'TB$OBJECTS';

Total elapsed time 00:00:00.002041

SQL ID: 5mvb53s7bx8a7
Child number: 10125
Plan hash value: 2772482250

Execution Plan
------------------------------------------------------------------------------------------------------------------------
   1  PARTITION HASH (ALL PART) (Cost:166, %%CPU:0, Rows:165) (PS:1, PE:4)
   2    TABLE ACCESS (ROWID) LOCAL: TB$OBJECTS_HASH (Cost:166, %%CPU:0, Rows:165)
   3      INDEX (RANGE SCAN): TB$OBJECTS_HASH_IX1 (Cost:9, %%CPU:0, Rows:165)


Predicate Information
------------------------------------------------------------------------------------------------------------------------
   3 - access: ("TB$OBJECTS_HASH"."OBJECT_NAME" = 'TB$OBJECTS') (0.001)


NAME                                VALUE
------------------------------ ----------
db block gets                           0
consistent gets                       112
physical reads                          0
redo size                               0
sorts (disk)                            0
sorts (memory)                          0
rows processed                        100


