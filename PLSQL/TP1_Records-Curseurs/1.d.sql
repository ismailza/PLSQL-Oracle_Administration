
VARIABLE ancienneEmb VARCHAR2(12);

BEGIN
  SELECT MIN(hire_date) INTO :ancienneEmb
  FROM employees;
END;
/