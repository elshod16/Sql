create database homework
use homework 
create table  employees(EmpId int,name varchar(50),salary decimal(10,2))
insert into employees(EmpId,name,salary)
VALUES
(1,'John', 1000),
(2, 'Steeve',2000),
(3,'Bob',3000);
select * from employees
update employees 
set salary = salary+7000
where EmpId = 1
delete from employees
where EmpId=2
--delete:removes specific rows from a table based on a condition 
--truncate:removes all rows from a table. The table structure remains.Cannot delete specific rows .Less easy to roll back 
--drop: completely removes the table and its structure from the table. The table is gone permanently.
alter table employees 
alter column name varchar(100)
alter table employees 
ADD department varchar(100)
alter table employees
alter column salary float
create table departments (departmentID int ,depname varchar(50),employeesname varchar(20),salary decimal (10,2))
select * from departments 
truncate table employees
DROP TABLE DEPARTMENTS

insert into departments(departmentID,depname,employeesname,salary)
Select 1,'MAAB','John',1000 union all
Select 2,'ITPARK','Steeve',700 union all
Select 3,'Najot ta''lim','Jack',800 union all
Select 4,'mohirdev','Harry',900  union all
Select 5,'It Academy','Lucy',600; 

update employees
set department ='management'
where salary>500
truncate table employees
exec sp_rename 'employees.name','staffmembers';
select * from employees

create table products (productID int primary key, ProductName varchar (60),category varchar(50), price decimal(10,2))
select * from products 
alter table products 
ADD constraint check_price check (price>0)
alter table products 
add stockquantity int default 50
 exec sp_rename 'products.category','productcategory','column'
 insert into  products(productID,productname,productcategory,price)
 values
 (1,'laptop','technology',900),
 (2,'phone','gadget',700),
 (3,'tv','furniture',500),
 (4,'dishwasher','furniture',400),
 (5,'watch','accessories',200);
 select * into products_backup from products 
 select* from products_backup
 exec sp_rename 'products','inventory';
select * from inventory
alter table inventory
alter column price float ;
alter table inventory 
drop constraint check_price
