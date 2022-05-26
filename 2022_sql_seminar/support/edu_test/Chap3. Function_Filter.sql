create or replace function emp_avg_sal
return number
is
    l_avg_sal number;
begin
    select avg(sal)       
      into l_avg_sal 
      from emp;
    
    return l_avg_sal;
end;
/

-- Case 1
select /*+ full(emp) */ *
  from emp
 where sal >= emp_avg_sal();

함수 호출 회수 : 14회 - 전체 테이블을 다 읽어야 함
------------------------------------------------------------------------------------
| ID  | Operation            | Name | Rows    | Elaps. Time  | CR Gets  | Starts   |
------------------------------------------------------------------------------------
|   1 | TABLE ACCESS (FULL)  | EMP  |       6 |00:00:00.0045 |      77  |       1  |
------------------------------------------------------------------------------------
 
Predicate Information
----------------------------------------------------------------------------------------------------
    1 - filter: ("EMP"."SAL" >= "TIBERO"."EMP_AVG_SAL"()) (0.100)

-- Case 2
create index emp_ix01 on emp(sal);

select /*+ index(emp(sal)) */ *
  from emp
 where sal >= emp_avg_sal();

함수 호출 회수 : 1회 - 함수를 먼저 실행하고, 거기서 리턴되는 값으로 emp_ix01 인덱스를 액세스하는 상수 조건을 사용
-----------------------------------------------------------------------------------------
| ID  | Operation             | Name     | Rows    | Elaps. Time  | CR Gets  | Starts   |
-----------------------------------------------------------------------------------------
|   1 | TABLE ACCESS (ROWID)  | EMP      |       6 |00:00:00.0000 |       1  |       1  |
|   2 |  INDEX (RANGE SCAN)   | EMP_IX01 |       6 |00:00:00.0003 |       2  |       1  |
-----------------------------------------------------------------------------------------
 
Predicate Information
----------------------------------------------------------------------------------------------------
    2 - access: ("EMP"."SAL" >= "TIBERO"."EMP_AVG_SAL"()) (0.100)

-- Case 3
create index emp_ix02 on emp(deptno);

select /*+ index(emp(deptno)) */ *
  from emp
 where sal >= emp_avg_sal()
   and deptno = 20;

함수 호출 회수 : 5회 - 'deptno = 20' 조건을 만족하는 레코드는 5건이고 'sal >= emp_avg_sal' 조건 필터링을 거친 최종 건수 3건
-----------------------------------------------------------------------------------------
| ID  | Operation             | Name     | Rows    | Elaps. Time  | CR Gets  | Starts   |
-----------------------------------------------------------------------------------------
|   1 | TABLE ACCESS (ROWID)  | EMP      |       3 |00:00:00.0019 |      23  |       1  |
|   2 |  INDEX (RANGE SCAN)   | EMP_IX02 |       5 |00:00:00.0000 |       1  |       1  |
-----------------------------------------------------------------------------------------
 
Predicate Information
----------------------------------------------------------------------------------------------------
    1 - filter: ("EMP"."SAL" >= "TIBERO"."EMP_AVG_SAL"()) (0.100)
    2 - access: ("EMP"."DEPTNO" = 20) (0.357)

-- Case 4
create index emp_ix03 on emp(deptno, sal);

select /*+ index(emp(deptno, sal)) */ *
  from emp
 where sal >= emp_avg_sal()
   and deptno = 20;

함수 호출 회수 : 1회 - 2번 케이스와 동일
-----------------------------------------------------------------------------------------
| ID  | Operation             | Name     | Rows    | Elaps. Time  | CR Gets  | Starts   |
-----------------------------------------------------------------------------------------
|   1 | TABLE ACCESS (ROWID)  | EMP      |       3 |00:00:00.0000 |       1  |       1  |
|   2 |  INDEX (RANGE SCAN)   | EMP_IX03 |       3 |00:00:00.0020 |      24  |       1  |
-----------------------------------------------------------------------------------------
 
Predicate Information
----------------------------------------------------------------------------------------------------
    2 - access: ("EMP"."DEPTNO" = 20) AND ("EMP"."SAL" >= "TIBERO"."EMP_AVG_SAL"()) (0.357 * 0.100)

-- Case 5
create index emp_ix04 on emp(deptno, ename, sal);

select /*+ index(emp(deptno, ename, sal)) */ *
  from emp
 where sal >= emp_avg_sal()
   and deptno = 20;

함수 호출 회수 : 6회 - 4번과 유사하나 인덱스 중간 컬럼인 ename이 생략되어 필터 조건으로 사용되고 'deptno = 20'
                범위를 넘어 더 이상 조건을 만족하는 레코드가 없음을 확인하는 One-Plus 스캔과정까지 포함에서 6번 함수호출
-----------------------------------------------------------------------------------------
| ID  | Operation             | Name     | Rows    | Elaps. Time  | CR Gets  | Starts   |
-----------------------------------------------------------------------------------------
|   1 | TABLE ACCESS (ROWID)  | EMP      |       3 |00:00:00.0000 |       1  |       1  |
|   2 |  FILTER               |          |       3 |00:00:00.0022 |      29  |       1  |
|   3 |   INDEX (RANGE SCAN)  | EMP_IX04 |       5 |00:00:00.0000 |       1  |       1  |
-----------------------------------------------------------------------------------------
 
Predicate Information
----------------------------------------------------------------------------------------------------
    2 - filter: ("EMP"."SAL" >= "TIBERO"."EMP_AVG_SAL"()) (0.100)
    3 - access: ("EMP"."DEPTNO" = 20) (0.357)

-- Case 6
select /*+ index(emp(deptno, sal)) */ *
  from emp
 where sal >= emp_avg_sal()
   and deptno >= 10;

함수 호출 회수 : 13회 - 'deptno >= 10'을 만족하는 건수만큼 함수를 호출하며, One-Plus 스캔은 발생하지 않음

-----------------------------------------------------------------------------------------
| ID  | Operation             | Name     | Rows    | Elaps. Time  | CR Gets  | Starts   |
-----------------------------------------------------------------------------------------
|   1 | TABLE ACCESS (ROWID)  | EMP      |       6 |00:00:00.0000 |       1  |       1  |
|   2 |  FILTER               |          |       6 |00:00:00.0000 |       0  |       1  |
|   3 |   INDEX (RANGE SCAN)  | EMP_IX03 |      13 |00:00:00.0003 |       2  |       1  |
-----------------------------------------------------------------------------------------
 
Predicate Information
----------------------------------------------------------------------------------------------------
    2 - filter: ("EMP"."SAL" >= "TIBERO"."EMP_AVG_SAL"()) (0.100)
    3 - access: ("EMP"."DEPTNO" >= 10) AND ("EMP"."SAL" >= "TIBERO"."EMP_AVG_SAL"()) (0.107 * 0.100)
