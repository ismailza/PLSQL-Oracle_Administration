CREATE OR REPLACE PROCEDURE dep_nbremp
  (dept_id IN employees.department_id%TYPE, outnbremp OUT NUMBER)
IS
BEGIN
  SELECT COUNT(*)
  INTO outnbremp
  FROM employees
  WHERE department_id = dept_id;
END;
/

VARIABLE cptemp NUMBER;
ACCEPT dept_id PROMPT 'Entrez le numero du departement : ';
EXECUTE dep_nbremp(&dept_id, :cptemp);
PRINT cptemp;
