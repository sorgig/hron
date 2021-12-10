-- examples on self join
alter session set current_schema = hron;

-- SQL/92
select e.last_name as Employee, m.last_name as Manager
from employee e join employee m
on e.manager_id = m.employee_id
order by 1;

-- "classic"
select e.last_name as Employee, m.last_name as Manager
from employee e, employee m
where e.manager_id = m.employee_id
order by 1;
