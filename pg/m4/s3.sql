-- examples on group by

-- grouping employees by department and then by job id
select department_id, job_id
from employee
group by department_id, job_id
order by 1;

-- average salary for all the employees
select round(avg(salary), 2) as "avg salary"
from employee
order by 1 desc;

-- average salary for each department
select department_id, round(avg(salary)) as "avg salary"
from employee
group by department_id
order by 2 desc;

-- average salary for each department, excluding the employees not assigned to a department
select department_id, round(avg(salary)) as "avg salary"
from employee
group by department_id
order by 2 desc;

select d.name, round(avg(e.salary)) as "avg salary"
from employee e join department d using (department_id)
where hired >= '2020-01-01'
group by d.name;
