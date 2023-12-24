CREATE OR REPLACE FUNCTION dept_nbremp
  (dept_id IN employees.department_id%TYPE)
  RETURN INTEGER
IS
  nbremp INTEGER := 0;
BEGIN
  FOR emp IN (SELECT * FROM employees
              WHERE department_id = dept_id)
  LOOP
    nbremp := nbremp + 1;
  END LOOP;
  RETURN nbremp;
END;
/

VARIABLE cptemp NUMBER
ACCEPT dept_id PROMPT 'Enter department id: '
EXECUTE :cptemp := dept_nbremp(&dept_id)
PRINT cptemp
