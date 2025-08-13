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



