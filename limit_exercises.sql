DESCRIBE employees;
-- 2. 
SELECT DISTINCT last_name 
FROM `employees`
ORDER BY last_name DESC
LIMIT 10;

-- 3.
SELECT emp_no, hire_date
FROM employees
WHERE hire_date LIKE '199%'
ORDER BY hire_date ASC
LIMIT 5;

-- 4. 
SELECT emp_no, hire_date, birth_date
FROM employees
WHERE hire_date LIKE '%199%'
AND birth_date LIKE '%-12-25'
ORDER BY hire_date ASC
LIMIT 5 OFFSET 45;