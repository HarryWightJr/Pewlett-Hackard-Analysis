SELECT e.emp_no, 
	   e.first_name, 
	   e.last_name,
	   titles.title,
	   titles.from_date,
	   titles.to_date
--INTO Retirement_Titles
FROM employees as e
INNER JOIN titles
ON e.emp_no = titles.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO Unique_Titles
FROM retirement_titles as rt
ORDER BY emp_no ASC, to_date DESC;
--
Drop Table Retiring_Titles;
SELECT COUNT (title), title
--INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;
--
SELECT DISTINCT ON (em.emp_no) em.emp_no,
       em.first_name,
       em.last_name, 
       em.birth_date,
       de.from_date,
       de.to_date,  
       ti.title
--INTO mentorship_eligibilty
FROM employees as em
    LEFT JOIN dept_emp as de
    ON (em.emp_no = de.emp_no)
    LEFT JOIN titles as ti
    ON (em.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01') AND 
    (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY em.emp_no; 
-- Total Employees
SELECT COUNT (emp_no)
FROM employees;