-- examples on constraints

create table some_constraint (
	pk integer primary key,
    a integer,
    b integer not null,
    c integer unique,
    d integer unique not null,
    e integer,
    f integer,
    g integer check (g > 100),
    
	unique (e),
	foreign key (f) references service (service_id)
);

select * from some_constraint;

-- SQL Error [23502]: ERROR: null value in column "pk" of relation "some_constraint" violates not-null constraint
insert into some_constraint (pk, a, b, c, d, e, f, g) values (null, null, null, null, null, null, null, null);

-- SQL Error [23502]: ERROR: null value in column "b" of relation "some_constraint" violates not-null constraint
insert into some_constraint (pk, a, b, c, d, e, f, g) values (1, null, null, null, null, null, null, null);

-- SQL Error [23502]: ERROR: null value in column "d" of relation "some_constraint" violates not-null constraint
insert into some_constraint (pk, a, b, c, d, e, f, g) values (1, null, 1, null, null, null, null, null);

-- OK
insert into some_constraint (pk, a, b, c, d, e, f, g) values (1, null, 1, null, 1, null, null, null);
-- OK
insert into some_constraint (pk, a, b, c, d, e, f, g) values (2, null, 1,     1,2,    1, null, null);

-- SQL Error [23505]: ERROR: duplicate key value violates unique constraint "some_constraint_c_key"
insert into some_constraint (pk, a, b, c, d, e, f, g) values (3, 1, 1, 1, 3, 2, null, null);

-- OK
insert into some_constraint (pk, a, b, c, d, e, f, g) values (3, 1, 1, 2, 3, 2, null, null);

-- SQL Error [23505]: ERROR: duplicate key value violates unique constraint "some_constraint_d_key"
insert into some_constraint (pk, a, b, c, d, e, f, g) values (4, 1, 1, 3, 3, 2, null, null);

-- SQL Error [23505]: ERROR: duplicate key value violates unique constraint "some_constraint_e_key"
insert into some_constraint (pk, a, b, c, d, e, f, g) values (4, 1, 1, 3, 4, 2, null, null);

-- OK
insert into some_constraint (pk, a, b, c, d, e, f, g) values (4, 1, 1, 3, 4, 3, null, null);

-- SQL Error [23505]: ERROR: duplicate key value violates unique constraint "some_constraint_pkey"
insert into some_constraint (pk, a, b, c, d, e, f, g) values (4, 1, 1, 4, 5, 4, null, null);

-- OK
insert into some_constraint (pk, a, b, c, d, e, f, g) values (5, 1, 1, 4, 5, 4, null, null);

-- SQL Error [23503]: ERROR: insert or update on table "some_constraint" violates foreign key constraint "some_constraint_f_fkey"
--  Detail: Key (f)=(100) is not present in table "service".
insert into some_constraint (pk, a, b, c, d, e, f, g) values (6, 1, 1, 5, 6, 5, 100, null);

-- OK
insert into some_constraint (pk, a, b, c, d, e, f, g) values (6, 1, 1, 5, 6, 5, 1, null);

-- SQL Error [23514]: ERROR: new row for relation "some_constraint" violates check constraint "some_constraint_g_check"
insert into some_constraint (pk, a, b, c, d, e, f, g) values (7, 1, 1, 6, 7, 6, 1, 100);

-- OK
insert into some_constraint (pk, a, b, c, d, e, f, g) values (7, 1, 1, 6, 7, 6, 1, 101);

--
--
--

create table other_constraint (
	pk serial,
    a integer,
    b integer,
    f integer,
    
    primary key (pk),
    unique (a, b),
	foreign key (f) references service (service_id) on delete cascade
--    constraint foreign key (f) references service (service_id) on delete set null
);

select * from other_constraint;

insert into other_constraint default values;
insert into other_constraint (a, b) values (1, 1);

-- SQL Error [23505]: ERROR: duplicate key value violates unique constraint "other_constraint_a_b_key"
-- Detail: Key (a, b)=(1, 1) already exists
insert into other_constraint (a, b) values (1, 1);
