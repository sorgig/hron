-- example on case when

do $$
declare
    v_solution integer := 42;
begin
    case v_solution
    when 0 then
        raise notice 'Game over';
    when 42 then
        raise notice 'Solution found!';
    else
        raise notice 'Try again';
    end case;
end $$;
