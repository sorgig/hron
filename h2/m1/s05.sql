-- Examples on logical operators

-- the other way round
select *
from employee
where not department_id > 2;

-- both conditions should hold
select *
from employee
where salary < 3000 and employee_id > 160;

-- one or the other should hold
select *
from employee
where salary < 2200 or last_name = 'King';
