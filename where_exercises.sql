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

-- 6. 30723 start OR end with E and 24292 end with E
SELECT * 
FROM employees
WHERE last_name LIKE '%e';

SELECT * 
FROM employees
WHERE last_name LIKE '%e'
OR last_name LIKE 'E%';

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
WHERE `birth_date` BETWEEN '1990-01-01'	and '1999-12-31';

-- 9. 842 people were borned in Christmas   
SELECT * 
FROM employees
WHERE birth_date LIKE '%%%%-12-25';

-- 10. 362 borned in Crhistmasn and hired in the 90s 
SELECT * 
FROM employees
WHERE birth_date LIKE '%%%%-12-25'
AND hire_date 
BETWEEN '1990-01-01'	
and '1999-12-31';

-- 11. There are 18973 emoloyees with a Q in their last name
SELECT * 
FROM employees
WHERE last_name 
LIKE '%q%';

-- 12. 547 people have a last name with  Q but don't have QU
SELECT * 
FROM employees
WHERE last_name NOT LIKE '%qu%'
AND last_name LIKE '%q%';
 

	