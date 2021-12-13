-- triggering update
alter session set current_schema = hron;

update employee
set salary = salary * 1.3
where employee_id between 103 and 108;

select *
from employee_salary;

select *
from employee
where employee_id between 103 and 108;
