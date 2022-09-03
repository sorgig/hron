-- Minimal SQL

-- select all
select *
from service;

-- insert a new row
insert into service (name, location_id) values ('Scratchaway', 2300);

-- update a row
update service
set location_id = 1600
where name = 'Scratchaway';

-- delete a row
delete from service
where name = 'Scratchaway';
