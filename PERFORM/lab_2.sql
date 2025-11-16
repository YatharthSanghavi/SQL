--LAB => 2
--Perform SQL queries for UPDATE, ALTER, Rename, Delete, Truncate, Drop


--Part - A

--1. UPDATE deposit AMOUNT of all customers from 3000 to 5000. (Use Deposit TABLE)

UPDATE deposit SET AMOUNT=5000.00 WHERE AMOUNT = 3000.00

--2. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow TABLE) 
UPDATE borrow SET BNAME='c.g.road' WHERE CNAME='anil'

--3. UPDATE Account No of SANDIP to 111 & AMOUNT to 5000. (Use Deposit TABLE)
UPDATE deposit SET ACTNO=111 , AMOUNT=5000.00 WHERE CNAME='sandip'

--4. UPDATE AMOUNT of KRANTI to 7000. (Use Deposit TABLE)
UPDATE deposit SET AMOUNT=7000 WHERE CNAME='kranti'

--5. UPDATE branch name from ANDHERI to ANDHERI WEST. (Use Branch TABLE)
UPDATE branch SET BNAME='andheri west' WHERE BNAME='andheri'

--6. UPDATE branch name of MEHUL to NEHRU PALACE. (Use Deposit TABLE)
UPDATE deposit SET BNAME='nehru palace' WHERE CNAME='mehul'

--7. UPDATE deposit AMOUNT of all depositors to 5000 whose account no between 103 & 107. (Use Deposit TABLE)
UPDATE deposit SET AMOUNT = 5000.00 WHERE ACTNO between 103 and 107

--8. UPDATE ADATE of ANIL to 1-4-95. (Use Deposit TABLE)
UPDATE deposit SET adate='1995-04-01' WHERE CNAME='anil';

--9. UPDATE the AMOUNT of MINU to 10000. (Use Deposit TABLE)
UPDATE deposit SET AMOUNT=10000.00 WHERE CNAME='minu';

--10. UPDATE deposit AMOUNT of PRAMOD to 5000 and ADATE to 1-4-96 (Use Deposit TABLE)
UPDATE deposit SET AMOUNT=5000.00 , adate='1996-04-01' WHERE CNAME='pramod'

--Part => B

--1. Give 10% Increment in Loan AMOUNT. (Use Borrow TABLE)
UPDATE borrow SET AMOUNT=(AMOUNT+(AMOUNT*10/100))

--2. Customer deposits ADDitional 20% AMOUNT to their account, UPDATE the same. (Use Deposit TABLE)
UPDATE deposit SET AMOUNT=(AMOUNT+(AMOUNT*20/100))

--3. Increase AMOUNT by 1000 in all the account. (Use Deposit TABLE)
UPDATE deposit SET AMOUNT=(AMOUNT+1000) 

--4. UPDATE the BORROW TABLE to SET the AMOUNT to 7000 and the branch name to 'CENTRAL' WHERE the customer name is MEHUL and the loan number is even.
UPDATE borrow SET AMOUNT=7000 , BNAME='central' WHERE CNAME='mehul' and (loanno%2 = 0)

--5. UPDATE the DEPOSIT TABLE to SET the date to '2022-05-15' and the AMOUNT to 2500 for all accounts in VRCE and with an account number less than 105.
UPDATE deposit SET adate='2022-05-15' , AMOUNT=2500.00 WHERE ACTNO < 105 and BNAME='vrce'

--Part => C

--1. Update amount of loan no 321 to NULL. (Use Borrow TABLE)
update borrow set amount=null where loanno=321;

--2. Update branch name of KRANTI to NULL (Use Borrow TABLE)
update borrow set bname=null where cname='kranti' 

--3. Display the name of borrowers whose Loan number is NULL. (Use Borrow TABLE)
select * from borrow where loanno is null

--4. Display the Borrowers whose having branch. (Use Borrow TABLE)
select * from borrow where bname is not null

--5. Update the Loan Amount to 5000, Branch to VRCE & Customer Name to Darshan whose loan no is 481. (Use Borrow TABLE)
update borrow set amount=5000.00 , bname='vrce' , cname='darshan' where loanno=481

--6. Update the Deposit TABLE and set the date to 01-01-2021 for all the depositor whose amount is less than 2000.
update deposit set adate='2021-01-01' where amount < 2000

--7. Update the Deposit TABLE and set the date to NULL & Branch name to ANDHERI whose Account No is 110.
update deposit set adate=null , bname='andheri'where actno=110 


--ALTER, Rename Operation

--Part => A
--1. ADD two more COLUMNs City VARCHAR (20) and Pincode INT
ALTER TABLE deposit ADD city varchar(20) , pincode int;

--2. ADD COLUMN state VARCHAR(20).
ALTER TABLE deposit ADD state varchar(20);

--3. Change the size of CNAME COLUMN from VARCHAR (50) to VARCHAR (35).
ALTER TABLE deposit MODIFY COLUMN cname varchar(35);

