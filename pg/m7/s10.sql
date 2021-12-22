-- example on select into

do $$
declare
    c_employee_id constant employee.employee_id%type := 107;
    v_first_name employee.first_name%type;
    v_last_name employee.last_name%type;
begin
    select first_name, last_name
    into v_first_name, v_last_name
    from employee
    where employee_id = c_employee_id;

    if found then
        raise notice '[% %]', v_first_name, v_last_name;
    else
        raise notice 'Employee % not found', c_employee_id;
    end if;
end $$;