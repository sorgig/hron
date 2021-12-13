-- examples on alter table
alter session set current_schema = hron;

-- check the current table status
describe item;

-- add a column
alter table item add counter integer;

-- drop a column
alter table item drop column counter;

-- add check
alter table item add constraint item_status_ck check(status in ('a', 'b', 'x'));

-- ORA-02290: check constraint (HRON.ITEM_STATUS_CK) violated
insert into item values(13, 'y', 'ciao', 13);

insert into item (item_id, status) values(43, 'x');

-- ORA-02290: check constraint (HRON.ITEM_STATUS_CK) violated
update item set status = '?';

-- I mean it, make item empty!
delete from item;
commit;

-- check the coder table
describe coder;
select * from coder;

-- add unique constraint
alter table coder add constraint coder_name_uq unique (first_name, last_name);

insert into coder values(1222, 'Bruce', 'Austin', date'2021-12-01', 6000.00);

-- ORA-00001: unique constraint (HRON.CODER_NAME_UQ) violated
insert into coder values(1223, 'Bruce', 'Austin', date'2022-01-01', 6000.00);

insert into coder values(1223, 'Bruce Jr', 'Austin', sysdate, 4000.00);

-- add pk
alter table coder modify coder_id integer primary key;

-- drop pk
alter table coder drop primary key;

describe item;
describe coder;

-- add fk
alter table item add constraint item_coder_fk foreign key (coder_id) references coder(coder_id);
alter table item drop constraint item_coder_fk;
