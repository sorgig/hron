-- example on select into
-- set serveroutput on

declare
    v_first_name employee.first_name%type;
    v_last_name employee.last_name%type;
begin
    select first_name, last_name
    into v_first_name, v_last_name
    from employee
    where employee_id = 103;
    
    dbms_output.put_line('[' || v_first_name || ' ' || v_last_name || ']');
end;
/