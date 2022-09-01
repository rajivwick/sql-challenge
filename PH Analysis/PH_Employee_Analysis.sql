

-- Question 1 List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON 
s.emp_no=e.emp_no
ORDER BY emp_no;

-- Question 2. List first name, last name, and hire date for employees who were hired in 1986

SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE date_part('year', e.hire_date) = 1986
ORDER BY hire_date;

-- Question 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT m.dept_no, dep.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_manager as m
INNER JOIN departments as dep ON 
dep.dept_no=m.dept_no
INNER JOIN	employees as e ON
e.emp_no = m.emp_no
ORDER BY dept_no;

-- Question 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT d.emp_no, e.last_name, e.first_name, dep.dept_name
FROM dept_emp as d
INNER JOIN departments as dep ON dep.dept_no=d.dept_no
INNER JOIN	employees as e ON 
e.emp_no = d.emp_no
ORDER BY emp_no; 

-- Question 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%'
ORDER BY last_name; 

-- Question 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT d.emp_no, last_name, e.first_name, dep.dept_name
FROM dept_emp as d
INNER JOIN departments as dep ON
dep.dept_no=d.dept_no
INNER JOIN	employees as e ON
e.emp_no = d.emp_no
WHERE dep.dept_name = 'Sales'
ORDER BY emp_no;

-- Question 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT d.emp_no, e.last_name, e.first_name, dep.dept_name
FROM dept_emp as d
INNER JOIN departments as dep ON
dep.dept_no=d.dept_no
INNER JOIN	employees as e ON
e.emp_no = d.emp_no
WHERE dep.dept_name = 'Sales'
	OR dep.dept_name = 'Development'
ORDER BY emp_no;	

-- Question 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT last_name, COUNT(last_name) AS "Last Name"
FROM employees
GROUP BY last_name 
ORDER BY last_name DESC;