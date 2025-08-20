--1

create proc te
as 
begin 
create table #EmployeeBonus(
           EmployeeID INT PRIMARY KEY,
        FullName NVARCHAR(100),
        Department NVARCHAR(50),
        Salary DECIMAL(10,2),
        BonusAmount DECIMAL(10,2))
INSERT INTO #EmployeeBonus (EmployeeID, FullName, Department, Salary, Bonusamount) 
select e.employeeid ,concat(e.firstname,' ',e.lastname) as fullname ,e.Department,e.salary,e.Salary * d.BonusPercentage from Employees as e
join DepartmentBonus as d on e.Department=d.Department
select * from #EmployeeBonus
end 
go

exec te


--2
go
create proc employee_dep
@departmentname varchar(40),
@IncreasePercent int 
as begin 
update employees
set salary=Salary + (Salary * @IncreasePercent / 100)
where Department=@departmentname
select * from employees 
where department=@departmentname
end 

exec employee_dep 'IT' ,20

--3

select * from Products_Current
select * from Products_New

merge into products_current as target 
using products_new as source
on target.productID=source.productid

when matched then update set target.ProductName = source.ProductName,target.Price = source.Price
when not matched by target then INSERT (ProductID, ProductName, Price)
    VALUES (source.ProductID, source.ProductName, source.Price)
when not matched by source then 
delete ;

--4

select id , case when p_id is null then 'root'
when id in ( select p_id from tree where p_id is not null) then 'inner'
else 'leaf'
end as type from tree


select s.user_id,coalesce(avg(case when action ='confirmed' then 1.0 else 0 end ),0) as confirmation_rate
from signups as s
left join Confirmations as c on c.user_id=s.user_id
group by s.user_id 
order by s.user_id

--6

select * from employees
where salary =(select min(salary) from employees)

go
create proc GetProductSalesSummary
as
begin 
select p.productname ,
       sum (s.Quantity) as total_quantity_sold,
	   sum(s.quantity*p.price) as total_sales_amount,
	   min(saledate) as firstdate,
	   max(saledate) as lastdate
from Products as p
left join sales as s on p.ProductID=s.ProductID
group by p.productname
end

go

exec GetProductSalesSummary
