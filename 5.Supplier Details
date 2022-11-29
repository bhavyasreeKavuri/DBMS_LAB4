select SUP.SUPP_ID , SUPP_NAME , SUPP_PHONE , SUPP_CITY FROM supplier as sup
inner join 
( select * from supplier_pricing group by SUPP_ID having count(SUPP_ID)>1) as sp
on sp.SUPP_ID=sup.SUPP_ID;
