-- table for trigger
alter session set current_schema = hron;

create table employee_salary (
    employee_id number(6, 0)
    	references employee(employee_id) on delete cascade,
    old_salary number(8, 2),
    new_salary number(8, 2)
);

drop table employee_salary;