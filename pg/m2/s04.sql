-- examples on join - on, using, classic - where

-- join using
select r.name as region, c.name as country
from region r join country c
using (region_id)
where region_id = 1
order by c.name;

-- join on
select r.name as region, c.name as country
from region r join country c
on r.region_id = c.region_id
where r.region_id = 1
order by c.name;

-- "classic" join
select r.name as region, c.name as country
from region r, country c
where r.region_id = c.region_id and r.region_id = 1
order by c.name;
