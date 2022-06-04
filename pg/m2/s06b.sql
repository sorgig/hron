-- examples on left/right outer join - from "many" perspective

-- Treasury is a department
select name
from department
where department_id in (11, 12);

-- the inner join skips Treasury
select first_name, last_name, name
from employee inner join department
using(department_id)
where department_id in (11, 12);

-- right outer join
select first_name, last_name, name
from employee right outer join department
using(department_id)
where department_id in (11, 12);

-- as above, rewritten as left outer join
select first_name, last_name, name
from department left outer join employee
using(department_id)
where department_id in (11, 12);
