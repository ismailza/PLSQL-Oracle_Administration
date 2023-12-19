
DECLARE
  CONSTRAINT_VIOLATION EXCEPTION;
  PRAGMA EXCEPTION_INIT(CONSTRAINT_VIOLATION, -2292);
  dept_num departments.department_id%TYPE := &v_dept_num;
BEGIN
  DELETE FROM departments
  WHERE department_id = dept_num;
  COMMIT;
EXCEPTION
  WHEN CONSTRAINT_VIOLATION THEN
    DBMS_OUTPUT.PUT_LINE('Impossible de supprimer le departement ' || dept_num || ' car il contient des employes');
END;
/