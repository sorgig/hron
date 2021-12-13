-- example on create function

create or replace function get_salary(
    p_employee_id in employee.employee_id%type)
return number as
    v_salary employee.salary%type;
begin
    select salary
    into v_salary from employee
    where employee_id = p_employee_id;
    return v_salary;
end get_salary;
/

-- drop function get_salary;
