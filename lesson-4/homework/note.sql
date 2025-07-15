
select top 5 * from Employees

select distinct category from products
select * from Products
where price>100

select * from Customers
where firstname like 'A%'

select * from products 
order by price asc

select * from Employees
where salary >=60000 and DepartmentName ='HR'

update employees
set email='noemail@example.com'
where email is null 

select * from products 
where price between 50 and 100

select distinct category, productname from products
order by productname desc

select top 10 * from products
order by price desc

select coalesce (firstname,lastname) as name  from Employees

select distinct category,price from products

select * from employees
where age between 30 and 40 or departmentname ='marketing'

 order by Salary desc 
offset 10 rows fetch next 10 rows only

select * from products 
where price<=1000 and StockQuantity>50
order by stockquantity asc

select * from products 
where productname like '%a%'
  
select * from employees 
where departmentname in ('HR','IT','Finance')

select * from customers 
order by city asc , PostalCode desc

select top 5 *  from Sales 
order by SaleAmount desc

 
 select  firstname+' '+lastname from Employees

 select distinct category , productname , price from Products 
 where price > 50


 select avg(price) as avaregeprice from products

 select price from products 
 where price < 0.1 *(SELECT AVG( PRICE )FROM Products);

select * from employees
where age<30 and departmentname in ('HR','IT')

select * from employees
where email like '%@gmail.com'

select * from employees 
where salary> all(select salary from employees where DepartmentName='sales')


SELECT *
FROM Orders
WHERE OrderDate BETWEEN DATEADD(DAY, -180, (SELECT MAX(OrderDate) FROM Orders))
 AND (SELECT MAX(OrderDate) FROM Orders);
