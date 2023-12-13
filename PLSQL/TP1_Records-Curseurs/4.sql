DECLARE
  CURSOR depts_curs (numdept departments.department_id%TYPE) IS
    SELECT D.department_id, D.department_name, D.manager_id, D.location_id, DEPTS.masse_salariale
    FROM departments D, (SELECT department_id, SUM(salary) AS masse_salariale
                       FROM employees
                       WHERE department_id != numdept
                       GROUP BY department_id
                       HAVING COUNT(*) = (SELECT COUNT(*) 
                                         FROM employees
                                         WHERE department_id = numdept
                                         GROUP BY department_id)) DEPTS
    WHERE D.department_id = DEPTS.department_id;

BEGIN
  FOR dept_rec IN depts_curs (30) LOOP
    DBMS_OUTPUT.PUT_LINE('- Departement ' || dept_rec.department_id || ' : ' || dept_rec.department_name ||
                        '- Manager id : ' || dept_rec.manager_id || 
                        '- Localisation id : ' || dept_rec.location_id ||
                        '- Masse salariale : ' || dept_rec.masse_salariale);
  END LOOP;
END;
/
