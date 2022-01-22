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

begin;
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

begin;
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
	job_id identity primary key,
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

-- a table with a complicated relation with employee, and in the role "many" to one location
create table department (
	department_id serial primary key,
	name varchar(30) not null,
	manager_id integer,
	location_id integer,

	constraint department_location_fk foreign key (location_id) references location(location_id)
);

set @v_sewa = 8;
set @v_sltx = 5;
set @v_toon = 9;
set @v_lond = 15;
set @v_sfca = 6;
set @v_muba = 18;
set @v_oxfr = 16;

begin;
    insert into department (name, location_id) values ('Administration', @v_sewa);
    insert into department (name, location_id) values ('Marketing', @v_toon);
    insert into department (name, location_id) values ('Purchasing', @v_sewa);
    insert into department (name, location_id) values ('Human Resources', @v_lond);
    insert into department (name, location_id) values ('Shipping', @v_sfca);
    insert into department (name, location_id) values ('IT', @v_sltx);
    insert into department (name, location_id) values ('Public Relations', @v_muba);
    insert into department (name, location_id) values ('Sales', @v_oxfr);
    insert into department (name, location_id) values ('Executive', @v_sewa);
    insert into department (name, location_id) values ('Finance', @v_sewa);
    insert into department (name, location_id) values ('Accounting', @v_sewa);

    -- other departements, not used
    insert into department (name) values ('Treasury');
    insert into department (name) values ('Benefits');
    insert into department (name) values ('Manufacturing');
    insert into department (name) values ('Contracting');
    insert into department (name) values ('Operations');
    insert into department (name) values ('IT Support');
    insert into department (name) values ('IT Helpdesk');
    insert into department (name) values ('Recruiting');
commit;

-- the core table, with many relations (also a self - manager)
create table employee (
	employee_id identity primary key,
	first_name varchar(20),
	last_name varchar(25) not null,
	phone integer unique not null,
	hired date not null,
	job_id integer not null,
	salary numeric(8,2),
	commission numeric(2,2),
	manager_id integer,
	department_id integer,

	constraint employee_salary_ck check (salary > 0),
	constraint employee_job_fk foreign key (job_id) references job (job_id),
	constraint employee_department_fk foreign key (department_id) references department (department_id)
);

set @v_pres = 1;
set @v_vprs = 2;
set @v_asst = 3;
set @v_fimg = 4;
set @v_prog = 15;
set @v_acct = 5;
set @v_pumg = 10;
set @v_puck = 11;
set @v_stmg = 12;
set @v_stck = 13;
set @v_samg = 8;
set @v_sarp = 9;
set @v_shck = 14;
set @v_mkmg = 16;
set @v_mkrp = 17;
set @v_hrrp = 18;
set @v_prrp = 19;
set @v_acmg = 6;
set @v_puac = 7;

