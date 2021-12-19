-- examples on update

-- the current table status
select *
from service;

-- updating a single row (if found)
update service
set name = 'K&R Associates', location_id = 1500
where service_id = 12;

-- updating all rows - by mistake?
-- ??? committing ???
begin;
    update service
    set name = 'mistake?';
rollback;

-- updating (potentially) more rows
begin;
    update service
    set name = 'N/A!'
    where service_id > 10;
rollback;


-- check the current salary for IT people
select e.first_name, e.last_name, e.salary
from employee e join department d using (department_id)
where d.name = 'IT';

-- update - where subquery
-- assuming department name is not duplicated!
begin;
    update employee
    set salary = salary + 100
    where employee_id = (
    	select manager_id
    	from department
    	where name = 'IT');
rollback;
