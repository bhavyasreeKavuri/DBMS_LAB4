select ORD_ID , PRO_NAME
from `order` as o
inner join supplier_pricing as s
on s.PRICING_ID = o.PRICING_ID
and o.CUS_ID=2
inner join product as p
on p.PRO_ID = s.PRO_ID; 
