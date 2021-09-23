DESCRIBE users;

-- Join Example Database
-- 1. 
SELECT * 
FROM roles as r
JOIN users as u on r.id = u.role_id;

-- 2.
SELECT users.name AS user_name, roles.name AS role_name
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

-- 3. 
SELECT roles.name, count(roles.id) as prople_in_role
FROM users 
RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY roles.name;

-- Employees Database
DESCRIBE dept_manager;

SELECT * 
FROM departments as d
JOIN dept_manager as dm 
ON d.dept_no = dm.dept_no
JOIN employees as e
ON dm.emp_no = e.emp_no;

-- 2. 
SELECT d.dept_name AS Dpartment_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager 
FROM employees AS e
JOIN `dept_manager` AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY d.dept_name; 

-- 3.
SELECT d.dept_name AS Dpartment_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager 
FROM employees AS e
JOIN `dept_manager` AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' and e.`gender` = 'F'
ORDER BY d.dept_name; 

-- 4. 

SELECT t.title, count(title) AS Count
FROM titles as t
JOIN employees as e
ON t.emp_no = e.emp_no
JOIN `dept_emp` as d
ON e.emp_no = d.emp_no
WHERE t.to_date = '9999-1-1'
AND d.`to_date` LIKE '9999%'
AND d.`dept_no` = 'd009'
GROUP BY title
ORDER BY title;

-- 5.
SELECT d.dept_name AS Dpartment_Name, CONCAT(e.first_name, ' ', e.last_name) AS Name, salary Department_Manager 
FROM employees AS e
JOIN `dept_manager` AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
ORDER BY d.dept_name; 

-- 6. NO BUENO
SELECT de.dept_no, de.`dept_name`, count(s.salary) AS num_employees
FROM dept_emp as d
JOIN salaries as s
ON d.emp_no = s.emp_no
JOIN departments as de
ON d.dept_no = de.dept_no
WHERE d.to_date LIKE '9999%'
AND s.to_date LIKE '9999%'
GROUP BY de.`dept_no`
ORDER BY de.`dept_no`;

-- 7. 
SELECT d.`dept_name`, avg(s.salary)
FROM departments as d
JOIN dept_emp as de
ON d.`dept_no` = de.`dept_no` 
JOIN salaries as s
ON de.emp_no = s.`emp_no`
WHERE de.to_date LIKE '9999%'
AND s.to_date LIKE '9999%'
GROUP BY d.`dept_name`
ORDER BY d.`dept_name` DESC
LIMIT 1;

SELECT *
FROM departments as d
JOIN dept_emp as de
ON d.`dept_no` = de.`dept_no` 
JOIN salaries as s
ON de.emp_no = s.`emp_no`
WHERE de.to_date LIKE '9999%'
AND s.to_date LIKE '9999%';