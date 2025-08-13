create table numbers (number int)

select * from Numbers1
--1
;with ncte as  
(
select 1 as n
union all
select n+1 
from ncte
where n<1000
)
INSERT INTO numbers 
SELECT n
FROM NCTE
OPTION (MAXRECURSION 1000);


--2
select e.EmployeeID,s.totalsale from employees as e 
join
(
select s.EmployeeID,sum(s.SalesAmount) as totalsale from sales as s
group by s.EmployeeID
) as s
on e.EmployeeID=s.EmployeeID

--3
;with cte as
(
select e.EmployeeID, avg(e.Salary) as avg_salary from employees as e
group by e.EmployeeID
)
select EmployeeID,avg_salary from cte


--4
select p.ProductName,highestone.highest from
(
select s.productID,max(s.SalesAmount)as highest from sales as s
group by s.ProductID
)as highestone
join products as p on highestone.ProductID=p.productID

--5


;with cte AS
(
    SELECT 1 AS num
    UNION ALL
    SELECT num * 2
    FROM cte
    WHERE num * 2 < 1000000
)
SELECT num
FROM cte
OPTION (MAXRECURSION 0); 


--6
;with cte as
(
select s.EmployeeID,count(s.SalesAmount) as totalsale from sales as s 
group by s.EmployeeID
)
select c.EmployeeID,c.totalsale from cte as c
join Employees as e on c.EmployeeID=e.EmployeeID



;with cte as
(
select s.EmployeeID,sum(s.SalesAmount) as totalsale  from sales as s 
group by s.EmployeeID
)
select c.EmployeeID,c.totalsale from cte as c
join Employees as e on c.EmployeeID=e.EmployeeID
where c.totalsale>500


;with cte as
(
select avg(e.Salary) as avgsalary from employees as e 
)
select e.FirstName+' '+e.LastName as fullanme,c.avgsalary  from cte as c
cross join employees as e
where e.Salary>c.avgsalary

select top 5  e.EmployeeID,e.FirstName+' '+e.LastName as fullname,d.totalorders   from Employees as e
join ( select s.SalesID,count(*) as totalorders from sales as s 
group by s.SalesID 
) as d
on d.SalesID=e.EmployeeID

select * from sales 
select * from products 

select p.ProductID ,sum(x.SalesAmount) as categorysales from 
(select s.ProductID,s.SalesAmount from sales as s
) as x 
join Products as p on p.ProductID=x.ProductID
group by p.ProductID


;WITH CTE AS
(
    SELECT Number,
           CAST(1 AS INT) AS i,
           CAST(1 AS BIGINT) AS fact
    FROM Numbers1
    WHERE Number >= 0
    UNION ALL
    SELECT Number,
           i + 1,
           fact * (i + 1)
    FROM CTE
    WHERE i < Number
)
SELECT Number,
       MAX(fact) AS Factorial
FROM CTE
GROUP BY Number
ORDER BY Number
OPTION (MAXRECURSION 0);


SELECT 
    YEAR(s1.SaleDate) AS SaleYear,
    MONTH(s1.SaleDate) AS SaleMonth,
    SUM(s1.SalesAmount) AS CurrentMonthSales,
    SUM(s1.SalesAmount) - 
    (
        SELECT SUM(s2.SalesAmount)
        FROM Sales s2
        WHERE YEAR(s2.SaleDate) = YEAR(DATEADD(MONTH, -1, MIN(s1.SaleDate)))
          AND MONTH(s2.SaleDate) = MONTH(DATEADD(MONTH, -1, MIN(s1.SaleDate)))
    ) AS SalesDifference
FROM Sales s1
GROUP BY YEAR(s1.SaleDate), MONTH(s1.SaleDate)
ORDER BY SaleYear, SaleMonth;

SELECT 
    e.EmployeeID,
    e.FirstName,
    YEAR(s.SaleDate) AS SaleYear,
    DATEPART(QUARTER, s.SaleDate) AS SaleQuarter,
    SUM(s.SalesAmount) AS TotalSales
FROM Employees e
JOIN Sales s ON e.EmployeeID = s.EmployeeID
GROUP BY 
    e.EmployeeID, 
    e.FirstName, 
    YEAR(s.SaleDate), 
    DATEPART(QUARTER, s.SaleDate)
HAVING SUM(s.SalesAmount) > 45000
ORDER BY e.EmployeeID, SaleYear, SaleQuarter;


;WITH FibCTE AS
(
    SELECT 1 AS n, CAST(0 AS BIGINT) AS fib, CAST(1 AS BIGINT) AS next_fib
    UNION ALL
    SELECT n + 1, next_fib, fib + next_fib
    FROM FibCTE
    WHERE n < 20
)
SELECT n AS Position, fib AS FibonacciValue
FROM FibCTE
ORDER BY n
OPTION (MAXRECURSION 0);


select * from FindSameCharacters
where len(vals) >1 
  AND LEN(vals) = LEN(REPLACE(vals, LEFT(vals, 1), ''))
 



DECLARE @n INT = 5;

;WITH NumberSequence AS
(
    SELECT CAST(1 AS INT) AS num, CAST('1' AS NVARCHAR(100)) AS seq
    UNION ALL
    SELECT num + 1,
           seq + CAST(num + 1 AS NVARCHAR(10))
    FROM NumberSequence
    WHERE num < @n
)
SELECT seq
FROM NumberSequence
ORDER BY num
OPTION (MAXRECURSION 0);

SELECT e.EmployeeID, e.firstname, s.SalesCount
FROM Employees e
JOIN (
    SELECT EmployeeID, COUNT(*) AS SalesCount
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY EmployeeID
) AS s
    ON e.EmployeeID = s.EmployeeID
WHERE s.SalesCount = (
    SELECT MAX(SalesCount)
    FROM (
        SELECT EmployeeID, COUNT(*) AS SalesCount
        FROM Sales
        WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
        GROUP BY EmployeeID
    ) AS t
);
