-- 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
USE employees;
SELECT dept_emp.emp_no, dept_no, from_date AS start_date, to_date AS end_date,
	CASE 
		WHEN dept_emp.to_date > now() THEN 1
		ELSE 0
		END AS 'is_current_employee'
FROM `dept_emp` 
JOIN (SELECT 
			emp_no, MAX(to_date) AS max_date
			FROM dept_emp
			GROUP BY emp_no) AS last_dept
USING(emp_no) 
JOIN departments USING(dept_no)
WHERE dept_emp.emp_no = last_dept.emp_no
ORDER BY emp_no;

-- 2 Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.	

SELECT first_name, last_name,
	CASE
		WHEN last_name < 'i' THEN 'A-H' 
		WHEN last_name < 'r' THEN 'I-Q'
		ELSE 'R-Z'
		END AS alpha_group
FROM employees;
	


-- 3 How many employees (current or previous) were born in each decade?

-- birth_date renge 
select max(birth_date), min(birth_date)
from employees;

-- Count of births per decade
SELECT COUNT(*),
	CASE
		WHEN birth_date LIKE '195%' THEN '1950s'
		WHEN birth_date LIKE '196%' THEN '1960s'
		ELSE NULL
		END AS decade_of_birth
FROM employees
GROUP BY decade_of_birth; 



-- BONUS. What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
-- Departments 
select * from departments;

-- Grouping
SELECT
	CASE
		WHEN dept_name IN ('Research', 'Development') THEN 'R&D'
		WHEN dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
		WHEN dept_name IN ('Production', 'Quality Managment') THEN 'Prod & QM'
		WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR' 
		ELSE 'Costomer Service'
		END AS department_group, AVG(salary) AS avg_salary
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE salaries.to_date > now()
GROUP BY department_group
ORDER BY avg_salary;
