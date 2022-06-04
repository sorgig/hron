-- left/right outer join - from "many" perspective

-- Kimberely is an employee
select first_name, last_name
from employee
where last_name like 'Gr%';

-- the inner join skips Kimberely
select first_name, last_name, name as department
from employee join department
using (department_id)
where last_name like 'Gr%';

-- left outer join
select first_name, last_name, name
from employee left outer join department
using (department_id)
where last_name like 'Gr%';

-- rewritten as right outer join
select first_name, last_name, name
from department right outer join employee
using (department_id)
where last_name like 'Gr%';

-- "left" / "right" imply "outer"
select first_name, name
from employee left join department
using (department_id)
where last_name = 'Grant';
