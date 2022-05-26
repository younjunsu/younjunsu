select /*+  */ *
  from dept  d
     , emp   e
 where 1 = 1
   and e.deptno = d.deptno
   and e.empno  = 7788;

Execution Plan
--------------------------------------------------------------------------------
   1  INDEX JOIN (Cost:5, %%CPU:0, Rows:1)
   2    TABLE ACCESS (ROWID): EMP (Cost:3, %%CPU:0, Rows:1)
   3      INDEX (UNIQUE SCAN): PK_EMP (Cost:2, %%CPU:0, Rows:1)
   4    TABLE ACCESS (ROWID): DEPT (Cost:3, %%CPU:0, Rows:1)
   5      INDEX (UNIQUE SCAN): PK_DEPT (Cost:2, %%CPU:0, Rows:1)

select /*+ full(d) full(e) */ *
  from dept  d
     , emp   e
 where 1 = 1
   and e.deptno = d.deptno
   and exists (select /*+ no_unnest */ 1
                 from salgrade s
                where s.losal <= e.sal
                  and s.hisal >= e.sal);

Execution Plan
--------------------------------------------------------------------------------
   1  HASH JOIN (Cost:323, %%CPU:0, Rows:14)
   2    TABLE ACCESS (FULL): DEPT (Cost:23, %%CPU:0, Rows:4)
   3    FILTER (Cost:300, %%CPU:0, Rows:14)
   4      TABLE ACCESS (FULL): EMP (Cost:23, %%CPU:0, Rows:14)
   5      CACHE (Cost:23, %%CPU:0, Rows:0)
   6        COUNT (STOP NODE) (STOP LIMIT 2) (Cost:23, %%CPU:0, Rows:1)
   7          FILTER (Cost:23, %%CPU:0, Rows:1)
   8            TABLE ACCESS (FULL): SALGRADE (Cost:23, %%CPU:0, Rows:5)

Predicate Information
--------------------------------------------------------------------------------
   1 - access: ("D"."DEPTNO" = "E"."DEPTNO") (0.250)
   3 - filter: EXISTS (SELECT /*+ NO_UNNEST */ 1
                 FROM SALGRADE S
                WHERE S.LOSAL <= E.SAL
                  AND S.HISAL >= E.SAL) (1.000)

   6 - filter: (ROWNUM = 1) (0.010)
   7 - filter: ("S"."LOSAL" <= :0) AND ("S"."HISAL" >= :0) (0.100 * 0.100)

select /*+ full(d) full(e) */ *
  from dept  d
     , emp   e
 where 1 = 1
   and e.deptno = d.deptno
   and not 
       exists (select /*+ unnest hash_aj */ 1
                 from salgrade s
                where 1 = 1
                  and s.losal <= e.sal
                  and s.hisal >= e.sal);

Execution Plan
--------------------------------------------------------------------------------
   1  HASH JOIN (Cost:369, %%CPU:0, Rows:5)
   2    TABLE ACCESS (FULL): DEPT (Cost:23, %%CPU:0, Rows:4)
   3    NESTED LOOPS (ANTI) (Cost:346, %%CPU:0, Rows:5)
   4      TABLE ACCESS (FULL): EMP (Cost:23, %%CPU:0, Rows:14)
   5      TABLE ACCESS (FULL): SALGRADE (Cost:23, %%CPU:0, Rows:5)

Predicate Information
--------------------------------------------------------------------------------
   1 - access: ("D"."DEPTNO" = "E"."DEPTNO") (0.250)
   3 - access: ("E"."SAL" >= "S"."LOSAL") AND ("E"."SAL" <= "S"."HISAL") (1.000 * 0.592)

select /*+ full(d) full(e) */ *
  from dept  d
     , emp   e
 where 1 = 1
   and e.deptno = d.deptno
   and not 
       exists (select /*+ unnest hash_aj */ 1
                 from salgrade s
                where 1 = 1
                  and length(s.rowid) = length(e.rowid)
                  and s.losal <= e.sal
                  and s.hisal >= e.sal);

Execution Plan
--------------------------------------------------------------------------------
   1  HASH JOIN (Cost:69, %%CPU:0, Rows:13)
   2    TABLE ACCESS (FULL): DEPT (Cost:23, %%CPU:0, Rows:4)
   3    HASH JOIN (REVERSE ANTI) (Cost:46, %%CPU:0, Rows:13)
   4      TABLE ACCESS (FULL): SALGRADE (Cost:23, %%CPU:0, Rows:5)
   5      TABLE ACCESS (FULL): EMP (Cost:23, %%CPU:0, Rows:14)

Predicate Information
--------------------------------------------------------------------------------
   1 - access: ("D"."DEPTNO" = "E"."DEPTNO") (0.250)
   3 - access: (LENGTH("S"."ROWID") = LENGTH("E"."ROWID")) (0.002)
   3 - filter: ("S"."LOSAL" <= "E"."SAL") AND ("S"."HISAL" >= "E"."SAL") (1.000 * 1.000)