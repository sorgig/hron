-- examples on aggregate functions
alter session set current_schema = hron;

-- count all
select count(*), count(ROWID), count(ROWNUM)
from employee;

-- beware of null
select count(manager_id)
from employee;

-- count distinct values
select count(distinct manager_id) as "distinct managers"
from employee;

-- different count
select count(*), count(distinct commission), count(commission)
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
select round(avg(salary), 2)
from employee
where department_id = 5;
