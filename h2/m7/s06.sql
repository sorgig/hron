-- example on if

do $$
declare
    v_a integer := 1;
begin
    if v_a > 0 then
        raise notice 'v_a is positive';
    elsif v_a = 0 then
        raise notice 'v_a is zero';
    else
        raise notice 'v_a is negative';
    end if;
end $$;
