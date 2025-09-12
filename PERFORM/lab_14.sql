use vimal_141_new
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


--From the above given tables perform the following queries:  
--Part - A 
--1. Create a cursor Product_Cursor to fetch all the rows from a products table.

DECLARE @Product_id INT,@Product_Name VARCHAR(100),@Price INT;
DECLARE cursor_Select CURSOR
FOR SELECT * FROM Products;

OPEN cursor_Select;

FETCH NEXT FROM cursor_Select  INTO @Product_id ,@Product_Name,@Price; 

WHILE @@FETCH_STATUS=0
	BEGIN
		PRINT CAST(@Product_id AS  VARCHAR) + ' | ' + @Product_Name +' | ' +CAST(@Price AS VARCHAR);
		FETCH NEXT FROM cursor_Select INTO @Product_id ,@Product_Name,@Price;
	END;

CLOSE cursor_Select;
DEALLOCATE cursor_Select;

--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName. 
--(Example: 1_Smartphone) 
DECLARE @Prod_id INT,@Prod_Name VARCHAR(100);
DECLARE cursor_Select CURSOR
FOR SELECT Product_id,Product_Name FROM Products;

OPEN cursor_Select;

FETCH NEXT FROM cursor_Select  INTO @Prod_id ,@Prod_Name; 

WHILE @@FETCH_STATUS=0
	BEGIN
		PRINT CAST(@Prod_id AS  VARCHAR) + '_' + @Prod_Name;
		FETCH NEXT FROM cursor_Select  INTO @Prod_id ,@Prod_Name; 
	END;

CLOSE cursor_Select;
DEALLOCATE cursor_Select;


--3. Create a Cursor to Find and Display Products Above Price 30,000. 
DECLARE @Produ_id INT,@Produ_Name VARCHAR(100),@Pri int;
DECLARE cursor_Select CURSOR
FOR SELECT * FROM Products where Price>30000;

OPEN cursor_Select;

FETCH NEXT FROM cursor_Select  INTO @Produ_id ,@Produ_Name,@Pri; 

WHILE @@FETCH_STATUS=0
	BEGIN
		PRINT CAST(@Produ_id AS  VARCHAR) + ' | ' + @Produ_Name +' | ' +CAST(@Pri AS VARCHAR);
		FETCH NEXT FROM cursor_Select  INTO @Produ_id ,@Produ_Name,@Pri; 
	END;

CLOSE cursor_Select;
DEALLOCATE cursor_Select;


--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.
DECLARE @Produc_id INT,@Produc_Name VARCHAR(100),@Pric int;
DECLARE cursor_delete CURSOR
FOR SELECT * FROM Products;

OPEN cursor_delete;

FETCH NEXT FROM cursor_delete  INTO @Produc_id ,@Produc_Name,@Pric; 

WHILE @@FETCH_STATUS=0
	BEGIN
		delete from Products;
		FETCH NEXT FROM cursor_delete  INTO @Produc_id ,@Produc_Name,@Pric; 
	END;

CLOSE cursor_delete;
DEALLOCATE cursor_delete;

--Part – B 
--1. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases the 
--price by 10%. 
DECLARE @Product_id1 INT,@Product_Name1 VARCHAR(100),@Price1 INT;
DECLARE Product_CursorUpdate CURSOR
FOR SELECT * FROM Products;

OPEN Product_CursorUpdate;

FETCH NEXT FROM Product_CursorUpdate  INTO @Product_id1 ,@Product_Name1,@Price1; 

WHILE @@FETCH_STATUS=0
	BEGIN
		UPDATE Products SET Price=@Price1*1.1 WHERE Product_id=@Product_id1;
		FETCH NEXT FROM Product_CursorUpdate  INTO @Product_id1 ,@Product_Name1,@Price1; 
	END;

CLOSE Product_CursorUpdate;
DEALLOCATE Product_CursorUpdate;


--2. Create a Cursor to Rounds the price of each product to the nearest whole number.
DECLARE @Product_id2 INT,@Product_Name2 VARCHAR(100),@Price2 INT;
DECLARE Product_CursorUpdate CURSOR
FOR SELECT * FROM Products;

OPEN Product_CursorUpdate;

FETCH NEXT FROM Product_CursorUpdate  INTO @Product_id2 ,@Product_Name2,@Price2; 

WHILE @@FETCH_STATUS=0
	BEGIN
		UPDATE Products SET Price=ROUND(@Price2,0) WHERE Product_id=@Product_id2;
		FETCH NEXT FROM Product_CursorUpdate  INTO @Product_id2 ,@Product_Name2,@Price2;  
	END;

CLOSE Product_CursorUpdate;
DEALLOCATE Product_CursorUpdate;


--Part – C 
--1. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop” (Note: 
--Create NewProducts table first with same fields as Products table) 
CREATE TABLE NewProducts (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);

SELECT * FROM NewProducts

DECLARE @Product_id3 INT,@Product_Name3 VARCHAR(100),@Price3 INT;
DECLARE INSERT_NewProducts CURSOR
FOR SELECT * FROM Products;

OPEN INSERT_NewProducts;

FETCH NEXT FROM INSERT_NewProducts  INTO @Product_id3 ,@Product_Name3,@Price3; 

WHILE @@FETCH_STATUS=0
	BEGIN
		IF(@Product_Name3='Laptop')
			INSERT INTO NewProducts VALUES (@Product_id3,@Product_Name3,@Price3);
		FETCH NEXT FROM INSERT_NewProducts  INTO @Product_id3 ,@Product_Name3,@Price3;;  
	END;

CLOSE INSERT_NewProducts;
DEALLOCATE INSERT_NewProducts;


--2. Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products with a 
--price above 50000 to an archive table, removing them from the original Products table.
CREATE TABLE ArchivedProducts (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);
SELECT * FROM Products
SELECT * FROM ArchivedProducts
DELETE FROM ArchivedProducts
DELETE FROM Products

DECLARE @Product_id4 INT,@Product_Name4 VARCHAR(100),@Price4 INT;
DECLARE INSERT_ArchivedProducts CURSOR
FOR SELECT * FROM Products;

OPEN INSERT_ArchivedProducts;

FETCH NEXT FROM INSERT_ArchivedProducts  INTO @Product_id4 ,@Product_Name4,@Price4; 

WHILE @@FETCH_STATUS=0
	BEGIN
		IF(@Price4>50000)
		BEGIN
			INSERT INTO ArchivedProducts VALUES (@Product_id4,@Product_Name4,@Price4);
			DELETE FROM Products WHERE Product_id=@Product_id4;
		END;
		FETCH NEXT FROM INSERT_ArchivedProducts  INTO @Product_id4 ,@Product_Name4,@Price4;  
	END;

CLOSE INSERT_ArchivedProducts;
DEALLOCATE INSERT_ArchivedProducts;




