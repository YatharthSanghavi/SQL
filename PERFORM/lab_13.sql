USE vimal_141

CREATE TABLE PERSON(
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL
);


-------Insert Value—
INSERT INTO PERSON (FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID) VALUES
('Rahul', 'Anshu', 56000, '1990-01-01', 1, 12),
('Hardik', 'Hinsu', 18000, '1990-09-25', 2, 11),
('Bhavin', 'Kamani', 25000, '1991-05-14', NULL, 11),
('Bhoomi', 'Patel', 39000, '2014-02-20', 1, 13),
('Rohit', 'Rajgor', 17000, '1990-07-23', 2, 15),
('Priya', 'Mehta', 25000, '1990-10-18', 2, NULL),
('Neha', 'Trivedi', 18000, '2014-02-20', 3, 15);



SELECT * FROM PERSON

--Lab 13 Implement UDF 
--Note: for Table valued function use tables of Lab-2 
--Part – A 
--1. Write a function to print "hello world". 

CREATE OR ALTER FUNCTION FN_PRINT()
RETURNS VARCHAR(100)
AS 
BEGIN 
RETURN 'HELLO WORLD';
END

SELECT dbo.FN_PRINT()


--2. Write a function which returns addition of two numbers. 
CREATE OR ALTER FUNCTION ADDITION(@N1 INT,@N2 INT)
RETURNS INT
AS
BEGIN
RETURN @N1+@N2;
END

SELECT dbo.ADDITION(15,15)

--3. Write a function to check whether the given number is ODD or EVEN. 
CREATE OR ALTER FUNCTION ODDeven(@N INT)
RETURNS VARCHAR(100)
AS 
BEGIN
	RETURN CASE
	WHEN @N%2=0 THEN 'EVEN'
	WHEN @N%2!=0 THEN 'ODD'
	END
END

SELECT dbo.ODDeven(5)
SELECT dbo.ODDeven(6)

--4. Write a function which returns a table with details of a person whose first name starts with B. 
CREATE OR ALTER FUNCTION NAMESb()
RETURNS TABLE 
AS 
return(SELECT * FROM PERSON WHERE FirstName like 'B%')

SELECT * from dbo.NAMESb()

--5. Write a function which returns a table with unique first names from the person table. 
CREATE OR ALTER FUNCTION NAMESunique()
RETURNS TABLE 
AS 
return(SELECT distinct firstname FROM PERSON )

SELECT * from dbo.NAMESunique()

--6. Write a function to print number from 1 to N. (Using while loop) 
CREATE OR ALTER FUNCTION FN_1toN(@N INT)
RETURNS @result TABLE(NUM INT)
AS
BEGIN 
	DECLARE @I INT=1;
	WHILE @I!=@N+1
		BEGIN
			INSERT INTO @result VALUES(@I)
			SET @I=@I +1
		END
	RETURN
END

SELECT * FROM dbo.FN_1toN(10)


--7. Write a function to find the factorial of a given integer. 
CREATE OR ALTER FUNCTION FACTORIAL(@N INT)
RETURNS INT
AS
BEGIN
	DECLARE @I INT=1,@FACT INT=1;
	WHILE @I<=@N
		BEGIN
			SET @FACT=@FACT*@I
			SET @I=@I+1
		END
	RETURN @FACT
END

SELECT dbo.FACTORIAL(5)	

--Part – B 
--1. Write a function to compare two integers and return the comparison result. (Using Case statement) 
CREATE OR ALTER FUNCTION COMPARE(@N1 INT,@N2 INT)
RETURNS VARCHAR(100)
AS
BEGIN
	RETURN CASE
	WHEN @N1>@N2 THEN 'N1 IS GRETER THEN N2'
	WHEN @N1<@N2 THEN 'N2 IS GRETER THEN N1'
	END
END

SELECT dbo.COMPARE(10,15)


--2. Write a function to print the sum of even numbers between 1 to 20. 
CREATE OR ALTER FUNCTION EVENSUM()
RETURNS INT
AS
BEGIN
	DECLARE @I INT=1,@SUM INT=0;
	WHILE @I<=20
		BEGIN
			IF(@I%2=0)
			SET @SUM=@SUM+@I

			SET @I=@I+1
		END
	RETURN @SUM
END

SELECT dbo.EVENSUM() AS EVENsum1to20

--3. Write a function that checks if a given string is a palindrome 
CREATE OR ALTER FUNCTION palindrome(@STRING VARCHAR(100))
RETURNS VARCHAR(100)
AS 
BEGIN
	DECLARE @REV VARCHAR(100)= REVERSE(@STRING) 
	RETURN CASE
	WHEN @STRING=@REV THEN 'palindrome'
	WHEN @REV!=@STRING THEN 'not palindrome'
	END
END


SELECT dbo.palindrome('nayan')
SELECT dbo.palindrome('RAM')

--Part – C 
--1. Write a function to check whether a given number is prime or not.
CREATE OR ALTER FUNCTION PRIMEcheck(@N INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @I INT=1,@RES INT=0;
	WHILE(@I<=@N)
	BEGIN
		IF @N%@I=0
			BEGIN
				SET @RES=@RES+1
			END
			SET @I=@I+1
	END
	RETURN CASE
		WHEN @RES=2 THEN 'PRIME'
		WHEN @RES!=2 THEN 'NOT PRIME'
	END
END

SELECT dbo.PRIMEcheck(5)


