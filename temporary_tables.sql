-- 1 Using the example from the lesson, 
-- create a temporary table called employees_with_departments 
-- that contains first_name, last_name, and dept_name
-- for employees currently with that department. Be absolutely sure to create this table on your own database.
-- If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.

USE employees;
CREATE TEMPORARY TABLE hopper_1565.employees_with_departments AS (
	SELECT first_name, last_name, dept_name
	FROM employees
	JOIN dept_emp USING(emp_no)
	JOIN departments USING(dept_no)
	WHERE to_date > now()
	);


SELECT * FROM hopper_1565.employees_with_departments;

-- WARNING => drop table
DROP TEMPORARY TABLE hopper_1565.employees_with_departments;

-- a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
DESCRIBE hopper_1565.employees_with_departments;
ALTER TABLE hopper_1565.employees_with_departments ADD full_name VARCHAR(30);

-- b. Update the table so that full name column contains the correct data

UPDATE hopper_1565.employees_with_departments SET full_name = concat(first_name, ' ', last_name);
ALTER TABLE hopper_1565.employees_with_departments DROP COLUMN first_name, DROP COLUMN last_name;

SELECT * FROM hopper_1565.employees_with_departments;

-- d. What is another way you could have ended up with this same table?

CREATE TEMPORARY TABLE hopper_1565.2employees_with_departments AS (
	SELECT concat(first_name, ' ', last_name) AS full_name, dept_name
	FROM employees
	JOIN dept_emp USING(emp_no)
	JOIN departments USING(dept_no)
	WHERE to_date > now()
	);

SELECT * FROM hopper_1565.2employees_with_departments;
DESCRIBE hopper_1565.2employees_with_departments;

-- 2. 
-- Create a temporary table based on the payment table from the sakila database.
-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
USE sakila;
CREATE TEMPORARY TABLE hopper_1565.payment AS
SELECT * FROM payment;
ALTER TABLE hopper_1565.payment ADD num_cents INT UNSIGNED;
SELECT * FROM hopper_1565.payment;

-- WARNING => drop table
DROP TEMPORARY TABLE hopper_1565.payment;

UPDATE hopper_1565.payment SET hopper_1565.payment.num_cents = hopper_1565.payment.amount * 100; 
SELECT * FROM hopper_1565.payment;


-- 3 Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?

-- Table with salaries, dept, and emp_no
USE employees;
CREATE TEMPORARY TABLE hopper_1565.Emp_No_Salary_Department AS
SELECT * FROM `dept_emp` as de
JOIN departments d USING(`dept_no`)
JOIN salaries s USING(`emp_no`);


-- Over all historical average pay
SELECT avg(salary) as Historical_avg_pay
FROM salaries;

-- Current verage pay per department

SELECT d.dept_name, avg(s.salary) FROM `dept_emp` as de
JOIN departments d USING(`dept_no`)
JOIN salaries s USING(`emp_no`)
WHERE s.to_date LIKE '9999%'
GROUP BY d.dept_name;

-- Returns the historic z-scores for each salary
# SELECT salary, 
 #   (salary - (SELECT AVG(salary) FROM salaries)) 
  #  / 
   # (SELECT stddev(salary) FROM salaries) AS zscore
# FROM salaries;

SELECT salary, 
    (SELECT avg(salary) as Historical_avg_pay
	FROM salaries) - (SELECT AVG(salary) FROM salaries)) 
    / 
    (SELECT stddev(salary) FROM salaries) AS zscore
FROM salaries;

-- 3
-- Find out how the current average pay in each department
SELECT d.dept_name, avg(s.salary) FROM `dept_emp` as de
JOIN departments d USING(`dept_no`)
JOIN salaries s USING(`emp_no`)
WHERE s.to_date LIKE '9999%'
GROUP BY d.dept_name;
 
-- compares to the overall, historical average pay. 
-- In order to make the comparison easier, you should use the Z-score for salaries.
--  In terms of salary, what is the best department right now to work for? 
-- The worst?

-- how can we simplify?
-- blow ooff what we can, where we can (resucing cognitive overhead)
-- zscore = ( x - avg(x)) / stddev(x)

-- STEP 1: find historic average pay
USE employees;
SELECT round(avg(salary)) FROM salaries;
-- avg_pay = 63811

-- Step 2: Find hisrtoric stamdar diviation 
SELECT round(stddev(salary)) FROM salaries;
-- Historical standar diviation = 16905

-- Step 3: Find current average pay in each department
SELECT d.dept_name, avg(s.salary) AS cur_avg_salary 
FROM `dept_emp` as de
JOIN departments d USING(`dept_no`)
JOIN salaries s USING(`emp_no`)
WHERE s.to_date LIKE '9999%'
AND de.to_date LIKE '9999%'
GROUP BY d.dept_name;


-- if yoou see "each" or "for each" in a problem statment for SQL
-- You are probably going to be grouping by the noun sprcified by " for each"
-- I need departments for dept_namr
-- I need salaries to get salary
-- I need somenthinf that is associated 


CREATE TEMPORARY TABLE hopper_1565.salaries_by_dept AS (
	SELECT d.dept_name, avg(s.salary) AS cur_avg_salary 
	FROM `dept_emp` as de
	JOIN departments d USING(`dept_no`)
	JOIN salaries s USING(`emp_no`)
	WHERE s.to_date LIKE '9999%'
	AND de.to_date LIKE '9999%'
	GROUP BY d.dept_name);
	


select* from hopper_1565.salaries_by_dept;

USE hopper_1565;

-- Add columns 

ALTER TABLE salaries_by_dept ADD COLUMN company_avg_salary FLOAT(10, 2);
ALTER TABLE salaries_by_dept ADD COLUMN company_std_salary FLOAT(10, 2);
ALTER TABLE salaries_by_dept ADD COLUMN zscore FLOAT(10, 2);

SELECT * FROM salaries_by_dept;

-- Add data to columns

UPDATE salaries_by_dept
SET company_avg_salary = (SELECT avg(salary) FROM employees.salaries);
UPDATE salaries_by_dept
SET company_std_salary = (SELECT stddev(salary) FROM employees.salaries);
UPDATE salaries_by_dept 
SET zscore = (cur_avg_salary - company_avg_salary) / company_std_salary;

-- double check work

SELECT * FROM hopper_1565.salaries_by_dept
ORDER BY zscore DESC;


