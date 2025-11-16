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
 -->Part – A
 --1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display a message “Record is Affected.”
 create or alter trigger trigger_1
 on PersonInfo
 after insert,update,delete
 as 
 begin
 print 'Record is Affected.'
 end

 insert into PersonInfo values(1,'yatharth',100000.0,'2025-12-4','rajkot',25,'2025-12-1');

 --2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, log all operations performed on the person table into PersonLog.
 --insert trigger
 create or alter trigger trigger_2i
 on PersonInfo
 after insert
 as
 begin
 declare @pid int, @pname varchar(100);
	select @pid = PersonID, @pname=PersonName from inserted;
	insert into PersonLog values(@pid,@pname,'insert',GETDATE());
 end
 --update trigger
  create or alter trigger trigger_2u
 on PersonInfo
 after update
 as
 begin
 declare @pid int, @pname varchar(100);
	select @pid = PersonID, @pname=PersonName from inserted;
	insert into PersonLog values(@pid,@pname,'update',GETDATE());
 end
 --delete trigger
 create or alter trigger trigger_2d
 on PersonInfo
 after delete
 as
 begin
 declare @pid int, @pname varchar(100);
	select @pid = PersonID, @pname=PersonName from deleted;
	insert into PersonLog values(@pid,@pname,'delete',GETDATE());
 end

 db.Deposit.insertMany([
  {
    ACTNO: 101,
    CNAME: "ANIL",
    BNAME: "VRCE",
    AMOUNT: 1000,
    ADATE: "1-3-95"
  },
  {
    ACTNO: 102,
    CNAME: "SUNIL",
    BNAME: "AJNI",
    AMOUNT: 5000,
    ADATE: "4-1-96"
  },
  {
    ACTNO: 103,
    CNAME: "MEHUL",
    BNAME: "KAROLBAGH",
    AMOUNT: 3500,
    ADATE: "17-11-95"
  },
  {
    ACTNO: 104,
    CNAME: "MADHURI",
    BNAME: "CHANDI",
    AMOUNT: 1200,
    ADATE: "17-12-95"
  },
  {
    ACTNO: 105,
    CNAME: "PRMOD",
    BNAME: "M.G. ROAD",
    AMOUNT: 3000,
    ADATE: "27-3-96"
  },
  {
    ACTNO: 106,
    CNAME: "SANDIP",
    BNAME: "ANDHERI",
    AMOUNT: 2000,
    ADATE: "31-3-96"
  },
  {
    ACTNO: 107,
    CNAME: "SHIVANI",
    BNAME: "VIRAR",
    AMOUNT: 1000,
    ADATE: "5-9-95"
  },
  {
    ACTNO: 108,
    CNAME: "KRANTI",
    BNAME: "NEHRU PLACE",
    AMOUNT: 5000,
    ADATE: "2-7-95"
  }
]);

 select * from PersonLog
 select * from PersonInfo


 --3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, log all operations performed on the person table into PersonLog.
 --insert
 create or alter trigger trigger_2in
 on PersonInfo
 instead of insert
 as
 begin
 declare @pid int, @pname varchar(100);
	select @pid = PersonID, @pname=PersonName from inserted;
	insert into PersonLog values(@pid,@pname,'insert',GETDATE());
 end
 --update trigger
  create or alter trigger trigger_2uin
 on PersonInfo
 instead of  update
 as
 begin
 declare @pid int, @pname varchar(100);
	select @pid = PersonID, @pname=PersonName from inserted;
	insert into PersonLog values(@pid,@pname,'update',GETDATE());
 end
 --delete trigger
 create or alter trigger trigger_2din
 on PersonInfo
 instead of  delete
 as
 begin
 declare @pid int, @pname varchar(100);
	select @pid = PersonID, @pname=PersonName from deleted;
	insert into PersonLog values(@pid,@pname,'delete',GETDATE());
 end

 insert into PersonInfo values(4,'yatharth',100000.0,'2025-12-4','rajkot',25,'2025-12-1');
 update PersonInfo set PersonID=5 where PersonID=4
 delete from PersonInfo where PersonID=5
 select * from PersonLog
 select * from PersonInfo
 drop trigger trigger_2in

 --4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into uppercase whenever the record is inserted.
 create or alter trigger trigger_2upper
 on PersonInfo
 after insert
 as
 begin
 declare @pid int, @pname varchar(100);
	select @pid = PersonID, @pname=PersonName from inserted;
	update PersonInfo set PersonName=upper(@pname) where PersonID=@pid;
 end
 select * from PersonInfo

 insert into PersonInfo values(4,'upp',100000.0,'2025-12-4','rajkot',25,'2025-12-1');
 
 --5. Create trigger that prevent duplicate entries of person name on PersonInfo table.
 create or alter trigger trigger_2upper
 on PersonInfo
 after insert
 as
 begin
 declare @pid int, @pname varchar(100);
	select @pid = PersonID, @pname=PersonName from inserted;
	update PersonInfo set PersonName=upper(@pname) where PersonID=@pid;
 end

 --6. Create trigger that prevent Age below 18 years.
