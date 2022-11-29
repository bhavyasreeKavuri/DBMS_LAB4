create database `order-directory`;
use `order-directory`;

create table if not exists supplier(
	SUPP_ID int primary key,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50),
    SUPP_PHONE VARCHAR(10) NOT NULL
    );
    
create table if not exists customer(
	CUS_ID INT NOT NULL,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR,
    PRIMARY KEY (CUS_ID)
    );
    
CREATE TABLE IF NOT EXISTS CATEGORY(
	CAT_ID INT NOT NULL,
    CAT_NAME VARCHAR(20) NOT NULL,
    PRIMARY KEY (CAT_ID)
    );
    
CREATE TABLE IF NOT EXISTS PRODUCT(
	PRO_ID INT NOT NULL,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT "DUMMY",
    PRO_DESC VARCHAR(60),
    CAT_ID INT NOT NULL,
    PRIMARY KEY (PRO_ID),
    FOREIGN KEY (CAT_ID) REFERENCES CATEGORY (CAT_ID)
    );
    
    CREATE TABLE IF NOT EXISTS SUPPLIER_PRICING(
    PRICING_ID INT NOT NULL,
    PRO_ID INT NOT NULL,
    SUPP_ID INT NOT NULL,
    SUPP_PRICE INT DEFAULT 0,
    PRIMARY KEY (PRICING_ID),
    FOREIGN KEY (PRO_ID) REFERENCES PRODUCT (PRO_ID),
    FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER(SUPP_ID),
    UNIQUE (PRO_ID,SUPP_ID)
    );
    
    CREATE TABLE IF NOT EXISTS `ORDER`(
    ORD_ID INT NOT NULL,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE,
    CUS_ID INT NOT NULL,
    PRICING_ID INT NOT NULL,
    PRIMARY KEY (ORD_ID),
    FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER (CUS_ID),
    FOREIGN KEY (PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID)
    );
    
    CREATE TABLE IF NOT EXISTS RATING(
		RAT_ID INT NOT NULL,
        ORD_ID INT NOT NULL,
        RAT_RATSTARS INT NOT NULL,
        PRIMARY KEY (RAT_ID),
        FOREIGN KEY (ORD_ID) REFERENCES `ORDER` (ORD_ID),
        UNIQUE (ORD_ID)
        );
        
        insert into supplier value (1, 'Rajesh Retails', 'Delhi', 1234567890);
        insert into supplier value (2, 'Appario_Ltd.', 'Mumbai', 2589631470);
        insert into supplier value (3, 'Knome products', 'Banglore', 9785462315);
        insert into supplier value (4, 'Bansal Retails', 'Kochi', 8975463285);
        insert into supplier value (5, 'Mittal Ltd.', 'Lucknow', 7898456532);
        
        insert into Customer value (1, 'AAKASH', 9999999999, 'DELHI', 'M');
        insert into Customer value (2, 'AMAN', 9785463215, 'NOIDA', 'M');
        insert into Customer value (3, 'NEHA', 9999999999, 'MUMBAI', 'F');
        insert into Customer value (4, 'MEGHA', 9994562399, 'KOLKATA', 'F');
        insert into Customer value (5, 'PULKIT', 7895999999, 'LUCKNOW', 'M');
        
        insert into Category value (1, 'BOOKS');
        insert into Category value (2, 'GAMES');
        insert into Category value (3, 'GROCERIES');
        insert into Category value (4, 'ELECTRONICS');
        insert into Category value (5, 'CLOTHES');
        
        insert into Product value (1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2);
        insert into Product value (2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5);
        insert into Product value (3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4);
        insert into Product value (4, 'OATS', 'Highly Nutritious from Nestle', 3);
        insert into Product value (5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1);
        insert into Product value (6, 'MILK', '1L Toned MIlk', 3);
        insert into Product value (7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4);
        insert into Product value (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5);
        insert into Product value (9, 'Project IGI', 'compatible with windows 7 and above', 2);
        insert into Product value (10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5);
        insert into Product value (11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1);
        insert into Product value (12, 'Train Your Brain', 'By Shireen Stephen', 1);
        
        insert into Supplier_pricing values (1, 1, 2, 1500);
        insert into Supplier_pricing values (2, 3, 5, 30000);
        insert into Supplier_pricing values (3, 5, 1, 3000);
        insert into Supplier_pricing values (4, 2, 3, 2500);
        insert into Supplier_pricing values (5, 4, 1, 1000);
        
        insert into `Order` value (101, 1500, '2021-10-06', 2, 1);
        insert into `Order` value (102, 1000, '2021-10-12', 3, 5);
        insert into `Order` value (103, 30000, '2021-09-16', 5, 2);
        insert into `Order` value (104, 1500, '2021-10-05', 1, 1);
        insert into `Order` value (105, 3000, '2021-08-16', 4, 3);
        insert into `order` value (106, 1450, '2021-08-18', 1, 9);
         insert into `Order` value (107, 789, '2021-09-01', 3, 7);
        insert into `Order` value (108, 780, '2021-09-07', 5, 6);
        insert into `Order` value (109, 3000, '2021-01-10', 5, 3);
        insert into `Order` value (110, 2500, '2021-09-10', 2, 4);
        insert into `Order` value (111, 1000, '2021-09-15', 4, 5);
        insert into `Order` value (112, 789, '2021-09-16', 4, 7);
        insert into `Order` value (113, 31000, '2021-09-16', 1, 8);
        insert into `Order` value (114, 1000, '2021-09-16', 3, 5);
        insert into `Order` value (115, 3000, '2021-10-06', 5, 3);
        insert into `Order` value (116, 99, '2021-09-17', 2, 1);
        
        insert into Rating values (1,101,4);
        insert into Rating values (2,102,3);
        insert into Rating values (3,103,1);
        insert into Rating values (4,104,2);
        insert into Rating values (5,105,4);
        insert into Rating values (6,106,3);
        insert into Rating values (7,107,4);
        insert into Rating values (8,108,4);
        insert into Rating values (9,109,3);
        insert into Rating values (10,110,5);
        insert into Rating values (11,111,3);
        insert into Rating values (12,112,4);
        insert into Rating values (13,113,2);
        insert into Rating values (14,114,1);
        insert into Rating values (15,115,1);
        insert into Rating values (16,116,0);
        
