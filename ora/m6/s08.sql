-- examples on sequence
alter session set current_schema = hron;

-- create
create sequence my_seq;

-- next value
select my_seq.nextval
from dual;

-- current value, no increase - seldom useful
-- can't be used before first time nextval is used
select my_seq.currval
from dual;

-- change sequence setting
alter sequence my_seq increment by 2;

-- get rid of it
drop sequence my_seq;

-- create a sequence for a table
select *
from coder;

create sequence coder_seq start with 200;

insert into coder values(coder_seq.nextval, 'Tommy', 'Kopp', SYSDATE, 12000);
commit;

alter sequence coder_seq increment by 2;

insert into coder values(coder_seq.nextval, 'Bertrand', 'Meyer', SYSDATE, 20000);
commit;

-- info on sequences
select *
from user_sequences;

drop sequence coder_seq;
