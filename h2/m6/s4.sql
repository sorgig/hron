-- examples on alter table

select * from item;

-- add a column
alter table item add column counter integer;

-- drop a column
alter table item drop column counter;

-- add check
alter table item add check(status in ('a', 'b', 'x'));

-- SQL Error [23514]: ERROR: new row for relation "items" violates check constraint "items_status_check"
insert into item values(13, 'y', 'ciao', 13);

insert into item (item_id, status) values(43, 'a');

-- SQL Error [23514]: ERROR: new row for relation "items" violates check constraint "items_status_check"
update item set status = '?';

-- I mean it, make items empty!
delete from item;

-- check the exec table
select * from exec;

-- add unique constraint
alter table exec add unique (first_name, last_name);

-- OK
insert into exec values(1222, 'Bruce', 'Austin', '2007-05-21', 6000.00);

-- SQL Error [23505]: ERROR: duplicate key value violates unique constraint "execs_first_name_last_name_key"
insert into exec values(1223, 'Bruce', 'Austin', '2020-03-10', 6000.00);

-- OK
insert into exec values(1223, 'Bruce Jr', 'Austin', '2007-05-21', 6000.00);

-- add pk
alter table exec add primary key(exec_id);

-- add fk
alter table item add foreign key (exec_id) references exec (exec_id);

-- drop constraints
alter table item drop constraint item_exec_id_fkey;
alter table exec drop constraint exec_pkey;
