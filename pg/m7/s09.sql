-- examples on while / for

do $$
declare
    v_x integer;
begin
	-- while loop
	v_x := 0;
	while v_x < 5 loop
	   raise notice 'while: v_x = %', v_x;
	   v_x := v_x + 1;
    end loop;

	-- for loop
    for i in 1..5 loop
       raise notice 'for loop: %', i;
    end loop;

	-- for loop reverse
    for i in reverse 5..1 loop
       raise notice 'for loop reverse: %', i;
    end loop;	
end $$;
