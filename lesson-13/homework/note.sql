
select cast (employee_id as varchar)+'-'+first_name+' '+LAST_NAME as full_information from employees 


select cast(EMPLOYEE_ID as varchar)+'-'+concat_ws(' ',first_name,last_name) as full_info from employees

select charindex('a','Alijon Isaqov',charindex('a','Alijon Isaqov')+1)

update employees 
set PHONE_NUMBER=replace(PHONE_NUMBER,'124','999')
select * from Employees

select first_name ,len(first_name) as length_of_name from employees 
where first_name like 'a%' or  FIRST_NAME like'j%' or first_name like 'm%'

select manager_id,sum(salary) as total_salary from employees 
group by MANAGER_ID 

select * from testmax 

select year1, GREATEST(max1,max2,max3)as high_value from testmax

select * from cinema 
where id%2=1 and description not in('boring')

SELECT * 
FROM SingleOrder
ORDER BY case when id=0 then 1 else 0 end, id

select coalesce(ssn,passportid,itin)from person

select * from orders

select o1.customerid,o1.DeliveryState,o2.DeliveryState from orders as o1
join orders as o2 on o1.CustomerID=o2.CustomerID
where o1.DeliveryState='CA' and o2.DeliveryState='TX'
