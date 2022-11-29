select c.CAT_ID,t3.PRO_NAME,c.CAT_NAME,MIN(t3.MIN_PRICE) AS MIN_PRICE FROM category as c
inner join
( select p.CAT_ID,p.PRO_NAME,t2.* FROM product as p
  inner join( select PRO_ID , MIN(SUPP_PRICE) AS MIN_PRICE from supplier_pricing group by PRO_ID)  as t2 
  on t2.PRO_ID=p.PRO_ID
  ) as t3 
  on t3.CAT_ID=C.CAT_ID
  group by t3.CAT_ID;
