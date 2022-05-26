�� INDEX & NULL
#####################################################################################################

create table null_test as
select rownum key
     , case when mod(rownum, 1000) = 0 then null else mod(rownum, 1000) end as col_a
     , lpad(rownum, 10, '0') as col_b
  from dual
connect by level <= 10000;

create index null_test_ix1 on null_test(col_a, col_b);

alter session set statistics_level = all;

/* Case 1 */
select * 
  from null_test 
 where col_a is null;

select * from table(dbms_xplan.display_cursor(null, null, 'allstats last'));

-----------------------------------------------------------------------------------------
| Id  | Operation         | Name      | Starts | E-Rows | A-Rows |   A-Time   | Buffers |
-----------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |           |      1 |        |     10 |00:00:00.01 |      38 |
|*  1 |  TABLE ACCESS FULL| NULL_TEST |      1 |     10 |     10 |00:00:00.01 |      38 |
-----------------------------------------------------------------------------------------
 
Predicate Information
------------------------------
   1 - filter("COL_A" IS NULL)

/* Case 2 */
select /*+ index(a, null_test_ix1) */ * 
  from null_test a
 where col_a is null;

-----------------------------------------------------------------------------------------
| Id  | Operation         | Name      | Starts | E-Rows | A-Rows |   A-Time   | Buffers |
-----------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |           |      1 |        |     10 |00:00:00.01 |      38 |
|*  1 |  TABLE ACCESS FULL| NULL_TEST |      1 |     10 |     10 |00:00:00.01 |      38 |
-----------------------------------------------------------------------------------------
 
Predicate Information 
------------------------------
   1 - filter("COL_A" IS NULL) 

/* Case 3 */   
select * 
  from null_test 
 where col_a is null
   and col_b = '0000004000';

select * from table(dbms_xplan.display_cursor(null, null, 'allstats last'));
   
-------------------------------------------------------------------------------------------------------
| Id  | Operation                   | Name          | Starts | E-Rows | A-Rows |   A-Time   | Buffers |
-------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |               |      1 |        |      1 |00:00:00.01 |       4 |
|   1 |  TABLE ACCESS BY INDEX ROWID| NULL_TEST     |      1 |      1 |      1 |00:00:00.01 |       4 |
|*  2 |   INDEX RANGE SCAN          | NULL_TEST_IX1 |      1 |      1 |      1 |00:00:00.01 |       3 |
-------------------------------------------------------------------------------------------------------
 
Predicate Information
---------------------------------------------------
    2 - access("COL_A" IS NULL AND "COL_B"='0000004000')
        filter("COL_B"='0000004000')   

### �� �ٸ� ����
# �ֿ� ���� : Null Column ���� Index�� ����� Tip
# ��� ���� �� where Col1 is null;
# Col1�� Null ���� �����ϰ� ���� ��� �ش� �÷��� Index�� ���� ��� is null�� ������ ��� �ε����� ����� �� ����
# �ذ� ��� : Dummy ���� �ε����� ���� ��Ŵ
# �ֿ� ���� : ���� �ε����� ����� Null ���� Index�� ����

# ��� SQL
update /*+ index(b, YOON2_NULL_IX) */ yoon2 b
   set last_ddl_time = nvl((select a.created from yoon a 
                             where a.owner = b.owner and a.object_name = b.object_name), last_ddl_time)
where created is null;

# Case 1 : ���� �÷����� ������ Index
create index yoon2_null_ix on yoon2(created);

---------------------------------------------------------------------------------------------------
| Id  | Operation                    | Name     | Starts | A-Rows |   A-Time   | Buffers | Reads  |
---------------------------------------------------------------------------------------------------
|   0 | UPDATE STATEMENT             |          |      1 |      0 |00:00:00.09 |    3286 |   3129 |
|   1 |  UPDATE                      | YOON2    |      1 |      0 |00:00:00.09 |    3286 |   3129 |
|*  2 |   TABLE ACCESS FULL          | YOON2    |      1 |     10 |00:00:00.08 |    3271 |   3127 |
|*  3 |   TABLE ACCESS BY INDEX ROWID| YOON     |      1 |      1 |00:00:00.01 |       3 |      2 |
|*  4 |    INDEX RANGE SCAN          | YOON_IX1 |      1 |      1 |00:00:00.01 |       2 |      2 |
---------------------------------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   2 - filter("CREATED" IS NULL)
   3 - filter("A"."OWNER"=:B1)
   4 - access("A"."OBJECT_NAME"=:B1)

# Case 2 : ���� �÷����� ������ Index
create index yoon2_null_ix on yoon2(created, 1);

--------------------------------------------------------------------------------------------------------
| Id  | Operation                    | Name          | Starts | A-Rows |   A-Time   | Buffers | Reads  |
--------------------------------------------------------------------------------------------------------
|   0 | UPDATE STATEMENT             |               |      1 |      0 |00:00:00.01 |      28 |      5 |
|   1 |  UPDATE                      | YOON2         |      1 |      0 |00:00:00.01 |      28 |      5 |
|   2 |   TABLE ACCESS BY INDEX ROWID| YOON2         |      1 |     10 |00:00:00.01 |      13 |      3 |
|*  3 |    INDEX RANGE SCAN          | YOON2_NULL_IX |      1 |     10 |00:00:00.01 |       3 |      3 |
|*  4 |   TABLE ACCESS BY INDEX ROWID| YOON          |      1 |      1 |00:00:00.01 |       3 |      2 |
|*  5 |    INDEX RANGE SCAN          | YOON_IX1      |      1 |      1 |00:00:00.01 |       2 |      2 |
--------------------------------------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   3 - access("CREATED" IS NULL)
   4 - filter("A"."OWNER"=:B1)
   5 - access("A"."OBJECT_NAME"=:B1)

       