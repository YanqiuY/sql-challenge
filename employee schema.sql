-- Create a table for titles
CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);

--DROP TABLE titles

-- view of the 'titles' table
SELECT * FROM titles

-- Create a table for departments
CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

-- view of the 'departments' table
SELECT * FROM departments

-- Create a table for employees
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR NOT NULL,
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

--DROP TABLE employees

-- view of the 'employees' table
SELECT * FROM employees

-- Create a table for dept_emp
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--DROP TABLE dept_emp

-- view of the 'dept_emp' table
SELECT * FROM dept_emp

-- Create a table for dept_manager
CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--DROP TABLE dept_manager

-- view of the 'dept_manager' table
SELECT * FROM dept_manager

-- Create a table for salaries
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--DROP TABLE salaries

-- view of the 'salaries' table
SELECT * FROM salaries