-- DML Data Manipulation Language
-- Insert, update and delete

create table sample1 (Sno int, Sname char(20), city char(20));

#Insert
insert into sample1 values (1, "Jay", "Bangalore"),(2, "Vijay", "Pune"), (3, "Suraj", "Chennai"), (4, "Vikram", "Chennai"), (5, "Ajay", "Mumbai");

alter table sample1 add column sales int;

select * from sample1;

insert into sample1 values (6, "Imran", "Bangalore", 50000), (7, "Salman", "Mumbai", 25000);

select * from sample1;

#Update
set sql_safe_updates = 0; 
#To set safe updates

update sample1 set sales = 25000 where city = "Bangalore";
select * from sample1;

update sample1 set sales = 15000 where Sname = "Vikram";
select * from sample1;
update sample1 set sales = 10000 where Sno = 3;

-- update null into 0
-- is null is used for null values and not =
update sample1 set sales = 0 where sales is null;
select * from sample1;

-- update Bangalore and pune sales to 35000
update sample1 set sales = 35000 where city = "Bangalore" or city = "pune";
update sample1 set sales = 35000 where city in ("bangalore","pune");
select * from sample1;

insert into sample1 values (8,"Salman","Mumbai",25000),(9,"Vikram","Bangalore",15000);
select * from sample1;

-- update vikram chennai sales to 25000
update sample1 set sales = 25000 where city = "chennai" and Sname = "vikram";
update sample1 set sales = 25000 where Sno = 4;
select * from sample1;

-- Delete and Truncate
-- Delete will delete data based on condition
-- truncate will delete all data from table in one go

delete from sample1 where sales = 0;
select * from sample1;
delete from sample1 where city = 'bangalore';
select * from sample1;

-- ex; delete from sample1 where Sno in(2,3);

delete from sample1; - # deletes all records but tables remains
truncate sample1; - # deletes all records but tables remains
drop table sample1; - # deletes table


