SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

--How many employees are ready for retirement?
SELECT count(*)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

--Refining the query for different age group
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT count(*)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31'


--Create three more queries to search for employees
--who were born in 1953, 1954, and 1955.

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';


-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND
		(hire_date BETWEEN '1985-01-01' AND '1988-12-31');
		
--COUNT OF ELIGIBLE RETIREES
SELECT count(*)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND
		(hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--CREATING A NEW TABLE FOR THE ELIGIBLE RETIREES
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT *
FROM retirement_info;

-- DROPING THE RETIRMENT TABLE
DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;


-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;


-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
	retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * FROM current_emp

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

SELECT COUNT(re.emp_no),(de.dept_no)
INTO count_retirees
FROM retirement_info as re
full JOIN dept_emp as de
ON re.emp_no = de.emp_no
GROUP BY de.dept_no;

SELECT * FROM count_retirees


SELECT * FROM salaries
ORDER BY to_date DESC;


-- -- MERGING 3 TABLE TO AQUIRE DATA
SELECT e.emp_no,e.first_name,e.last_name,e.gender,s.salary,de.to_date
INTO emp_info
FROM employees AS e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

SELECT * FROM emp_info
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
SELECT * FROM manager_info
-- -- -- -- -- -- -- -- -- -- -- 

SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- -- Employee numbers /Employee first name
-- /Employee last name /Employee department name
SELECT e.emp_no, e.first_name, e.last_name, de.dept_name
-- INTO sales_info
FROM employees AS e
INNER JOIN dept_emp as dep
ON (e.emp_no =  dep.emp_no)
INNER JOIN departments AS de
ON (dep.dept_no = de.dept_no)


SELECT e.emp_no, e.first_name, e.last_name, de.dept_name, e.hire_date
-- INTO sales_info
FROM employees AS e
INNER JOIN dept_emp as dep
ON (e.emp_no =  dep.emp_no)
INNER JOIN departments AS de
ON (dep.dept_no = de.dept_no)
WHERE de.dept_name IN ('Developmnent','Sales') AND
(birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');