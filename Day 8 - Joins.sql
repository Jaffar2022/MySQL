#Joins
#Table_01, Table_02, Table_03
#Inner join, left join and right join are performed on common columns

select * from table_01;
select * from table_02;
select * from table_03;

#Inner Join (Score by city)
select city, score from table_01 inner join table_02
on table_01.name = table_02.name;

#inner join (score, city, mobile_number)
select city, score, mobile_number from table_01 inner join table_02
on table_01.name = table_02.name;

#inner join
select table_01.name, table_01.score, table_02.name, table_02.city, table_02.mobile_number 
from table_01 inner join table_02
on table_01.name = table_02.name;

#inner join is also known as Join
#inner join using alias 
select a.name, a.score, b.name, b.city, b.mobile_number 
from table_01 as a join table_02 as b
on a.name = b.name;

#Left Join (Name, Score, City)
select a.name, b.city, a.score
from table_01 as a left join table_02 as b
on a.name = b.name;


#Right Join (Name, Score, City) Complete list of cities
select a.name, b.city, a.score 
from table_01 as a right join table_02 as b
on a.name=b.name;

#get the city list where city is not updated
select a.name, a.score, b.city 
from table_01 as a left join table_02 as b
on a.name=b.name
where b.city is null;

#Get the city list where emp name is not updated
select a.name, a.score, b.city
from table_01 as a right join table_02 as b
on a.name = b.name
where a.name is null;

#Get the matching emp and city with total score
#Table_03
select * from table_03;

select a.name, a.city, sum(b.score) as total_score
from table_02 as a inner join table_03 as b
on a.name = b.name
group by 1,2;

#Get the name, city, total score where name is not updated
select b.name, a.city, sum(b.score) as total_score
from table_02 as a left join table_03 as b
on a.name = b.name
where b.name is null
group by 1,2;

#Load Country, City, Manager and self file
#select group color wise total sales (superstore and country_list)

select a.group_color, sum(b.sales) as total_sales
from country_list as a inner join superstore as b
on a.country = b.country
group by 1;

#country, segment, ship_mode, sales, profit*qty, cost
#Group color and cc rank
#aggregate sum of all the measure columns
select * from superstore;

select b.country, b.segment, b.ship_mode, a.group_color, a.cc_rank,
 sum(b.sales) Sales, sum(b.profit * b.quantity) PQ, sum(b.sales-b.profit)Cost
 from country_list as a inner join superstore as b
 on a.country = b.country
 group by 1,2,3,4,5;
 
#City_list (manger wise sales)
select * from city_list;

select a.manger, sum(b.sales) Sales
from city_list as a inner join superstore as b
on a.city = b.city
group by 1;

# Country, segment, total sales (superstore)
# group_color, cc_rank(country_list)
# Manger (city_list)

select a.country, a.segment, b.group_color, b.cc_rank, c.manger,
sum(a.sales) total_sales
from superstore as a inner join country_list as b
on a.country = b.country
inner join city_list as c
on a.city = c.city
group by 1,2,3,4,5;

#Self Join - using join on one table
#Self Join using self table
select * from self;

select a.name as manager, b.name as emp 
from self as a join self as b 
on a.emp_id = b.manager_id;

#self join using emp_data
select a.name as manager, b.name as emp 
from emp_data as a join emp_data as b 
on a.emp_id = b.manager_id;

#Cross Join - performed on two different table on different columns
#No (on) condition for cross join as there is no common column
select * from drink_new;
select * from meals_new;

select a.drinkname, a.rate, b.mealname, b.rate
from drink_new as a cross join meals_new as b;

select a.drinkname, a.rate, b.mealname, b.rate,
sum(a.rate+b.rate) as total
from drink_new as a cross join meals_new as b
group by 1,2,3,4;

select a.drinkname, b.mealname, a.rate+b.rate as Total_rate
from drink_new as a cross join meals_new as b;

#Full Outer Join
#To get all records use (Union all)

select * from table_01 left join table_02
on table_01.name = table_02.name
union all
select * from table_01 right join table_02
on table_01.name = table_02.name;

#Unique records (Union)
select * from table_01 left join table_02
on table_01.name = table_02.name
union 
select * from table_01 right join table_02
on table_01.name = table_02.name;

