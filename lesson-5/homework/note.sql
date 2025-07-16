select productname as name
from products

select * from Customers as cilent 

select productname from Products
union all
select productname from Products_Discounted

--show the same data from 2 table 
select ProductName  from products
intersect
select ProductName from Products_Discounted

select distinct firstname  , country from Customers
select * from Customers

select *, 
case when price> 1000 then 'high'
when  price <=1000 then'low' end as status from products

select *,
iif( stockquantity > 100,'yes','no') as stockn from products_discounted

select productname from products 
union 
select productname from Products_Discounted


select productname from products 
except
select productname from Products_Discounted

select * from products 
except
select * from Products_Discounted

select *,
iif (price > 1000, 'expensive','affordable') as price_type from products

select * from employees
where  age<25  or salary>60000

update employees 
set salary = salary*1.1 
where departmentname= 'HR' or EmployeeID=5


select * ,
case when saleamount > 500 then 'top tier'
when saleamount between 200 and 500 then  'mid tier'
else 'low tier'
end as tier from sales 

select customerid from orders
except
select customerid from Sales

select customerid,
quantity ,
case when quantity=1 then '3%' 
when quantity between 1 and 3 then '5%'
else '7%'
end as discount_percentage from Orders
