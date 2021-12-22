-- examples on function

create or replace function get_salary(
    p_id in employee.employee_id%type)
returns employee.salary%type
language plpgsql as $$
declare
    v_salary employee.salary%type;
begin
    select salary
    into v_salary from employee
    where employee_id = p_id;
    return v_salary;
end $$;

select get_salary(107);

drop function if exists get_salary;

-- a more interesting function
create or replace function new_car(
    p_name in car.name%type)
returns car.car_id%type
language plpgsql as $$
declare
    v_id car.car_id%type;
begin
    insert into car (car_id, name) values (nextval('car_seq'), p_name);

    select car_id
    into v_id
    from car
    where name = p_name;

    return v_id;
exception
    when others then
        raise warning 'Can''t insert car named %', p_name;
        raise;
end $$;

do $$
declare
    v_name constant varchar := 'Colossus';
    v_id int;
begin
    v_id := new_car(v_name);
    raise notice 'Car % has id %', v_name, v_id;
end $$;

select * from car;
delete from car where name = 'Colossus';

drop function if exists new_car;