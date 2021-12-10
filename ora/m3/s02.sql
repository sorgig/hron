-- examples on string function
alter session set current_schema = hron;

-- string concatenation by concat()
select concat(first_name, concat(' ', last_name)) name
from employee
fetch first 5 rows only;

-- string concatenation by ||
select first_name || ' ' || last_name name
from employee
fetch first 5 rows only;

-- upper and lower case
select upper('upper') up, lower('LOWER') low
from dual;

-- substring position (or zero)
select instr('crab', 'ba') as "not found"
from dual;

select instr('crab', 'ra') as pos
from dual;

-- find in str the target starting from the passed index
--            1234567890123456789
select instr('crab abba rabid cab', 'ab', 13) as pos
from dual;

-- find in str the target from pos the n-th occurrence
--            1234567890123456789
select instr('crab abba rabid cab', 'ab', 4, 3) as pos
from dual;

-- string size (with implicit conversion)
select length('name'), length(42000), length(4 / 3)
from dual;

-- char and its representation
select ascii('A') as "A is 65", chr(90) as "90 is Z"
from dual;

-- left and right padding
select lpad('tom', 30, '.') "left padded tom", rpad('tim', 30, '_- -_') "right padded tim"
from dual;

-- left, right, both trim
select ltrim(' Hi!') "left", '[' || rtrim('Hi! ') || ']' "right", '[' || trim('  Hi! ') || ']' "both"
from dual;

-- trim specific characters
select trim('x' from 'xxHi!xx') "trim x"
from dual;

-- extract a substring
select hired, substr(hired, 1, 2) as day, substr(hired, 4, 3) as month, substr(hired, 8) as year
from employee
fetch first 5 rows only;
