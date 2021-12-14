-- order by

select *
from employee
order by last_name, first_name;

-- sorting in natural order
select *
from employee
order by salary;

-- descending
select first_name, last_name, salary
from employee
order by salary desc
limit 3;

-- positional notation
select first_name, last_name, salary
from employee
where first_name like 'A%'
order by 3 desc
limit 5;

select first_name, last_name, hired
from employee
where first_name like 'A%'
order by 3 desc
limit 5;
