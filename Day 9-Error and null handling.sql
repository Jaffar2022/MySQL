#Error handling
#Error_01
create table sample6 (id int, payment int not null);

insert into sample6 values (1,2000);
select * from sample6;
insert into sample values (2, null);

create table sample6_error(c_id int primary key auto_increment, message text, TOT datetime);
truncate sample6;
select * from sample6;
select * from sample6_error;

#Error_02
create table sample6 (id int, payment int not null);

insert into sample6 values (1,2000);
select * from sample6;
insert into sample values (2, null);

create table sample6_error(c_id int primary key auto_increment, message text, TOT datetime);
truncate sample6;
select * from sample6;
select * from sample6_error;

call error_02(8,null);

#Null (if null)
create table sample7 (sno int, name varchar(20));
insert into sample7 values (1,"Ajay"),(2,null),(3,"Jay"),(4,"Vijay"),(5,null);
select * from sample7;

select ifnull(null,"sql");
select *,ifnull(name, "No name") as new_name from sample7;

#Coalesce handling for null values
create table sample8(sno int, first_name varchar(30), mid_name varchar(30), last_name varchar(30));
insert into sample8 values (1, null, null,"Raj"), (2,null, "Suraj", null),(3,"Suresh", null, null),(4,"Krishna","Kumar","Patel");
select * from sample8;

select *, coalesce (first_name, mid_name, last_name) as new_name from sample8;

#Duplicates
create table sample9 (sno int, name varchar(30));
insert into sample9 values (1,"Jay"),(2,"Vijay"),(3,"Raj"),(4,"Ajay"),(5,"Raj"),(6,"Kumar"),(7,"Jay"),(8,"Raj"),(9,"Suresh"),(10,"Jay");
select * from sample9;

#Count of duplicate names
select count(*)total_count from sample9;

select count(name)total_count from sample9;

select name,count(name)total_count from sample9
group by 1;

select name,count(name)total_count from sample9
group by 1
having total_count >1;

#Formatting
select country, sum(sales) total_sales from superstore
group by 1 order by 2;

select country, sum(sales) total_sales,
case
when sum(sales)>=100000 then concat(format(sum(sales)/100000,1)," L")
when sum(sales)>=1000 then concat(format(sum(sales)/1000,1)," K")
else format(sum(sales),0)
end as formatted
from superstore
group by 1;