begin;
    -- employees with no commission
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Steven', 'King', 4511, '2016-06-17', @v_pres, 24000);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Neena', 'Kochhar', 4568, '2014-09-21', @v_vprs, 17000);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Lex', 'De Haan', 4518, '2014-01-13', @v_vprs, 17000);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Alexander', 'Hunold', 4567, '2019-01-06', @v_prog, 9000);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Bruce', 'Ernst', 4268, '2021-05-21', @v_prog, 6000);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('David', 'Austin', 4571, '2018-06-25', @v_prog, 4800);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Valli', 'Pataballa', 4560, '2019-02-05', @v_prog, 4800);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Diana', 'Lorentz', 5567, '2020-02-07', @v_prog, 4200);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Nancy', 'Greenberg', 4569, '2015-08-17', @v_fimg, 12008);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Daniel', 'Faviet', 4169, '2015-08-16', @v_acct, 9000);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('John', 'Chen', 4269, '2018-09-28', @v_acct, 8200);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Ismael', 'Sciarra', 4369, '2018-09-05', @v_acct, 7700);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Jose Manuel', 'Urman', 4469, '2019-03-07', @v_acct, 7800);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Luis', 'Popp', 4597, '2020-12-07', @v_acct, 6900);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Den', 'Raphaely', 4561, '2020-12-02', @v_pumg, 11000);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Alexander', 'Khoo', 4562, '2021-05-03', @v_puck, 3100);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Shelli', 'Baida', 4563, '2018-12-24', @v_puck, 2900);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Sigal', 'Tobias', 4564, '2018-07-24', @v_puck, 2800);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Guy', 'Himuro', 4565, '2019-11-15', @v_puck, 2600);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Karen', 'Colmenares', 4566, '2021-08-07', @v_puck, 2500);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Matthew', 'Weiss', 4330, '2017-07-18', @v_stmg, 8000);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Adam', 'Fripp', 2234, '2018-04-10', @v_stmg, 8200);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Payam', 'Kaufling', 3234, '2016-05-01', @v_stmg, 7900);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Shanta', 'Vollman', 4234, '2018-10-10', @v_stmg, 6500);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Kevin', 'Mourgos', 4244, '2020-11-16', @v_stmg, 5800);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Julia', 'Nayer', 4214, '2018-07-16', @v_stck, 3200);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Irene', 'Mikkilineni', 4224, '2019-09-06', @v_stck, 2700);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('James', 'Landry', 4334, '2020-01-14', @v_stck, 2400);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Steven', 'Markle', 4434, '2021-03-08', @v_stck, 2200);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Laura', 'Bissot', 5234, '2018-08-20', @v_stck, 3300);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Mozhe', 'Atkinson', 6234, '2018-10-30',@v_stck, 2800);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('James', 'Marlow', 7234, '2018-02-16', @v_stck, 2500);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('TJ', 'Olson', 8234, '2020-04-10', @v_stck, 2100);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Jason', 'Mallin', 1934, '2017-06-14', @v_stck, 3300);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Michael', 'Rogers', 4834, '2019-08-26', @v_stck, 2900);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Ki', 'Gee', 4734, '2020-12-12', @v_stck, 2400);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Hazel', 'Philtanker', 4634, '2021-02-06', @v_stck, 2200);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Renske', 'Ladwig', 4233, '2016-07-14', @v_stck, 3600);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Stephen', 'Stiles', 4034, '2018-10-26', @v_stck, 3200);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('John', 'Scantamburlo', 4019, '2019-02-12', @v_stck, 2700);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Joshua', 'Patel', 4824, '2019-04-06', @v_stck, 2500);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Trenna', 'Rajs', 4009, '2016-10-17', @v_stck, 3500);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Curtis', 'Davies', 4994, '2018-01-29', @v_stck, 3100);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Randall', 'Matos', 4874, '2019-03-15', @v_stck, 2600);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Peter', 'Vargas', 4004, '2019-07-09', @v_stck, 2500);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Winston', 'Taylor', 4276, '2019-01-24', @v_shck, 3200);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Jean', 'Fleaur', 4277, '2019-02-23', @v_shck, 3100);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Martha', 'Sullivan', 4878, '2020-06-21', @v_shck, 2500);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Girard', 'Geoni', 4879, '2021-02-03', @v_shck, 2800);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Nandita', 'Sarchand', 4816, '2017-01-27', @v_shck, 4200);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Alexis', 'Bull', 4846, '2018-02-20', @v_shck, 4100);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Juliet', 'Dullinger', 4256, '2019-06-24', @v_shck, 3400);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Anthony', 'Cabrio', 4271, '2020-02-07', @v_shck, 3000);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Kelly', 'Chung', 4376, '2018-06-14', @v_shck, 3800);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Jennifer', 'Dilly', 4872, '2018-08-13', @v_shck, 3600);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Tim', 'Gates', 4871, '2019-07-11', @v_shck, 2900);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Randall', 'Perkins', 4576, '2020-12-19', @v_shck, 2500);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Sarah', 'Bell', 4261, '2017-02-04', @v_shck, 4000);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Britney', 'Everett', 4226, '2015-03-03', @v_shck, 3900);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Samuel', 'McCain', 4218, '2016-07-01', @v_shck, 3200);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Vance', 'Jones', 4275, '2017-03-17', @v_shck, 2800);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Alana', 'Walsh', 4211, '2019-04-24', @v_shck, 3100);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Kevin', 'Feeney', 4222, '2019-05-23', @v_shck, 3000);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Donald', 'OConnell', 4231, '2020-06-21', @v_shck, 2600);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Douglas', 'Grant', 4240, '2021-01-13', @v_shck, 2600);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Jennifer', 'Whalen', 4241, '2016-09-17', @v_asst, 4400);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Michael', 'Hartstein', 4255, '2017-02-17', @v_mkmg, 13000);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Pat', 'Fay', 4259, '2018-08-17', @v_mkrp, 6000);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Susan', 'Mavris', 4215, '2015-06-07', @v_hrrp, 6500);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Hermann', 'Baer', 4288, '2015-06-07', @v_prrp, 10000);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Shelley', 'Higgins', 4280, '2015-06-07', @v_acmg, 12008);
    insert into employee (first_name, last_name, phone, hired, job_id, salary) values
        ('Willy', 'Gietz', 4281, '2015-06-07', @v_puac, 8300);
    
    -- sales have commission
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('John', 'Russell', 9200, '2017-10-01', @v_samg, 14000, 0.35);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Karen', 'Partners', 9261, '2018-01-05', @v_samg, 13500, 0.25);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Alberto', 'Errazuriz', 9218, '2018-03-10', @v_samg, 12000, 0.25);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Gerald', 'Cambrault', 9211, '2020-10-15', @v_samg, 11000, 0.25);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Eleni', 'Zlotkey', 9018, '2018-01-29', @v_samg, 10500, 0.15);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Peter', 'Tucker', 9299, '2021-01-30', @v_sarp, 10000, 0.25);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('David', 'Bernstein', 5268, '2018-03-24', @v_sarp, 9500, 0.20);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Peter', 'Hall', 8968, '2018-08-20', @v_sarp, 9000, 0.20);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Christopher', 'Olsen', 9718, '2019-03-30', @v_sarp, 8000, 0.15);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Nanette', 'Cambrault', 9768, '2019-12-09', @v_sarp, 7500, 0.15);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Oliver', 'Tuvault', 9508, '2020-11-23', @v_sarp, 7000, 0.10);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Jane', 'King', 9228, '2017-01-30', @v_sarp, 10000, 0.30);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Patrick', 'Sully', 9252, '2017-03-04', @v_sarp, 9500, 0.30);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Allan', 'McEwen', 9222, '2017-08-01', @v_sarp, 9000, 0.30);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Lindsey', 'Smith', 9221, '2018-03-10', @v_sarp, 8000, 0.25);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Louise', 'Doran', 9225, '2018-12-15', @v_sarp, 7500, 0.25);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Sarath', 'Sewall', 9212, '2019-11-03', @v_sarp, 7000, 0.20);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Clara', 'Vishney', 9288, '2018-11-11', @v_sarp, 10500, 0.20);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Danielle', 'Greene', 9213, '2020-03-19', @v_sarp, 9500, 0.10);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Mattea', 'Marvins', 9256, '2021-01-24', @v_sarp, 7200, 0.05);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('David', 'Lee', 9219, '2021-02-23', @v_sarp, 6800, 0.05);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Sundar', 'Ande', 9201, '2021-03-24', @v_sarp, 6400, 0.05);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Amit', 'Banda', 9208, '2021-04-21', @v_sarp, 6200, 0.05);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Lisa', 'Ozer', 9229, '2018-03-11', @v_sarp, 11500, 0.20);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Harrison', 'Bloom', 9286, '2019-03-23', @v_sarp, 10000, 0.15);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Tayler', 'Fox', 9298, '2019-01-24', @v_sarp, 9600, 0.15);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('William', 'Smith', 9255, '2020-02-23', @v_sarp, 7400, 0.10);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Elizabeth', 'Bates', 9233, '2020-03-24', @v_sarp, 7300, 0.10);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Sundita', 'Kumar', 9268, '2021-04-21', @v_sarp, 6100, 0.05);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Ellen', 'Abel', 9267, '2017-05-11', @v_sarp, 11000, 0.25);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Alyssa', 'Hutton', 9266, '2018-03-19', @v_sarp, 8800, 0.20);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Jonathon', 'Taylor', 9265, '2019-03-24', @v_sarp, 8600, 0.15);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Jack', 'Livingston', 2926, '2019-04-23', @v_sarp, 8400, 0.15);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Kimberely', 'Grant', 9263, '2020-05-24', @v_sarp, 7000, 0.10);
    insert into employee (first_name, last_name, phone, hired, job_id, salary, commission) values
        ('Charles', 'Johnson', 9262, '2021-01-04', @v_sarp, 6200, 0.05);    
