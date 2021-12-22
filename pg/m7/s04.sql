-- examples on variables

do $$
declare
    v_width integer;
    v_height constant integer := 2;
    v_area integer := 6;
begin
    v_width := v_area / v_height;
    raise notice 'v_area = %, v_width = %', v_area, v_width;

    -- SQL Error [22005]: ERROR: variable "v_height" is declared CONSTANT
    -- v_height := 3;
    v_area := 10;
    v_width := v_area / v_height;
    raise notice 'v_area = %, v_width = %', v_area, v_width;
end $$;
