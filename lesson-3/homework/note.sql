
--1-easy level 
-- bulk insert BULK INSERT is a Transact-SQL (T-SQL) command in SQL Server
-- used to quickly import large amounts of data from a data file into a SQL Server table or view.
--To efficiently load large datasets into SQL Server.
--Reduce the overhead of inserting data row-by-row with standard INSERT statements.

--Four File Formats That Can Be Imported into SQL Server:
--1. CSV (Comma-Separated Values)
--2. TXT (Plain Text files with delimiters like commas, tabs, etc.)
--3. XML files (using other import tools like OPENXML, BULK INSERT for XML binaries)
--4. JSON files (via OPENROWSET(BULK...) in recent versions like SQL Server 2016+

---AAAAAAAAAAAAAAAA
 create  table products(productid int primary key  , productname nvarchar(100),price decimal(10,2),categoryid int )
 select * from products
insert into products(productid,productname,price,categoryid) 
values
(1,'laptop',700,1),
(2,'phone',800,2),
(3,'tv',900, 3)

-- null- no value/unknown. The coulumn can be empty
--not null means must have value. the column can not be empty
alter table products 
add unique (productname);
--comment in a sql query , i can write  a comment with using -- for a single line or /*...*/ for a multiple line
alter table products
add categoryid int;
-----DDDDDDDDD
create table categories(categoryid int primary key,categoryname nvarchar (100) )
insert into categories
-- an identity column is used to automatically generate unique , sequential numeric values for each new row inserted into a table - often for primary keys
   --2 medium level 
BULK insert [directors].[dbo].[products]
from 'C:\Users\ACER\Desktop\test.csv '
with(
firstrow = 2 ,
fieldterminator =',',
rowterminator='\n'
)
alter table products 
add constraint fk_products_categories
foreign key(categoryid) references categories(categoryid);
select * from products
