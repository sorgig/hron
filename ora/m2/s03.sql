-- examples on inner join: using / on / natural
alter session set current_schema = hron;

-- pre-SQL/92 join
select r.name as region, c.name as country
from region r, country c
where r.region_id = c.region_id;

-- join-using, handy
select r.name as region, c.name as country
from region r join country c
using (region_id);

-- join-on, flexible
select r.name as region, c.name as country
from region r join country c
on r.region_id = c.region_id;

-- !!! here a natural join leads to the wrong result set !!!
select name as region, name as country
from region natural join country;