commit;

alter table department add constraint department_manager_fk foreign key (manager_id) references employee (employee_id);
alter table employee add constraint employee_manager_fk foreign key (manager_id) references employee (employee_id);

begin;
	update employee
	set department_id = ( select department_id from department where name =  'Accounting' )
	where job_id = ( select job_id from job where title = 'Public Accountant' );

	update employee
	set department_id = ( select department_id from department where name =  'Accounting' )
	where job_id = ( select job_id from job where title = 'Accounting Manager' );

	update employee
	set department_id = ( select department_id from department where name =  'Administration' )
	where job_id = ( select job_id from job where title = 'Assistant' );

	update employee
	set department_id = ( select department_id from department where name =  'Executive' )
	where job_id = ( select job_id from job where title = 'President' );

	update employee
	set department_id = ( select department_id from department where name =  'Executive' )
	where job_id = ( select job_id from job where title = 'Vice President' );

	update employee
	set department_id = ( select department_id from department where name =  'Finance' )
	where job_id = ( select job_id from job where title = 'Finance Manager' );

	update employee
	set department_id = ( select department_id from department where name =  'Finance' )
	where job_id = ( select job_id from job where title = 'Accountant' );

	update employee
	set department_id = ( select department_id from department where name =  'Human Resources' )
	where job_id = ( select job_id from job where title = 'Human Resources Representative' );

	update employee
	set department_id = ( select department_id from department where name =  'IT' )
	where job_id = ( select job_id from job where title = 'Programmer' );

	update employee
	set department_id = ( select department_id from department where name =  'Marketing' )
	where job_id = ( select job_id from job where title = 'Marketing Manager' );

	update employee
	set department_id = ( select department_id from department where name =  'Marketing' )
	where job_id = ( select job_id from job where title = 'Marketing Representative' );

	update employee
	set department_id = ( select department_id from department where name =  'Public Relations' )
	where job_id = ( select job_id from job where title = 'Public Relations Representative' );

	update employee
	set department_id = ( select department_id from department where name =  'Purchasing' )
	where job_id = ( select job_id from job where title = 'Purchasing Manager' );

	update employee
	set department_id = ( select department_id from department where name =  'Purchasing' )
	where job_id = ( select job_id from job where title = 'Purchasing Clerk' );

	update employee
	set department_id = ( select department_id from department where name =  'Sales' )
	where job_id = ( select job_id from job where title = 'Sales Manager' );

	update employee
	set department_id = ( select department_id from department where name =  'Sales' )
	where job_id = ( select job_id from job where title = 'Sales Representative' and first_name != 'Kimberely');

	update employee
	set department_id = ( select department_id from department where name =  'Shipping' )
	where job_id = ( select job_id from job where title = 'Shipping Clerk');

	update employee
	set department_id = ( select department_id from department where name =  'Shipping' )
	where job_id = ( select job_id from job where title = 'Stock Clerk');

	update employee
	set department_id = ( select department_id from department where name =  'Shipping' )
	where job_id = ( select job_id from job where title = 'Stock Manager');
