select min(price) as  min_p from products

select max(salary) as max_s from employees

select count(customerid) as count_of_customers  from Customers

select count( distinct category) as unique_products from products 
select * from products 

select * from sales 

select sum(saleamount) as total_sale from sales
where productid = 7

select avg(age) as average_age  from Employees

select DepartmentName, count(*) AS EMPLOYEE_COUNT FROM EMPLOYEES

GROUP BY DepartmentName

SELECT CATEGORY , MIN(PRICE) AS MIN_p ,MAX(PRICE) AS MAX_P  FROM PRODUCTS
GROUP BY CATEGORY

SELECT CUSTOMERID , SUM(SALEAMOUNT) AS TOTAL_SALE FROM Sales
GROUP BY CUSTOMERID 

select departmentname, count(*) as employee_count  from employees
group by DepartmentName
having count(*) > 5;

select ProductID, sum(saleamount) as total_sales , avg(saleamount) as avg_sales from sales 
group by ProductID

select * from employees

select departmentname  , count(*) as cnt_emp from employees 
group by departmentname 
having departmentname = 'HR'

select departmentname , min(salary) as min_salary , max(salary) as max_salary from employees 
group by  departmentname 

select departmentname , avg(salary) as avg_salary from employees 
group by  departmentname 

select departmentname ,avg(salary) as avg_s , count(*) as cnt_emp from employees 
group by  departmentname 

select category, avg(price) as avg_price from products 
group by category 
having avg(price) > 400 

select * from sales

select year(saledate) as sale_year , sum(saleamount) as total_sale from sales 
group by year(saledate)


select * from customers 

select customerid from orders
group by customerid
having count(*) > 3


select departmentname , avg(salary) as avg_salary from employees 
group by  departmentname 
having avg(salary)> 60000

select category, avg(price)as avg_price from products 
group by category 
having avg(price) > 150


select customerid , sum(saleamount) as total_sale from Sales
group by customerid 
having sum(saleamount) <1500

select departmentname , avg(salary) as avg_salary, sum(salary) as sum_salary from employees 
group by  departmentname 
having avg(salary) > 65000

select customerid ,sum(totalamount)as totalsale  ,min(totalamount) as min_sale from orders 
group by customerid 
having sum(totalamount) >50 

select year(orderdate) as y_s ,month(orderdate) as m_s , sum(totalamount) as total_amount , count(productid) as cnt_products from orders
group by year(orderdate), month(orderdate)
having  count(productid) >=2

select year(orderdate) as year_of_order, min(quantity) as min_q , max(quantity) as max_q from orders 
group by year(orderdate)
