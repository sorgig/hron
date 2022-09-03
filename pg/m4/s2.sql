-- examples on aggregate functions

-- count, count distinct
select count(*) as "All", count(manager_id) as "not null", count(distinct manager_id) as manager
from employee;

select count(commission), count(distinct commission)
from employee;

-- max, min
select max(salary), min(salary)
from employee;

select first_name, last_name, salary
from employee
where salary = (
	select max(salary)
	from employee
	);

select max(commission), min(distinct commission)
from employee;


-- min, max on dates
select min(hired), max(hired)
from employee;

-- min, max on strings
select min(first_name), max(last_name)
from employee;

-- sum
select sum(salary)
from employee
where department_id = 5;

-- average
select round(avg(salary), 2) as average, round(avg(distinct salary), 2) as "average no duplicates"
from employee
where department_id = 5;
