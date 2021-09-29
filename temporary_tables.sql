-- 1 Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.

CREATE TEMPORARY TABLE hopper_1565.employees_with_departments(
	first_name VARCHAR(50), last_name VARCHAR(50) , dept_name VARCHAR(50));

SELECT * FROM hopper_1565.employees_with_departments;


-- a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
-- b. Update the table so that full name column contains the correct data

ALTER TABLE hopper_1565.employees_with_departments ADD full_name VARCHAR(31);
SELECT * FROM hopper_1565.employees_with_departments;
DESCRIBE hopper_1565.employees_with_departments;

-- b. Update the table so that full name column contains the correct data

ALTER TABLE employees_with_departments DROP COLUMN last_name;
ALTER TABLE employees_with_departments DROP COLUMN first_name;
SELECT * FROM employees_with_departments;

-- d. What is another way you could have ended up with this same table?

CREATE TEMPORARY TABLE hopper_1565.2employees_with_departments( 
	dept_name VARCHAR(50), full_name VARCHAR(100));
	
SELECT * FROM hopper_1565.2employees_with_departments;

-- 2. Create a temporary table based on the payment table from the sakila database. Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
USE sakila;
CREATE TEMPORARY TABLE hopper_1565.payment AS
SELECT * FROM payment;

SELECT * FROM hopper_1565.payment;

DROP TEMPORARY TABLE hopper_1565.payment;

UPDATE hopper_1565.payment SET amount = amount * 100; CLEAN UP!!!!!!!!!!!ACCESSIBLE
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

-- Current verage pay per departmentx

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
-- compares to the overall, historical average pay. 
-- In order to make the comparison easier, you should use the Z-score for salaries.
--  In terms of salary, what is the best department right now to work for? 
-- The worst?

--how can we simplify?
-- blow ooff what we can, where we can (resucing cognitive overhead)
-- zscore = ( x - avg(x)) / stddev(x)

-- STEP 1: find historic average pay
use employees;
select round(avg(salary)) from salaries;

-- Step 2: find hisrtoric stamdar diviation
-- 63811 
select round(avg(saary)) from salaries;

-- Step 3: find current average pay in each department
-- if yoou see "each" or "for each" in a problem statment for SQL
-- You are probably going to be grouping by the noun sprcified by " for each"
-- I need departments for dept_namr
-- I need salaries to get salary
-- I need somenthinf that is associated 
select dept_name, round(avg(salary)) as current_dept_avg_Salary
from departments
join dept_emp using(dept_name)
join salaries using(emp_no)
where salaries.to_date > now()
and dept_name.to_date > curdate()
group by dept_name;

Create temporary table hopper_1565.sakaries_by_dept as (
	select dept_name, round(avg(salary)) as current_dept_avg_Salary
	from departments
	join dept_emp using(dept_name)
	join salaries using(emp_no)
	where salaries.to_date > now()
	and dept_name.to_date > curdate()
	group by dept_name;
	
)

select* from hopper_1565.sakaries_by_dept;

use hopper_1565;

-- 
--
--

alter table salary_by_dept add column company FLOAT(10, 2);
alter table salary_by_dept add column company FLOAT(10, 2);
alter table salary_by_dept add column zscore FLOAT(10, 2);

select* from hopper_1565.sakaries_by_dept;

-- let's relay

update salries_by_dept
set company_std_salary = (select stddev(salary) from employees.salaries);

-- double check work

select* from hopper_1565.sakaries_by_dept;

-- now we can calculate zscore
update salries
