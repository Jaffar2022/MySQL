Create Database MYClass;

use myclass;

create table Sales(Customer_ID Int,	Customer_Name varchar(250),	Country_Code char(10),	Product_ID int,	Quantity int,	Date_ID int);
insert into sales values(101,	'A',	'IN',	10,	800,	201901),
(102,	'B',	'FR',	11,	104,	201901),
(103,	'C',	'US',	12,	300,	201901),
(104,	'D',	'IT',	13,	240,	201901),
(105,	'E',	'MY',	14,	321,	201901),
(106,	'F',	'UK',	15,	105,	201902),
(107,	'G',	'AU',	16,	503,	201902),
(108,	'H',	'TH',	17,	438,	201902),
(109,	'I',	'NZ',	18,	352,	201902),
(110,	'J',	'IN',	19,	678,	201902),
(111,	'K',	'RU',	20,	424,	201903),
(112,	'L',	'IN',	10,	965,	201903),
(113,	'M',	'US',	11,	236,	201903),
(114,	'N',	'FR',	12,	463,	201903),
(115,	'O',	'NZ',	13,	198,	201903),
(116,	'P',	'TH',	14,	673,	201904),
(117,	'Q',	'AU',	15,	392,	201904),
(118,	'R',	'IN',	16,	851,	201904),
(119,	'S',	'MY',	17,	425,	201904),
(120,	'T',	'JP',	18,	294,	201904),
(121,	'U',	'KW',	19,	383,	201905),
(122,	'V',	'IT',	20,	298,	201905),
(123,	'W',	'TH',	10,	283,	201905),
(124,	'X',	'US',	11,	593,	201905),
(125,	'Y',	'FR',	12,	296,	201906),
(126,	'Z',	'JP',	13,	519,	201906),
(127,	'A',	'IN',	10,	800,	201906),
(128,	'B',	'FR',	11,	104,	201906),
(129,	'C',	'US',	12,	300,	201907),
(130,	'D',	'IT',	13,	240,	201907),
(131,	'E',	'MY',	14,	321,	201907),
(132,	'F',	'UK',	15,	105,	201907),
(133,	'G',	'AU',	16,	503,	201907),
(134,	'H',	'TH',	17,	438,	201908),
(135,	'I',	'NZ',	18,	352,	201908),
(136,	'J',	'IN',	19,	678,	201908),
(137,	'K',	'RU',	20,	424,	201908),
(138,	'L',	'IN',	10,	965,	201909),
(139,	'M',	'US',	11,	236,	201909),
(140,	'N',	'FR',	12,	463,	201909),
(141,	'O',	'NZ',	13,	198,	201909),
(142,	'P',	'TH',	14,	673,	201909),
(143,	'Q',	'AU',	15,	392,	201910),
(144,	'R',	'IN',	16,	851,	201910),
(145,	'S',	'MY',	17,	425,	201910),
(146,	'T',	'JP',	18,	294,	201910),
(147,	'U',	'KW',	19,	383,	201910),
(148,	'V',	'IT',	20,	298,	201911),
(149,	'W',	'TH',	10,	283,	201911),
(150,	'X',	'US',	11,	593,	201911),
(151,	'Y',	'FR',	12,	296,	201911),
(152,	'Z',	'IN',	13,	519,	201911),
(153,	'A',	'IN',	10,	800,	201912),
(154,	'B',	'FR',	11,	104,	201912),
(155,	'C',	'US',	12,	300,	201912),
(156,	'D',	'IT',	13,	240,	201912),
(157,	'E',	'MY',	14,	321,	202001),
(158,	'F',	'UK',	15,	105,	202001),
(159,	'G',	'AU',	16,	503,	202001),
(160,	'H',	'TH',	17,	438,	202001),
(161,	'I',	'NZ',	18,	352,	202002),
(162,	'J',	'IN',	19,	678,	202002),
(163,	'K',	'RU',	20,	424,	202002),
(164,	'L',	'IN',	10,	965,	202002),
(165,	'M',	'US',	11,	236,	202003),
(166,	'N',	'FR',	12,	463,	202003),
(167,	'O',	'NZ',	13,	198,	202003),
(168,	'P',	'TH',	14,	673,	202003),
(169,	'Q',	'AU',	15,	392,	202003),
(170,	'R',	'IN',	16,	851,	202003),
(171,	'S',	'MY',	17,	425,	202004),
(172,	'T',	'JP',	18,	294,	202004),
(173,	'U',	'KW',	19,	383,	202004),
(174,	'V',	'IT',	20,	298,	202004),
(175,	'W',	'TH',	10,	283,	202005),
(176,	'X',	'US',	11,	593,	202005),
(177,	'Y',	'FR',	12,	296,	202005),
(178,	'Z',	'FR',	13,	519,	202005),
(179,	'A',	'IN',	10,	800,	202006),
(180,	'B',	'FR',	11,	104,	202006),
(181,	'C',	'US',	12,	300,	202006),
(182,	'D',	'IT',	13,	240,	202006),
(183,	'E',	'MY',	14,	321,	202007),
(184,	'F',	'UK',	15,	105,	202007),
(185,	'G',	'AU',	16,	503,	202007),
(186,	'H',	'TH',	17,	438,	202008),
(187,	'I',	'NZ',	18,	352,	202008),
(188,	'J',	'IN',	19,	678,	202008),
(189,	'K',	'RU',	20,	424,	202009),
(190,	'L',	'IN',	10,	965,	202009),
(191,	'M',	'US',	11,	236,	202009),
(192,	'N',	'FR',	12,	463,	202009),
(193,	'O',	'NZ',	13,	198,	202010),
(194,	'P',	'TH',	14,	673,	202010),
(195,	'Q',	'AU',	15,	392,	202010),
(196,	'R',	'IN',	16,	851,	202010),
(197,	'S',	'MY',	17,	425,	202011),
(198,	'T',	'JP',	18,	294,	202011),
(199,	'U',	'KW',	19,	383,	202011),
(200,	'V',	'IT',	20,	298,	202011),
(201,	'W',	'TH',	10,	283,	202012),
(202,	'X',	'US',	11,	593,	202012),
(203,	'Y',	'FR',	12,	296,	202012),
(204,	'Z',	'FR',	13,	519,	202012);



