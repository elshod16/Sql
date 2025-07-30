select e.Name, d.DepartmentName,e.Salary from  employees as e 
join Departments as d on e.DepartmentID=d.DepartmentID
where e.Salary >50000

select c.FirstName,year (o.OrderDate) as year_of_order from customers as c 
join orders as o on c.CustomerID=o.CustomerID
group by c.FirstName,year(o.OrderDate)
having year(o.OrderDate)=2023

select e.Name,isnull(d.DepartmentName,'no') as dept_name from employees  as e 
left join Departments as d on e.DepartmentID=d.DepartmentID

select s.SupplierName, isnull( p.ProductName,'no_name') as product_name from products as p 
left join suppliers as s on p.SupplierID=s.SupplierID

select * from orders as o 
full join payments as p on o.OrderID=p.OrderID

select e1.name as emp_name , e2.name as manager_name  from Employees as e1 
left join Employees as e2 on e1.ManagerID=e2.EmployeeID

select s.Name,c.CourseName from Students as s
join Enrollments as e on s.StudentID = e.StudentID
join courses as c on c.CourseID=e.CourseID
where c.CourseName = 'math 101'

select c.FirstName,o.Quantity from Customers as c 
join orders as o on c.CustomerID=o.CustomerID
where o.quantity >3
order by c.FirstName,o.Quantity

select e.Name,d.DepartmentName from employees as e 
join departments as d on e.DepartmentID=d.DepartmentID
where d.DepartmentName = 'Human Resources'


select d.DepartmentName ,count(e.name )as employee_count from employees as e
join departments as d on e.DepartmentID=d.DepartmentID
group by d.DepartmentName
having count(e.name) >5

select p.ProductID,p.ProductName from products as p 
left join sales as sa on p.ProductID=sa.ProductID
where sa.ProductID is null

select c.FirstName,c.LastName,count(o.orderid) as total_orders from customers as c
join orders as o on c.CustomerID=o.CustomerID
group by c.FirstName ,c.lastname
having count(o.orderid) >=1


select e.Name , d.DepartmentName from employees as e
inner join Departments as d  on e.DepartmentID=d.DepartmentID

select p.ProductName,p.ProductID from products as p
left join orders as o on p.ProductID=o.ProductID
where o.ProductID is null

select e1.name,e1.Salary from employees as e1
join (SELECT DepartmentID, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DepartmentID)
	AS AVG_DEPT ON E1.DepartmentID = AVG_DEPT.DepartmentID
	WHERE E1.SALARY > Avg_DEPT.AVGSALARY

select p.OrderID,year(o.orderdate) as year_order from orders as o
left join payments as p on o.OrderID=p.OrderID
where year(o.orderdate) > 2020 and p.orderid is null

select * from  products as p 
join categories as c on p.ProductID=c.CategoryID
where c.CategoryName in('electronics','furniture')

select o.OrderID,o.OrderDate,p.PaymentID from orders as o 
left join payments as p on o.OrderID=p.OrderID
where p.PaymentID is null


 SELECT s.StudentID, s.Name AS StudentName
FROM Students s
WHERE s.StudentID NOT IN (
    SELECT e.StudentID
    FROM Enrollments e
    JOIN Courses c ON e.CourseID = c.CourseID
    WHERE c.CourseName = 'Math 101'
);
