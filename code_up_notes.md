# Codeup Data Science Temporary Tables


-- Step 3: start samll w/ one table, run your query
CREATE TEMPORARY TABLE hopper_1565.employees_with_ departments AS(
    
)
USE employees;

SELECT * 
FROM employees
JOIN dept_emp USING(emp_no)
