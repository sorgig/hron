-- examples on for in select

-- using a record
do $$
declare
    v_employee record;
begin
    for v_employee in
        select first_name, last_name 
        from employee
    loop 
        raise notice '% %', v_employee.first_name, v_employee.last_name;
    end loop;
end $$;

-- not using a record
do $$
declare
    v_first_name employee.first_name%type;
    v_last_name employee.last_name%type;
begin
    for v_first_name, v_last_name in
        select first_name, last_name 
        from employee
    loop 
        raise notice '% %', v_first_name, v_last_name;
    end loop;
end $$;
