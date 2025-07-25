
 select * from products

 select category , count(*) as cntof_prod from products
 group by category
 select category , avg(price) as avgprice from products 
 group by category 
 having category='electronics'
 
 select   avg(price) asavg_price from products
 where category='electronics'
 select * from customers

 select city from customers
 where city like 'l%'
 select * from products 

 select productname from products 
 where productname like '%er'


 select country  from customers
 where country like '%A'

 select max(price)  as maxprice from products 

 
 select productname, stockquantity,
case when StockQuantity<30 then 'lowstock'
 else 'sufficient ' end as stq
 from products
 
 select country , count(*) as count_of_customers from customers
 group by country 

select min(quantity) as min_quantity  , max(quantity) as max_quantity from orders 

select * from invoices 
select * from orders 

select distinct customerid from orders
where orderdate>'2023-01-01' and orderdate < '2023-02-01' 
and customerid not in (select distinct customerid from invoices)

SELECT DISTINCT CustomerID
FROM Orders
WHERE OrderDate >= '2023-01-01' AND OrderDate < '2023-02-01'
  AND CustomerID NOT IN (
    SELECT DISTINCT CustomerID
    FROM Invoices
  );
