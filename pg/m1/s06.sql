-- examples on null

-- check null
select employee_id, first_name, last_name, commission
from employee
where commission is null and last_name = 'King';

select employee_id, first_name, last_name, commission
from employee
where commission is not null
	and last_name = 'King';

-- !!! WRONG !!! check null
select employee_id, first_name, last_name, commission
from employee
where commission = null
and last_name = 'King';

-- !!! WRONG !!!
select employee_id, first_name, last_name, commission
from employee
where commission != null
and last_name = 'King';

-- null in operations
select first_name, last_name, salary * commission
from employee
where last_name = 'King';

-- coalesce: if commission is null use 0 instead
select employee_id, last_name, salary * coalesce(commission, 0)
from employee
where last_name = 'King';
