-- example on execute function
-- set serveroutput on

declare
    v_id employee.employee_id%type := 105;
    v_salary employee.salary%type;
begin
    v_salary := get_salary(v_id);
    dbms_output.put_line('Salary is ' || v_salary);
    -- dbms_output.put_line('Salary is ' || get_salary(v_id));
exception
    when others then
        dbms_output.put_line('Can''t get salary for ' || v_id);
end;
/
