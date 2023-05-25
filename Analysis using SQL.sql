-- TOP (10) CUSTOMERS BY TOTAL REVENUE :
select top (10) CONCAT(first_name,' ',last_name) as [Customer Name] , sum(list_price * quantity * (1-discount)) as Revenue from sales.customers C inner join sales.orders O
on C.customer_id = o.customer_id join sales.order_items OI
on o.order_id = OI.order_id
group by CONCAT(first_name,' ',last_name)
order by Revenue desc

-- TOTAL REVENUE BY STATE :
select state , sum(list_price*quantity*(1-discount)) as Revenue from sales.customers C join sales.orders O
on C.customer_id = O.customer_id join sales.order_items OI
on O.order_id = OI.order_id
group by state
order by Revenue desc

-- TOTAL REVENUE BY STORE :
select store_name , sum(list_price*quantity*(1-discount)) as Revenue from sales.stores S join sales.orders O
on s.store_id = o.store_id join sales.order_items OI
on o.order_id = OI.order_id
group by store_name
order by Revenue desc

-- TOTAL REVENUE BY MONTH :
select FORMAT(order_date,'MMMM') as [Month Name] , sum(list_price*quantity*(1-discount)) as Revenue from sales.orders O join sales.order_items OI
on o.order_id = OI.order_id
group by FORMAT(order_date,'MMMM')
