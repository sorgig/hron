-- run this script once, before setup
--
-- java -cp h2.jar org.h2.tools.RunScript -url jdbc:h2:./hron -script once.sql

drop schema if exists hron cascade;
drop user if exists hron;

create user hron password 'password';
create schema hron;
grant all on schema hron to hron;