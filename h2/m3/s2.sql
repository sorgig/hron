-- examples on string functions

-- string concatenation
select concat(first_name, ' ', last_name) as "name"
from employee;

select first_name || ' ' || last_name as "name"
from employee;

-- upper and lower case
select upper('upper') up, lower('LOWER') low;

-- find substring
select position('ba' in 'crab' ) as "not found", position('ra' in 'crab' ) as pos;

-- string size
select length('name');

-- char and its representation
select ascii('A') as "A is 65", chr(90) as "90 is Z";

-- left and right padding
select lpad('tom', 30, '.') tom, rpad('tim', 30, '_- -_') tim;

-- left, right, both trim
select ltrim(' Hi!') "left", concat('[', rtrim('Hi! '), ']') "right", concat('[', trim('  Hi! '), ']') "both";

-- left, right, both trim
select trim(leading 'xy' from 'xy!xy') "left", trim(trailing 'xy' from 'xy!xy') "right", trim(both 'xy' from 'xy!xy') "both";

-- extract substring
select right('discardedXYZ', 3), substr('ABCDEFG', 3, 4);

-- replace
select replace('Begin here', 'Begin', 'End');
