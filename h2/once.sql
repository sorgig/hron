-- this script should run on hron
--
-- java -cp h2.jar org.h2.tools.RunScript -url jdbc:h2:./hron -script once.sql

drop user if exists hron;

create user hron password 'password';
grant all on schema public to hron;