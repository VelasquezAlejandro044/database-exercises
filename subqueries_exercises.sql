-- SUBQUERIES

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT * 
FROM employees
WHERE hire_date = 
		(
		SELECT hire_date
		ccessible FROM employees
		WHERE emp_no = 101010
		); 

-- 2. Find all the titles ever held by all current employees with the first name Aamod.


SELECT title 
FROM titles
WHERE emp_no IN
		(
		SELECT emp_no
		FROM employees
		WHERE `first_name` = 'Aamod'
		); 
		
-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
-- 59,900

SELECT * 
FROM employees
WHERE emp_no NOT IN 
			(
			SELECT emp_no FROM salaries
			WHERE to_date LIKE '9999%' 
			) 
; 

-- 4. Find all the current department managers that are female. List their names in a comment in your code.

SELECT * FROM employees
WHERE gender = 'F' 
AND emp_no IN 
			(
			SELECT emp_no
			FROM dept_manager
			WHERE to_date > now()
			)  
;

-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT emp_no, first_name, last_name FROM employees
WHERE `emp_no` IN 
				(
				SELECT emp_no FROM salaries
				WHERE to_date LIKE '9999%'
				AND	salary > 
							(
							SELECT avg(salary) 
							FROM salaries));							
							
-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

SELECT conunt(salary)
FROM salaries
WHERE to_date > now()
AND salary > (
(SELECT max(salary) FROM salaries where to_date > now()) -
(SELECT std(salary) FROM salaries WHERE to_date > now());


-- Find the current highest salary:
SELECT MAX(salary)
FROM salaries
WHERE to_date > CURDATE(); -- The maximum current salary is 158220
 -- Find St Dev
SELECT STD(salary)
FROM salaries
WHERE to_date > CURDATE(); -- The standard deviation is 17309.9593
 -- Assemble subquery:
SELECT COUNT(salary)
FROM salaries
WHERE to_date > CURDATE() AND salary >= 140910.0407; -- There are 83 salaries within one standard deviation of the max salary
 -- Need to figure out how to implement the subtraction of the max salary and the standard deviation into sql statement
SELECT COUNT(salary)
FROM salaries
WHERE to_date > CURDATE() AND salary > ((SELECT MAX(salary)
FROM salaries
WHERE to_date > CURDATE()) - (SELECT STD(salary)
FROM salaries
WHERE to_date > CURDATE()));
-- Find the percentage of all salaries:
SELECT ((SELECT COUNT(salary)
FROM salaries
WHERE to_date > CURDATE() AND salary > ((SELECT MAX(salary)
FROM salaries
WHERE to_date > CURDATE()) - (SELECT STD(salary)
FROM salaries
WHERE to_date > CURDATE())))
/COUNT(salary))*100
FROM salaries
WHERE to_date > CURDATE();









