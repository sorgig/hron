-- examples on select

-- select all
select *
from region;

-- a plain select
select name
from region
where region_id = 1;

-- select a single column
select manager_id
from employee;

-- select only distinct values in a column
select distinct manager_id
from employee;

-- alias
select title, min_salary as "the minimum salary", min_salary as min
from job;

-- select with change on results
select title, min_salary, min_salary + 200 as "option 1", min_salary + (min_salary * 0.05) as "option 2"
from job;

-- 'no table' select
select current_date, sqrt(25), 5/2;

-- concatenation by operator ||
select region_id || ': ' || country_id as "the countries"
from country;

-- concatenation by concat()
select concat(region_id, ': ', country_id, ' ... ',name) as "the countries"
from country;

-- limit to get result set with a specified size
select first_name, last_name
from employee
order by first_name
limit 10;

select first_name, last_name
from employee
order by first_name
offset 10 limit 10;

select first_name, last_name
from employee
order by first_name
limit 10 offset 100;
