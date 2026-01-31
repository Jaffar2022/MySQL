#Triggers - Two types of triggers before and after 
#Before insert, before update, before delete
#After insert, after update, after delete


#Before Insert (working_hrs negative hrs to positive hrs)
create table T1(id int, sname varchar(20), working_hrs int);
insert into T1 values (1, "Ajay", 20);
select * from T1;
insert into t1 values (2,"Vijay",-40);
insert into t1 values (3,"Raj",-30);
select * from T1;

#Before update (price >40000 display error)
create table product1 (id int, P_name varchar(20), Price int);
insert into product1 values (1, "Samsung", 15000), (2,"Oppo",12000),(3,"Vivo",17000);
select * from product1;

update product1 set price = price+5000 where id = 3;
select * from product1;

#Before delete (backup deleted data)
create table newemp(emp_id int, hire_date date, salary int);
create table backup(sno int primary key auto_increment, 
emp_id int, hire_date date, salary int, delete_at timestamp default now());

insert into newemp values (101,"2025-01-20",50000),(102,"2020-02-20",30000),(103,"2019-03-25",25000);
select * from newemp;
select * from backup;

delete from newemp where emp_id=103;
select * from newemp;
select * from backup;

#After Insert
create table t2(sno int, sname varchar(30));

create table t3(sno int primary key auto_increment, snos int, sname varchar(30), records datetime, Remarks text);

insert into t2 values (1,"Kiran");
insert into t2 values (2,"Ram");

select * from t2;
select * from t3;

#After update
update t2 set sname = "Ajay" where sname="Ram";
select * from t2;
select * from t3;

#After delete
delete from t2 where sname = "Kiran";

select * from t2;
select * from t3;




