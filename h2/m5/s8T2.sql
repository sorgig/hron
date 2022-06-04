-- examples on transaction isolation levels

-- both transactions serialized, no phantom read
begin transaction isolation level serializable; -- (1)
	select * from service; -- (2)
	insert into service (service_id, name) values (22, 'T2 insert'); -- (3) T2 hangs until T1 commit
    -- select * from service; -- (4) T1 won't see the phantom
commit; -- (5)
select * from service; -- (6) both T1 and T2 see the change

-- non-repeatable read
begin; -- (1)
    select * from service where service_id = 22; -- (2)
    update service set name = 'T2 update' where service_id = 22; -- (3) T2 update the row
commit; -- (4) executed by T2
-- select * from service where service_id = 22; -- (5) if T1 sees a change here, it is a non-repeatable read!
-- commit; -- (6) executed by T1
select * from service where service_id = 22; -- (7) both T1 and T2 see the change

-- lost update
set transaction isolation level read uncommitted; -- (1)
start transaction; -- (2)
	-- update service set name = concat(name, '1') where service_id = 22; -- (3) T1
	update service set name = concat(name, '2') where service_id = 22; -- (4) T2 waits for T1 commit!
commit; -- (4)
select * from service where service_id = 22; -- (5) both 1 and 2, no lost update!
commit;
