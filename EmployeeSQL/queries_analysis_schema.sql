--List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees emp
JOIN salaries sal 
ON emp.emp_no = sal.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees emp
WHERE emp.hire_date >= '1986-01-01'
AND emp.hire_date <= '1986-12-31';

--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT dept_m.dept_no, departments.dept_name, dept_m.emp_no, employees.last_name, employees.first_name, titles.title
FROM dept_manager dept_m
JOIN departments ON dept_m.dept_no = departments.dept_no
JOIN employees ON dept_m.emp_no = employees.emp_no
JOIN titles ON titles.title_id = employees.emp_title_id;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
ORDER BY dept_emp.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' 
AND employees.last_name LIKE 'B%'
ORDER BY SEX;

--List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name, titles.title
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
JOIN titles ON titles.title_id = employees.emp_title_id
WHERE departments.dept_name = 'Sales'
ORDER BY titles.title, employees.emp_no;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name, titles.title
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
JOIN titles ON titles.title_id = employees.emp_title_id
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development'
ORDER BY departments.dept_name, titles.title;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT last_name, COUNT(emp_no) AS " how many employees share each last name"
FROM employees
GROUP BY last_name
ORDER BY " how many employees share each last name" DESC;