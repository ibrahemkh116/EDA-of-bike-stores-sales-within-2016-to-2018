-- 1st way :

select customer_id , first_name , last_name , city , state from sales.customers

select store_id , store_name from sales.stores

select category_id , category_name from production.categories

select * from production.brands

select  order_date , customer_id , store_id , staff_id , product_id , quantity , list_price , Discount , quantity*list_price*(1-discount) as Revenue
from sales.orders O inner join sales.order_items I
on o.order_id = I.order_id 

select staff_id , store_id , first_name , last_name from sales.staffs

select product_id , product_name , brand_id , category_id from production.products

select * from sales.orders
where order_date between '04-01-2018' and '06-30-2018'
--------------------------------------------------------------------------------------
-- 2nd way :

select brand_name , product_name , category_name , OI.list_price*quantity*(1-discount) as [Revenue] , order_date , CONCAT(CUS.first_name,' ',CUS.last_name) as [Customer Name] , CUS.city , CUS.state , store_name , CONCAT(STT.first_name,' ',STT.last_name) as [Staff Name] 
from production.brands B join production.products P
on B.brand_id = P.brand_id join production.categories CA
on CA.category_id = P.category_id join sales.order_items OI
on p.product_id = OI.product_id join sales.orders O
on o.order_id = OI.order_id join sales.customers CUS
on CUS.customer_id = o.customer_id join sales.stores STO
on STo.store_id = o.store_id join sales.staffs STT
on STT.staff_id = o.staff_id