DESCRIBE employees;

-- 2. 704()
SELECT CONCAT(first_name, ' ', last_name) as full_name
FROM `employees`
WHERE first_name like 'e%e'
ORDER BY first_name;

-- 3. upper()
SELECT upper(CONCAT(first_name, ' ', last_name)) as full_name
FROM `employees`
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;
	
-- 4. 
SELECT first_name, last_name, hire_date, curdate(), curdate() - hire_date as days_atwork  
FROM employees
WHERE birth_date LIKE '%%%%-12-25'
AND hire_date 
BETWEEN '1990-01-01'	
and '1999-12-31'
ORDER BY birth_date ASC, hire_date DESC;

-- 5.
SELECT max(salary), min(salary)
FROM salaries
WHERE to_date > curdate(); 

-- 6. total = 899 Newst =Teji Eldridge Oldest = Sergie Erde 
SELECT lower(concat(substr(first_name, 1, 1), substr(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), substr(year(birth_date),3,4))) as username, first_name, last_name, birth_date 
FROM employees;






	()