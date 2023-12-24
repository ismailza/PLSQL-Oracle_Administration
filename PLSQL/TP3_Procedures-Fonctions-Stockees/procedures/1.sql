CREATE OR REPLACE PROCEDURE supprimer_employe
  (emp_num IN employees.employee_id%TYPE)
IS
BEGIN
  DELETE FROM employees
  WHERE employee_id = emp_num;
  COMMIT;
  IF SQL%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('Pas d employe avec ce numero');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Employe supprime');
  END IF;
  EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erreur lors de la suppression');
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    ROLLBACK;
END;
/

ACCEPT emp_num PROMPT 'Entrez le numero de l employe a supprimer : ';
EXECUTE supprimer_employe(&emp_num);
