-- examples on create table

-- create a simple table with a primary key
create table item (
    item_id integer primary key,
    status char,
    name varchar(20),
    exec_id integer);

-- table created empty
select * from item;

insert into item (item_id) values (12);

select *
from item;

update item
set status = 'x', name = 'thing'
where item_id = 12;

-- create a table by data extraction
create table exec
as
    select employee_id as exec_id, first_name, last_name, hired, salary
    from employee
    where department_id = 9;

select *
from exec;
