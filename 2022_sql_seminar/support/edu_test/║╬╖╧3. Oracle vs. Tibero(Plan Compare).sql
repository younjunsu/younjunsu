[오라클]
select * from table(dbms_xplan.display_cursor(null, null, 'advanced allstats last'));

SQL_ID  dagm2wjkj19r4, child number 0
-------------------------------------
select h.*      , (select count(*) from tb$objects_hash s where s.owner 
= h.owner) as cnt1   from tb$objects_hash h  where 1 = 1    and 
object_name = upper('tb$objects_hash')
 
Plan hash value: 448506724
 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
| Id  | Operation                          | Name                | Starts | E-Rows |E-Bytes| Cost (%CPU)| E-Time   | Pstart| Pstop | A-Rows |   A-Time   | Buffers |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                   |                     |      1 |        |       |     5 (100)|          |       |       |      5 |00:00:00.01 |      11 |
|   1 |  SORT AGGREGATE                    |                     |      1 |      1 |    17 |            |          |       |       |      1 |00:00:00.01 |     487 |
|   2 |   PARTITION HASH ALL               |                     |      1 |    725 | 12325 |   138   (1)| 00:00:02 |     1 |     4 |      5 |00:00:00.01 |     487 |
|*  3 |    INDEX FAST FULL SCAN            | TB$OBJECTS_HASH_IX1 |      4 |    725 | 12325 |   138   (1)| 00:00:02 |     1 |     4 |      5 |00:00:00.01 |     487 |
|   4 |  PARTITION HASH ALL                |                     |      1 |      5 |  1035 |     5   (0)| 00:00:01 |     1 |     4 |      5 |00:00:00.01 |      11 |
|   5 |   TABLE ACCESS BY LOCAL INDEX ROWID| TB$OBJECTS_HASH     |      4 |      5 |  1035 |     5   (0)| 00:00:01 |     1 |     4 |      5 |00:00:00.01 |      11 |
|*  6 |    INDEX RANGE SCAN                | TB$OBJECTS_HASH_IX1 |      4 |      5 |       |     2   (0)| 00:00:01 |     1 |     4 |      5 |00:00:00.01 |       9 |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
Query Block Name / Object Alias (identified by operation id):
-------------------------------------------------------------
 
   1 - SEL$2
   3 - SEL$2 / S@SEL$2
   4 - SEL$1
   5 - SEL$1 / H@SEL$1
   6 - SEL$1 / H@SEL$1
 
Outline Data
-------------
 
  /*+
      BEGIN_OUTLINE_DATA
      IGNORE_OPTIM_EMBEDDED_HINTS
      OPTIMIZER_FEATURES_ENABLE('11.2.0.1')
      DB_VERSION('11.2.0.1')
      ALL_ROWS
      OUTLINE_LEAF(@"SEL$2")
      OUTLINE_LEAF(@"SEL$1")
      INDEX_RS_ASC(@"SEL$1" "H"@"SEL$1" ("TB$OBJECTS_HASH"."OBJECT_NAME" "TB$OBJECTS_HASH"."OWNER"))
      INDEX_FFS(@"SEL$2" "S"@"SEL$2" ("TB$OBJECTS_HASH"."OBJECT_NAME" "TB$OBJECTS_HASH"."OWNER"))
      END_OUTLINE_DATA
  */
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   3 - filter("S"."OWNER"=:B1)
   6 - access("OBJECT_NAME"='TB$OBJECTS_HASH')
       filter
 
