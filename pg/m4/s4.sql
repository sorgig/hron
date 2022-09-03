-- examples on having

select d.name as "Department", j.title as "Job Title"
from department d join employee e using (department_id)
    join job j using (job_id)
group by d.name, j.title
having d.name like '%ing';

-- get employees with a salary less than 8000
-- group them by manager id
-- keep the groups with an average salary above 6000
-- and order the result by the the second column, descending
select manager_id, round(avg(salary)) as avg_sal
from employee
where salary < 8000
group by manager_id
having avg(salary) > 6000
order by avg_sal desc;


select manager_id, round(avg(salary)) as avg_sal
from employee
where salary between 6000 and 8000
group by manager_id
order by avg_sal desc;


select concat(first_name, ' ', last_name)
from employee
where department_id in (
	select department_id
	from department
	where name = 'IT');