commit;

-- set the manager FK (self)
begin;
    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Steven' and last_name = 'King' )
    where job_id in ( select job_id from job where title in ('Vice President', 'Purchasing Manager', 'Stock Manager', 'Sales Manager', 'Marketing Manager') );

    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Alexander' and last_name = 'Hunold' )
    where job_id = ( select job_id from job where title = 'Programmer' );

    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Nancy' and last_name = 'Greenberg' )
    where job_id = ( select job_id from job where title = 'Accountant' );

    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Shelley' and last_name = 'Higgins' )
    where job_id = ( select job_id from job where title = 'Public Accountant' );

    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Michael' and last_name = 'Hartstein' )
    where job_id = ( select job_id from job where title = 'Marketing Representative' );

    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Den' and last_name = 'Raphaely' )
    where job_id = ( select job_id from job where title = 'Purchasing Clerk' );

	--
    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Lex' and last_name = 'De Haan' )
    where first_name = 'Alexander' and last_name = 'Hunold';

	update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Neena' and last_name = 'Kochhar' )
    where (first_name = 'Nancy' and last_name = 'Greenberg') or
        (first_name = 'Shelley' and last_name = 'Higgins') or
        (first_name = 'Jennifer' and last_name = 'Whalen') or
        (first_name = 'Susan' and last_name = 'Mavris') or
        (first_name = 'Hermann' and last_name = 'Baer');

    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'John' and last_name = 'Russell' )
    where (first_name = 'Peter' and last_name = 'Tucker') or
        (first_name = 'David' and last_name = 'Bernstein') or
        (first_name = 'Peter' and last_name = 'Hall') or
        (first_name = 'Christopher' and last_name = 'Olsen') or
        (first_name = 'Nanette' and last_name = 'Cambrault') or
        (first_name = 'Oliver' and last_name = 'Tuvault');

    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Karen' and last_name = 'Partners' )
    where (first_name = 'Jane' and last_name = 'King') or
        (first_name = 'Patrick' and last_name = 'Sully') or
        (first_name = 'Allan' and last_name = 'McEwen') or
        (first_name = 'Lindsey' and last_name = 'Smith') or
        (first_name = 'Louise' and last_name = 'Doran') or
        (first_name = 'Sarath' and last_name = 'Sewall');

    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Alberto' and last_name = 'Errazuriz' )
    where (first_name = 'Clara' and last_name = 'Vishney') or
        (first_name = 'Danielle' and last_name = 'Greene') or
        (first_name = 'Mattea' and last_name = 'Marvins') or
        (first_name = 'David' and last_name = 'Lee') or
        (first_name = 'Sundar' and last_name = 'Ande') or
        (first_name = 'Amit' and last_name = 'Banda');

    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Gerald' and last_name = 'Cambrault' )
    where (first_name = 'Lisa' and last_name = 'Ozer') or
        (first_name = 'Harrison' and last_name = 'Bloom') or
        (first_name = 'Tayler' and last_name = 'Fox') or
        (first_name = 'William' and last_name = 'Smith') or
        (first_name = 'Elizabeth' and last_name = 'Bates') or
        (first_name = 'Sundita' and last_name = 'Kumar');

    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Eleni' and last_name = 'Zlotkey' )
    where (first_name = 'Ellen' and last_name = 'Abel') or
        (first_name = 'Alyssa' and last_name = 'Hutton') or
        (first_name = 'Jonathon' and last_name = 'Taylor') or
        (first_name = 'Jack' and last_name = 'Livingston') or
        (first_name = 'Kimberely' and last_name = 'Grant') or
        (first_name = 'Charles' and last_name = 'Johnson');

    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Matthew' and last_name = 'Weiss' )
    where (first_name = 'Julia' and last_name = 'Nayer') or
        (first_name = 'Irene' and last_name = 'Mikkilineni') or
        (first_name = 'James' and last_name = 'Landry') or
        (first_name = 'Steven' and last_name = 'Markle') or
        (first_name = 'Winston' and last_name = 'Taylor') or
        (first_name = 'Jean' and last_name = 'Fleaur') or
        (first_name = 'Martha' and last_name = 'Sullivan') or
        (first_name = 'Girard' and last_name = 'Geoni');

    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Adam' and last_name = 'Fripp' )
    where (first_name = 'Laura' and last_name = 'Bissot') or
        (first_name = 'Mozhe' and last_name = 'Atkinson') or
        (first_name = 'James' and last_name = 'Marlow') or
        (first_name = 'TJ' and last_name = 'Olson') or
        (first_name = 'Nandita' and last_name = 'Sarchand') or
        (first_name = 'Alexis' and last_name = 'Bull') or
        (first_name = 'Juliet' and last_name = 'Dullinger') or
        (first_name = 'Anthony' and last_name = 'Cabrio');

    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Payam' and last_name = 'Kaufling' )
    where (first_name = 'Jason' and last_name = 'Mallin') or
        (first_name = 'Michael' and last_name = 'Rogers') or
        (first_name = 'Ki' and last_name = 'Gee') or
        (first_name = 'Hazel' and last_name = 'Philtanker') or
        (first_name = 'Kelly' and last_name = 'Chung') or
        (first_name = 'Jennifer' and last_name = 'Dilly') or
        (first_name = 'Tim' and last_name = 'Gates') or
        (first_name = 'Randall' and last_name = 'Perkins');

    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Shanta' and last_name = 'Vollman' )
    where (first_name = 'Renske' and last_name = 'Ladwig') or
        (first_name = 'Stephen' and last_name = 'Stiles') or
        (first_name = 'John' and last_name = 'Scantamburlo') or
        (first_name = 'Joshua' and last_name = 'Patel') or
        (first_name = 'Sarah' and last_name = 'Bell') or
        (first_name = 'Britney' and last_name = 'Everett') or
        (first_name = 'Samuel' and last_name = 'McCain') or
        (first_name = 'Vance' and last_name = 'Jones');

    update employee
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Kevin' and last_name = 'Mourgos' )
    where (first_name = 'Trenna' and last_name = 'Rajs') or
        (first_name = 'Curtis' and last_name = 'Davies') or
        (first_name = 'Randall' and last_name = 'Matos') or
        (first_name = 'Peter' and last_name = 'Vargas') or
        (first_name = 'Alana' and last_name = 'Walsh') or
        (first_name = 'Kevin' and last_name = 'Feeney') or
        (first_name = 'Donald' and last_name = 'OConnell') or
        (first_name = 'Douglas' and last_name = 'Grant');	
