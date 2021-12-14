-- union example

-- two queries on two different tables...
select title as info, 'job' as source
from job
where title like 'A%';

select name, 'department'
from department
where name like 'A%';

-- ... could give a combined result set
    select title as info, 'job' as source
    from job
    where title like 'A%'
union
    select name, 'department'
    from department
    where name like 'A%'
order by info;