select cus_id from `order` group by cus_id having sum(ord_amount) >= 3000;
select cus_gender,count(cus_gender) from customer where cus_id in (select cus_id from `order` group by cus_id having sum(ord_amount) >= 3000) group by cus_gender; 

select `order`.* from `order` where cus_id =2;
select o.*, sp.pro_id from `order` as o, supplier_pricing as sp where cus_id = 2 and o.pricing_id = sp.pricing_id;
select o.*,p.pro_name from `order` as o, supplier_pricing as sp , product as p where cus_id = 2 and o.pricing_id = sp.pricing_id and sp.pro_id = p.pro_id;

select supp_id from supplier_pricing group by supp_id having count(supp_id)> 1;
select * from supplier where supp_id in (select supp_id from supplier_pricing group by supp_id having count(supp_id)> 1);

select pro_id,pricing_id,min(supp_price) as minprice from supplier_pricing group by pro_id;

select pp.Cat_ID, c.cat_NAME , pp.Pro_name , MIN(SUPP_PRICE) MinPrice 
from supplier_pricing ss 
INNER JOIN PRODUCT pp ON pp.Pro_ID = ss.Pro_ID
INNER JOIN Category c ON c.cat_Id = pp.Cat_ID
 GROUP BY pp.Cat_ID;
 
 select * from `order` where ord_date > "2021-10-05";
select pricing_id from `order` as o where ord_date > "2021-10-05";
select pro_id from supplier_pricing as sp where pricing_id in (select pricing_id from `order` as o where ord_date > "2021-10-05");
select pro_id,pro_name from product as p where pro_id in (select pro_id from supplier_pricing as sp where pricing_id in (select pricing_id from `order` as o where ord_date > "2021-10-05"));


select cus_name,cus_gender from customer where cus_name like 'A%' or  cus_name like '%a';


select ord_id,rat_ratstars from rating;
select o.ord_id,r.rat_ratstars from  rating as r ,`order` as o where r.ord_id = o.ord_id;
select sp.supp_id,o.ord_id,r.rat_ratstars from rating as r ,`order` as o,supplier_pricing as sp where r.ord_id = o.ord_id and sp.pricing_id = o.pricing_id;

select supp_id,supp_name,Avg_rating,
case when Avg_rating =5 then 'Excellent Service'
when Avg_rating > 4 then 'Good Service'
when Avg_rating >2 then 'Average Service'
else 'Poor Service'
end as Type_of_Service from (select sp.supp_id,s.supp_name,avg(r.rat_ratstars) as Avg_rating
from rating as r ,`order` as o,supplier_pricing as sp, supplier as s where r.ord_id = o.ord_id and sp.pricing_id = o.pricing_id and s.supp_id = sp.supp_id group by sp.supp_id ) as T1;
