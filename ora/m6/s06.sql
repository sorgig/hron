-- examples on index
alter session set current_schema = hron;

describe coder;

select *
from user_indexes
where table_name = 'CODER';

create bitmap index coder_name_ix on coder (salary);
drop index coder_name_ix;
