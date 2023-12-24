CREATE OR REPLACE FUNCTION max_sal_job
  (job IN employees.job_id%TYPE)
  RETURN NUMBER
IS
  max_sal NUMBER := 0;
BEGIN
  FOR emp IN (SELECT salary FROM employees
              WHERE job_id = UPPER(job))
  LOOP
    IF emp.salary > max_sal THEN
      max_sal := emp.salary;
    END IF;
  END LOOP;
  RETURN max_sal;
END;
/

VARIABLE max_sal NUMBER
ACCEPT job PROMPT 'Enter job title: '
EXECUTE :max_sal := max_sal_job('&job')
PRINT max_sal
