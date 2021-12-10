-- examples on regex
alter session set current_schema = hron;

-- plain LIKE
select last_name
from employee
where last_name like 'A%' or last_name like 'E%'
order by 1;

-- LIKE with regular expression
select last_name
from employee
where regexp_like(last_name, '^[AE]');

select first_name, last_name
from employee
where regexp_like(last_name, '^C.*[nt]$');
