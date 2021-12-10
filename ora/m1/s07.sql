-- examples on orderering
alter session set current_schema = hron;

-- a plain sorted query
select first_name, last_name
from employee
order by last_name;

-- ordering by more columns
select last_name, first_name
from employee
order by last_name, first_name;

-- natural order is not always what we want
select first_name, last_name, salary
from employee
order by salary;

-- descending and limited
select first_name, last_name, salary
from employee
order by salary desc
fetch first 6 rows only;

-- ordering by a column not shown in the result set
select first_name, last_name
from employee
where first_name like 'B%'
order by salary desc;

-- positional notation
select first_name, last_name
from employee
order by 1, 2;

-- ...
select first_name, last_name, hired
from employee
where first_name like 'C%'
order by 3 asc;
