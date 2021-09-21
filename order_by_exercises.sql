DESCRIBE employees;

-- 2. 1st person = Irena Reutenaure. Last = vidya Simmen
SELECT * 
FROM `employees`
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

-- 3. 1st = Irene Acton Last = Vidaya Zweizing
SELECT * FROM employees
WHERE (first_name = 'Irena' 
	OR first_name = 'Vidya' 
	OR first_name ='Maya'
	)
	ORDER BY first_name, last_name;
	
-- 4. 1st = Irene Acton Last = Maya Zyda
SELECT * FROM employees
WHERE (first_name = 'Irena' 
	OR first_name = 'Vidya' 
	OR first_name ='Maya'
	)
	ORDER BY last_name, first_name;

-- 5.Total = 899 first employee = 10021	Ramzi Erde Last = 499648 Tadahiro Erde
SELECT emp_no, first_name, last_name 
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY `emp_no`;

-- 6. total = 899 Newst =Teji Eldridge Oldest = Sergie Erde 
SELECT first_name, last_name 
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY hire_date DESC;

SELECT * 
FROM employees
WHERE last_name LIKE '%e'
OR last_name LIKE 'E%';

-- 7. Total = 362 Oldest = Khun Bernini  Joungst = Douadi Pettis
SELECT first_name, last_name, birth_date 
FROM employees
WHERE birth_date LIKE '%%%%-12-25'
AND hire_date 
BETWEEN '1990-01-01'	
and '1999-12-31'
ORDER BY birth_date ASC, hire_date DESC;



	