commit;

-- set manager FK on department table
begin;
    update department
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Jennifer' and last_name = 'Whalen' )
    where name = 'Administration';

    update department
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Michael' and last_name = 'Hartstein' )
    where name = 'Marketing';

    update department
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Den' and last_name = 'Raphaely' )
    where name = 'Purchasing';

    update department
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Susan' and last_name = 'Mavris' )
    where name = 'Human Resources';

    update department
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Adam' and last_name = 'Fripp' )
    where name = 'Shipping';

    update department
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Alexander' and last_name = 'Hunold' )
    where name = 'IT';

    update department
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Hermann' and last_name = 'Baer' )
    where name = 'Public Relations';

    update department
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'John' and last_name = 'Russell' )
    where name = 'Sales';

    update department
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Steven' and last_name = 'King' )
    where name = 'Executive';

    update department
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Nancy' and last_name = 'Greenberg' )
    where name = 'Finance';

    update department
    set manager_id = (
        select employee_id
        from employee
        where first_name = 'Shelley' and last_name = 'Higgins' )
    where name = 'Accounting';
commit;

-- "one" car for one employee, "many" cars seviced by many services
create table car(
    car_id integer primary key,
    name varchar(40) unique,
    employee_id integer unique,

    constraint car_employee_fk foreign key (employee_id) references employee (employee_id)
);

