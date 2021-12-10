-- example on full outer join
alter session set current_schema = hron;

-- Left join for department 12 or 'Grant' -> Treasury is missing
select e.first_name, e.last_name, d.name, department_id
from employee e left outer join department d
using (department_id)
where department_id = 12 or e.last_name = 'Grant';

-- Right join for department 12 or 'Grant' -> Kimberely is missing
select e.first_name, e.last_name, d.name, department_id
from employee e right outer join department d
using (department_id)
where department_id = 12 or e.last_name = 'Grant';

-- FULL OUTER JOIN
select e.first_name, e.last_name, d.name, department_id
from employee e full outer join department d
using (department_id)
where department_id = 12 or e.last_name = 'Grant'
