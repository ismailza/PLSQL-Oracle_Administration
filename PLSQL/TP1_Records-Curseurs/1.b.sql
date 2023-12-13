DECLARE
  emp_matricule employees.employee_id%TYPE := &v_matricule;
  emp_email employees.email%TYPE := &v_email;
  emp_salaire employees.salary%TYPE := &v_salaire;
BEGIN
  IF emp_salaire > 5000 THEN
    UPDATE employees
    SET salary = emp_salaire, email = emp_email
    WHERE employee_id = emp_matricule;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Le salaire doit etre superieur a 5000');
  END IF;
END;
/