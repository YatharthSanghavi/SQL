-->LAB-11

-->Create tables
CREATE TABLE Departments (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Designation Table
CREATE  TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Person Table
CREATE TABLE Pe(
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);


-->Insert values
INSERT INTO Pe (FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID) VALUES
('Rahul', 'Anshu', 56000, '1990-01-01', 1, 12),
('Hardik', 'Hinsu', 18000, '1990-09-25', 2, 11),
('Bhavin', 'Kamani', 25000, '1991-05-14', NULL, 11),
('Bhoomi', 'Patel', 39000, '2014-02-20', 1, 13),
('Rohit', 'Rajgor', 17000, '1990-07-23', 2, 15),
('Priya', 'Mehta', 25000, '1990-10-18', 2, NULL),
('Neha', 'Trivedi', 18000, '2014-02-20', 3, 15),
('Nehaj', 'Trivedi', 18000, '2014-02-20', 3, NULL);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Admin'),
(2, 'IT'),
(3, 'HR'),
(4, 'Account');

INSERT INTO Designation (DesignationID, DesignationName) VALUES
(11, 'Jobber'),
(12, 'Welder'),
(13, 'Clerk'),
(14, 'Manager'),
(15, 'CEO');

-->PART - A
--1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.
--Insert
--department table
CREATE or ALTER PROCEDURE Depart_insert
	@department_name varchar(100),
	@department_id int
as
begin
	insert into Departments values(@department_id,@department_name)
end
exec Depart_insert @department_name='computer' , @department_id = 5
select * from Departments

--Designation table
CREATE or ALTER PROCEDURE desig_insert
	@DesignationName varchar(100),
	@DesignationID int
as
begin
	insert into Designations values(@DesignationID,@DesignationName)
end
exec desig_insert @DesignationName='CFO' , @DesignationID = 16
select * from Designation

--PERSON TABLE
CREATE or ALTER PROCEDURE person_insert
	@fn varchar(100),
	@ln varchar(100),
	@sal decimal(8,2),
	@joiningdate datetime,
	@depid int,
	@desid int
as
begin
	insert into pe values(@fn,@ln,@sal,@joiningdate,@depid,@desid)
end
exec person_insert @fn='joy' , @ln='roy' , @sal='10000' , @joiningdate = '1995-10-15' ,@depid='1',@desid='16'
select * from pe

--update
--department table
CREATE or ALTER PROCEDURE Depart_update
	@department_name varchar(100),
	@department_id int
as
begin
	update Departments set DepartmentName=@department_name where DepartmentID=@department_id;
end
exec Depart_update @department_name='computerr' , @department_id = 5
select * from Departments

--Designation table
CREATE or ALTER PROCEDURE desig_update
	@DesignationName varchar(100),
	@DesignationID int
as
begin
	update Designation set DesignationName = @DesignationName where DesignationID = @DesignationID;
end
exec desig_update @DesignationName='CMO' , @DesignationID = 16
select * from Designation

--PERSON TABLE
CREATE or ALTER PROCEDURE person_update
	@personid int,
	@fn varchar(100)
as
begin
	update Pe set FirstName=@fn where PersonID=@personid;
end
exec person_update @personid='111',@fn='joyy'
select * from pe

--delete
--department table
CREATE or ALTER PROCEDURE Depart_delete
	@department_id int
as
begin
	delete from Departments where DepartmentID=@department_id
end
exec Depart_delete @department_id = 5
select * from Departments

--Designation table
CREATE or ALTER PROCEDURE desig_delete
	@DesignationID int
as
begin
	delete from Designation where DesignationID=@DesignationID;
end
exec desig_delete @DesignationID = 16
select * from Designation

--PERSON TABLE
CREATE or ALTER PROCEDURE person_delete
	@personid int
as
begin
	delete from Pe where PersonID=@personid;
end
exec person_delete @personid='111'
select * from pe

--2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY
--department table
CREATE or ALTER PROCEDURE Depart_select
	@department_id int
as
begin
	select * from Departments where DepartmentID=@department_id;
end
exec Depart_select @department_id = 4

--Designation table
CREATE or ALTER PROCEDURE desig_select
	@DesignationID int
as
begin
	select * from Designation where DesignationID=@DesignationID
end
exec desig_select @DesignationID = 15

--PERSON TABLE
CREATE or ALTER PROCEDURE person_select
	@personid int
as
begin
	select * from Pe where PersonID=@personid;
end
exec person_select @personid='108'


--3. Department, Designation & Person Table’s (If foreign key is available then do write join and take columns on select list)
--PERSON TABLE
CREATE or ALTER PROCEDURE person_select
as
begin
	select p.PersonID,p.FirstName,p.LastName,p.JoiningDate,p.Salary,p.DepartmentID,d.DepartmentName,de.DesignationName from Pe as p inner join Departments as d on P.DepartmentID=d.DepartmentID inner join Designation as de on p.DesignationID=de.DesignationID;
end
exec person_select

--4. Create a Procedure that shows details of the first 3 persons.
CREATE or ALTER PROCEDURE person_top
as
begin
	select TOP 3 * from Pe;
end
exec person_top



-->PART - B
--1. Create a Proc that takes the dept name as input and returns a table with all workers working in that dept.
CREATE or ALTER PROCEDURE dept_all
	@dname varchar(100)
as
begin
	select p.FirstName from Departments as d inner join Pe as p on d.DepartmentID=p.DepartmentID where d.DepartmentName=@dname;
end
exec dept_all @dname='Admin'

--2. Create Procedure that takes department name & designation name as input and returns a table with worker’s first name, salary, joining date & department name.
CREATE or ALTER PROCEDURE des_dep_name
	@dname varchar(100),
	@dename varchar(100)
as
begin
	select p.PersonID,p.FirstName,p.LastName,p.JoiningDate,p.Salary,p.DepartmentID,d.DepartmentName,de.DesignationName from Pe as p inner join Departments as d on P.DepartmentID=d.DepartmentID inner join Designation as de on p.DesignationID=de.DesignationID where d.DepartmentName=@dname or de.DesignationName=@dename;
end
exec des_dep_name @dname='Admin',@dename='clerk'

--3. Create a Procedure that takes the first name as an input parameter and display all the details of the worker with their department & designation name.
CREATE or ALTER PROCEDURE per_name
	@fname varchar(100)
as
begin
	select p.PersonID,p.FirstName,p.LastName,p.JoiningDate,p.Salary,p.DepartmentID,d.DepartmentName,de.DesignationName from Pe as p inner join Departments as d on P.DepartmentID=d.DepartmentID inner join Designation as de on p.DesignationID=de.DesignationID where p.FirstName=@fname;
end
exec per_name @fname='Rahul'

--4. Create Procedure which displays department wise maximum, minimum & total salaries.
create or alter procedure pr_depmax
as
begin
select d.DepartmentName,max(p.Salary) as maximum, MIN(p.Salary) as minimum,SUM(p.Salary) as total_salaries from Departments as d left join Pe as p on d.DepartmentID=p.DepartmentID group by d.DepartmentName;
end

exec pr_depmax

--5. Create Procedure which displays designation wise average & total salaries.
create or alter procedure avg_total
as
begin
select d.DesignationName as designationname,avg(p.Salary) as avge,SUM(p.Salary) as total from Designation as d left join Pe as p on d.DesignationID=p.DesignationID group by d.DesignationName
end

exec avg_total

-->Part – C
--1.Create Procedure that Accepts Department Name and Returns Person Count.
create or alter procedure per_count
@dep varchar(100)
as
begin
	select COUNT(p.PersonID) from Pe as p join Departments as d on p.DepartmentID=d.DepartmentID where d.DepartmentName=@dep;
end

exec per_count @dep='It';

--2. Create a procedure that takes a salary value as input and returns all workers with a salary greater than input salary value along with their department and designation details.
create or alter procedure gre_sal
@sal int
as
begin
	select p.FirstName,p.JoiningDate,p.LastName,p.Salary,d.DepartmentName,d.Location,de.DesignationName from Pe as p full outer join Departments as d on p.DepartmentID=d.DepartmentID full outer join Designation as de on p.DesignationID = de.DesignationID where p.Salary>@sal;
end

exec gre_sal @sal=50000;

--3.Create a procedure to find the department(s) with the highest total salary among all departments.create or alter procedure totasbeginselect MAX(p.Salary) as maxsal,d.DepartmentName from Pe as p join Departments as d on p.DepartmentID =d.DepartmentID group by d.DepartmentName;endexec tot;--4. Create a procedure that takes a designation name as input and returns a list of all workers under that designation who joined within the last 10 years, along with their department.create or alter procedure lasty@des varchar(100)asbeginselect p.FirstName,p.LastName,p.JoiningDate,p.Salary,de.DepartmentName,d.DesignationName from Pe as p join Designation as d on p.DesignationID=d.DesignationID join Departments as de on p.DepartmentID=de.DepartmentID where d.DesignationName=@des and p.JoiningDate >= DATEADD(year, -10, GETDATE());endexec lasty @des='CEO'--5. Create a procedure to list the number of workers in each department who do not have a designation assigned.create or alter procedure assiasbeginselect COUNT(p.FirstName),d.DepartmentName from Pe as p left join Departments as d on p.DepartmentID = d.DepartmentID left join Designation as de on p.DesignationID=de.DesignationID where p.DesignationID is Null group by d.DepartmentName;endexec assi--6. Create a procedure to retrieve the details of workers in departments where the average salary is above 12000.create or alter proc avgsalasbeginselect p.FirstName,DepartmentName from Pe as p join Departments as d on p.DepartmentID=d.DepartmentID group by d.DepartmentName having AVG(p.Salary)>12000;end