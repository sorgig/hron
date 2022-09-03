-- examples on inner join: using / on / natural

-- join-using, handier
select r.name region, c.name country
from region r join country c
using (region_id)
order by 1, 2;

-- join-on, more flexible
select r.name as region, c.name as country
from region r join country c
on r.region_id = c.region_id
order by 1, 2;

-- natural join -- here does not work!
select r.name, c.name
from region r natural join country c;