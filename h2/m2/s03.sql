-- examples on inner join: using / on / natural

-- join-using, handier
select r.name, c.name
from region r join country c
using (region_id);

-- join-on, more flexible
select r.name, c.name
from region r join country c
on r.region_id = c.region_id;

-- natural join -- here does not work!
select r.name, c.name
from region r natural join country c;