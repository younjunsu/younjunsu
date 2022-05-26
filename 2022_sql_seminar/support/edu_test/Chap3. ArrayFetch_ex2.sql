drop table big_table purge;
create table big_table
as
select o.*
  from dba_objects o
     , (select level as lvl from dual connect by level < 1001) d;

-- Session 1 (Array Fetch)
set serveroutput on;

alter session set sql_trace = yes;

declare
    l_object_name big_table.object_name%type;
    
    cursor c is
    select object_name 
      from big_table 
     where rownum <= 3000;
begin
    for item in c
    loop
        l_object_name := item.object_name;
        dbms_output.put_line(l_object_name);
    end loop;
end;
/

alter session set sql_trace = no;

-- Session 2(Single Row Fetch)
set serveroutput on;

alter session set sql_trace = yes;

declare
    l_object_name big_table.object_name%type;
    
    cursor c is
    select object_name
      from big_table 
     where rownum <= 3000;
begin
    open c;
    loop
        fetch c into l_object_name;
        exit when c%notfound;
        dbms_output.put_line(l_object_name);
    end loop;
    close c;
    
    execute immediate 'alter session set sql_trace = no';
end;
/

alter session set sql_trace = no;
