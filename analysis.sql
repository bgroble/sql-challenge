-- list employee number, ln, fn, sex, and salary for each employee
SELECT EMPLOYEES.emp_no, EMPLOYEES.last_name, EMPLOYEES.first_name, EMPLOYEES.sex, SALARIES.salary
FROM EMPLOYEES
LEFT JOIN SALARIES 
ON SALARIES.emp_no = EMPLOYEES.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT EMPLOYEES.first_name, EMPLOYEES.last_name, EMPLOYEES.hire_date
FROM EMPLOYEES
WHERE EMPLOYEES.hire_date BETWEEN '01-01-1986' AND '12-31-1986'
ORDER BY EMPLOYEES.hire_date;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT DEPT_MANAGER.emp_no, DEPT_MANAGER.dept_no, DEPARTMENTS.dept_name, EMPLOYEES.last_name, EMPLOYEES.first_name
FROM DEPT_MANAGER
LEFT JOIN DEPARTMENTS
ON DEPARTMENTS.dept_no = DEPT_MANAGER.dept_no
LEFT JOIN EMPLOYEES 
ON EMPLOYEES.emp_no = DEPT_MANAGER.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT DEPT_EMP.dept_no, EMPLOYEES.emp_no, EMPLOYEES.last_name, EMPLOYEES.first_name, DEPARTMENTS.dept_name
FROM DEPT_EMP
JOIN EMPLOYEES
ON EMPLOYEES.emp_no = DEPT_EMP.emp_no
JOIN DEPARTMENTS 
ON DEPARTMENTS.dept_no = DEPT_EMP.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT EMPLOYEES.first_name, EMPLOYEES.last_name, EMPLOYEES.sex
FROM EMPLOYEES
WHERE first_name = 'Hercules'
AND last_name Like 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT DEPT_EMP.emp_no, EMPLOYEES.last_name, EMPLOYEES.first_name
FROM DEPT_EMP
JOIN EMPLOYEES
ON EMPLOYEES.emp_no = DEPT_EMP.emp_no
JOIN DEPARTMENTS
ON DEPARTMENTS.dept_no = DEPT_EMP.dept_no
WHERE DEPARTMENTS.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT DEPT_EMP.emp_no, EMPLOYEES.last_name, EMPLOYEES.first_name, DEPARTMENTS.dept_name
FROM DEPT_EMP
JOIN EMPLOYEES
ON EMPLOYEES.emp_no = DEPT_EMP.emp_no
JOIN DEPARTMENTS
ON DEPARTMENTS.dept_no = DEPT_EMP.dept_no
WHERE DEPARTMENTS.dept_name = 'Sales' OR DEPARTMENTS.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM EMPLOYEES
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;