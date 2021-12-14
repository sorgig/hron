-- this script should run on postgres
--
-- psql -U postgres \i setup.sql

drop database if exists hron;
drop user if exists hron;

create user hron with password 'password';
create database hron owner=hron;