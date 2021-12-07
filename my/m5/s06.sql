-- examples on transaction
use hron;

-- current status
select * from service;

-- autocommit on
set autocommit = true;

-- change a row
update service set name = 'Car 42' where service_id = 20;

-- can't rollback, it has been autocommitted!
rollback;
select * from service;

-- autocommit off
set autocommit = false;

-- change a row
update service set name = 'mistake!' where service_id = 20;

-- the change is there
select * from service;

-- now a rollback makes sense
rollback;
select * from service;

-- ensure autocommit is off for the transaction, regardless of the flag
start transaction;
insert into service (name) values ('Example 1');
select * from service;
savepoint first_step;

insert into service (name) values ('Example 2');
select * from service;
rollback to first_step; -- keep Example 1, rollback Example 2
select * from service;

commit; -- persist Example 1

-- rollback after commit is useless
rollback;
select * from service;
