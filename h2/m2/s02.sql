-- Examples on inner join

-- without join, we get four different result set, plus one to build them up
-- UNION could merge the results set in one
select region_id, name
from region;

-- 1|Europe
-- 2|Americas
-- 3|Asia
-- 4|Middle East and Africa

select region_id as r_id, 'Europe' as "region name", country_id, name as country
from country
where region_id = 1;

select region_id as r_id, 'Americas' as "region name", country_id, name
from country
where region_id = 2;

select region_id as r_id, 'Asia' as "region name", country_id, name
from country
where region_id = 3;

select region_id as r_id, 'Middle East and Africa' as "region name", country_id, name as country
from country
where region_id = 4
order by 1, 4;

-- join the two tables and see the full result in a single shot
select region.region_id as r_id, region.name as "region name", country_id, country.name as country
from region, country
where region.region_id = country.region_id
order by 1, 4;

-- table alias
select r.region_id as r_id, r.name as "region name", country_id, c.name as country
from region r, country c
where r.region_id = c.region_id
order by 1, 4;
