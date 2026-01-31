-- TCL (Transaction Control Language) to manage transactions within the database.
-- TCL commands - rollback, savepoint, commit

create table Accounts (id int, Name char(50), amount int);
insert into Accounts values(1, "Suraj", 25000),(2, "Ram", 35000);
select * from accounts;
rollback; -- not working

-- to apply TCL commands first we have to use start transactions
-- Rollback is used to delete recent records, like  undo

start transaction;
insert into Accounts values(3, "Raj", 15000),(4, "Rahim", 35000);
select * from accounts;
rollback;
select * from accounts;

-- savepoint to verify or cross check the data for adding or deleting (check point)
-- commit to submit the final data

create table account1 (id int, name char(20), amount int);

start transaction;
insert into account1 values (1, 'suraj', 25000),(2,'ram',15000);
savepoint aa;

insert into account1 values (3, 'raj', 10000),(4,'rohit',17000);
savepoint ab;

insert into account1 values (5, 'Suresh', 40000),(6,'suma',50000);
savepoint ac;

insert into account1 values (7, 'kiran', 25000),(8,'kumar',35000);
select * from account1;

rollback to ab;
select * from account1;

commit;
rollback;
-- once commit, rollback will not work




