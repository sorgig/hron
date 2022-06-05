-- examples on date functions

-- current date and time
select current_date;
select current_timestamp, now();
select localtimestamp, current_timestamp::timestamp;
select current_time, localtime;
select current_timestamp, localtimestamp;

-- operators -, +
select current_date - 1 as yesterday, current_date + 1 as tomorrow;

select extract(year from now()), extract(month from now()), extract(dow from now()), extract(doy from now());
