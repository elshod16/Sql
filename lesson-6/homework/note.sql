
select * from InputTbl
select distinct col1,col2 from InputTbl--1-usul distinct bilan hech qaysisi bir biriga oxshashmaslarini berdi har bitta columnda
select distinct 
greatest (col1,col2) as v1,
least(col1,col2) as v2
from InputTbl--  Using LEAST() and GREATEST() to ignore order (treat (a,b) same as (b,

select * from TestMultipleZero
where ([A]+[B]+[C]+[D]) > 0



select * from section1 
where id = ( select min(id) from section1)


select * from section1 
where id = ( select max(id) from section1)

select * from section1
where name like 'b%'



select * from productcodes
where code like '%n_%' escape 'n'
