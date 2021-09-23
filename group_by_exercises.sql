DESCRIBE employees;

-- 2. There are 7 unitc titles 
SELECT DISTINCT title
FROM titles;

-- 3. 5 
SELECT DISTINCT last_name
FROM `employees`
WHERE last_name LIKE 'e%E' 
GROUP BY last_name;

-- 4. 846
SELECT DISTINCT first_name, last_name
FROM `employees`
WHERE last_name LIKE '%E' 
AND last_name LIKE 'E%'
ORDER BY first_name;

-- 5 The 3 names are Chleq, Lindqvist, Qwiwen
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%' 
AND last_name NOT LIKE '%qu%'
;

-- 6 The names are Chleq, Lindqvist, Qwiwen

SELECT DISTINCT last_name, COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%' 
AND last_name NOT LIKE '%qu%'
GROUP BY last_name
;


-- 7 
SELECT first_name, gender, count(*) 
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;

-- 8
SELECT count(lower(concat(substr(first_name, 1, 1), substr(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), substr(year(birth_date),3,4)))) as user_name
FROM employees
;

SELECT DISTINCT count(lower(concat(substr(first_name, 1, 1), substr(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), substr(year(birth_date),3,4)))) as user_name
FROM employees
;

-- 9 
DESCRIBE salaries;

-- 9.1 
SELECT avg(salary) 
FROM salaries 
WHERE to_date NOT LIKE '9999-%';

-- 9.2 
SELECT  emp_no, avg(salary) 
FROM salaries 
WHERE to_date NOT LIKE '9999-%'
GROUP BY emp_no;

-- 9.3 
SELECT  emp_no, salary 
FROM salaries 
WHERE to_date LIKE '9999-%'
;

-- 9.4
SELECT emp_no, max(salary)
FROM salaries
GROUP BY emp_no;

-- 9.5
SELECT emp_no, max(salary)
FROM salaries
WHERE salary > 150000
GROUP BY emp_no
ORDER BY emp_no;

-- 9.6
SELECT emp_no, avg(salary) as AVG_$$
FROM salaries
WHERE to_date > curdate() 
and salary BETWEEN 80000 and 90000
GROUP BY emp_no;



