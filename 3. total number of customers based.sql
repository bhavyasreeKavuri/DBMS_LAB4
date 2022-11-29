/* method 1: */

select CUS_GENDER, COUNT(CUS_ID) as no_of_customers
from customer
where CUS_ID IN (select CUS_ID FROM `order` where ORD_AMOUNT >=3000) group by CUS_GENDER;

/* method 2 */

select t2.CUS_GENDER , count(t2.CUS_GENDER) as no_of_customers  from 
(
select t1.CUS_GENDER , CUS_ID from
(select CUS_GENDER, c.CUS_ID
from customer as c
inner join `order` as o
on o.CUS_ID=c.CUS_ID
and ORD_AMOUNT >=3000 ) as t1 group by t1.CUS_ID
) as t2 group by t2.CUS_GENDER;
