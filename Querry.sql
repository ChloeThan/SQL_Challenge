-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no "employee number", last_name "last name", first_name "first name", sex, salary  
FROM public."Employee" e
INNER JOIN public."Salary" s on e.emp_no = s.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name "first name", last_name "last name", hire_date
FROM public."Employee" 
where hire_date BETWEEN '1986-01-01' AND '1986-12-31'

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, dept_name, e.emp_no, last_name, first_name
FROM public."Department" d, public."DepartmentManager" dm, public."Employee" e
where d.dept_no = dm.dept_no and dm.emp_no = e.emp_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no "employee number", last_name "last name", first_name "first name", dept_name  
FROM public."Employee" e
INNER JOIN public."DepartmentEmployee" de on e.emp_no = de.emp_no
INNER JOIN public."Department" d on de.dept_no = d.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name "first name", last_name "last name", sex
FROM public."Employee" 
WHERE first_name = 'Hercules' and last_name LIKE 'B%'


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no "employee number", last_name "last name", first_name "first name", dept_name  
FROM public."Employee" e
INNER JOIN public."DepartmentEmployee" de on e.emp_no = de.emp_no
INNER JOIN public."Department" d on de.dept_no = d.dept_no
WHERE dept_name = 'Sales'


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no "employee number", last_name "last name", first_name "first name", dept_name  
FROM public."Employee" e
INNER JOIN public."DepartmentEmployee" de on e.emp_no = de.emp_no
INNER JOIN public."Department" d on de.dept_no = d.dept_no
WHERE (dept_name = 'Sales' OR dept_name = 'Development')


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) as frequency_count
FROM public."Employee"
GROUP BY last_name
ORDER BY frequency_count DESC
















