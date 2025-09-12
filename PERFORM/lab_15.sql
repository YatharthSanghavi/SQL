use [vimal_141_new]

CREATE TABLE PersonInfo (
 PersonID INT PRIMARY KEY,
 PersonName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8,2) NOT NULL,
 JoiningDate DATETIME NULL,
 City VARCHAR(100) NOT NULL,
 Age INT NULL,
 BirthDate DATETIME NOT NULL
);

-- Creating PersonLog Table
CREATE TABLE PersonLog (
 PLogID INT PRIMARY KEY IDENTITY(1,1),
 PersonID INT NOT NULL,
 PersonName VARCHAR(250) NOT NULL,
 Operation VARCHAR(50) NOT NULL,
 UpdateDate DATETIME NOT NULL
);


--From the above given tables perform the following queries:  
--Part – A 
--1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display a 
--message “Record is Affected.” 
create or alter trigger trigger_1 
on PersonInfo
after insert,update,delete
as 
begin
	print 'Record is Affectedajsdhfjhadf.'
end
drop trigger trigger_1
insert into PersonInfo values (123,'vimal',100000.2,'2025-01-21','rajkot',21,'2004-01-01')

--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, log all 
--operations performed on the person table into PersonLog. 
create or alter drop trigger trigger_insert
on PersonInfo
after insert
as
begin
	declare @PersonID int, @PersonName varchar(100);
	select @PersonID=PersonID, @PersonName=PersonName from inserted;
	insert into PersonLog values(@PersonID,@PersonName,'Insert',GETDATE())
end

----------------------
create or alter drop trigger trigger_update
on PersonInfo
after update
as
begin
	declare @PersonID int, @PersonName varchar(100);
	select @PersonID=PersonID, @PersonName=PersonName from inserted;
	insert into PersonLog values(@PersonID,@PersonName,'Update',GETDATE())
end

-----------------------
create or alter drop trigger trigger_delete
on PersonInfo
after delete
as
begin
	declare @PersonID int, @PersonName varchar(100);
	select @PersonID=PersonID, @PersonName=PersonName from deleted;
	insert into PersonLog values(@PersonID,@PersonName,'delete',GETDATE())
end
----------------------

insert into PersonInfo values (12,'vimal',100000.2,'2025-01-21','rajkot',21,'2004-01-01')
select * from PersonLog
select * from PersonInfo


--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. 
--For that, log all operations performed on the person table into PersonLog. 
create or alter drop trigger trigger_insert_io
on PersonInfo
instead of  insert
as
begin
	declare @PersonID int, @PersonName varchar(100);
	select @PersonID=PersonID, @PersonName=PersonName from inserted;
	insert into PersonLog values(@PersonID,@PersonName,'Insert',GETDATE())
end
drop trigger trigger_insert_io
insert into PersonInfo values (6,'yatharth',100000.2,'2025-01-21','rajkot',16,'2004-01-01')


--4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into uppercase 
--whenever the record is inserted. 
create or alter drop trigger trigger_insert_upper
on PersonInfo
after  insert
as
begin
	declare @PersonID int, @PersonName varchar(100);
	select @PersonID=PersonID, @PersonName=PersonName from inserted;
	update PersonInfo set PersonName=upper(@PersonName) where PersonID=@PersonID
end


--5.Create trigger that prevent duplicate entries of person name on PersonInfo table. 
create or alter drop trigger trigger_insert_5
on PersonInfo
instead of  insert
as
begin
	insert into PersonInfo (PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate)
	select * from inserted
	where PersonName not in (select PersonName from PersonInfo)
end

drop trigger trigger_insert_6
--6. Create trigger that prevent Age below 18 years. 
create or alter trigger trigger_insert_6
on PersonInfo
instead of  insert
as
begin
	insert into PersonInfo (PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate)
	select * from inserted
	where Age>18
end
