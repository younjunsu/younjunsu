create table t_context (no number, char_time varchar(21));

create or replace function date_to_char(p_dt date)
return varchar
as
begin
    return to_char(p_dt, 'yyyy/mm/dd hh24:mi:ss');
end;
/

alter session set sql_trace = 'Y';

insert into t_context
select /*+ No Context Switching */ rownum as no
     , to_char(sysdate + rownum, 'yyyy/mm/dd hh24:mi:ss') as char_time
  from dual
connect by level < 100000;

commit;

insert into t_context
select /*+ Context Switching */ rownum as no
     , date_to_char(sysdate + rownum) as char_time
  from dual
connect by level < 100000;

commit;

alter session set sql_trace = 'N';


 stage     count       cpu   elapsed   current     query      disk      rows
-----------------------------------------------------------------------------
 parse         1      0.01      0.00         0        51         0         0
  exec         1      0.21      0.22      3391       150         1    100009
 fetch         0      0.00      0.00         0         0         0         0
-----------------------------------------------------------------------------
   sum         2      0.22      0.22      3391       201         1    100009


 stage     count       cpu   elapsed   current     query      disk      rows
-----------------------------------------------------------------------------
 parse         1      0.00      0.00         0        28         0         0
  exec         1      2.28      2.29      3089        66         0    100002
 fetch         0      0.00      0.00         0         0         0         0
-----------------------------------------------------------------------------
   sum         2      2.28      2.29      3089        94         0    100002
