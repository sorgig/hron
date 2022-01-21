-- cleanup
drop table if exists car_service;
drop table if exists service cascade;
drop table if exists car;
drop sequence if exists car_seq;

alter table if exists department drop constraint if exists department_manager_fk;
drop table if exists employee cascade;
drop table if exists department;
drop table if exists location;
drop table if exists country;
drop table if exists region;
drop table if exists job;

-- simple: "one" region, many countries
create table region (
	region_id serial primary key,
	name varchar(25)
);

begin;
    insert into region (name) values ('Europe');
    insert into region (name) values ('Americas');
    insert into region (name) values ('Asia');
    insert into region (name) values ('Middle East and Africa');
commit;

-- "many" services taking cares of many cars, many services could share one location
create table service(
    service_id serial primary key,
    name varchar(40),
    location_id integer

--    , constraint service_location_fk foreign key (location_id) references location (location_id)
);

begin;
    insert into service (name, location_id) values ('Inspired Glass', 1000);
    insert into service (name, location_id) values ('Faith Auto Repair', 1000);
    insert into service (name, location_id) values ('Happy Brake', 2300);
commit;

CREATE ALIAS get_salary AS  $$
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
@CODE
BigDecimal getSalary(Connection connection, int id) throws SQLException {
    return new BigDecimal(4_200);
}
$$;
