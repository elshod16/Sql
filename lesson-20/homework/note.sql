select distinct s.customername from #sales as s
where exists(
select  1 from  #sales as s2
where s.customername=s2.customername and saledate between '2024-03-01' and '2024-03-31'
group by customername )

--2
select product , sum(price*quantity) as totalrevenue from #sales 
group by product 
having sum(price*quantity)=(select max(sumrevenue) from (select sum(price *quantity) as sumrevenue from #sales 
group by product
)subquery)

--3
select Price*Quantity from #sales 
select max(Price*Quantity) as highest from #sales 
where  Price*Quantity<(select max(Price*Quantity)from #sales )

--4

select salemonth ,sum(totalqty) as totalquantity  from (select datepart(month,saledate) as salemonth,quantity as totalqty from #sales 
)t
group by salemonth
order by salemonth

--5

select * from #sales 
select customername  from #sales as s1
where exists(select 1  from #Sales as s2  WHERE s1.customername <> s2.customername  AND s1.product = s2.product  )

--6
create table Fruits(Name varchar(50), Fruit varchar(50))
insert into Fruits values ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Orange'),
							('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), 
							('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), ('Mario', 'Apple'), 
							('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), 
							('Mario', 'Orange')

select name ,[Apple],[Orange],[Banana] from fruits
pivot (count (fruit) for fruit in ([Apple],[Orange],[Banana])
) as p



create table Family(ParentId int, ChildID int)
insert into Family values (1, 2), (2, 3), (3, 4)

select * from Family

SELECT f1.ParentId,f2.ChildID
FROM Family f1
CROSS JOIN Family f2
WHERE f2.ChildID > f1.ParentId
order by f1.parentid 


CREATE TABLE #Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);


INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);

select * from #orders 
where DeliveryState='TX' and exists(select 1 from #orders as o where #orders.customerID=o.CustomerID and o.DeliveryState='CA' )

create table #residents(resid int identity, fullname varchar(50), address varchar(100))

insert into #residents values 
('Dragan', 'city=Bratislava country=Slovakia name=Dragan age=45'),
('Diogo', 'city=Lisboa country=Portugal age=26'),
('Celine', 'city=Marseille country=France name=Celine age=21'),
('Theo', 'city=Milan country=Italy age=28'),
('Rajabboy', 'city=Tashkent country=Uzbekistan age=22')

Select *, 
case when charindex('name=',address) = 0 then
stuff(address, charindex('age=', address), 0, concat('name=',fullname,' '))
else address end as updated_address

from #residents


CREATE TABLE #Routes
(
RouteID        INTEGER NOT NULL,
DepartureCity  VARCHAR(30) NOT NULL,
ArrivalCity    VARCHAR(30) NOT NULL,
Cost           MONEY NOT NULL,
PRIMARY KEY (DepartureCity, ArrivalCity)
);

INSERT INTO #Routes (RouteID, DepartureCity, ArrivalCity, Cost) VALUES
(1,'Tashkent','Samarkand',100),
(2,'Samarkand','Bukhoro',200),
(3,'Bukhoro','Khorezm',300),
(4,'Samarkand','Khorezm',400),
(5,'Tashkent','Jizzakh',100),
(6,'Jizzakh','Samarkand',50);

select * from #routes


select * from #orders as o1
where DeliveryState='TX' and exists(select 1 from #orders as o2 where o1.CustomerID=o2.CustomerID and o2.DeliveryState='CA')


CREATE TABLE #RankingPuzzle
(
     ID INT
    ,Vals VARCHAR(10)
)

 
INSERT INTO #RankingPuzzle VALUES
(1,'Product'),
(2,'a'),
(3,'a'),
(4,'a'),
(5,'a'),
(6,'Product'),
(7,'b'),
(8,'b'),
(9,'Product'),
(10,'c')

select vals,
row_number ()over  (order by id ) as rank 
from #RankingPuzzle

CREATE TABLE #EmployeeSales (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SalesAmount DECIMAL(10,2),
    SalesMonth INT,
    SalesYear INT
);

INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
('Alice', 'Electronics', 5000, 1, 2024),
('Bob', 'Electronics', 7000, 1, 2024),
('Charlie', 'Furniture', 3000, 1, 2024),
('David', 'Furniture', 4500, 1, 2024),
('Eve', 'Clothing', 6000, 1, 2024),
('Frank', 'Electronics', 8000, 2, 2024),
('Grace', 'Furniture', 3200, 2, 2024),
('Hannah', 'Clothing', 7200, 2, 2024),
('Isaac', 'Electronics', 9100, 3, 2024),
('Jack', 'Furniture', 5300, 3, 2024),
('Kevin', 'Clothing', 6800, 3, 2024),
('Laura', 'Electronics', 6500, 4, 2024),
('Mia', 'Furniture', 4000, 4, 2024),
('Nathan', 'Clothing', 7800, 4, 2024);

select * from #EmployeeSales as e1
where SalesAmount>(select avg(SalesAmount) as avgsales  from #EmployeeSales as e2 where e1.Department=e2.Department)


select *  from #employeesales as e1
where exists (select  1  from #EmployeeSales as e2 where e1.SalesMonth=e2.SalesMonth
group by e2.SalesMonth
having e1.Salesamount =max(e2.salesamount)
)


select * from #EmployeeSales as e1
where not exists(select 1 from #EmployeeSales as e2 )

select * from #EmployeeSales as e
where not exists(select 1 from (select distinct SalesMonth from #EmployeeSales)as m 
where not exists (select 1 from #EmployeeSales as s where s.EmployeeID=e.EmployeeID and s.SalesMonth=e.SalesMonth)
)


CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    Name        VARCHAR(50),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2),
    Stock       INT
);

INSERT INTO Products (ProductID, Name, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 15),
(2, 'Smartphone', 'Electronics', 800.00, 30),
(3, 'Tablet', 'Electronics', 500.00, 25),
(4, 'Headphones', 'Accessories', 150.00, 50),
(5, 'Keyboard', 'Accessories', 100.00, 40),
(6, 'Monitor', 'Electronics', 300.00, 20),
(7, 'Mouse', 'Accessories', 50.00, 60),
(8, 'Chair', 'Furniture', 200.00, 10),
(9, 'Desk', 'Furniture', 400.00, 5),
(10, 'Printer', 'Office Supplies', 250.00, 12),
(11, 'Scanner', 'Office Supplies', 180.00, 8),
(12, 'Notebook', 'Stationery', 10.00, 100),
(13, 'Pen', 'Stationery', 2.00, 500),
(14, 'Backpack', 'Accessories', 80.00, 30),
(15, 'Lamp', 'Furniture', 60.00, 25);

select name  from products 
where price>(select avg(price ) from Products) 

select * from Products
where stock <(select max(stock) from products)

select * from products 
where category=(select Category from products where name='laptop')

select * from Products
where price >(select min(price) from Products  where category='electronics')

select * from products as p1
where price >(select avg(price ) from products as p2 where p1.Category=p2.Category )

CREATE TABLE Orders (
    OrderID    INT PRIMARY KEY,
    ProductID  INT,
    Quantity   INT,
    OrderDate  DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 2, '2024-03-01'),
(2, 3, 5, '2024-03-05'),
(3, 2, 3, '2024-03-07'),
(4, 5, 4, '2024-03-10'),
(5, 8, 1, '2024-03-12'),
(6, 10, 2, '2024-03-15'),
(7, 12, 10, '2024-03-18'),
(8, 7, 6, '2024-03-20'),
(9, 6, 2, '2024-03-22'),
(10, 4, 3, '2024-03-25'),
(11, 9, 2, '2024-03-28'),
(12, 11, 1, '2024-03-30'),
(13, 14, 4, '2024-04-02'),
(14, 15, 5, '2024-04-05'),
(15, 13, 20, '2024-04-08');

select *  from Products as p 
where exists(select 1 from orders as o where p.ProductID=o.ProductID)

select * from Products
where ProductID in(select ProductID from orders
group by productid 
having sum(Quantity)>(select avg(sum(quantity)) from orders 
group by productID ))


select *  from Products 
where productid in(
select productid from orders 
group by ProductID
having  sum(quantity)>(select avg(totalqty )from  (select avg(quantity)as totalqty from orders 
group by ProductID)n))


select * from Products 
where productid not in (select ProductID from orders )






