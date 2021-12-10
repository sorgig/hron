-- examples on select
alter session set current_schema = hron;

-- select all
select *
from region;

-- selecting a single column and a single row (if exists)
select name
from region
where region_id = 1;

-- select a single column, no row filtering
select manager_id
from employee;

-- selecting only non-duplicated values
select distinct manager_id
from employee;

-- select with changes on values and column names
select title, min_salary, min_salary * 2 as "Doubled Min Salary"
from job;

-- other ways to specify column aliases
select title, min_salary as min, max_salary max
from job;

-- the dual table and the function sysdate
select sysdate
from dual;

select sqrt(25)
from dual;

-- limit the result set to a specified max size
select first_name, last_name
from employee
fetch first 10 rows only;

-- the second block of ten employees
select first_name, last_name
from employee
offset 10 rows fetch next 10 rows only;

-- there are less than 110 employees, so this result set is smaller than 10
select first_name, last_name
from employee
offset 100 rows fetch next 10 rows only;

-- pseudo columns
select rowid, rownum
from region;
