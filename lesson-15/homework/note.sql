select * from employees
where salary =(select min(salary )from employees)

select * from employees
where salary >(select avg(salary )from employees)

select * from employees 
where department_id=(select id from departments where department_name='sales')

select * from customers 
where customer_id not in (select customer_id from orders )

select * from products as p1
where price=(select max(price) from products as p2 where p1.category_id=p2.category_id)

select *,(select  avg(salary) from employees as e where e.id=d.id  ) as avg_salary from departments as d

select * from employees1 as e1
where salary>(select avg(salary) from employees1 as e2 where e1.department_id=e2.department_id)


select * from students as s
join grades as g on s.student_id=g.student_id
where g.grade=(select max(grade) from grades where course_id=g.course_id)

select * from (select *,DENSE_RANK() over (partition by category_id order by price desc) as price_rank from products) as ranked_products
where price_rank=3

select * from employees as e1
where salary >( select avg(salary)from employees as e2 )
and  salary<( select max(salary)from employees as e2 where e1.department_id=e2.department_id)
