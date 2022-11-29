select final.SUPP_ID, SUPP_NAME, final.AVERAGE from
(
        select t2.SUPP_ID, sum(t2.RAT_RATSTARS)/COUNT(t2.RAT_RATSTARS) AS AVERAGE from
        (
                 select SUPP_ID, t1.RAT_RATSTARS
                 from supplier_pricing as sup
                 inner join
	            (
                 select r.RAT_RATSTARS,PRICING_ID
                 FROM rating r
                 inner join `order` o
                 on o.ORD_ID=r.ORD_ID
	            ) as t1 on t1.PRICING_ID=sup.PRICING_ID 
        ) as t2 group by SUPP_ID
) AS final 
  INNER JOIN supplier s 
  on s.SUPP_ID=final.SUPP_ID;
