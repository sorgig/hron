-- this script should run on postgres
--
-- psql -U postgres \i setup.sql

drop schema if exists hron cascade;
drop user if exists hron;

create user hron with password 'password';
create schema authorization hron;
