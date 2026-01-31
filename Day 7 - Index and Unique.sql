select * from Ntest limit 10;

#Index is useful for quick lookups and searches on non-primary key column
#By default primary key is considered as index
#Index works using binary tree

create table sample4 (Sno int primary key, sname varchar(20));
insert into sample4 values (1,"Ravi"),(2,"Suraj");

select * from sample4;
desc sample4;
show index from sample4;

show index from superstore;

select country, sales, profit from superstore
where sales between 300 and 3000;

#To create index, index name as test
create index test on superstore(sales);
show index from superstore;

select country, sales, profit from superstore
where sales between 300 and 3000;

#To drop index
drop index test on superstore;

#Unique index
create table student01 (sno int primary key, sname varchar(20), Mobile char(20));
insert into student01 values (1, "Raj", 9876543201);
insert into student01 values (2, "Kiran", 9876543201);
desc student01;
truncate student01;

show index from student01;

create unique index UK1 on student01(sname, mobile);

show index from student01;

insert into student01 values (1, "Raj", 9876543201);
insert into student01 values (2, "Kiran", 9876543201);
insert into student01 values (3, "Kiran", 9876543201);

#Stored procedure
#Stored procedure is a prepared sql code that can be saved to reuse over and over again. It is like automation.
#To create stored procedure you can create from navigator menu stored procedure or you can create from database - stored procedures
#To run stored procedure you can click thunder icon in stored procedures - left side below tables or call (stored procedure name).
#To run stored procedure after creating 
#To drop stored procedure right click stored procedure drop.

call sstore;
call france_data;
call germany_tech;

#Create stored procedure for Region = north, south and segment = consumer

call reg_seg;

#stored procedure with variables
#To check right click country_list alter
call country_list ("finland");

#multiple variables in stored procedure
#country_list1
call country_list1("France","Finland");

#Get dynamic sales list using stored procedure
call sales_list (100);

#Get dynamic year using stored procedure
call dynamic_year(2021);

#Get  year and country
call year_country (2021,"france");



