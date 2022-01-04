--I want to know how many employees with each title were born after 1965-01-01.


select count(*) as "Number of Employees", t.title
from employees e
inner join titles t 
on e.emp_no = t.emp_no 
where e.birth_date >'1965-01-01'
group by t.title;

--I want to know the average salary per title.

select AVG(s.salary), t.title 
from salaries s
inner join titles t 
on s.emp_no = t.emp_no 
group by t.title;

--How much money was spent on salary for the marketing department between the years 1990 and 1992?

select format(sum(s.salary), 2) as 'Total Salaries,', d.dept_name
from salaries s, dept_emp de, departments d
where s.emp_no = de.emp_no and de.dept_no = d.dept_no 
and year(s.from_date) >= 1990 and year(s.to_date) <= 1992
and  d.dept_name like 'Marketing';
