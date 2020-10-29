USE employees;
-- employees with same hire date as employee_no: 101010
select *from employees
where hire_date in (
    select hire_date
    from employees
    where emp_no = 101010
);

-- titles of all employees with name aamod
select * from titles
where emp_no IN (
    select emp_no
    from employees
    where first_name = 'Aamod'
    )

--- current dept managers that are female
select first_name, last_name
from employees
where gender = 'F' and emp_no in (
    select emp_no
    from dept_manager
    where to_date  like '%9999%'
);