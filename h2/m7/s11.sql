-- examples on cursor

do $$
declare
    v_last_name employee.last_name%type;
    v_hired employee.hired%type;
    v_employee_cursor cursor for
        select last_name, hired
        from employee;
begin
    open v_employee_cursor;
    loop
        fetch v_employee_cursor
        into v_last_name, v_hired;
        exit when not found;

        raise notice '[%, %]', v_last_name, v_hired;
    end loop;
    close v_employee_cursor;
end $$;


do $$
declare
    v_employee record;
    v_employee_cursor cursor(p_name department.name%type) for
        select last_name, hired
        from employee join department using (department_id)
        where name = p_name;
begin
    open v_employee_cursor('IT');
    loop
        fetch v_employee_cursor
        into v_employee;
        exit when not found;

        raise notice '[%, %]', v_employee.last_name, v_employee.hired;
    end loop;
    close v_employee_cursor;
end $$;
