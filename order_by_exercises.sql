USE employees;
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY last_name,first_name;

SELECT * FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E'
ORDER BY emp_no DESC ;

SELECT * FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
ORDER BY emp_no DESC;

SELECT * FROM employees
WHERE birth_date LIKE '%12-25%'
  AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY birth_date, hire_date DESC;