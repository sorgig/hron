select d.name, round(avg(e.salary)) as "avg salary"
from employee e join department d using (department_id)
where hired >= '2020-01-01'
group by d.name;

-- examples on group by example of grouping

select department_id, sum(salary) as sum_salary
from employee
group by department_id
order by sum_salary desc;

select d.name, max(e.salary) as sum_salary
from employee e join department d
using (department_id)
group by d,name
order by sum_salary desc;


-- grouping employees by department and then by job id
select department_id, job_id
from employee
group by department_id, job_id
order by department_id;

-- average salary for all the employees
select round(avg(salary), 2) as avg_sal
from employee;

-- average salary for each department
select department_id, round(avg(salary)) as avg_sal
from employee
group by department_id
order by avg_sal desc;

-- average salary for each department, excluding the employees not assigned to a department
select department_id, round(avg(salary)) as avg_sal
from employee
where department_id is not null
group by department_id
order by avg_sal desc;

-- average salary for latest hired employees grouped by department
select d.name, round(avg(e.salary)) as avg_sal
from employee e join department d using (department_id)
where hired >= '2020-01-01'
group by d.name;
