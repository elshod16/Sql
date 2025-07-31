--easy level
select c.FirstName,o.OrderID, year(o.OrderDate) as year_of_orders from  orders as o 
join customers as c on o.CustomerID=c.CustomerID
group by c.FirstName,year(o.OrderDate) , o.OrderID
having year(o.OrderDate)>2022


select e.Name, d.DepartmentName from employees as e
join departments as d on e.DepartmentID=d.DepartmentID
where d.DepartmentName in ( 'sales','marketing')

select d.DepartmentName,max(e.salary) as maxsalary  from Employees as e 
join Departments as d on e.DepartmentID= d.DepartmentID
group by d.DepartmentName

select c.FirstName,o.OrderID,year(o.OrderDate) as year_of_order from Customers as c
join orders as o on c.CustomerID=o.CustomerID
where c.Country ='usa' and year(o.OrderDate)=2023

select c.FirstName,count(o.orderid) as totalorders  from orders as o 
join Customers as c on o.CustomerID=c.CustomerID
group by c.FirstName

select p.ProductName,s.SupplierName from Products as p 
join Suppliers as s on p.SupplierID=s.SupplierID
where s.SupplierName in('gadget supplies','clothing mart')

select c.customerid,(c.FirstName+' '+c.LastName) as customername,max(o.orderdate) as mostrecentorder from customers as c 
left join orders as o on c.CustomerID=o.CustomerID
group by c.CustomerID,(c.FirstName+' '+c.LastName)

--medium level 

select (c.FirstName+' '+c.LastName) as customername,o.TotalAmount  from orders as o 
join customers as c on o.CustomerID=c.CustomerID
where TotalAmount >500

select p.ProductName,year(s.SaleDate)as year_of_order,s.SaleAmount from Products as p 
join sales as s on p.ProductID=s.ProductID
where year(s.saledate)=2022 or s.saleamount>400

select p.ProductName, sum(s.SaleAmount) as totalsaleamount from sales as s 
join products as p on s.ProductID=p.ProductID
group by p.ProductName


select e.Name,d.DepartmentName,e.Salary from Employees as e 
join Departments as d on e.DepartmentID=d.DepartmentID
where DepartmentName ='hr' and salary>60000

select p.ProductName,year(s.SaleDate) as year_of_sale ,p.StockQuantity from products as p 
join sales as s on  p.ProductID=s.ProductID
where year(s.saledate)>2023 and p.StockQuantity>100

select e.Name,d.DepartmentName,year(e.HireDate) as yearhiredate from employees as e 
join Departments as d on e.DepartmentID=d.DepartmentID
where d.DepartmentName ='sales' or year(e.HireDate)>2020

--hard level 
select c.FirstName+c.LastName as customername ,o.OrderID,c.Address,o.OrderDate from customers as c 
join orders as o on c.CustomerID=o.CustomerID
where country='usa' and c.Address like '[0-9][0-9][0-9][0-9]%'

select p.ProductName,p.Category,s.SaleAmount,c.CategoryName from Products as p
join sales as s on p.ProductID=s.ProductID
join categories as c on p.Category=c.CategoryID
where c.CategoryName='Electronics' or SaleAmount>350

select c.CategoryName,count(p.ProductID) as count_of_products  from products as p
join Categories as c on p.Category=c.CategoryID
group by c.CategoryName


select c.FirstName+' '+c.LastName as customername,c.City,o.OrderID,o.TotalAmount from customers as c 
join orders as o on c.CustomerID=o.CustomerID
where city='Los Angeles' and TotalAmount>300

select e.Name as employeename,d.DepartmentName from Employees as e 
join Departments as d on e.DepartmentID=d.DepartmentID
where DepartmentName in('Hr','Finance') or(
     (LEN(E.name) - LEN(REPLACE(E.Name, 'a', ''))) +
     (LEN(E.Name) - LEN(REPLACE(E.Name, 'e', ''))) +
     (LEN(E.Name) - LEN(REPLACE(E.Name, 'i', ''))) +
     (LEN(E.Name) - LEN(REPLACE(E.Name, 'o', ''))) +
     (LEN(E.Name) - LEN(REPLACE(E.Name, 'u', '')))
   ) >= 4

select e.name as employeename,d.DepartmentName ,e.Salary from employees as e 
join Departments as d on e.DepartmentID=d.DepartmentID
where DepartmentName in('Sales','Marketing') and salary>60000
