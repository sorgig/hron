-- examples on index

-- index on a column
create index on exec (last_name);

-- index on more columns
create index on exec (first_name, last_name);

-- get rid of indices, by index name
drop index exec_first_name_last_name_idx;
drop index exec_last_name_idx;
