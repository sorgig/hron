-- examples on transaction
alter session set current_schema = hron;

-- current status
select name from service where service_id = 20;

-- ensure autocommit is off, make a change and commit it
set autocommit off;
update service set name = 'Car 42' where service_id = 20;
commit;

-- when autocommitting, we can't rollback!
set autocommit on;
update service set name = 'Other name' where service_id = 20;
rollback; -- no use

-- ensure autocommit is off, make a change and rollback it
set autocommit off;
update service set name = 'mistake!' where service_id = 20;
rollback;

-- partial rollback - it makes sense only if autocommit is off
set autocommit off;
-- current status
select service_id, name from service;

insert into service (name) values ('Example 1');
savepoint first_step;

insert into service (name) values ('Example 2');
rollback to first_step; -- keep Example 1, rollback Example 2
commit; -- persist Example 1

-- rollback after commit is useless
rollback;
