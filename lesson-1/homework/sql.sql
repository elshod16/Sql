create database schoolIDB
use schoolIDB
create table students(
studentID INT primary key,
name varchar(50),
Age INT
)
select * from students 

insert into students(studentID , name , Age )
VALUES 
(1,'TOSHKENTOV ELSHOD',17),
(2,'AXMADOV JAMSHID', 18),
(3,'RISKULOV JASUR',19);
