-- cleanup
drop alias if exists get_salary;

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
	region_id identity primary key,
	name varchar(25)
);

begin;
    insert into region (name) values ('Europe');
    insert into region (name) values ('Americas');
    insert into region (name) values ('Asia');
    insert into region (name) values ('Middle East and Africa');
commit;

-- a "many" table with a natural PK, to one region
create table country(
	country_id char(2) primary key,
	name varchar(40),
	region_id integer,

	constraint country_region_fk foreign key (region_id) references region (region_id)
);

set @v_europe=1;
set @v_americas=2;
set @v_asia=3;
set @v_mea=4;
    
insert into country (country_id, name, region_id) values ('AR', 'Argentina', @v_americas);
insert into country (country_id, name, region_id) values ('AU', 'Australia', @v_asia);
insert into country (country_id, name, region_id) values ('BE', 'Belgium', @v_europe);
insert into country (country_id, name, region_id) values ('BR', 'Brazil', @v_americas);
insert into country (country_id, name, region_id) values ('CA', 'Canada', @v_americas);
insert into country (country_id, name, region_id) values ('CH', 'Switzerland', @v_europe);
insert into country (country_id, name, region_id) values ('CN', 'China', @v_asia);
insert into country (country_id, name, region_id) values ('DE', 'Germany', @v_europe);
insert into country (country_id, name, region_id) values ('DK', 'Denmark', @v_europe);
insert into country (country_id, name, region_id) values ('EG', 'Egypt', @v_mea);
insert into country (country_id, name, region_id) values ('FR', 'France', @v_europe);
insert into country (country_id, name, region_id) values ('IL', 'Israel', @v_mea);
insert into country (country_id, name, region_id) values ('IN', 'India', @v_asia);
insert into country (country_id, name, region_id) values ('IT', 'Italy', @v_europe);
insert into country (country_id, name, region_id) values ('JP', 'Japan', @v_asia);
insert into country (country_id, name, region_id) values ('KW', 'Kuwait', @v_mea);
insert into country (country_id, name, region_id) values ('ML', 'Malaysia', @v_asia);
insert into country (country_id, name, region_id) values ('MX', 'Mexico', @v_americas);
insert into country (country_id, name, region_id) values ('NG', 'Nigeria', @v_mea);
insert into country (country_id, name, region_id) values ('NL', 'Netherlands', @v_europe);
insert into country (country_id, name, region_id) values ('SG', 'Singapore', @v_asia);
insert into country (country_id, name, region_id) values ('UK', 'United Kingdom', @v_europe);
insert into country (country_id, name, region_id) values ('US', 'United States of America', @v_americas);
insert into country (country_id, name, region_id) values ('ZM', 'Zambia', @v_mea);
insert into country (country_id, name, region_id) values ('ZW', 'Zimbabwe', @v_mea);
commit;

-- "many" location in one country
create table location(
	location_id identity primary key,
	street_address varchar(40),
	postal_code varchar(12),
	city varchar(30) not null,
	state_province varchar(25),
	country_id char(2),

	constraint location_country_fk foreign key (country_id) references country (country_id)
);

set @v_it = 'IT';
set @v_jp = 'JP';
set @v_us = 'US';
set @v_ca = 'CA';
set @v_cn = 'CN';
set @v_in = 'IN';
set @v_au = 'AU';
set @v_sg = 'SG';
set @v_uk = 'UK';
set @v_de = 'DE';
set @v_br = 'BR';
set @v_ch = 'CH';
set @v_nl = 'NL';
set @v_mx = 'MX';

begin
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('Via Cola di Rienzo, 1297', '00989', 'Roma', 'RM', @v_it);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('Calle della Testa, 93091', '10934', 'Venice', 'VE', @v_it);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', @v_jp);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('9450 Kamiya-cho', '6823', 'Hiroshima', null, @v_jp);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', @v_us);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('2011 Interiors Blvd', '99236', 'South San Francisco', 'California', @v_us);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', @v_us);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('2004 Charade Rd', '98199', 'Seattle', 'Washington', @v_us);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', @v_ca);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', @v_ca);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('40-5-12 Laogianggen', '190518', 'Beijing', null, @v_cn);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', @v_in);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', @v_au);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('198 Clementi North', '540198', 'Singapore', null, @v_sg);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('8204 Arthur St', null, 'London', null, @v_uk);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', @v_uk);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('9702 Chester Road', '09629850293', 'Stretford', 'Manchester', @v_uk);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', @v_de);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('Rua Frei Caneca 1360 ', '01307-002', 'Sao Paulo', 'Sao Paulo', @v_br);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', @v_ch);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('Murtenstrasse 921', '3095', 'Bern', 'BE', @v_ch);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', @v_nl);
    insert into location (street_address, postal_code, city, state_province, country_id) values
        ('Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal', @v_mx);
commit;

-- "one" job to many employees
create table job (
	job_id serial primary key,
	title varchar(35) not null,
	min_salary integer,
	max_salary integer,
	
	constraint job_salary_ck check (min_salary < max_salary)
);

begin;
    insert into job (title, min_salary, max_salary) values ('President', 20080, 40000);
    insert into job (title, min_salary, max_salary) values ('Vice President', 15000, 30000);
    insert into job (title, min_salary, max_salary) values ('Assistant', 3000, 6000);
    insert into job (title, min_salary, max_salary) values ('Finance Manager', 8200, 16000);
    insert into job (title, min_salary, max_salary) values ('Accountant', 4200, 9000);
    insert into job (title, min_salary, max_salary) values ('Accounting Manager', 8200, 16000);
    insert into job (title, min_salary, max_salary) values ('Public Accountant', 4200, 9000);
    insert into job (title, min_salary, max_salary) values ('Sales Manager', 10000, 20080);
    insert into job (title, min_salary, max_salary) values ('Sales Representative', 6000, 12008);
    insert into job (title, min_salary, max_salary) values ('Purchasing Manager', 8000, 15000);
    insert into job (title, min_salary, max_salary) values ('Purchasing Clerk', 2500, 5500);
    insert into job (title, min_salary, max_salary) values ('Stock Manager', 5500, 8500);
    insert into job (title, min_salary, max_salary) values ('Stock Clerk', 2008, 5000);
    insert into job (title, min_salary, max_salary) values ('Shipping Clerk', 2500, 5500);
    insert into job (title, min_salary, max_salary) values ('Programmer', 4000, 10000);
    insert into job (title, min_salary, max_salary) values ('Marketing Manager', 9000, 15000);
    insert into job (title, min_salary, max_salary) values ('Marketing Representative', 4000, 9000);
    insert into job (title, min_salary, max_salary) values ('Human Resources Representative', 4000, 9000);
    insert into job (title, min_salary, max_salary) values ('Public Relations Representative', 4500, 10500);
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
