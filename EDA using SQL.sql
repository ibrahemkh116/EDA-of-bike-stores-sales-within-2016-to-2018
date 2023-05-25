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

-- TOTAL REVENUE BY Year :
select FORMAT(order_date,'yyyy') as [Year] , sum(list_price*quantity*(1-discount)) as Revenue from sales.orders o join sales.order_items OI
on o.order_id = OI.order_id
group by FORMAT(order_date,'yyyy')

-- TOTAL REVENUE BY MONTH in 2016:
select FORMAT(order_date,'MMMM') as [Month Name] , FORMAT(order_date,'MM') as [Month No.] , sum(list_price*quantity*(1-discount)) as Revenue from sales.orders O join sales.order_items OI
on o.order_id = OI.order_id
where order_date between '1/1/2016' and '12/31/2016'
group by FORMAT(order_date,'MMMM') , FORMAT(order_date,'MM')
order by [Month No.] asc

-- TOTAL REVENUE BY MONTH in 2017:
select FORMAT(order_date,'MMMM') as [Month Name] , FORMAT(order_date,'MM') as [Month No.] , sum(list_price*quantity*(1-discount)) as Revenue from sales.orders O join sales.order_items OI
on o.order_id = OI.order_id
where order_date between '1/1/2017' and '12/31/2017'
group by FORMAT(order_date,'MMMM') , FORMAT(order_date,'MM')
order by [Month No.] asc

-- TOTAL REVENUE BY MONTH in 2018:
select FORMAT(order_date,'MMMM') as [Month Name] , FORMAT(order_date,'MM') as [Month No.] , sum(list_price*quantity*(1-discount)) as Revenue from sales.orders O join sales.order_items OI
on o.order_id = OI.order_id
where order_date between '1/1/2018' and '12/31/2018'
group by FORMAT(order_date,'MMMM') , FORMAT(order_date,'MM')
order by [Month No.] asc

