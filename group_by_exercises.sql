DESCRIBE employees;

-- 2. There are 7 unitc titles 
SELECT DISTINCT title
FROM titles;

-- 3. 
SELECT DISTINCT last_name
FROM `employees`
WHERE last_name LIKE '%E' 
AND last_name LIKE 'E%'
GROUP BY last_name;

-- 4
SELECT DISTINCT first_name, last_name
FROM `employees`
WHERE last_name LIKE '%E' 
AND last_name LIKE 'E%'
ORDER BY first_name;

-- 5 The names are Chleq, Lindqvist, Qwiwen
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
SELECT first_name, gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name;

SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 10;


-- 8

-- 9
