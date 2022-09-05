 select *
 from service;
 
update service
set name = "Costanza"
where service_id=3;
--where name like 'Costa%'

insert into service(name, location_id) values ('Costanza', 1000);

update service
set location_id = 1500
where service_id = 2;