Column Projection Information (identified by operation id):
-----------------------------------------------------------
 
   1 - (#keys=0) COUNT(*)[22]
   4 - "SYS_ALIAS_1"."OWNER"[VARCHAR2,30], "OBJECT_NAME"[VARCHAR2,128], "SYS_ALIAS_1"."SUBOBJECT_NAME"[VARCHAR2,30], "SYS_ALIAS_1"."OBJECT_ID"[NUMBER,22], 
       "SYS_ALIAS_1"."DATA_OBJECT_ID"[NUMBER,22], "SYS_ALIAS_1"."OBJECT_TYPE"[VARCHAR2,19], "SYS_ALIAS_1"."CREATED"[DATE,7], 
       "SYS_ALIAS_1"."LAST_DDL_TIME"[DATE,7], "SYS_ALIAS_1"."TIMESTAMP"[VARCHAR2,19], "SYS_ALIAS_1"."STATUS"[VARCHAR2,7], "SYS_ALIAS_1"."TEMPORARY"[VARCHAR2,1], 
       "SYS_ALIAS_1"."GENERATED"[VARCHAR2,1], "SYS_ALIAS_1"."SECONDARY"[VARCHAR2,1], "SYS_ALIAS_1"."NAMESPACE"[NUMBER,22], 
       "SYS_ALIAS_1"."EDITION_NAME"[VARCHAR2,30]
   5 - "SYS_ALIAS_1"."OWNER"[VARCHAR2,30], "OBJECT_NAME"[VARCHAR2,128], "SYS_ALIAS_1"."SUBOBJECT_NAME"[VARCHAR2,30], "SYS_ALIAS_1"."OBJECT_ID"[NUMBER,22], 
       "SYS_ALIAS_1"."DATA_OBJECT_ID"[NUMBER,22], "SYS_ALIAS_1"."OBJECT_TYPE"[VARCHAR2,19], "SYS_ALIAS_1"."CREATED"[DATE,7], 
       "SYS_ALIAS_1"."LAST_DDL_TIME"[DATE,7], "SYS_ALIAS_1"."TIMESTAMP"[VARCHAR2,19], "SYS_ALIAS_1"."STATUS"[VARCHAR2,7], "SYS_ALIAS_1"."TEMPORARY"[VARCHAR2,1], 
       "SYS_ALIAS_1"."GENERATED"[VARCHAR2,1], "SYS_ALIAS_1"."SECONDARY"[VARCHAR2,1], "SYS_ALIAS_1"."NAMESPACE"[NUMBER,22], 
       "SYS_ALIAS_1"."EDITION_NAME"[VARCHAR2,30]
   6 - "SYS_ALIAS_1".ROWID[ROWID,10], "OBJECT_NAME"[VARCHAR2,128], "SYS_ALIAS_1"."OWNER"[VARCHAR2,30]
 
Note
-----
   - dynamic sampling used for this statement (level=2)


[티베로]
select * from table(dbms_xplan.display_cursor(null, null, 'all last'));

SQL ID         : gzf64htrzmnfb
HASH VALUE     : 1878643147
PLAN HASH VALUE: 1039957699
EXECUTIONS     : 1
FETCHES        : 1
LOADED AT      : 2021/12/01 14:50:27
TOT ELAPSED TIME: 00:00:00.0147 
AVG ELAPSED TIME: 00:00:00.0147 
 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
| ID  | Operation                      | Name                | Cost (%CPU)  | Cards   | Rows    | Elaps. Time  | Pstart| Pend  | CR Gets  | Starts   | Used Mem | Temp. Read | Temp. Write|
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
|   1 | PARTITION HASH (ALL PART)      |                     |  710   (1.13)|     165 |       0 |00:00:00.0000 |      1|      4|       0  |       1  |       0K |         0  |         0  |
|   2 |  TABLE ACCESS (ROWID) LOCAL    | TB$OBJECTS_HASH     |  710   (1.13)|     165 |       0 |00:00:00.0000 |       |       |       0  |       4  |       0K |         0  |         0  |
|   3 |   INDEX (RANGE SCAN)           | TB$OBJECTS_HASH_IX1 |    9      (0)|     165 |       0 |00:00:00.0129 |       |       |      12  |       4  |       0K |         0  |         0  |
|   4 |   CACHE                        |                     |  544   (1.47)|       0 |       0 |00:00:00.0000 |       |       |       0  |       0  |       0K |         0  |         0  |
|   5 |    SORT AGGR                   |                     |  544   (1.47)|       1 |       0 |00:00:00.0000 |       |       |       0  |       0  |       0K |         0  |         0  |
|   6 |     PARTITION HASH (ALL PART)  |                     |  542   (1.11)|   45050 |       0 |00:00:00.0000 |      1|      4|       0  |       0  |       0K |         0  |         0  |
|   7 |      FILTER                    |                     |  542   (1.11)|   45050 |       0 |00:00:00.0000 |       |       |       0  |       0  |       0K |         0  |         0  |
|   8 |       INDEX (FAST FULL SCAN)   | TB$OBJECTS_HASH_IX1 |  536      (0)|  270300 |       0 |00:00:00.0000 |       |       |       0  |       0  |       0K |         0  |         0  |
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
Predicate Information
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    3 - access: ("H"."OBJECT_NAME" = 'TB$OBJECTS_HASH') (0.001)
    7 - filter: ("S"."OWNER" = :0) (0.167)
 
Note
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    3 - 
    8 - dynamic sampling used for this table (96 blocks)
   