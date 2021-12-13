-- examples on constraints in create table statement
alter session set current_schema = hron;

begin
    drop_table_if_exists('constrained');
    drop_table_if_exists('other_constrained');
end;
/

create table constrained (
	pk integer primary key,
    a integer,
    b integer not null,
    c integer unique,
    d integer unique not null,
    e integer,
    f integer,
    g integer check (g > 100),
    
    unique(e),
    foreign key (f) references car(car_id)
);

-- ORA-01400: cannot insert NULL into ("HRON"."CONSTRAINED"."PK")
insert into constrained (a, b, c, d, e, f, g) values (null, null, null, null, null, null, null);

-- ORA-01400: cannot insert NULL into ("HRON"."CONSTRAINED"."B")
insert into constrained (pk, a, b, c, d, e, f, g) values (1, null, null, null, null, null, null, null);

-- ORA-01400: cannot insert NULL into ("HRON"."CONSTRAINED"."D")
insert into constrained (pk, a, b, c, d, e, f, g) values (1, null, 1, null, null, null, null, null);

insert into constrained (pk, a, b, c, d, e, f, g) values (1, null, 1, null, 1, null, null, null);
insert into constrained (pk, a, b, c, d, e, f, g) values (2, null, 1, 1, 2, 1, null, null);

-- ORA-00001: unique constraint (HRON.SYS_C008694) violated
insert into constrained (pk, a, b, c, d, e, f, g) values (3, 1, 1, 1, 3, 2, null, null);

insert into constrained (pk, a, b, c, d, e, f, g) values (3, 1, 1, 2, 3, 2, null, null);

-- ORA-00001: unique constraint (HRON.SYS_C008694) violated
insert into constrained (pk, a, b, c, d, e, f, g) values (4, 1, 1, 2, 3, 2, null, null);

-- ORA-00001: unique constraint (HRON.SYS_C008696) violated
insert into constrained (pk, a, b, c, d, e, f, g) values (4, 1, 1, 3, 4, 2, null, null);

insert into constrained (pk, a, b, c, d, e, f, g) values (4, 1, 1, 3, 4, 3, null, null);

-- ORA-00001: unique constraint (HRON.SYS_C008693) violated
insert into constrained (pk, a, b, c, d, e, f, g) values (4, 1, 1, 4, 5, 4, null, null);

insert into constrained (pk, a, b, c, d, e, f, g) values (5, 1, 1, 4, 5, 4, null, null);

-- ORA-02291: integrity constraint (HRON.SYS_C008697) violated - parent key not found
insert into constrained (pk, a, b, c, d, e, f, g) values (6, 1, 1, 5, 6, 5, 100, null);

insert into constrained (pk, a, b, c, d, e, f, g) values (6, 1, 1, 5, 6, 5, 1, null);

-- ORA-02290: check constraint (HRON.SYS_C008692) violated
insert into constrained (pk, a, b, c, d, e, f, g) values (7, 1, 1, 6, 7, 6, 1, 100);

insert into constrained (pk, a, b, c, d, e, f, g) values (7, 1, 1, 6, 7, 6, 1, 101);

--
--
--

create table other_constrained (
	pk integer generated by default on null as identity,
    a integer,
    b integer,
    f integer,
    
    primary key(pk),
    constraint other_constrained_ab_uq unique(a, b),
	constraint other_constrained_car foreign key (f) references car(car_id) on delete cascade
--    constraint other_constrained_car foreign key (f) references clients(client_id) on delete set null
);

insert into other_constrained (pk) values ( null );
insert into other_constrained (a, b) values (1, 1);

-- ORA-00001: unique constraint (HRON.OTHER_CONSTRAINED_AB_UQ) violated
insert into other_constrained (a, b) values (1, 1);
