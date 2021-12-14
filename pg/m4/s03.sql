-- examples on update

-- the current table status
select *
from service;

-- updating a single row (if found)
update service
set name = 'K&R Associates', location_id = 1500
where service_id = 12;

-- updating all rows - by mistake?
-- ??? committing ???
begin;
    update service
    set name = 'mistake?';
rollback;

-- updating (potentially) more rows
begin;
    update service
    set name = 'N/A!'
    where service_id > 10;
rollback;
