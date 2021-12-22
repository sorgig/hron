-- examples on loops

do $$
declare
    v_x integer;
begin
	-- loop w/ if then exit
    v_x := 0;
    
	loop
	    v_x := v_x + 1;
	    if v_x = 3 then
            exit;
	    end if;
	end loop;

	raise notice 'a) v_x = %', v_x;
		
	-- loop w/ exit when
	v_x := 0;
	loop
	    v_x := v_x + 1;
	    exit when v_x = 5;
	end loop;

    raise notice 'b) v_x = %', v_x;

	-- loop w/ continue
	v_x := 0;
	loop
	    v_x := v_x + 1;
	    if v_x = 3 then
	        continue;
	    end if;
        raise notice 'c) v_x = %', v_x;
	    exit when v_x = 5;
	end loop;
	
	v_x := 0;
	loop
	    v_x := v_x + 1;
	    continue when v_x = 3;
	
        raise notice 'd) v_x = %', v_x;
	    exit when v_x = 5;
	end loop;
end $$;
