
select p.firstname ,p.lastname,a.city,a.state from Person as p
left join address as a on p.personId=a.personId




select * from employee as e1 
join employee as e2 on e1.managerId=e2.id
where e1.salary>e2.salary



select email from person
group by email having count(email)>1


delete from person
where id not in (
select  min(id )as min_id from person
group by email)


select b.ParentName,g.name from boys as b
left join girls as g on b.ParentName=g.ParentName
where g.name is null


select isnull(cart1.item,'   ') as cart2 ,isnull(cart2.item,'   ') as cart1 from cart1
full join cart2 on cart1.Item=Cart2.Item


select c.name,o.customerid from Customers as c
left join orders as o on c.id=o.customerId
where o.id is null


select s.student_name,sb.subject_name, count(e.subject_name) as attendance from students as s 
cross join subjects as sb 
left join Examinations as e on s.student_id=e.student_id and sb.subject_name=e.subject_name
group by s.student_name,sb.subject_name
order by s.student_name,sb.subject_name
