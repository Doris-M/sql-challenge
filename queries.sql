/*List the following details of each employee: employee number, last name, first name, sex, and salary.*/
SELECT e.emp_id, 
       e.last_name, 
	   e.first_name, 
	   (SELECT CASE 
			   WHEN e.sex = 'F' THEN 'Female' 
			   ELSE 'Male' 
		END) AS Sex,
	    s.salary
FROM employees e
INNER JOIN salaries s ON s.emp_id = e.emp_id
ORDER BY salary


/*List first name, last name, and hire date for employees who were hired in 1986.*/
SELECT e.last_name, 
	   e.first_name, 
	   e.hire_date
  FROM employees e
 WHERE EXTRACT(YEAR FROM e.hire_date) = 1986


/*List the manager of each department with the following information: department number, department name, 
the manager's employee number, last name, first name.*/
SELECT dm.dept_id, 
	   d.dept_description AS "Deparment Name",
	   dm.emp_id_manager AS "Manager's Employee Number'",
	   e.last_name,
	   e.first_name
  FROM department_manager dm
INNER JOIN departments d ON d.dept_id = dm.dept_id
INNER JOIN employees e ON e.emp_id = dm.emp_id_manager


/*List the department of each employee with the following information: employee number, last name, first name, and department name.*/
SELECT e.emp_id as "Employee Number", 
       e.last_name, 
       e.first_name, 
	   d.dept_description AS "Department Name"
  FROM employees e 
INNER JOIN department_employees de on de.emp_id = e.emp_id
INNER JOIN departments d ON d.dept_id = de.dept_id;


/*List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."*/
SELECT e.first_name, 
       e.last_name,
	  (SELECT CASE 
			   WHEN e.sex = 'F' THEN 'Female' 
			   ELSE 'Male' 
		END) AS Sex
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';


/*List all employees in the Sales department, including their employee number, last name, first name, and department name.*/
    SELECT e.emp_id, e.last_name, e.first_name, dep.dept_description as department_name
      FROM employees e
INNER JOIN department_employees de ON de.emp_id = e.emp_id
INNER JOIN departments dep ON dep.dept_id = de.dept_id
     WHERE dep.dept_description = 'Sales'


/*List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.*/
   SELECT e.emp_id, e.last_name, e.first_name, dep.dept_description as department_name
      FROM employees e
INNER JOIN department_employees de ON de.emp_id = e.emp_id
INNER JOIN departments dep ON dep.dept_id = de.dept_id
     WHERE dep.dept_description in ('Sales','Development')

/*In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.*/


