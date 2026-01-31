select * from superstore;
#Logical conditions example
#Sum of profit <0 then sum of sales reduce by 10%
#sum of profit > 1 lakh then sum of sales increase by 30%
#remaining sum of sales increase by 15%
#columns to use country, sales, profit

#Using Case when then
select country, sum(profit) T_profit, sum(sales) T_sales,
case when sum(profit) <0 then sum(sales)*0.9
when sum(profit) >100000 then sum(sales)*1.3
else sum(sales)*1.15 end as New_Sales
from superstore
group by 1;

#using If Condition
select country, sum(profit) T_profit, sum(sales) T_sales,
if(sum(profit) <0, sum(sales)*0.9,
if(sum(profit) >100000, sum(sales)*1.3,
sum(sales)*1.15)) as New_Sales
from superstore
group by 1;

#Sum of cost between 0 to 100000 then "Bad"
#Sum of cost between 100000 to 200000 then "ok"
#Sum of cost between 200000 to 300000 then "Good"
#Sum of cost between > 300000 then "Excellent"
#sum of cost <0 then "Worst"

select country, sum(sales-profit) as Cost from superstore group by 1;

select country, sum(sales-profit) as Cost,
case when sum(sales-profit) <0 then "Worst"
when sum(sales-profit) between 0 and 100000 then "Bad"
when sum(sales-profit) between 100000 and 200000 then "Ok"
when sum(sales-profit) between 200000 and 300000 then "Good"
else "Excellent" end as Status
from superstore group by 1 order by 2 desc;

## Year and month wise total sales
select yr, Mname, Sales from (
select year(order_date) yr, monthname(order_date) Mname, month(order_date) Mno, sum(sales) Sales
from superstore
group by 1,2,3 order by 1,3) ab;

#Text Functions
select distinct customer_name from superstore;

select distinct customer_name, 
upper(customer_name) C1, 
lower(customer_name) C2, 
length(customer_name) C3
from superstore;

#Extracting text
select distinct order_id from superstore;

select distinct order_id, 
left(order_id,2) R_code,
mid(order_id,4,4) Order_yr,
right(order_id,7) Order_no
from superstore;

select distinct order_id,
mid(order_id,4,4) O_yr,
substring(order_id,4,4) or_yr,
reverse(order_id) Rv,
position("-" in order_id) p1,
locate("-", order_id) p2,
replace(order_id, 2017, 2025)Cyr
from superstore;

select distinct customer_name,
locate(" ",customer_name) find_space,
left(customer_name, locate(" ",customer_name)-1) First_name,
right(customer_name, length(customer_name)-locate(" ",customer_name)) Last_name
from superstore;

#same concept using Mysql
select distinct customer_name,
substring_index(customer_name, " ",1) first_name,
substring_index(customer_name, " ",-1) last_name
from superstore;

#For extracting mid name
create table sample3 (Sname varchar(30));
insert into sample3 values ("Krishna kumar singh"), ("Abdul Saleem khan"),
("Vikram Singh Rathore"),("Jay K Kumar");

select * from sample3;

select sname,
substring_index(sname, " ",1) first_name,
substring_index(substring_index(sname, " ",2)," ",-1) mid_name,
substring_index(sname, " ",-1) last_name
from sample3;

#Round the nubmers
select 1.99255 as C1,
round(1.99255,0) C2,
round(1.99255,1)C3,
round(1.99255,2)C4;

#Rounddown the numbers
select 1.99255 as C1, floor(1.99255) as C2;
select 235.55 as C1, floor(235.55) as C2;

#Roundup the numbers
select 1.99255 as C1, ceiling (1.99255) as C2;
select 280.20 as C1, ceiling (280.20) as C2;

#abs - to change negative to positive
select 255-500 as C1, abs(255-500) as C2;

#limit function
#top 10 rows
select * from superstore limit 10;

#Top 5 country based on sales
select country, sum(sales) Sales from superstore
group by 1 order by 2 desc limit 5;

#lowest 5 based on sales
select country, sum(sales) Sales from superstore
group by 1 order by 2 asc limit 5;

#Get 3rd highest sales by country
select country, sum(sales) Sales from superstore
group by 1 order by 2 desc limit 3;

select country, Sales from (select country, sum(sales) Sales from superstore
group by 1 order by 2 desc limit 3) ab order by 2 asc limit 1;

select * from myemp;

#Get top 3 highest salary 
select * from myemp 
order by salary desc limit 3;

#3rd highest salary by first name
select first_name, salary from (
select * from myemp order by salary desc limit 3) 
ab order by salary asc limit 1;

#Windows Function - Starts from over()
#3 Conditions 1. Order by 2. Partition by 3. Partition and order by
#Windows function formulas - Row number, Rank, Dense Rank, Lag, Lead

#Row number
select country, sum(sales) total_sales from superstore
group by 1;

select row_number() over() as Sno, country, sum(sales) total_sales from superstore
group by 2;

select row_number() over(order by sum(sales) desc) Sno, 
country, sum(sales) total_sales from superstore group by 2;

#Get the 3, 5 & 7 highest sales by country

select country, sum(sales) total_sales, row_number() over(order by sum(sales) desc) Sno 
from superstore group by 1;

select country, total_sales from (
select country, sum(sales) total_sales, 
row_number() over(order by sum(sales) desc) Sno
from superstore group by 1) ab where Sno in (3,5,7);


#Rank function
#using Myemp table

select first_name, last_name, salary,
rank () over(order by salary desc) Rnk
from myemp ;

#Dense Rank
#In real time scenario dense_rank will be used
select first_name, last_name, salary,
dense_rank () over(order by salary desc) Drnk
from myemp;

#3rd highest salary info
#sub_query with window function

select * from (
select * ,
dense_rank() over(order by salary desc) Drnk
from myemp) ab where Drnk = 3;

select * from (
select * ,
dense_rank() over(order by salary desc) Drnk
from myemp) ab where Drnk in (3,5);


