create database sept_25;
use sept_25;
show tables;

#DDL Data Definition Language

create table sample (Sno int, Sname char(10), City char(50));
show tables;
desc sample;
select * from sample;

insert into sample values(1, "ABC","Bangalore");
insert into sample values(2, "XYZ","Pune");
select * from sample;
insert into sample values(3, "GHI","Hyderabad");
select * from sample;
insert into sample values(4, "MMM","Delhi"),(5, "NNN","Kolkata");
select * from sample;

#Alter table
alter table sample add column age tinyint;
alter table sample add column sales int;
desc sample;

alter table sample add column total int, add column state char(20);
desc sample;
select * from sample;

#Drop column
alter table sample drop column total, drop column state;

insert into sample values (5, "Salman", "Mumbai",59,50000);

insert into sample values (6, "TTT", "Delhi",200,70000);

#Modify column
alter table sample modify column age int;
insert into sample values (6, "TTT", "Delhi",200,70000);

select * from sample;

#Change Column
alter table sample change column age quantity int;
select * from sample;

#Drop Column
alter table sample drop column quantity;
select * from sample;

#Rename table, 2 ways
Rename table sample to example;
select * from example;

alter table example rename to sample;
select * from sample;

#Truncate to delete inside table
truncate sample;
select * from sample;

#Drop table - to entirely delete table 
drop table sample;
