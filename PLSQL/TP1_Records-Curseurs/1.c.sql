
DECLARE
  emp_rec employees%ROWTYPE;
  emp_matricule employees.employee_id%TYPE := &v_matricule;
  emp_email employees.email%TYPE := &v_email;
  emp_salaire employees.salary%TYPE := &v_salaire;

BEGIN
  SELECT * INTO emp_rec
  FROM employees
  WHERE employee_id = emp_matricule;

  IF emp_salaire > 5000
  THEN
    emp_rec.salary := emp_salaire;
    emp_rec.email := emp_email;

    UPDATE employees
    SET salary = emp_rec.salary, email = emp_rec.email
    WHERE employee_id = emp_matricule;

    -- Affichage des informations de l'employé
    DBMS_OUTPUT.PUT_LINE(
      'Matricule: ' || emp_rec.employee_id || 
      ' Nom: ' || emp_rec.last_name || 
      ' Prenom: ' || emp_rec.first_name || 
      ' Email: ' || emp_rec.email || 
      ' Telephone: ' || emp_rec.phone_number ||
      ' Date embauche: ' || emp_rec.hire_date ||
      ' Salaire: ' || emp_rec.salary
    );
  ELSE
    DBMS_OUTPUT.PUT_LINE('Le salaire doit etre superieur a 5000');
  END IF;
END;
/