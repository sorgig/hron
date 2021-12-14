-- Examples on logical operators

-- both conditions should hold
select *
from employee
where salary < 3000 and employee_id > 150;

-- one or the other is ok
select *
from employee
where salary < 2200 or last_name = 'King';

-- the other way round
select *
from employee
where not department_id > 2;
