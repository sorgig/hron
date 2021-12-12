-- examples on update
alter session set current_schema = hron;

-- check the current table status
describe service;

select s.service_id, s.name, location_id, l.city
from service s left outer join location l using (location_id);

-- updating a single row (if found)
update service
set name = substr(name, 8), location_id = 1300
where service_id = 20;

-- updating (potentially) more rows
update service
set name = 'N/A'
where service_id > 10;

-- updating all rows - by mistake?
update service
set name = 'mistake!';

