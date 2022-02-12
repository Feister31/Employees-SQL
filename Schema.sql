--Creating tables for EmployeeDB

CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

CREATE TABLE employees(
	emp_no INT NOT NULL,
	birthday DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) References departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(50) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no , title, from_date)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary Int NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, from_date)
); 

COPY departments FROM '/Users/stevenfei/public/departments.csv' DELIMITER ',' CSV HEADER;
COPY employees FROM '/Users/stevenfei/public/employees.csv' DELIMITER ',' CSV HEADER;
COPY dept_emp FROM '/Users/stevenfei/public/dept_emp.csv' DELIMITER ',' CSV HEADER;
COPY dept_manager FROM '/Users/stevenfei/public/dept_manager.csv' DELIMITER ',' CSV HEADER;
COPY salaries FROM '/Users/stevenfei/public/salaries.csv' DELIMITER ',' CSV HEADER;
COPY titles FROM '/Users/stevenfei/public/titles.csv' DELIMITER ',' CSV HEADER;


SELECT * 
FROM salaries;

ALTER TABLE employees
RENAME COLUMN birthday TO birth_date;