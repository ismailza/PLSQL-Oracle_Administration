CREATE OR REPLACE PROCEDURE N_PREMIER_EMPLOYE
  (dept_id IN employees.department_id%TYPE, n IN INTEGER)
IS
  i INTEGER := 0;
BEGIN
  FOR emp IN (SELECT employee_id, last_name, first_name
              FROM employees
              WHERE department_id = dept_id)
  LOOP
    i := i + 1;
    IF i <= n THEN
      DBMS_OUTPUT.PUT_LINE(i || '. ' || emp.employee_id || ' ' || emp.last_name || ' ' || emp.first_name);
    END IF;
  END LOOP;
  IF i < n THEN
    DBMS_OUTPUT.PUT_LINE('Il n y a que ' || i || ' employes dans ce departement');
  END IF;
END;
/

ACCEPT dept_id PROMPT 'Entrez le numero du departement : ';
ACCEPT n PROMPT 'Entrez le nombre d employes a afficher : ';
EXECUTE N_PREMIER_EMPLOYE(&dept_id, &n);
