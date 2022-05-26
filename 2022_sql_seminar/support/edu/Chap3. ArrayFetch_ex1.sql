DECLARE    
    l_fetch_size NUMBER DEFAULT 1000;  -- 1,000건씩 Array 처리
  
    CURSOR c IS
    SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
      FROM emp;
  
    TYPE array_empno    IS TABLE OF emp.empno%type;
    TYPE array_ename    IS TABLE OF emp.ename%type;
    TYPE array_job      IS TABLE OF emp.job%type;
    TYPE array_mgr      IS TABLE OF emp.mgr%type;
    TYPE array_hiredate IS TABLE OF emp.hiredate%type;
    TYPE array_sal      IS TABLE OF emp.sal%type;
    TYPE array_comm     IS TABLE OF emp.comm%type;
    TYPE array_deptno   IS TABLE OF emp.deptno%type;
  
    l_empno     array_empno     := array_empno   ();
    l_ename     array_ename     := array_ename   ();
    l_job       array_job       := array_job     ();
    l_mgr       array_mgr       := array_mgr     ();
    l_hiredate  array_hiredate  := array_hiredate();
    l_sal       array_sal       := array_sal     ();
    l_comm      array_comm      := array_comm    ();
    l_deptno    array_deptno    := array_deptno  ();
  
    PROCEDURE insert_t( p_empno     IN array_empno
                      , p_ename     IN array_ename
                      , p_job       IN array_job
                      , p_mgr       IN array_mgr
                      , p_hiredate  IN array_hiredate
                      , p_sal       IN array_sal
                      , p_comm      IN array_comm
                      , p_deptno    IN array_deptno ) IS
    BEGIN
        FORALL i IN p_empno.first..p_empno.last
            INSERT INTO emp2
            VALUES ( p_empno   (i)
                   , p_ename   (i)
                   , p_job     (i)
                   , p_mgr     (i)
                   , p_hiredate(i)
                   , p_sal     (i) 
                   , p_comm    (i)
                   , p_deptno  (i) );
            
    EXCEPTION
      WHEN others THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        RAISE;
    END insert_t;
  
BEGIN
  
    OPEN c;
  
    LOOP
        FETCH c BULK COLLECT
         INTO l_empno, l_ename, l_job, l_mgr, l_hiredate, l_sal, l_comm, l_deptno
        LIMIT l_fetch_size;
        
        insert_t(l_empno   
                ,l_ename   
                ,l_job     
                ,l_mgr     
                ,l_hiredate
                ,l_sal     
                ,l_comm    
                ,l_deptno );  
        
        EXIT WHEN c%NOTFOUND;
    END LOOP;
  
    CLOSE c;
  
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/