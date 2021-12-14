-- examples on commit, rollback, savepoint

select * from service;

begin;
    insert into service (name) values ('Example 1');
    savepoint first_step;

    insert into service (name) values ('Example 2');

    rollback to first_step; -- keep Example 1, rollback Example 2
commit; -- persist Example 1

-- no use: there is no transaction in progress
rollback;