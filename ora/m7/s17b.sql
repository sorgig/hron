-- trigger

create or replace trigger salary_update
before update of salary on employee
for each row
begin
    insert into employee_salary values(
        :old.employee_id, :old.salary, :new.salary);
end salary_update;
/
