1--List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, last_name, first_name, sex, salary

FROM employees e
	JOIN salaries s on s.emp_no = e.emp_no


2--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date

FROM employees 

WHERE extract(year from hire_date) = 1986


3--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT first_name, last_name, dm.dept_no, e.emp_no

FROM dept_manager dm
	JOIN employees e on e.emp_no = dm.emp_no
	JOIN department d on d.dept_no = dm.dept_no

ORDER BY last_name ASC, first_name ASC


4--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT de.dept_no, e.last_name, e.first_name, d.dept_name, e.emp_no

FROM dept_emp de
	JOIN employees e on e.emp_no = de.emp_no
	JOIN department d on d.dept_no = de.dept_no

ORDER BY last_name ASC, first_name ASC


5--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT e.last_name, e.first_name, e.sex

FROM employees e

WHERE first_name = 'Hercules'
	AND last_name like 'B%'

ORDER BY last_name ASC, first_name ASC

6--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.last_name, e.first_name, e.emp_no

FROM dept_emp de
	JOIN employees e on e.emp_no = de.emp_no
	JOIN department d on d.dept_no = de.dept_no

WHERE d.dept_name = 'Sales'

ORDER BY last_name ASC, first_name ASC


7--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.last_name, e.first_name, e.emp_no, d.dept_name

FROM dept_emp de
	JOIN employees e on e.emp_no = de.emp_no
	JOIN department d on d.dept_no = de.dept_no

WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'

ORDER BY last_name ASC, first_name ASC

8--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name,
		count(emp_no) as num

FROM employees

GROUP BY last_name

ORDER BY num DESC













