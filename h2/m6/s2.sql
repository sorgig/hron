-- examples on create table

-- create an empty table
create table empty ();

-- create a simple table with a primary key
create table item (
    item_id integer primary key,
    status char,
    name varchar(20),
    exec_id integer);

-- a new table is created without any value in it
select * from item;

insert into item (item_id) values (12);

update item
set status = 'x', name = 'thing'
where item_id = 12;

-- create a table by data extraction
create table exec as
    select employee_id as exec_id, first_name, last_name, hired, salary
    from employee
    where department_id = 9;

select *
from exec;
