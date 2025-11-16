--> Lab 16
--create table
CREATE TABLE EMPLOYEEDETAILS
(
	EmployeeID Int Primary Key,
	EmployeeName Varchar(100) Not Null,
	ContactNo Varchar(100) Not Null,
	Department Varchar(100) Not Null,
	Salary Decimal(10,2) Not Null,
	JoiningDate DateTime Null
)
CREATE TABLE EmployeeLogs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(100) NOT NULL,
    ActionPerformed VARCHAR(100) NOT NULL,
    ActionDate DATETIME NOT NULL
);

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieTitle VARCHAR(255) NOT NULL,
    ReleaseYear INT NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    Rating DECIMAL(3, 1) NOT NULL,
    Duration INT NOT NULL
);

CREATE TABLE MoviesLog
(
	LogID INT PRIMARY KEY IDENTITY(1,1),
	MovieID INT NOT NULL,
	MovieTitle VARCHAR(255) NOT NULL,
	ActionPerformed VARCHAR(100) NOT NULL,
	ActionDate	DATETIME  NOT NULL
);


--Part - A 
--1. Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to display the message "Employee record affected.” create or alter trigger aftered1
 on EMPLOYEEDETAILS
 after insert,update,delete
 as 
 begin
 print 'Record is Affected.'
 end

 insert into EMPLOYEEDETAILS VALUES (1,'yatharth','910632312','CE',120000,GETDATE());


 --2. Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to log all operations into the EmployeeLog table.
  --insert trigger
 create or alter trigger altered2i
 on EMPLOYEEDETAILS
 after insert
 as
 begin
 declare @eid int, @ename varchar(100);
	select @eid = EmployeeID, @ename=EmployeeName from inserted;
	insert into PersonLog values(@eid,@ename,'insert',GETDATE());
 end
 --update trigger
  create or alter trigger altered2u
 on EMPLOYEEDETAILS
 after update
 as
 begin
 declare @eid int, @ename varchar(100);
	select @eid = EmployeeID, @ename=EmployeeName from inserted;
	insert into PersonLog values(@eid,@ename,'update',GETDATE());
 end
 --delete trigger
 create or alter trigger altered2d
 on EMPLOYEEDETAILS
 after delete
 as
 begin
 declare @eid int, @ename varchar(100);
	select @eid = EmployeeID, @ename=EmployeeName from deleted;
	insert into PersonLog values(@eid,@ename,'delete',GETDATE());
 end

 insert into EMPLOYEEDETAILS VALUES (2,'vimal','910632312','M',120000,GETDATE());
 update EMPLOYEEDETAILS set EmployeeID=5 where EmployeeID=2
 delete from EMPLOYEEDETAILS where EmployeeID=2

 --3. Create a trigger that fires AFTER INSERT to automatically calculate the joining bonus (10% of the salary) for new employees and update a bonus column in the EmployeeDetails table.
 alter table EmployeeDetails alter column bonus decimal(10,2)
 create or alter trigger sal1
 on EmployeeDetails
 after insert
 as 
 begin
 declare @eid int ,@Salary Decimal(10,2);
 select @eid = EmployeeID,@Salary=Salary from inserted
 update EMPLOYEEDETAILS set bonus = @Salary*0.1 where EmployeeID=@eid
end

insert into EMPLOYEEDETAILS (EmployeeID,EmployeeName,ContactNo,Department,Salary,JoiningDate) VALUES (5,'vimal','910632312','M',1200000,GETDATE());
 select * from EMPLOYEEDETAILS

--Part-> B
--1. Create a trigger to ensure that the JoiningDate is automatically set to the current date if it is NULL.
 create or alter trigger join1
 on EmployeeDetails
 after insert
 as 
 begin
 declare @eid int, @join datetime;
 select @eid=EmployeeID,@join=JoiningDate from inserted where JoiningDate = null
print(@join)
end

insert into EMPLOYEEDETAILS (EmployeeID,EmployeeName,ContactNo,Department,Salary) VALUES (9,'vimal','910632312','M',210000);
 

 --Instead of Trigger
 --Part – A --1. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Movies table. For that, log all operations performed on the Movies table into MoviesLog.  create or alter trigger alteredmovi
 on Movies
 instead of insert
 as
 begin
 declare @mid int, @mtitle varchar(100);
	select @mid = MovieID, @mtitle=MovieTitle from inserted;
	insert into MoviesLog values(@mid,@mtitle,'insert',GETDATE());
 end
 drop trigger alteredmovi
 --update trigger
  create or alter trigger alteredmovu
 on Movies
 instead of update
 as
 begin
 declare @mid int, @mtitle varchar(100);
	select @mid = MovieID, @mtitle=MovieTitle from inserted;
	insert into MoviesLog values(@mid,@mtitle,'update',GETDATE());
 end
 --delete trigger
 create or alter trigger alteredmovd
 on Movies
 instead of delete
 as
 begin
 declare @mid int, @mtitle varchar(100);
	select @mid = MovieID, @mtitle=MovieTitle from deleted;
	insert into MoviesLog values(@mid,@mtitle,'delete',GETDATE());
 end
 select * from Movies
 select * from MoviesLog
 insert into Movies VALUES (2,'vimal','2025','action',10,201);
 update Movies set MovieID=1 where MovieID=2
 delete from Movies where MovieID=2

 --2. Create a trigger that only allows to insert movies for which Rating is greater than 5.5 .
 create or alter trigger ifmovrate
 on Movies 
 instead of insert
 as
 begin
 insert into Movies (MovieID,MovieTitle,ReleaseYear, Genre,Rating,Duration)
 select * from inserted
 where Rating>5.5
 end
 
 insert into Movies VALUES (1,'vimal','2025','action',5,201);
 select * from Movies
 drop trigger ifmovrate

 --3. Create trigger that prevent duplicate 'MovieTitle' of Movies table and log details of it in MoviesLog table
  create or alter trigger movietitle
 on Movies 
 instead of insert
 as
 begin
 insert into Movies (MovieID,MovieTitle,ReleaseYear, Genre,Rating,Duration)
 select * from inserted
 where MovieTitle not in (select MovieTitle from Movies)
 end
 
 insert into Movies VALUES (1,'raj','2025','action',5,201);
 select * from Movies
 drop trigger movietitle

 --Part:-B

 --1. Create trigger that prevents to insert pre-release movies.   create or alter trigger prerelease
 on Movies 
 instead of insert
 as
 begin
 insert into Movies (MovieID,MovieTitle,ReleaseYear, Genre,Rating,Duration)
 select * from inserted
 where MovieTitle not in('raj')
 end
 
 insert into Movies VALUES (1,'raj','2025','action',5,201);
 select * from Movies
 drop trigger prerelease
 
 
 --part:c
 --1.Develop a trigger to ensure that the Duration of a movie cannot be updated to a value greater than 120 minutes (2 hours) to prevent unrealistic entries. 
    create or alter trigger movietime1
 on Movies 
 instead of update
 as
 begin
 insert into Movies (MovieID,MovieTitle,ReleaseYear, Genre,Rating,Duration)
 select * from inserted
 where Duration < 120
 end
 

 insert into Movies VALUES (4,'rrr','2025','action',5,201);
 update Movies set Duration = 204 where MovieID =3
 select * from Movies
 drop trigger movietime1