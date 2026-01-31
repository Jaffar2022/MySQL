-- DQL (Data Query Language) - Select command

select * from superstore;


select country,segment from superstore;
select distinct country from superstore;
select distinct country, segment from superstore;

-- order by clause (asc to desc (A to Z) or (Z to A) desc to asc)

select distinct country from superstore order by country; -- default asc
select distinct country from superstore order by country asc;
select distinct country from superstore order by country desc;

-- country & sales (sales required highest to lowest)
select country, sales from superstore order by sales desc;

-- where clause (applies for conditions)

-- country name equals to india required all the records

select * from superstore where country = "india";

-- get country equals to spain and norway

select distinct country from superstore where country in ("spain","norway");

select distinct country from superstore where country = "spain" or country = "norway";

select * from superstore where country = "spain" or country = "norway";

-- get unique country and segment where country not equals to spain 
-- not equals to (<>, !=, not in)

select distinct country, segment from superstore
where country <> "spain" order by country desc;

select distinct country, segment from superstore
where country not in ("spain") order by country desc;

-- get the unique country & sales above 7500

select distinct country, sales from superstore where sales > 7500;

-- get the unique country & segment & sales below 1500

select distinct country, segment, sales from superstore where sales < 1500 order by sales desc;

# get the country and sales from 500 to 1000 from superstore

select country, sales from superstore 
where sales >=500 and sales <=1000 order by sales desc;

select country, sales from superstore 
group by 1,2
having sum(sales) between 500 and 1000
order by sales desc;

select country, sales from superstore 
where sales between 500 and 1000 order by sales desc;

#get the country, sales of 500, 501, 502 from superstore

select country, sales from superstore where sales in (500,501,502);

#Get the country, sales from superstore of france and india

select country, sales from superstore 
where country = 'france' or country = 'India';

select country, sales from superstore 
where country in ("france","india");

#Get the country, sales from superstore where country india & sales >500 and france & sales >5000
select country, sales from superstore
where country = 'india' and sales >500 or country = 'france' and sales >5000;

#Get the country list excluding the france country 

select distinct country from superstore where country <> 'France' order by country asc;

select distinct country from superstore where country != 'France' order by country asc;

select distinct country from superstore where country not in ('France') order by country asc;

# get the country list excluding france, spain, norway, germany
select distinct country from superstore where country not in ('France', 'spain', 'norway','germany') order by country asc;

-- second method without not in
SELECT distinct country from superstore
WHERE country != 'France'
  AND country != 'Spain'
  AND country != 'Norway'
  AND country != 'Germany'
  order by country asc;

#pattern matching with wild card (like)

#get the country that starts with letter S
select distinct country from superstore where country like "s%";

#get the country that ends with letter A
select distinct country from superstore where country like "%a";

#get the country that contains A letter
select distinct country from superstore where country like '%a%';

#get the country that starts and ends with letter A
select distinct country from superstore where country like 'a%a';

#Get the country that does not start with letter A
select distinct country from superstore where country not like 'a%';

#Get the country that contains 7 letters
select distinct country from superstore where country like '_______';

#Get the country that contains 4th letter A
select distinct country from superstore where country like '___a%';

#Get the country which contains 7 or more letters in asc order
select distinct country from superstore where country like '_______%' order by country asc;

#Get the country which contains lesser than 7 letter in desc order
select distinct country from superstore where country not like '_______%' order by country desc;


