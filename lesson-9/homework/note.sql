--easy level
--Using Products, Suppliers table List all combinations of product names and supplier names.

select p.ProductName,s.suppliername from products as p
join Suppliers as s on p.SupplierID=s.SupplierID


--Using Departments, Employees table Get all combinations of departments and employees.
select * from departments as d
join Employees as e on d.DepartmentID=e.DepartmentID
select * from employees 


--Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name
select s.suppliername ,p.ProductName  from products as p
join Suppliers as s on p.SupplierID=s.SupplierID


--Using Orders, Customers table List customer names and their orders ID.
select c.FirstName,o.CustomerID from orders as o 
join Customers as c on c.CustomerID=o.CustomerID


--Using Courses, Students table Get all combinations of students and courses.
select * from courses as c
join students as s on c.CourseID=s.studentID


--Using Products, Orders table Get product names and orders where product IDs match.
select p.ProductName,o.orderid  from products as p
join orders as o on p.ProductID=o.ProductID



--Using Departments, Employees table List employees whose DepartmentID matches the department.
select d.DepartmentName,e.name  from departments as d
join employees as e on d.DepartmentID=e.DepartmentID

--Using Students, Enrollments table List student names and their enrolled course IDs.
select s.Name,e.EnrollmentID from students as s 
join enrollments as e on s.StudentID=e.StudentID

--Using Payments, Orders table List all orders that have matching payments.
select o.OrderID,p.paymentid from payments as p
join orders as o on p.OrderID=o.OrderID

--Using Orders, Products table Show orders where product price is more than 100.
select * from orders as o
join products as p on o.ProductID=p.ProductID
where p.price>100

--medium level
--Using Employees, Departments table List employee names and department names where department IDs are not equal.
--It means: Show all mismatched employee-department combinations.
select e.name as emp_name , d.DepartmentName as  dep_name  from employees as e
cross join departments as d 
where e.DepartmentID<>d.DepartmentID


--Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.
select * from orders as o 
join products as p on o.ProductID=p.ProductID
where o.Quantity>p.StockQuantity

--Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.
  select c.FirstName,s.ProductID,s.SaleAmount from customers as c
  join sales as s on c.CustomerID = s.CustomerID
  where SaleAmount>=500

--Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.
select c.CourseName,s.Name from courses as c 
join enrollments as e on e.CourseID=c.CourseID
join Students as s on s.StudentID=e.StudentID

--Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.
select p.ProductName,s.SupplierName from products as p 
join suppliers as s on p.SupplierID=s.SupplierID
where s.SupplierName like 'tech%'

--Using Orders, Payments table Show orders where payment amount is less than total amount.
select o.orderid,o.TotalAmount,p.Amount from orders as o
join payments as p on o.OrderID=p.OrderID
where o.TotalAmount<p.amount 

--Using Employees and Departments tables, get the Department Name for each employee.
select d.DepartmentName,e.Name from employees as e 
join Departments as d on e.DepartmentID=d.DepartmentID

--Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.
select * from products as p
join categories as c on p.ProductID=c.CategoryID
where c.CategoryName in ('electronics','furniture')
--Using Sales, Customers table Show all sales from customers who are from 'USA'.
select * from sales as s
join customers as c on s.CustomerID=c.CustomerID
where c.Country = 'usa'
--Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.
select * from orders as o
join customers as c on o.CustomerID=o.CustomerID 
where c.Country='germany' and o.TotalAmount>100

--hard level 
--Using Employees table List all pairs of employees from different departments.
select * from Employees as e1
join employees as e2 on e1.DepartmentID <> e2.DepartmentID
and e1.EmployeeID<e2.EmployeeID

--Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).
select * from payments as p
join orders as o on p.OrderID=o.OrderID
join products as pr on pr.ProductID=o.ProductID
where p.Amount=o.Quantity*pr.Price

--Using Students, Enrollments, Courses table Find students who are not enrolled in any course.
select * from students as s
left join enrollments as e on s.StudentID = e.StudentID
left join courses as c on c.CourseID=e.CourseID
where e.StudentID is null


--Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage.
select e1.Name,e1.salary,e2.name,e2.salary from  Employees as e1
join employees as e2 on e1.ManagerID=e2.EmployeeID
where E2.Salary <= E1.Salary

--Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.
select c.firstname from orders as o
left join customers as c on o.customerID=c.customerID
left join payments as p on p.OrderID=o.OrderID
where p.PaymentID is null
