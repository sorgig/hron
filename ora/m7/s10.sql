-- example on cursor, explicit fetch
-- set serveroutput on

declare
    v_last_name employee.last_name%type;
    v_hire_date employee.hired%type;
    cursor v_employee_cursor is
        select last_name, hired from employee;
begin
    open v_employee_cursor;
    loop
        fetch v_employee_cursor
        into v_last_name, v_hire_date;
        exit when v_employee_cursor%notfound;

        dbms_output.put_line('[' || v_last_name || ', ' || v_hire_date || ']');
    end loop;
    close v_employee_cursor;
end;
/
