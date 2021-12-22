-- example on trigger

-- an audit table
drop table if exists employee_audit;

create table employee_audit (
    employee_audit_id serial primary key,
    old_salary numeric(8, 2),
    new_salary numeric(8, 2),
    change_time timestamp,    
    employee_id integer,
    
    foreign key (employee_id) references employee (employee_id) on delete cascade
);

-- trigger function that writes in the audit table
create or replace function audit_salary()
returns trigger
language plpgsql as $$
begin
    if new.salary != old.salary then
        insert into employee_audit (old_salary, new_salary, change_time, employee_id) values
            (old.salary, new.salary, now(), old.employee_id);
    end if;

    return new;
end $$;

-- binding between function and SQL command on the table
create trigger employee_salary_update
    before update on employee
    for each row
    execute procedure audit_salary();

begin;
    update employee
    set salary = salary * 1.3
    where department_id = 6;

    select * from employee e 
    where department_id = 6;

    select * from employee_audit;
rollback;
