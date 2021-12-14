-- example on view

-- check existing table
select * from exec;

-- create view
create or replace view junior_exec_view as
	select exec_id, first_name, last_name, hired from exec
	where exec_id != 100;

-- check the derived view
select * from junior_exec_view;

-- get rid of a view
drop view junior_exec_view;
