DECLARE
  CURSOR depts_curs IS
    SELECT D.department_id, D.department_name, D.manager_id, D.location_id, DEPTS.masse_salariale
    FROM departments D, (SELECT department_id, SUM(salary) AS masse_salariale
                       FROM employees
                       WHERE department_id != 30
                       GROUP BY department_id
                       HAVING COUNT(*) = (SELECT COUNT(*) 
                                         FROM employees
                                         WHERE department_id = 30
                                         GROUP BY department_id)) DEPTS
    WHERE D.department_id = DEPTS.department_id;

  dept_rec depts_curs%ROWTYPE;

BEGIN
  OPEN depts_curs;
  LOOP
    FETCH depts_curs INTO dept_rec;
    EXIT WHEN depts_curs%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('- Departement ' || dept_rec.department_id || ' : ' || dept_rec.department_name ||
                        '- Manager id : ' || dept_rec.manager_id || 
                        '- Localisation id : ' || dept_rec.location_id ||
                        '- Masse salariale : ' || dept_rec.masse_salariale);
  END LOOP;
  CLOSE depts_curs;
END;
/