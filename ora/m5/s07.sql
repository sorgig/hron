-- examples on transaction anomalies
alter session set current_schema = hron;
set autocommit off;

-- cleanup
-- delete from service where service_id = 22;
-- commit;

-- phantom read
select * from service; -- (1)
-- insert into service (service_id, name) values (22, 'T2 insert'); -- (2) executed by T2
-- commit; -- (3) executed by T2
select * from service; -- (4) if T1 sees a change here, it is phantom read!

-- non-repeatable read
select * from service where service_id = 22; -- (1)
-- update service set name = 'T2 update' where service_id = 22; -- (2) T2 update the row
-- commit; -- (3) executed by T2
select * from service where service_id = 22; -- (4) if T1 sees a change here, it is a non-repeatable read!

-- lost update
update service set name = name || '_U1' where service_id = 22; -- (1) T1
-- update service set name = name || '_U2' where service_id = 22; -- (2) T2 expected to hang until T1 commit
commit; -- (3)
select * from service where service_id = 22; -- (4) both U1 and U2, or there has been a lost update

-- dirty read
-- update service set name = 'dirty' where service_id = 22; -- (1) T2
select * from service where service_id = 22; -- (2) if both T1 and T2 read the changed value, this is a dirty read!
-- rollback; -- (3)
select * from service where service_id = 22; -- (4) back to previous value
