-- examples on update
use hron;

-- check the current table status
describe service;
select s.*, l.city
from service s left outer join location l using (location_id);

-- updating a single row (if found)
update service
set name = right(name, 24), location_id = 3
where service_id = 20;

-- updating (potentially) more rows
update service
set name = 'N/A'
where service_id > 10;

-- updating all rows - by mistake?
update service
set name = 'mistake!';