create sequence car_seq;

begin;
    insert into car (car_id, name, employee_id) values
        (nextval('car_seq'), 'Silver Hornet', (
			select employee_id
			from employee
			where first_name = 'Jennifer' and last_name = 'Whalen'));

    insert into car (car_id, name, employee_id) values
        (nextval('car_seq'), 'White Phantom', (
			select employee_id
			from employee
			where first_name = 'Michael' and last_name = 'Hartstein'));

    insert into car (car_id, name, employee_id) values
        (nextval('car_seq'), 'Batmobile', (
			select employee_id
			from employee
			where first_name = 'Den' and last_name = 'Raphaely'));

    insert into car (car_id, name, employee_id) values
        (nextval('car_seq'), 'Starsky', (
			select employee_id
			from employee
			where first_name = 'Susan' and last_name = 'Mavris'));

    insert into car (car_id, name, employee_id) values
        (nextval('car_seq'), 'Smurf', (
			select employee_id
			from employee
			where first_name = 'Adam' and last_name = 'Fripp'));

    insert into car (car_id, name, employee_id) values
        (nextval('car_seq'), 'Fireball', (
			select employee_id
			from employee
			where first_name = 'Alexander' and last_name = 'Hunold'));

    insert into car (car_id, name, employee_id) values
        (nextval('car_seq'), 'Poison', (
			select employee_id
			from employee
			where first_name = 'Neena' and last_name = 'Kochhar'));

    insert into car (car_id, name, employee_id) values
        (nextval('car_seq'), 'Katana', (
			select employee_id
			from employee
			where first_name = 'Lex' and last_name = 'De Haan'));

    insert into car (car_id, name, employee_id) values
        (nextval('car_seq'), 'Titanic', (
			select employee_id
			from employee
			where first_name = 'Hermann' and last_name = 'Baer'));

    insert into car (car_id, name, employee_id) values
        (nextval('car_seq'), 'Dracula', (
			select employee_id
			from employee
			where first_name = 'John' and last_name = 'Russell'));

    insert into car (car_id, name, employee_id) values
        (nextval('car_seq'), 'Zeppelin', (
			select employee_id
			from employee
			where first_name = 'Steven' and last_name = 'King'));

    insert into car (car_id, name, employee_id) values
        (nextval('car_seq'), 'Ruby', (
			select employee_id
			from employee
			where first_name = 'Nancy' and last_name = 'Greenberg'));

    insert into car (car_id, name, employee_id) values
        (nextval('car_seq'), 'Tortoise', (
			select employee_id
			from employee
			where first_name = 'Shelley' and last_name = 'Higgins'));
