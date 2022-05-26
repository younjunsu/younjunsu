delete plan_table where statement_id = 'yhn_tune';

commit;

[�Ϲ� ����]
explain plan set statement_id = 'yhn_tune' into plan_table
for
select e.ename, d.dname
  from emp e, dept d
 where e.deptno = d.deptno;

[��� �⺻ ����]
select lpad(' ', 2 * level) || operation 
    || decode(object_owner, '', '' , ' ' || object_owner || '.')
    || decode(object_name , '', '' , object_name)
    || decode(cost        , '', '' , ' (cost=' || cost)  
    || decode(cardinality , '', ')', ', card=' || cardinality || ')') as plan
  from plan_table
 start with id = 1 and statement_id = 'yhn_tune'
 connect by prior id = parent_id and statement_id = 'yhn_tune'
 order by id;

[1�� �⺻ ����]
INDEX JOIN (cost=4, card=14)
  TABLE ACCESS (ROWID) TIBERO.DEPT (cost=3, card=4)
    INDEX (FULL) TIBERO.PK_DEPT (cost=2, card=4)
  INDEX (RANGE SCAN) TIBERO.EMP_IX04 (cost=2, card=3)

[2�� Ȱ�� ����]
INDEX JOIN (cost=4, card=14)
  TABLE ACCESS (ROWID) TIBERO.DEPT (cost=3, card=4)
    INDEX (FULL) TIBERO.PK_DEPT (cost=2, card=4) - DEPTNO
  INDEX (RANGE SCAN) TIBERO.EMP_IX04 (cost=2, card=3) - DEPTNO, ENAME, SAL

[Ȯ�� ���� - Plan_Table�� �ƴ� ���]
explain plan set statement_id = 'yhn_tune' into yplan_table
for
select e.ename, d.dname
  from emp e, dept d
 where e.deptno = d.deptno;

[��� �⺻ ����]
select lpad(' ', 2 * level) || operation 
    || decode(object_owner, '', '' , ' ' || object_owner || '.')
    || decode(object_name , '', '' , object_name)
    || decode(cost        , '', '' , ' (cost=' || cost)  
    || decode(cardinality , '', ')', ', card=' || cardinality || ')') as plan
  from yplan_table
 start with id = 1 and statement_id = 'yhn_tune'
 connect by prior id = parent_id and statement_id = 'yhn_tune'
 order by id;

�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��













[Ȱ�� ����]
col plan format a120;

select lpad(' ', 2 * level) || operation 
    || decode(object_owner, '', '' , ' ' || object_owner || '.')
    || decode(object_name , '', '' , object_name)
    || decode(cost        , '', '' , ' (cost=' || cost)  
    || decode(cardinality , '', ')', ', card=' || cardinality || ')') 
    || case when operation like 'INDEX%' and id > 1 then
            (select ' - ' || listagg(column_name || (case when descend = 'DESC' then descend end), ', ') within group (order by column_position) as ind_columns
               from dba_ind_columns
              where 1 = 1
                and index_owner = object_owner
                and index_name  = object_name)
       end  as plan
     , search_columns  
  from plan_table
 start with id = 1 and statement_id = 'tune_test'
 connect by prior id = parent_id and statement_id = 'tune_test'
 order by id;


