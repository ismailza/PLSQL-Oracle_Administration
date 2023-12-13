
DECLARE
  TYPE emp_rec_type IS RECORD (
    employee_id employees.employee_id%TYPE,
    last_name employees.last_name%TYPE,
    first_name employees.first_name%TYPE,
    email employees.email%TYPE,
    phone_number employees.phone_number%TYPE,
    hire_date employees.hire_date%TYPE,
    job_id employees.job_id%TYPE,
    salary employees.salary%TYPE,
    commission_pct employees.commission_pct%TYPE,
    manager_id employees.manager_id%TYPE,
    department_id employees.department_id%TYPE
  );
  emp_rec emp_rec_type;
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