commit;

-- "many" services taking cares of many cars, many services could share one location
create table service(
    service_id identity primary key,
    name varchar(40),
    location_id integer,
	
	constraint service_location_fk foreign key (location_id) references location (location_id)
);

begin;
    insert into service (name, location_id) values ('Inspired Glass', 1);
    insert into service (name, location_id) values ('Faith Auto Repair', 1);
    insert into service (name, location_id) values ('Happy Brake', 14);
commit;

-- many to many with details
create table car_service(
    car_id integer,
    service_id integer,
    checkin timestamp,
    checkout timestamp,

    constraint car_service_time_ck check (checkin < checkout),
    primary key (car_id, service_id, checkin),
    constraint car_service_car_fk foreign key (car_id) references car (car_id),
    constraint car_service_service_fk foreign key (service_id) references service (service_id)
);

begin;
    insert into car_service (car_id, service_id, checkin, checkout) values
        (1, 1, '2021-08-01 15:00:00', '2021-08-01 16:00:00');
    insert into car_service (car_id, service_id, checkin, checkout) values
        (5, 2, '2021-08-03 14:00:00', '2021-08-03 19:00:00');
    insert into car_service (car_id, service_id, checkin, checkout) values
        (1, 2, '2021-08-04 08:00:00', '2021-08-04 20:00:00');
    insert into car_service (car_id, service_id, checkin, checkout) values
        (1, 3, '2021-10-12 15:00:00', '2021-10-12 18:00:00');
commit;


CREATE ALIAS get_salary AS  $$
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
@CODE
BigDecimal getSalary(Connection connection, int id) throws SQLException {
/*
    select salary
    into v_salary
    from employee
    where employee_id = p_employee_id;

    return v_salary;
 */
    return new BigDecimal(4_200);
}
$$;
