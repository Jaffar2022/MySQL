#Date Functions
select curdate();
select current_date();
select now();
select current_timestamp();
select year(curdate());
select month(curdate());
select day(curdate());
select date("2020-12-15");
select hour(current_time());
select minute(curtime());
select second(curtime());
select time("10:35:50:");

select distinct order_date from superstore;

#Day
select order_date,day(order_date) from superstore;
select order_date,dayofmonth(order_date) from superstore;
select order_date,dayname(order_date) from superstore;
select order_date,dayofweek(order_date), weekday(order_date) from superstore;
#Sunday as 1st day of week
select order_date,dayofyear(order_date) from superstore;

#Month
select order_date, monthname(order_date) from superstore;
select order_date, month(order_date), monthname(order_date) from superstore;

select order_date, quarter(order_date) Qtr,
concat("Qtr-", quarter(order_date)) as Qtr_new
from superstore;

#week
select order_date, week(order_date) weekno,
weekday(order_date) weekday, dayname(order_date)
from superstore;

select weekday(curdate()),dayofweek(curdate());
select week(curdate());

select distinct order_date, year(order_date),
yearweek(order_date) #combination of year week
from superstore;

#Date Format
select distinct order_date,
dayname (order_date), date_format(order_date, "%a") short_day,
monthname(order_date), date_format(order_date, "%b") short_month,
year(order_date), date_format(order_date, "%y") short_year
from superstore;

#Get Sept-25
select date_format(curdate(),"%b-%y");

#get year wise total sales

select year(order_date), sum(sales) Total_Sales 
from superstore
group by 1 order by 1;

#Day wise sales 
select weekday(order_date) Day_no, 
dayname(order_date) D_name, sum(sales) Total_sales
from superstore
group by 1,2 order by 1;

# Sub-Query
#same day wise sales with only dayname and sales using subquery

select Dname, total_sales from (
select weekday(order_date) Dno, dayname(order_date) Dname, sum(sales) total_sales
from superstore
group by 1,2 order by 1) ab;

#Month wise sales (jan-Dec)
select Mname, total_sales from (
select month(order_date) M_no, monthname(order_date) M_name, sum(sales) total_sales
from superstore
group by 1,2 order by 1)ab;


#Qtr wise total sales
select concat ("Qtr-", quarter(order_date)) Qtr, 
sum(sales) total_sales
from superstore
group by 1 order by 1;

#Year, month wise total sales
select Yr, M_name, total_sales from (
select year(order_date) Yr, 
month(order_date) M_no, 
monthname(order_date) M_name,
sum(sales)total_sales
from superstore
group by 1,2,3 order by 1, 2) ab;

#Year month combined
select concat(Yr, "-",M_name) Yr_Mn, 
total_sales from (
select year(order_date) Yr,
month(order_date) M_no,
monthname(order_date) M_name,
sum(sales)total_sales
from superstore
group by 1,2,3 order by 1,2)ab;

#Year month combined using date format
select yr_mn, 
total_sales from (
select year(order_date) Yr,
month(order_date) M_no,
monthname(order_date) M_name,
date_format(order_date, "%y-%b") Yr_mn,
sum(sales) total_sales
from superstore
group by 1,2,3,4 order by 1)ab;

## Weekly status sales (mon_fri weekdays, sat-sun weekdays)
## Logcal condition

Create table sample2 (name varchar(30), sales int);

insert into sample2 values("Kiran", 500),("Suraj", 300),("Ajay", 200), ("Vijay", 800), ("Prem", 1200), ("Suresh", 1800);

select * from sample2;

#Condition <700 Bad, >=700 Good
#Utilising If Condition
select *, if(sales >=700,"Good","Bad") Result from sample2 
order by sales asc;

select *, if(sales <500,"Bad", if(sales<=1000, "Good", "Excellent")) Result from sample2
order by sales asc;

#Case Condition
select *, case when sales<500 then "Bad"
when sales <=1000 then "Good"
else "Excellent" end result 
from sample2 order by sales asc;

select dayname(order_date) Day_name, Weekday(order_date) Day_no, if(weekday(order_date)>4, "Weekends","Weekdays")Weekly_satus,
sum(sales) from superstore
group by 1,2,3 order by 2;

select if(weekday(order_date)>4, "Weekends","Weekdays") Weekly_status,
sum(sales) from superstore
group by 1;