create table Products(Product_ID int,	Product_Name varchar(250), 	 Product_Cost int);
insert into products values(10,'Smartphone',200),
(11,'Tablet',270),
(12,'Computer',470),
(13,'Headphone',70),
(14,'Smart TV',550),
(15,'Heater',130),
(16,'Toaster',95),
(17,'Mixer',50),
(18,'Juicer',40),
(19,'Air Conditioner',540),
(20,'Washing Machine',460);

create table Dates(Date_ID int,	Year int,	Month varchar(50));


insert into dates values(201901,2019,'January'),
(201902,2019,'February'),
(201903,2019,'March'),
(201904,2019,'April'),
(201905,2019,'May'),
(201906,2019,'June'),
(201907,2019,'July'),
(201908,2019,'August'),
(201909,2019,'September'),
(201910,2019,'October'),
(201911,2019,'November'),
(201912,2019,'December'),
(202001,2020,'January'),
(202002,2020,'February'),
(202003,2020,'March'),
(202004,2020,'April'),
(202005,2020,'May'),
(202006,2020,'June'),
(202007,2020,'July'),
(202008,2020,'August'),
(202009,2020,'September'),
(202010,2020,'October'),
(202011,2020,'November'),
(202012,2020,'December');

create table country(Country_Code varchar(50),	Country varchar(50),	Product_ID int,	Date_ID int);

insert into country values('IN','India',10,201901),
('FR','France',11,201902),
('US','United States',12,201903),
('IT','Italy',13,201904),
('MY','Malaysia',14,201905),
('UK','United Kingdom',15,201906),
('AU','Australlia',16,201907),
('TH','Thailand',17,201908),
('NZ','New Zealand',18,201909),
('RU','Russia',19,201910),
('JP','Japan',20,201911),
('KW','Kuwait',21,201912);


select Country,product_name,Quantity from country
 left join products on country.product_id=products.product_id 
 left join sales on country.Country_code=sales.country_code;











select Country,product_name,sum(Quantity) from country 
 left join products on country.product_id=products.product_id 
 left join sales on country.Country_code=sales.country_code
group by Country,product_name;

use excelr;
show tables;
select * from patients_data;

use myclass;
create table emp2(id int, first_name varchar(50), Mid_name varchar(50),
Last_name varchar(50));

insert into emp2 values( 1,null,null,"Raj"),(2, null, "Swathi",null),
(3,"Krishna",null,null),(4,"Suraj",null,null);

select * from emp2;
select id, coalesce( first_name,Mid_name,Last_name)as name from emp2;



