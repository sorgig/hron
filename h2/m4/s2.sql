-- examples on aggregate functions

-- count, count distinct
select count(*), count(manager_id), count(distinct manager_id), count(commission)
from employee;

-- max, min
select max(salary), min(salary)
from employee;

-- min, max on dates
select min(hired), max(hired)
from employee;

-- sum
select sum(salary)
from employee
where department_id = 5;

-- average
select round(avg(salary), 2) as average, round(avg(distinct salary), 2) as "average no duplicates"
from employee
where department_id = 5;
