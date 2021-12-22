-- example on procedures

create or replace procedure get_salary(
    p_id in employee.employee_id%type,
    p_salary out employee.salary%type)
language plpgsql as $$
begin
    select salary
    into p_salary from employee
    where employee_id = p_id;
end $$;

do $$
declare
    v_id constant int := 107;
    v_salary numeric;
begin
    call get_salary(v_id, v_salary);

    raise notice 'Salary for % is %', v_id, v_salary;
end $$;

drop procedure if exists get_salary;

-- a more interesting procedure
create or replace procedure new_department(
    p_name in department.name%type,
    p_id out department.department_id%type,
    p_commit inout boolean)
language plpgsql as $$
begin
    select department_id
    into p_id
    from department
    where name = p_name;

    if found then
        raise notice 'Department % already inserted', p_name;
        -- no insert for duplicated
        -- notice: this is not safe, data integrity is a DBMS resposibility, UNIQUE constraint should be used instead
        if p_commit then
            p_commit := false;
            return;
        end if;
    end if;

    insert into department (name) values (p_name);

    -- in case of duplicates, get the larger id
    select max(department_id)
    into p_id
    from department
    where name = p_name;
    if p_commit then
        raise notice 'Committing insert for department %', p_name;
        commit;
    else
        raise notice 'Rolling back insert for department %', p_name;
        rollback;
    end if;
end $$;

do $$
declare
    v_name constant varchar := 'Advanced Quantic Resarch';
    v_id int;
    v_commit boolean := true;
begin
    call new_department(v_name, v_id, v_commit);

    if v_commit then
        raise notice '% committed, its id is %', v_name, v_id;
    else
        raise notice '% not committed, id %', v_name, v_id;
    end if;
end $$;

select * from department where name like 'Adv%';

delete from department where name = 'Advanced Quantic Resarch';

drop procedure if exists new_department;
