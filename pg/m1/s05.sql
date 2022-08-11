-- Examples on logical operators

-- a plain select
select *
from employee
where not department_id > 2;

-- "not" is to get it the other way round
select *
from employee
where not department_id > 2;

-- "and" is when both conditions should hold
select *
from employee
where salary < 3000 and employee_id > 160;

-- "or" is when one or the other should hold
select *
from employee
where salary < 2200 or last_name = 'King';
