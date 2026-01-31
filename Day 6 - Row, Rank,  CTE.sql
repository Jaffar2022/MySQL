#Get the max salary from myemp

select * from myemp order by salary desc limit 1;
select max(salary) from myemp;
select * from myemp where salary = (select max(salary) from myemp);

#Get dept wise max salary 
select dep_id, salary, row_number() over (partition by dep_id) Sno
from myemp;

select dep_id, salary,
row_number() over(partition by dep_id order by salary desc) Sno
from myemp;

#Each dept wise highest salary

select dep_id, salary, row_number() over(order by salary desc) Sno
from myemp;

select * from (
select dep_id, salary, 
row_number() over(partition by dep_id order by salary desc) Sno 
from myemp) ab
where Sno = 1;

#Get the rank by salary from each department
select dep_id, salary, rank () over(partition by dep_id order by salary desc) rnk
from myemp;

create table emp1 (Sname varchar(30), dep_id varchar(30), salary int);

insert into emp1 values
("Suraj","Sales",25000),
("Ajay","HR",35000),
("Vijay","Sales",15000),
("Suresh","HR",25000),
("Sunil","HR",35000),
("Kiran","Sales",25000),
("Ram","Marketing",15000),
("Gita","Sales",35000),
("Suma","Marketing",50000),
("Basha","Marketing",15000);

select * from emp1;

#Get the Sno
select *, row_number() over() as Sno from emp1;

select *, row_number() over(order by salary desc) as Sno from emp1;

#Get first highest salary
select *, row_number() over(order by salary desc) as Sno from emp1 limit 1;

select * from (select *, row_number() over(order by salary desc) as Sno from emp1) ab where Sno = 3;

#Get the rank based on salary
select *, rank() over(order by salary desc) as Rnk from emp1;

#Dense rank will go in sequence wise
select *, dense_rank() over(order by salary desc) as Drank from emp1;

#To get Drank in first column
select dense_rank() over(order by salary desc) as Drank, Sname, dep_id from emp1;

#Get Sno based on dept level
select * from emp1 order by dep_id;

select *, row_number() over(partition by dep_id) as Sno from emp1;

select *, row_number() over(partition by dep_id order by salary desc) as Sno from emp1;

#Rank and Dense_rank based on dept level
select *, rank() over(partition by dep_id order by salary desc) as Rnk from emp1;
select*, dense_rank() over(partition by dep_id order by salary desc) as Drnk from emp1;

select*, dense_rank() over(order by salary desc) as Drnk from emp1;

#Get 3rd highest salary based on dept level

select * from (select *, dense_rank() over(partition by dep_id order by salary desc) as Drnk from emp1) ab where Drnk = 3;

#Get country, category wise highest sales from superstore
select country, category, sum(sales) total_sales from superstore group by 1, 2 order by 1, 3 desc;

select country, category, total_sales from (
select row_number() over(partition by country order by sum(sales) desc) sno,
country, category, sum(sales) total_sales from superstore
group by country, category) ab
where sno =1;

#Lag and Lead
#Lag (previous) and Lead (Next)

#Extract year wise total sales

select year (order_date) Yr, sum(sales) total_sales from superstore
group by 1 order by 1;

#To get PY/LY sales using Lag functions

select year(order_date) yr, sum(sales) Cy_sales,
lag(sum(sales)) over (order by year(order_date)asc) Ly_sales
from superstore
group by 1;

#To get next year sales using lead functions

select year(order_date) yr, sum(sales)Cy_sales,
lead(sum(sales)) over(order by year(order_date)asc) Nxt_sales
from superstore
group by 1;

#YOY% Year over year change

select *,concat(round((cy_sales-ly_sales)/ly_sales*100,2),"%") as YOY from(
select year(order_date)Yr, sum(sales)Cy_sales,
lag(sum(sales)) over(order by year(order_date)asc) Ly_sales
from superstore group by 1)ab;

#Region wise sales
select region, sum(sales)total_sales from superstore
group by 1;

select *,concat(round(total_sales/GT *100,2),"%") Region_per from (
select *, sum(total_sales) Over () GT from (
select region, sum(sales)total_sales from superstore
group by 1) ab)ac;

## CTE Common Table Expression (With)

select country, sum(sales) total_sales from superstore group by 1;

select country, sum(sales) total_sales, dense_rank () Over (order by sum(sales) desc) Rnk from superstore group by 1;

#Get 3,5,7 rnk using subquery
select * from (select country, sum(sales) total_sales, 
dense_rank () Over (order by sum(sales) desc) Rnk from superstore 
group by 1) ab where Rnk in (3,5,7);

#Get 3,5,7 rnk using CTE (with)

with ab as(
select country, sum(sales) total_sales, 
dense_rank() Over(order by sum(sales) desc) Rnk from superstore 
group by 1)
select * from ab where rnk in (3,5,7);

#Required dep wise total salary 2nd highest salary (CTE)

select * from emp1;

select dep_id, sum(salary) total_salary from emp1 group by 1;

with a as(
select dep_id, sum(salary) total_salary, dense_rank () Over(order by sum(salary) desc) rnk from emp1 group by 1) 
select * from a where rnk = 2;

#Constraints are used to specify rules for the data in a table (limit access)

create table students (SID int unique, SName varchar(20) not null, Age int check(age>21), course varchar(20) default ("My SQL"));
desc students;

insert into students values(1,"Ajay", 25, "PBI");
select * from students;

insert into students values(1,"Vijay",35,"Excel");

insert into students values(2,null,35,"Excel");

insert into students values(1,"Vijay",20,"Excel");

insert into students values(2,"Vijay",35,"Excel");

insert into students (Sid, Sname, age) values(3,"Ayub",25);
insert into students (Sid, Sname, age) values(4,"Suma",45);
select * from students;

#Primary key (Unique + not null)

create table customer (id int, First_name varchar(20), Last_name varchar(20), age int, primary key (id));
desc customer;

#Foreign Key 
create table new_order (order_id int, order_no int, cust_id int, primary key (order_id), foreign key (cust_id) references customer(id));

