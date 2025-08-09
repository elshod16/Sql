select * from TestMultipleColumns

select substring(name,1,charindex(',',name)-1) as firstname, 
       SUBSTRING(name,charindex(',',name)+1,len(name)) as lastname 
from TestMultipleColumns

select * from TestPercent
where strs like  '%[%]%' 
select * from Splitter
select *,
      SUBSTRING(vals,1,charindex('.',vals)-1) as firstv,
	  substring (vals,charindex('.',vals)+1,len(vals)) as secondv
from splitter 

select translate('1234ABC123456XYZ1234567890ADS','0123456789','XXXXXXXXXX') as replaced
 
select * from testDots
where vals like '%.%.%'

select * from countspaces 

select *,len(texts)-len(replace(texts, ' ','')) as cnt_of_spaces
from countspaces 

select * from Employees

select e1.EMPLOYEE_ID,e1.SALARY,e2.MANAGER_ID,e2.SALARY from employees as e1 
join employees as e2 on e1.EMPLOYEE_ID=e2.MANAGER_ID
where e1.SALARY>e2.SALARY


select Employee_ID, First_Name, Last_Name,Hire_Date ,datediff(year,hire_date,getdate()) as years_of_service
from employees 
where datediff(year,hire_date,getdate()) between 10 and 15

declare @str varchar(100)='rtcfvty34redt'
select @str as word,
      translate (@str,'abcdefghijklmnopqrstuvwxyz', replicate(' ',26)) as number_of_characters,
	  TRANSLATE (@str,'0123456789',replicate(' ',10)) as number_of_integers
	  

select * from weather  as w1
join weather as w2 on datediff(day,w1.RecordDate,w2.RecordDate)=1
where w1.Temperature>w2.Temperature

select player_id,min(event_date) as first_login  from activity
group by player_id

select  
      substring (fruit_list,
	  charindex(',',fruit_list,charindex(',',fruit_list)+1)+1,
	  charindex(',',fruit_list,charindex(',',fruit_list,charindex(',',fruit_list)+1)+1)-(charindex(',',fruit_list,charindex(',',fruit_list)+1)+1)) as third
from fruits


--select
--     SUBSTRING('sdgfhsdgfhs@121313131',1,charindex('@','sdgfhsdgfhs@121313131'))-1 as firstr,
--     substring ('sdgfhsdgfhs@121313131',charindex('@','sdgfhsdgfhs@121313131',
--	 charindex('@','sdgfhsdgfhs@121313131')+1)+1,len('sdgfhsdgfhs@121313131')) as secondr

declare @str1 varchar(100)='sdgfhsdgfhs@121313131'

select *,case when p1.code=0 then p2.code else p1.code end as code   from p1
join p2 on p1.id=p2.id

select FIRST_NAME+LAST_NAME as fullname,hire_date ,datediff(year,hire_date,getdate()) as experience,
case when datediff(year,hire_date,getdate())<1 then 'new hire'
     when datediff(year,hire_date,getdate()) between 1 and 5 then 'junior'
	 when datediff(year,hire_date,getdate()) between 5 and 10 then 'mid level '
	 when datediff(year,hire_date,getdate()) between 10 and 20 then 'senior'
	 when datediff(year,hire_date,getdate())>20 then 'veteran' end as status
from employees
select * from GetIntegers



SELECT 
    CASE  WHEN PATINDEX('%[^0-9]%', Vals) > 1 
    THEN LEFT(Vals, PATINDEX('%[^0-9]%', Vals) - 1)
    ELSE Vals
    END AS starting_integer
FROM GetIntegers;


select * from MultipleVals
select case when len(vals) >=2 then substring(vals ,2,1)+substring(vals,1,1)+substring(vals,3,len(vals)) 
else vals  end as status
from MultipleVals
