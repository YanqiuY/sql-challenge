-- Create a table for titles
CREATE TABLE titles (
	title_id VARCHAR(255) PRIMARY KEY NOT NULL,
	title VARCHAR(255)
);

-- view of the 'titles' table
SELECT * FROM titles;

-- Create a table for departments
CREATE TABLE departments (
	dept_no VARCHAR(255) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(255)
);

-- view of the 'departments' table
SELECT * FROM departments;

-- Create a table for employees
CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(255) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(255),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- view of the 'employees' table
SELECT * FROM employees;

-- Create a table for dept_emp
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(255) NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- view of the 'dept_emp' table
SELECT * FROM dept_emp;

-- Create a table for dept_manager
CREATE TABLE dept_manager (
	dept_no VARCHAR(255) NOT NULL,
	emp_no INT PRIMARY KEY NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- view of the 'dept_manager' table
SELECT * FROM dept_manager;

-- Create a table for salaries
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- view of the 'salaries' table
SELECT * FROM salaries;