CREATE SEQUENCE employee_seq START WITH 210 INCREMENT BY 1;

CREATE OR REPLACE FUNCTION insert_into_employees
(
  p_first_name employees.first_name%TYPE,
  p_last_name employees.last_name%TYPE,
  p_email employees.email%TYPE,
  p_phone_number employees.phone_number%TYPE,
  p_hire_date employees.hire_date%TYPE,
  p_job_id employees.job_id%TYPE,
  p_salary employees.salary%TYPE,
  p_commission_pct employees.commission_pct%TYPE,
  p_manager_id employees.manager_id%TYPE,
  p_department_id employees.department_id%TYPE
)
RETURN employees.employee_id%TYPE
IS
  v_employee_id employees.employee_id%TYPE;
BEGIN
  INSERT INTO employees
  (
    employee_id,
    first_name,
    last_name,
    email,
    phone_number,
    hire_date,
    job_id,
    salary,
    commission_pct,
    manager_id,
    department_id
  )
  VALUES
  (
    employee_sequence.NEXTVAL,
    p_first_name,
    p_last_name,
    p_email,
    p_phone_number,
    p_hire_date,
    p_job_id,
    p_salary,
    p_commission_pct,
    p_manager_id,
    p_department_id
  )
  RETURNING employee_id INTO v_employee_id;
  RETURN v_employee_id;
END;
/
