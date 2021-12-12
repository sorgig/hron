-- examples on transaction isolation levels
alter session set current_schema = hron;
set autocommit off;

-- cleanup
delete from service where service_id in (21, 22);
commit;

-- serialized transaction, no phantom read
set transaction isolation level serializable; -- (1)
select * from service; -- (2)
insert into service (service_id, name) values (21, 'T2 serializable'); -- (3) T2
commit; -- (4) T2
-- select * from service; -- (5) T1 won't see the new row here
-- commit; -- (6) T1
select * from service; -- (7)

-- on read committed level a non-repeatable read is ok
set transaction isolation level read committed; -- (1)
select * from service where service_id = 22; -- (2)
update service set name = 'T2 read committed' where service_id = 22; -- (3) T2
commit; -- (4) T2
select * from service where service_id = 22; -- (5) non-repeatable read, both T1 and T2 see the change
-- commit; -- (6) T1