--4. Change the data type DECIMAL to INT in amount COLUMN.
ALTER TABLE deposit MODIFY COLUMN amount int;

--5. Delete COLUMN City from the DEPOSIT TABLE.
ALTER TABLE deposit drop COLUMN city;

--6. Rename COLUMN ActNo to ANO.
ALTER TABLE deposit RENAME COLUMN ACTNO TO ANO;

--7. Change name of TABLE DEPOSIT to DEPOSIT_DETAIL
RENAME TABLE DEPOSIT TO DEPOSIT_DETAIL;


--Part => B

--1.Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.
ALTER TABLE deposit_detail CHANGE COLUMN ADATE AOPENDATE DATETIME;

--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table.
ALTER TABLE deposit_detail DROP COLUMN AOPENDATE;

--3. Rename Column CNAME to CustomerName.
ALTER TABLE deposit_detail CHANGE COLUMN CNAME CUSTOMERNAME VARCHAR(25);

--4. Add Column country.
ALTER TABLE deposit_detail ADD COLUMN COUNTRY VARCHAR(25);


--Part => C

--CREATE TABLE
CREATE TABLE student_detail(
 enrollment_No varchar(20),
 name varchar(25),
 cpi decimal(5,2),
 birthdate datetime
)

--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null).
ALTER TABLE student_detail ADD COLUMN CITY VARCHAR (20) NOT NULL, ADD COLUMN Backlog INT null;

--2.Add column department VARCHAR (20) Not Null.
ALTER TABLE student_detail ADD COLUMN department VARCHAR (20) NOT NULL;

--3. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).
ALTER TABLE student_detail MODIFY COLUMN name VARCHAR(35);

--4. Change the data type DECIMAL to INT in CPI Column.
ALTER TABLE student_detail MODIFY COLUMN cpi int;

--5.Delete Column City from the student_detail table.
ALTER TABLE student_detail DROP COLUMN CITY;

--6. Rename Column Enrollment_No to ENO.
ALTER TABLE student_detail CHANGE COLUMN Enrollment_No ENO VARCHAR (20);

--7. Change name of table student_detail to STUDENT_MASTER.
RENAME TABLE student_detail TO STUDENT_MASTER;


--DELETE, Truncate, Drop Operation
--Part => A (Use Deposit_Detail table)

--1. Delete all the records of DEPOSIT_DETAIL table having amount less than and equals to 4000. 
DELETE FROM deposit_detail WHERE AMOUNT<=4000;

--2. Delete all the accounts CHANDI BRANCH.
DELETE FROM deposit_detail WHERE BNAME='CHANDI';

--3. Delete all the accounts having account number (ANO) is greater than 102 and less than 105.
delete from deposit_detail where ano >102 and ano < 105

--4. Delete all the accounts whose branch is ‘AJNI’ or ‘POWAI’
delete from deposit_detail where BNAME='AJNI' OR BNAME='POWAI';

--5. Delete all the accounts whose account number is NULL
DELETE FROM deposit_detail WHERE ANO=NULL;

--6. Delete all the remaining records using Delete command.
delete from deposit_detail;

--7. Delete all the records of Deposit_Detail table. (Use Truncate)
truncate table deposit_detail;

--8. Remove Deposit_Detail table. (Use Drop)
drop table deposit_detail;


--Part => B
create table employee_master
(
 empno int,
 empname varchar(25),
 joinngdate datetime,
 salary decimal(8,2),
 city varchar(20)
)

insert into employee_master values
(101,'keyur','2002-01-05',12000.00,'rajkot'),
(102,'hardik','2004-02-15',14000.00,'ahmedabad'),
(103,'kajal','2006-03-14',15000.00,'baroda'),
(104,'bhoomi','2005-06-23',12500.00,'ahmedabad'),
(105,'harmit','2004-02-15',14000.00,'rajkot'),
(106,'mitesh','2001-09-25',5000.00,'jamnagar'),
(107,'meera',null,7000.00,'morbi'),
(108,'krishn','2003-02-06',10000.00,null)

--1. Delete all the records of Employee_MASTER table having salary greater than and equals to 14000. 
delete employee_master where salary >= 14000

--2. Delete all the Employees who belongs to �RAJKOT� city.
delete employee_master where city='rajkot'

--3. Delete all the Employees who joined after 1-1-2007.
delete employee_master where joinngdate>'2007-01-01'

--4. Delete the records of Employees whose joining date is null and Name is not null.
delete employee_master where joinngdate is null and empname is not null

--5. Delete the records of Employees whose salary is 50% of 20000.
delete employee_master where salary=((20000*50)/100)
delete employee_master where salary= 20000 * 0.5

--6. Delete the records of Employees whose City Name is not empty.
delete employee_master where city is not null

--7. Delete all the records of Employee_MASTER table. (Use Truncate)
truncate table employee_master

--8. Remove Employee_MASTER table. (Use Drop)
drop table employee_master
