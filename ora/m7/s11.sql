-- example on cursor with for-in
-- set serveroutput on

declare
    cursor v_employee_cursor is
        select last_name, hired from employee;
begin
    for v_cur in v_employee_cursor loop
        dbms_output.put_line('[' || v_cur.last_name || ', ' || v_cur.hired || ']');
    end loop;
end;
/
