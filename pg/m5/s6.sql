-- examples on commit, rollback, savepoint

-- current table status
select *
from service;

-- 1) autocommit
insert into service (name) values ('Example 1');

-- no effect, no pending change
rollback;

-- 2) transaction with explicit termination
begin;
    insert into service (name) values ('Example 2');

    -- only the current session could see the change
    select * from service;
rollback;

-- no effect, no pending change
commit;

-- 3) savepoint for partial rollback
begin;
    insert into service (name) values ('Example 3');
    savepoint first_step;

    insert into service (name) values ('Example 3/B');

    rollback to first_step; -- keep first insert, rollback the second one
commit; -- persist Example 3

-- no use: there is no transaction in progress
rollback;

delete from service where service_id > 3;
