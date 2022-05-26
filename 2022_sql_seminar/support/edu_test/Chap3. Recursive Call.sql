create or replace function date_to_char2(p_dt date)
return varchar
as
    curr_dt    varchar(21);
begin
    select to_char(p_dt, 'yyyy/mm/dd hh24:mi:ss')
      into curr_dt
      from dual;
      
    return curr_dt;
end;
/

alter session set sql_trace = 'Y';

insert into t_context
select /*+ Recursive Call */ rownum as no
     , date_to_char2(sysdate + rownum) as char_time
  from dual
connect by level < 100000;

commit;

alter session set sql_trace = 'N';

 stage     count       cpu   elapsed   current     query      disk      rows
-----------------------------------------------------------------------------
 parse         1      0.00      0.00         0        28         0         0
  exec         1     11.01     11.07      3106        72         0    200001
 fetch         0      0.00      0.00         0         0         0         0
-----------------------------------------------------------------------------
   sum         2     11.01     11.07      3106       100         0    200001


