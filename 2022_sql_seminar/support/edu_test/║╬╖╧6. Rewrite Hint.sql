[�Ʒ� ���� �����ҷ��� QUERY_REWRITE ������ �־�� ��]

create materialized view mv_sum_sales
build immediate  
refresh complete  
enable query rewrite  
as
select deptno
     , sum(sal) sum_sales
  from emp
 group by deptno;
 

set autot trace exp;


[�Ϲ� ����]
select deptno, sum(sal)
  from emp
 group by deptno;

Execution Plan
--------------------------------------------------------------------------------
   1  GROUP BY (HASH) (Cost:7, %%CPU:0, Rows:3)
   2    TABLE ACCESS (ROWID): EMP (Cost:7, %%CPU:0, Rows:14)
   3      INDEX (FAST FULL SCAN): PK_EMP (Cost:6, %%CPU:0, Rows:14)


[Rewrite Hint] 
select /*+ rewrite */ deptno, sum(sal)
  from emp
 group by deptno; 

Execution Plan
--------------------------------------------------------------------------------
   1  TABLE ACCESS (FULL) MV REWRITE: MV_SUM_SALES (Cost:23, %%CPU:0, Rows:4032)
 