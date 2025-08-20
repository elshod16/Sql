;with monthlysales as 
(
select p.ProductName,sum(s.Quantity) as totalsale ,(sum (s.quantity*p.price) )as totalrevenue from products as p 
join  sales as s on p.ProductID=s.ProductID
where month(s.saledate) = (select month(max(sales.saledate))from sales )
group by p.productname
)
select * from monthlysales

create view vw_ProductSalesSummary as (
select p.ProductID,p.ProductName,p.category,ISNULL(SUM(s.Quantity), 0) AS TotalQuantitySold from Products as p
left join sales as s on p.ProductID=s.ProductID
group by p.ProductID,p.ProductName,p.category)


go
create function fn_GetTotalRevenueForProduct(@ProductID INT)
  returns decimal(10, 2)
as
  begin
    return (select SUM(s.quantity * p.price) as totalRevenue from Products as p
      join Sales as s on s.ProductID = p.ProductID
      where p.ProductID = @ProductID)
  end
go

select dbo.fn_GetTotalRevenueForProduct(1) as revenue








drop function fn_GetSalesByCategory

create function fn_GetSalesByCategory(@category varchar(50))
returns table
as 
return   (SELECT 
        p.ProductName,
        SUM(s.Quantity) AS TotalQuantity,
        SUM(s.Quantity * p.Price) AS TotalRevenue from products as p 
		left join sales as s on p.ProductID=s.ProductID
		where p.Category=@category
		group by p.productname)
select * from products 
select * from sales 


select * from fn_GetSalesByCategory('Groceries')

DECLARE @num int = 2, @inc int = 2, @checker int = 1
while @inc < @num
begin
  if @num % @inc = 0
  begin
    set @checker = 0
    break
  end
  else
  begin
  set @inc = @inc + 1
  end
end

if @checker = 1
begin
  print('Bu son tub')
end
else
begin
  print('Bu son tub emas')
end


go 
create function fn_GetNumbersBetween(@Start INT,@End INT)
returns table
as 
return
(with numbers  as(
select  @Start as Number
union all
select number  + 1 from numbers 
where Number +1 <=@end
)
select * from numbers)

select * from dbo.fn_GetNumbersBetween(3,7)
go

-- Jadval yaratish
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    salary INT
);

-- Ma'lumot qo'shish
INSERT INTO Employees (id, salary)
VALUES 
(1, 100),
(2, 200),
(3, 300);

-- Natijani ko'rish
SELECT * FROM Employees;
CREATE FUNCTION getNthHighestSalary(@N INT)
RETURNS INT
AS
BEGIN
    DECLARE @result INT;

    ;WITH Ranked AS (
        SELECT salary,
               DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
        FROM Employees
    )
    SELECT @result = salary
    FROM Ranked
    WHERE rnk = @N;

    RETURN @result;
END
