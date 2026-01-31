#Views - is a virtual table created by a query that combine the result of select query
#We cannot add columns in views.
#Views are used to solve the issue of time-out error in PBI or Excel

select * from superstore;

create view store as select * from superstore;
select * from store;


create view new_superstore as
select order_date, region, country, sales, profit from superstore;

select * from new_superstore;

#User defined functions
#It comes under stored procedures in schemas database
