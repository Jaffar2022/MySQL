#Aggregate functions (sum, min, max, count, average)

select * from superstore;

select count(*) as Total_count from superstore;
select count(country) as country_count from superstore;
select count(distinct country) as Country_list from superstore;

select sum(sales) from superstore;
select sum(sales) as Total_sales from superstore;
select sum(sales) Total_sales from superstore;
select min(sales) min_sales from superstore;
select max(sales) max_sales from superstore;
select avg(sales) avg_sales from superstore;

select sum(sales) total_sales, max(sales) max_sales, 
min(sales) min_sales, avg(sales) avg_sales from superstore;

-- Group by clause
#get country wise sales from superstore

select country, sum(sales) Total_sales from superstore
group by country order by 1;

#get country wise sales and profit

select country, sum(sales) Total_sales, sum(profit) Total_profit from superstore
group by country;

#get the country and segment sales from superstore
select country, segment, sum(sales) total_sales from superstore
group by country, segment;

#get the region, country, segment, category, average sales from superstore
select region, country, segment, category, avg(sales) avg_sales from superstore
group by region, country, segment, category;

-- second method 
select region, country, segment, category, avg(sales) avg_sales from superstore
group by 1,2,3,4;

-- Combination
#get the country and sales from suprestore country asc

select country, sum(sales) total_sales from superstore group by 1 order by 1 asc;

#get the country & segment & sales & profit, sales asc

select country, segment, sum(sales) total_sales, sum(profit) total_profit from superstore
group by 1,2 order by 4 desc limit 3;

SELECT 
    country,
    segment,
    SUM(sales) total_sales,
    SUM(profit) total_profit
FROM superstore
GROUP BY 1,2
ORDER BY 4 DESC
LIMIT 3;


#get the country & segment & sales & profit, country asc and profit desc
select country, segment, sum(sales) total_sales, sum(profit) total_profit from superstore
group by 1,2 order by 1 asc, 4 desc;

#get the south region & country & sales from superstore country asc

select region, country, sum(sales) total_sales from superstore 
where region = 'South'
group by 1,2
order by 2;

#get the country, segment, sales from superstore where sales range 5000-10000

select country, segment, sum(sales) total_sales from superstore
where sales between 5000 and 10000
group by 1,2
order by 3 desc;

-- this above is incorrect, below one is correct

-- column numbers only used in group by and order by clauses

-- this is correct
select country, segment, sum(sales) total_sales from superstore
group by 1,2
having sum(sales) between 5000 and 10000
order by 3 desc;

#get the country & sales from superstore where country & sales are more than 10000
select country, sum(sales) total_sales from superstore
group by 1
having sum(sales) > 30000
order by 2 desc;

#Get the country, sales, profit where country starts from letter S and profit above 0
select country, sum(sales) total_sales, sum(profit) total_profit from superstore
where country like 's%'
group by 1
having total_profit >0
order by 3;

#Get the country segment sales and profit where segment is consumer and sales above 15000 and profit <0

select country, segment, sum(sales) T_sales, sum(profit) T_profit from superstore 
where segment = "consumer"
group by 1,2
having sum(sales) >15000 and sum(profit) <10000
order by 3 asc, 4 desc;
