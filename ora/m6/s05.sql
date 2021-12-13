-- examples on truncate / drop table
alter session set current_schema = hron;

-- get rid of all rows (DML)
delete from other_constrained;

-- get rid of all rows (DDL)
truncate table other_constrained;

-- get rid of the table (DDL)
-- if does not exist -> ORA-00942: table or view does not exist
drop table other_constrained;
