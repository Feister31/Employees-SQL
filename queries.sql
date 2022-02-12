-- EMPLOYEE_DATABASE_CHALLENGE_SQL
select emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1925-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM RETIREMENT_INFO;

--NUMBER OF EMPLOYEES RETIRING
SELECT count(first_name)
FROM employees
WHERE(birth_date BETWEEN '1925-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--joining departments and dept_manager table

SELECT d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
From departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no
WHERE dm.to_date =('9999-01-01');

--SELECTING CURRENT EMPLOYEES
select ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
Where de.to_date =('9999-01-01');

-- EMPLOYEE COUNT BY DEPARTMENT NUMBER
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp AS ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- EMPLOYEE LIST WITH GENDER AND SALARY 
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	s.salary,
	de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s 
	ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01')

SELECT * FROM emp_info;

--LIST OF MANAGERS PER DEPARTMENTS
SELECT dm.dept_no,
	dm.emp_no,
	d.dept_name,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
INTO manager_info
FROM dept_manager as dm
INNER JOIN departments as d
	ON (dm.dept_no = d.dept_no)
INNER JOIN current_emp as ce
	ON (dm.emp_no = ce.emp_no);

SELECT * FROM manager_info;

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	i.title,
	de.from_date,
	de.to_date
INTO emp_comfir
FROM employees as e
INNER JOIN titles as i 
	ON (e.emp_no = i.emp_no)
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no DESC;

SELECT * FROM emp_comfir;

-- List of employees with departments
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp as de
	on (ce.emp_no = de.emp_no)
INNER JOIN departments as d
	on (de.dept_no = d.dept_no);

SELECT * From dept_info;

-- List of Sales Employees 
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO sales_info
FROM current_emp as ce
INNER JOIN dept_emp as de
	ON (ce.emp_no = de.emp_no)
INNER JOIN departments as d
	ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales';

-- LIST OF SALES AND DEVELOPMENT
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO sales_dev
FROM current_emp as ce
INNER JOIN dept_emp as de
	ON (ce.emp_no = de.emp_no)
INNER JOIN departments as d
	ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY ce.emp_no;

SELECT * FROM sales_dev;	
