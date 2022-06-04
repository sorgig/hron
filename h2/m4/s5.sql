-- examples on subquery

-- most common subquery: select - where

-- employees in department 'IT' (slightly unsafe, it could be a duplicated name ...)
select concat(first_name, ' ', last_name)
from employee
where department_id = (
    select department_id
    from department
    where name = 'IT');

-- who is the manager of John Chen
-- fine, but risky: first + last name should be unique!
-- could get SQL Error [21000]: more than one row returned by a subquery used as an expression
select employee_id, first_name, last_name, salary
from employee
where employee_id = (
	select manager_id
	from employee
	where first_name = 'John' and last_name = 'Chen');

-- a safer version select - where, using "in" and checking for null
-- who are the manager of employees having last name starting with 'K' (null not included)
select first_name, last_name
from employee
where employee_id in (
	select manager_id
	from employee
	where last_name like 'K%' and manager_id is not null);

-- subquery in select - group by - having + another one in select - from
-- step 1: average salaries for each department
select round(avg(salary))
from employee
group by department_id
order by 1 desc;

-- step 2: highest salary among the average salary for each department
select round(max(tmp.avg_sal)) from (
	select avg(salary) avg_sal
	from employee
	group by department_id) tmp;

-- average salaries for each department (no null), excluding the topmost one
select department_id, round(avg(salary))
from employee
group by department_id having avg(salary) < (select max(x.sal) from (
	select avg(salary) sal
	from employee
	group by department_id) x
    where department_id is not null)
order by 2 desc;

-- subquery in select - from - join
-- how many countries for each region
select name, c.country_count
from region natural join (
    select region_id, count(*) country_count
    from country
    group by region_id) c;

-- multirow subquery in select - where
-- to get manager names
select first_name, last_name
from employee
where employee_id in (
    select distinct manager_id
    from employee
    where manager_id is not null)
order by 2;
