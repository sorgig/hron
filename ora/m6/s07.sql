-- examples on view
alter session set current_schema = hron;

-- check existing table
describe coder;
select * from coder;

-- create view
create or replace view senior_coder_v as
	select first_name, last_name, hired from coder
	where salary > 5000;

-- check the view
describe senior_coder_v;
select * from senior_coder_v;

update senior_coder_v
set hired = sysdate + 1
where last_name = 'Austin';

rollback;

-- get rid of a view
drop view senior_coder_v;
