-- examples on casting
alter session set current_schema = hron;

-- explicit cast to char
select cast(12345.67 as char(8))
from dual;

-- error ORA-25137: Data value out of range
select cast(12345.67 as char(5))
from dual;

-- explicit cast to timestamp
select cast(date'2022-01-01' as timestamp)
from dual;

-- error ORA-01847, bad day in date
select cast(date'01-10-2022' as date)
from dual;

-- cast to NUMBER following its rules, rounding when required
select cast(12345.678 as number(10,2)) as "number(10,2)"
from dual;

-- ORA-01438: value larger than specified precision allowed for this column
select cast(12345.678 as number(4))
from dual;

-- no need to specify the size with to_char
select to_char(12345.67) as "to_char"
from dual;

-- to_char following the pattern (5,3) with comma and dot 
select to_char(12345.67, '99,999.999') as "pattern"
from dual;

-- not fitting -> ####
select to_char(12345.67, '9.9') as "misfit"
from dual;

-- roman number
select to_char(2022, 'RN') as "roman"
from dual;

-- number (using the current locale)
select to_number('970,13') * 2 "doubled"
from dual;

-- to_date following a pattern
select to_date('31-AUG-2022','DD-MON-YYYY')
from dual;
