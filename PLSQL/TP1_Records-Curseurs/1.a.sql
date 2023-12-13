
DECLARE
  emp_rec employees%ROWTYPE;
  emp_matricule employees.employee_id%TYPE := &v_matricule;
BEGIN
  SELECT * INTO emp_rec
  FROM employees
  WHERE employee_id = emp_matricule;

  DBMS_OUTPUT.PUT_LINE(
    'Matricule: ' || emp_rec.employee_id || 
    ' Nom: ' || emp_rec.last_name || 
    ' Prenom: ' || emp_rec.first_name || 
    ' Email: ' || emp_rec.email || 
    ' Telephone: ' || emp_rec.phone_number ||
    ' Date embauche: ' || emp_rec.hire_date ||
    ' Salaire: ' || emp_rec.salary
  );
END;
/