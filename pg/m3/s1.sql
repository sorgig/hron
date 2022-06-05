-- examples on conversion

-- varchar cast
select cast(12345.67 as varchar);
select 12345.67::varchar;

-- date cast
select cast('2022-08-15' as date);
select cast('15-aug-22' as date);
select '15-aug-22'::date;

-- timestamp cast
select cast('2022-08-15' as timestamp);
select cast('15-aug-22' as timestamp);
select '15-aug-22'::timestamp;
