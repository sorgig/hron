-- examples on insert
alter session set current_schema = hron;

-- check the current table status
describe service;

select s.service_id, s.name, location_id, l.city
from service s left outer join location l
using (location_id);

-- plain insert
insert into service (service_id, name, location_id) values
	(20, 'Mayday Shifty Solutions', 1100);

-- nullable column could be skipped
insert into service (service_id, name) values
	(21, 'Kerr and Reetch Associates');

-- auto-incremented value for pk
insert into service (name) values ('Multiple Oz Factories');

-- insert relying on column definition on table
insert into service values (26, 'Rainydays Carwash', null);
