DESCRIBE employees;

-- 2. 709 
SELECT * 
FROM `employees`
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

-- 3. Yes 709 rows
SELECT * FROM employees
WHERE (first_name = 'Irena' 
	OR first_name = 'Vidya' 
	OR first_name ='Maya'
	);
	
-- 4. 441
SELECT * FROM employees
WHERE gender = 'M' and (first_name = 'Irena' 
	OR first_name = 'Vidya' 
	OR first_name ='Maya'
	);

-- 5.7330
SELECT * 
FROM employees
WHERE last_name LIKE 'e%';

-- 6. 30723 start OR en with E and 24292 end with E
SELECT * 
FROM employees
WHERE last_name LIKE '%e';

SELECT * 
FROM employees
WHERE last_name LIKE '%e'
OR last_name LIKE '%';

-- 7. Start and end with E 899 and 24292 end with E
SELECT * 
FROM employees
WHERE last_name LIKE '%e'
AND last_name LIKE 'e%';

SELECT * 
FROM employees
WHERE last_name LIKE '%e';

-- 8. There are 135214 employees hired in the 90s
SELECT * 
FROM employees
WHERE `hire_date` BETWEEN '1990-01-01'	and '1999-12-31'

-- 9.  
SELECT * 
FROM employees
WHERE `hire_date` LIKE '%%%%-12-25'


	