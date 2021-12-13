-- example on create procedure

create or replace procedure get_employee_salary(
    p_employee_id in employee.employee_id%type,
    p_salary out employee.salary%type) is
begin
    select salary
    into p_salary
    from employee
    where employee_id = p_employee_id;
end get_employee_salary;
/


-- drop procedure get_coder_salary;
