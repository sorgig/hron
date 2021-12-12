-- examples on delete
alter session set current_schema = hron;

-- check the current table status
select *
from service;

-- delete a single row (or none)
delete from service
where service_id = 20;

-- multiline delete - be extra careful with it!
delete from service
where service_id > 10;

-- even more careful here!
-- anyway this statement won't work
-- ORA-02292: integrity constraint (HRON.CAR_SERVICE_SERVICE_FK) violated - child record found
delete from service;