-- examples on exceptions

do $$
begin
    raise notice '%', 6 / 0;
exception
    when division_by_zero then
        raise notice 'division_by_zero exception trapped';
end $$;

do $$
begin
    raise notice '%', 6 / 0;
exception
    when others then
        raise notice 'whatever exception trapped';
end $$;
