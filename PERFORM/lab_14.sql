-->LAB-14

--CREATE TABLE
CREATE TABLE Products (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);

-- Insert data into the Products table
INSERT INTO Products (Product_id, Product_Name, Price) VALUES
(1, 'Smartphone', 35000),
(2, 'Laptop', 65000),
(3, 'Headphones', 5500),
(4, 'Television', 85000),
(5, 'Gaming Console', 32000);


-->PART-A
--1. Create a cursor Product_Cursor to fetch all the rows from a products table.
DECLARE 
@Product_id int,
@Product_Name varchar(100),
@Price int;
DECLARE selecta CURSOR
for select * from Products;
open selecta;
fetch next from selecta INTO @Product_id,@Product_Name,@Price;
while @@FETCH_STATUS = 0
	begin
		print cast(@Product_id as varchar(100)) +'|'+@Product_Name+'|'+cast(@Price as varchar(100));
		fetch next from selecta into @Product_id,@Product_Name,@Price;
	end;
close selecta;
deallocate selecta;

--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName
DECLARE 
@Prodt_id int,
@Prodt_Name varchar(100);
DECLARE Product_Cursor_Fetch CURSOR
for select Product_id,Product_Name from Products;
open Product_Cursor_Fetch;
fetch next from Product_Cursor_Fetch INTO @Prodt_id,@Prodt_Name;
while @@FETCH_STATUS = 0
	begin
		print cast(@Prodt_id as varchar) +'_'+@Prodt_Name;
		fetch next from Product_Cursor_Fetch into @Prodt_id,@Prodt_Name;
	end;
close Product_Cursor_Fetch;
deallocate Product_Cursor_Fetch;

--3. Create a Cursor to Find and Display Products Above Price 30,000.DECLARE 
@prize int;
DECLARE Product_Cursor CURSOR
for select Price from Products where Price>30000;
open Product_Cursor;
fetch next from Product_Cursor INTO @prize;
while @@FETCH_STATUS = 0
	begin
		print cast(@prize as varchar) ;
		fetch next from Product_Cursor into @prize;
	end;
close Product_Cursor;
deallocate Product_Cursor;

--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.
DECLARE 
@Product_id_d int,
@Product_Name_d varchar(100),
@Price_d int;
DECLARE Product_CursorDelete CURSOR
for select * from Products;
open Product_CursorDelete;
fetch next from Product_CursorDelete INTO @Product_id_d,@Product_Name_d,@Price_d;
while @@FETCH_STATUS = 0
	begin
		delete from Products;
		fetch next from Product_CursorDelete INTO @Product_id_d,@Product_Name_d,@Price_d;
	end;
close Product_CursorDelete;
deallocate Product_CursorDelete;

-->part:B

--1.Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases the price by 10%.
DECLARE 
@Product_id_u int,
@Product_Name_u varchar(100),
@Price_u int;
DECLARE Product_CursorUpdate CURSOR
for select * from Products;
open Product_CursorUpdate;
fetch next from Product_CursorUpdate INTO @Product_id_u,@Product_Name_u,@Price_u;
while @@FETCH_STATUS = 0
	begin
		Update Products set Price = @Price_u*1.1 where Product_id=@Product_id_u;
		fetch next from Product_CursorUpdate INTO @Product_id_u,@Product_Name_u,@Price_u;
	end;
close Product_CursorUpdate;
deallocate Product_CursorUpdate;

--2. Create a Cursor to Rounds the price of each product to the nearest whole number.
DECLARE 
@Product_id_r int,
@Product_Name_r varchar(100),
@Price_r int;
DECLARE Produnt_price_round CURSOR
for select * from Products;
open Produnt_price_round;
fetch next from Produnt_price_round INTO @Product_id_r,@Product_Name_r,@Price_r;
while @@FETCH_STATUS = 0
	begin
		Update Products set Price = ROUND(@Price_r,0) where Product_id=@Product_id_r;
		fetch next from Produnt_price_round INTO @Product_id_r,@Product_Name_r,@Price_r;
	end;
close Produnt_price_round;
deallocate Produnt_price_round;

-->Part – C
--1. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop” (Note: Create NewProducts table first with same fields as Products table)
CREATE TABLE NewProducts (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);

DECLARE 
@Product_id_i int,
@Product_Name_i varchar(100),
@Price_i int;
DECLARE selecta CURSOR
for select * from Products;
open selecta;
fetch next from selecta INTO @Product_id_i,@Product_Name_i,@Price_i;
while @@FETCH_STATUS = 0
	begin
	if (@Product_Name_i = 'laptop')
		insert into NewProducts values(@Product_id_i,@Product_Name_i,@Price_i);
	fetch next from selecta into @Product_id_i,@Product_Name_i,@Price_i;
	end;
close selecta;
deallocate selecta;

--2 Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products with a price above 50000 to an archive table, removing them from the original Products table.
CREATE TABLE ArchivedProducts (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);

DECLARE 
@Product_id_n int,
@Product_Name_n varchar(100),
@Price_n int;
DECLARE high_price CURSOR
for select * from Products;
open high_price;
fetch next from high_price INTO @Product_id_n,@Product_Name_n,@Price_n;
while @@FETCH_STATUS = 0
	begin
	if (@Price_n > 50000)
		begin
			insert into ArchivedProducts values(@Product_id_n,@Product_Name_n,@Price_n)
			delete from Products where Price>50000 and Product_id=@Product_id_n;
		end
	fetch next from high_price into @Product_id_n,@Product_Name_n,@Price_n;
	end;
close high_price;
deallocate high_price;