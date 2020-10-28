USE employees;
SELECT DISTINCT title FROM titles;

SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
GROUP BY last_name;

-- 2 distinct columns group by
SELECT DISTINCT first_name,last_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
GROUP BY first_name, last_name;

SELECT DISTINCT last_name
SELECT * FROM employees
WHERE last_name LIKE '%q%' AND NOT last_name LIKE '%qu%'
GROUP BY last_name;

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND NOT last_name LIKE '%qu%'
GROUP BY last_name;

-- find the amount of people with each unique last name
SELECT COUNT(*)
FROM employees
WHERE last_name LIKE '%q%' AND NOT last_name LIKE '%qu%'
GROUP BY last_name;

-- get count of people with that name and group by gender
SELECT COUNT(*), gender
FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
GROUP BY gender;