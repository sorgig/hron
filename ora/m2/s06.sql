-- examples on left/right outer join - from "many" perspective
alter session set current_schema = hron;

-- Kimberely is an employee not associated to any department
select first_name, last_name, department_id
from employee
where last_name like 'Gr%';

-- the inner join skips Kimberely
select e.first_name, e.last_name, d.name as department
from employee e inner join department d
using (department_id)
where e.last_name like 'Gr%';

-- left outer join preserves Kimberely, giving NULL for the department columns
select e.first_name, e.last_name, d.name as department
from employee e left outer join department d
using (department_id)
where e.last_name like 'Gr%';

-- rewritten as right outer join
select e.first_name, e.last_name, d.name as department
from department d right outer join employee e
using (department_id)
where e.last_name like 'Gr%';

-- "left" or "right" implies "outer"
select e.first_name, e.last_name, d.name as department
from employee e left join department d
using (department_id)
where e.last_name = 'Grant';
