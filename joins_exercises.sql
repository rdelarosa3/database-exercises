USE employees;
-- managers by department and employee name
SELECT dept_name as 'Department Name', CONCAT(first_name,' ',last_name) as 'Department Manager'
FROM departments as dept
    JOIN dept_manager as dm
        ON dept.dept_no = dm.dept_no
    JOIN employees as em
        ON dm.emp_no = em.emp_no

-- where managers are female
SELECT dept_name as 'Department Name', CONCAT(first_name,' ',last_name) as 'Department Manager'
FROM departments as dept
         JOIN dept_manager as dm
              ON dept.dept_no = dm.dept_no
         JOIN employees as em
              ON dm.emp_no = em.emp_no
WHERE em.gender = 'F';

-- current salaries for mananger
SELECT dept_name as 'Department Name', CONCAT(first_name,' ',last_name) as 'Department Manager', salary AS Salary
FROM dept_manager as dm
         JOIN departments as dept
              ON dept.dept_no = dm.dept_no
         JOIN employees as em
              ON dm.emp_no = em.emp_no
         JOIN salaries AS s
              ON em.emp_no = s.emp_no
where s.to_date LIKE '%9999%' and dm.to_date LIKE '%9999%'
order by dept_name asc

-- the count of  current titles of employees currently working in the
-- Customer Service Dept
SELECT title as Title, COUNT(title) AS Count
FROM titles AS ti
         JOIN dept_emp as demp
              ON ti.emp_no = demp.emp_no
         JOIN departments as dept
              ON dept.dept_no = demp.dept_no
WHERE dept_name = 'Customer Service'
AND ti.to_date LIKE '%9999%'
AND demp.to_date LIKE'%9999%'
GROUP BY title