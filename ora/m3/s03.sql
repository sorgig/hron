-- examples on numeric functions
alter session set current_schema = hron;

-- absolute value
select abs(10), abs(-12.43)
from dual;

-- ceiling
select ceil(5.8), ceil(-5.2)
from dual;

-- floor
select floor(5.8), floor(-5.2)
from dual;

-- module
select mod(8, 3), mod(8, 4), mod(8.5, 4.13)
from dual;

-- power
select power(2, 1), power(2, 3)
from dual;

-- e raised to the power of
select exp(1)
from dual;

-- square root, argument should be positive
select sqrt(25), sqrt(5)
from dual;

-- ORA-01428: argument '-2' is out of range
select sqrt(-2)
from dual;

-- natural logarithm, or for a given base
select ln(exp(1)), log(10, 100)
from dual;

-- rounding
select round(5.75), round(5.75, 1), round(5.75, -1)
from dual;

-- truncating
select trunc(5.75), trunc(5.75, 1), trunc(5.75, -1)
from dual;

-- check negative, zero, positive
select sign(-2.3), sign(0), sign(42)
from dual;

-- sine, cosine, tangent, ...
select sin(acos(-1)), cos(0), tan(acos(-1)/4)
from dual;
