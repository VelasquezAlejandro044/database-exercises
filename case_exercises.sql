-- 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, 

USE employees;
SELECT e.*, (SELECT to_date FROM salaries WHERE to_date NOT LIKE '9999%') AS end_date 
FROM employees AS e
JOIN salaris s 
;  


-- and a new column 'is_current_employee' 
e.emp_no, de.dept_no, e.hire_date
-- that is a 1 if the employee is still with the company and 0 if not.



-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

-- 3. How many employees (current or previous) were born in each decade?