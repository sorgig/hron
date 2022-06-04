-- examples on conversion

-- varchar cast
select cast(12345.67 as varchar);
select 12345.67::varchar;

-- date cast
select cast('2022-01-18' as date);
select cast('01-feb-22' as date);
select '01-feb-22'::date;
