-- examples on date/time functions
alter session set current_schema = hron;

select sysdate
from dual;

-- change date format
alter session set nls_date_format = 'YYYY-MM-DD';
alter session set nls_date_format = 'DD-MON-YY';

-- change date language
alter session set nls_date_language = 'ITALIAN';
alter session set nls_date_language = 'ENGLISH';

-- if date format is DD-MON-YY
select add_months('12-MAR-22', 3)
from dual;

select months_between(sysdate, date'2021-12-01')
from dual;

-- if date language is English
select next_day(sysdate, 'mon')
from dual;

select last_day(sysdate)
from dual;

select round(sysdate, 'year'), round(sysdate, 'month')
from dual;

select trunc(sysdate, 'year'), trunc(sysdate, 'month')
from dual;

select first_name, last_name, hired, round(sysdate - hired) as "days"
from employee
where hired > date'2021-01-01'
order by 3;
