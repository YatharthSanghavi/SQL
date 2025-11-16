-->Lab 12

-->create table & insert

CREATE TABLE Departments ( 
	DepartmentID INT PRIMARY KEY, 
	DepartmentName VARCHAR(100) NOT NULL UNIQUE, 
	ManagerID INT NOT NULL, 
	Location VARCHAR(100) NOT NULL 
); 

CREATE TABLE Employee ( 
	EmployeeID INT PRIMARY KEY, 
	FirstName VARCHAR(100) NOT NULL, 
	LastName VARCHAR(100) NOT NULL, 
	DoB DATETIME NOT NULL, 
	Gender VARCHAR(50) NOT NULL, 
	HireDate DATETIME NOT NULL, 
	DepartmentID INT NOT NULL, 
	Salary DECIMAL(10, 2) NOT NULL, 
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 	
);

CREATE TABLE Projects ( 
	ProjectID INT PRIMARY KEY, 
	ProjectName VARCHAR(100) NOT NULL, 
	StartDate DATETIME NOT NULL, 
	EndDate DATETIME NOT NULL, 
	DepartmentID INT NOT NULL, 
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
); 

	INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID, Location) 
	VALUES  
	(1, 'IT', 101, 'New York'), 
	(2, 'HR', 102, 'San Francisco'), 
	(3, 'Finance', 103, 'Los Angeles'), 
	(4, 'Admin', 104, 'Chicago'), 
	(5, 'Marketing', 105, 'Miami'); 

	INSERT INTO Employee (EmployeeID, FirstName, LastName, DoB, Gender, HireDate, DepartmentID, 
	Salary) 
	VALUES  
	(101, 'John', 'Doe', '1985-04-12', 'Male', '2010-06-15', 1, 75000.00), 
	(102, 'Jane', 'Smith', '1990-08-24', 'Female', '2015-03-10', 2, 60000.00), 
	(103, 'Robert', 'Brown', '1982-12-05', 'Male', '2008-09-25', 3, 82000.00), 
	(104, 'Emily', 'Davis', '1988-11-11', 'Female', '2012-07-18', 4, 58000.00), 
	(105, 'Michael', 'Wilson', '1992-02-02', 'Male', '2018-11-30', 5, 67000.00); 
	
	
	INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, DepartmentID) 
	VALUES  
	(201, 'Project Alpha', '2022-01-01', '2022-12-31', 1), 
	(202, 'Project Beta', '2023-03-15', '2024-03-14', 2), 
	(203, 'Project Gamma', '2021-06-01', '2022-05-31', 3), 
(204, 'Project Delta', '2020-10-10', '2021-10-09', 4), 
	(205, 'Project Epsilon', '2024-04-01', '2025-03-31', 5);


-->part-A

--1. Create Stored Procedure for Employee table As User enters either First Name or Last Name and based on this you must give EmployeeID, DOB, Gender & Hiredate. 
Create or Alter proc proc1
@name varchar(100)
as
begin
select e.DepartmentID,e.DoB,e.HireDate,e.Gender from Employee as e where FirstName=@name or LastName=@name
end

exec proc1 @name='john';

--2. Create a Procedure that will accept Department Name and based on that gives employees list who belongs to that department. 
Create or Alter proc dep
@department int
as
begin
	select e.FirstName from Departments as d inner join Employee as e on d.DepartmentID=e.DepartmentID where d.DepartmentID=@department;
end

exec dep @department=1;

--3.Create a Procedure that accepts Project Name & Department Name and based on that you must give all the project related details.
Create or Alter proc projname
@pname  varchar(100),
@dname int
as
begin
select pr.ProjectID,pr.ProjectName,pr.StartDate,pr.EndDate,pr.DepartmentID from Projects as pr inner join Departments as d on d.DepartmentID=@dname where pr.ProjectName=@pname;
end

exec projname @pname='project alpha',@dname=1;

--4.Create a procedure that will accepts any integer and if salary is between provided integer, then those employee list comes in output.
create or alter proc sal
@startint int,
@endint int
as 
begin
select * from Employee where Salary between @startint and @endint
end

exec sal @startint=60000,@endint=80000

--5. Create a Procedure that will accepts a date and gives all the employees who all are hired on that date
create or alter proc datee
@date varchar(100)
as
begin
select * from Employee where HireDate=@date;
end

exec datee @date='2010-06-15';

-->part : B
--1. Create a Procedure that accepts Gender’s first letter only and based on that employee details will be served
create or alter proc gen
@gender varchar(1)
as
begin
select * from Employee where Gender like @gender + '%'
end

exec gen @gender='M';

--2. Create a Procedure that accepts First Name or Department Name as input and based on that employee data will come. 
Create or Alter proc depname
@name  varchar(100)
as
begin
select * from Employee as e inner join Departments as d on d.DepartmentID=e.DepartmentID where e.FirstName=@name or d.DepartmentName=@name ;
end

exec depname @name='IT';

--3. Create a procedure that will accepts location, if user enters a location any characters, then he/she will get all the departments with all data. 
Create or Alter proc loc
@loc varchar(100)
as
begin
select * from Departments where Location like '%' + @loc + '%';
end

exec loc @loc='s';

-->part - C
--1. Create a procedure that will accepts From Date & To Date and based on that he/she will retrieve Project related data.
create or alter proc proj
@start varchar(100),
@end varchar(100)
as 
begin
select * from Projects where StartDate=@start and EndDate = @end;
end

exec proj @start='2022-01-01',@end='2022-12-31'

--2.Create a procedure in which user will enter project name & location and based on that you must provide all data with Department Name, Manager Name with Project Name & Starting Ending Dates. 
create or alter proc pr
@pname varchar(100),
@loc varchar(100)
as
begin
select d.DepartmentName,Concat(e.FirstName,' ' ,e.LastName) as Manager,p.StartDate,p.EndDate from Projects as p inner join Departments as d on p.DepartmentID=d.DepartmentID inner join Employee as e on e.DepartmentID=d.DepartmentID where p.ProjectName=@pname and d.Location=@loc;
end

exec pr @pname='project alpha',@loc='new york';