-- examples on cross join
alter session set current_schema = hron;

-- cartesian product - following the SQL/92 syntax
select r.name, s.name
from region r cross join service s;

-- "classic" cartesian product
select r.name, s.name
from region r, service s;
