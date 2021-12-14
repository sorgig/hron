do $$ declare result varchar;
begin
	call get_employee_car(100, result);
    raise notice '%', result;
end $$;