--Lab-18
CREATE TABLE STU_MASTER (
    Rno INT PRIMARY KEY,          
    Name VARCHAR(100) NOT NULL,   
    Branch VARCHAR(50) default 'General' NULL,      
    SPI DECIMAL(4,2) check(SPI<=10) NOT NULL,    
    Bklog INT check(Bklog>=0) NOT NULL            
);

INSERT INTO STU_MASTER (Rno, Name, Branch, SPI, Bklog) VALUES
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 0),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh', NULL, 4.50, 3);


--part - A
--4. Try to update SPI of Raju from 8.80 to 12.begin try 	update STU_MASTER set SPI=12 where Rno=101end trybegin catch	print error_message()end catch--5. Try to update Bklog of Neha from 0 to -1begin try 	update STU_MASTER set Bklog=-1 where Name='neha'end trybegin catch	print error_message()end catch--Part – B--1. Emp_details(Eid, Ename, Did, Cid, Salary, Experience) Dept_details(Did, Dname) City_details(Cid, Cname)create table Dept_details(Did int primary key, Dname varchar(100))create table City_details(Cid int primary key, Cname varchar(100))create table Emp_details(Eid int primary key, Ename varchar(100), Did int foreign key (Did) references Dept_details(Did), Cid int foreign key (Cid) references City_details(Cid), Salary decimal check(salary<1000000 and salary>1000), Experience decimal check(Experience >3))--Part -C--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience) Dept_info(Did, Dname) City_info(Cid, Cname, Did)) District(Did, Dname, Sid) State(Sid, Sname, Cid) Country(Cid, Cname)create table Dept_info(Did int primary key not null, Dname varchar(100) check(Dname = 'DE'))create table City_info(Cid int primary key, Cname varchar(100) check (Cname = 'rajkot'),Did int foreign key(Did) References District(Did))create table Emp_info(Eid int primary key, Ename varchar(100), Did int foreign key (Did) references Dept_info(Did), Cid int foreign key (Cid) references City_info(Cid), Salary decimal check(salary<1000000 and salary>1000), Experience decimal check(Experience >3))create table Country(Cid int primary key, Cname varchar(100) check(Cname = 'india'))create table State1(Sid int primary key, Sname varchar(100) check(Sname = 'gujarat'),Cid int foreign key(Cid) References Country(Cid))create table District(Did int primary key, Dname varchar(100) check(Dname='rajkot'),Sid int foreign key(Sid) References State1(Sid))--2. Insert 5 records in each table.insert into Emp_info values(1,'yatahrth',1,1,10000,5),(2,'yatahrth',2,2,10000,5),(3,'yatahrth',3,3,10000,5),(4,'yatahrth',4,4,10000,5),(5,'yatahrth',5,5,10000,5)insert into Dept_info values(1,'DE'),(2,'DE'),(3,'DE'),(4,'DE'),(5,'DE')insert into City_info values(1,'rajkot',1),(2,'rajkot',2),(3,'rajkot',3),(4,'rajkot',4),(5,'rajkot',5)insert into District values(1,'rajkot',1),(2,'rajkot',2),(3,'rajkot',3),(4,'rajkot',4),(5,'rajkot',5)insert into State1 values(1,'Gujarat',1),(2,'Gujarat',2),(3,'Gujarat',3),(4,'Gujarat',4),(5,'Gujarat',5)insert into Country values(1,'India'),(2,'India'),(3,'India'),(4,'India'),(5,'India')--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all employees.select e.Ename,d.Dname,e.Salary,e.Experience,c.Cname,d.Dname,s.Sname,co.Cname from Emp_info as e join Dept_info as d on e.Did=d.Did join City_info as c on e.Cid = c.Cid join District as di on c.Did = d.Did join State1 as s on di.Sid=s.Sid join Country as co on s.Sid=co.Cid