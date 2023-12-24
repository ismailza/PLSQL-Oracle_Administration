CREATE OR REPLACE PROCEDURE Comm_employe
  (emp_num IN employees.employee_id%TYPE, taux IN NUMBER)
IS
  commision employees.commission_pct%TYPE;
BEGIN
  SELECT commission_pct
  INTO commision
  FROM employees
  WHERE employee_id = emp_num;

  IF commision IS NULL THEN
    DBMS_OUTPUT.PUT_LINE('Commission est nulle');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Commission est ' || commision);
    commision := commision * taux;
    UPDATE employees
    SET commission_pct = commision
    WHERE employee_id = emp_num;
    DBMS_OUTPUT.PUT_LINE('Nouvelle commission est ' || commision);
  END IF;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Pas d employe avec ce numero');
END;
/

EXECUTE Comm_employe(100, 1.1);
EXECUTE Comm_employe(102, 1.2);