--lab>01
--perform basic sql command

--Lab-01
--create table
CREATE TABLE DEPOSIT (
    ACTNO int,
    CNAME varchar(50),
	  BNAME varchar(50),
    AMOUNT decimal(8,2),
    ADATE datetime
);

CREATE TABLE BRANCH (
    BNAME varchar(50),
  	CITY varchar(50)
);

CREATE TABLE CUSTOMERS (
    CNAME varchar(50),
	  CITY varchar(50)
);

CREATE TABLE BORROW (
    LOANNO int,
    CNAME varchar(50),
	  BNAME varchar(50),
    AMOUNT decimal(8,2)
);


--INSERT DATA

--1 DEPOSIT TABLE
INSERT INTO deposit (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES
(101,'ANIL','VRCE',1000,'1995-03-01'),
(102,'SUNIL','AJNI',5000,'1996-01-04'),
(103,'MEHUL','JARBOLBAGH',3500,'1995-11-17'),
(104,'MADHURI','CHANDI',1200,'1995-12-17'),
(105,'PRAMOD','M.G.ROAD',3000,'1996-03-27'),
(106,'SANDIP','ANDHERI',2000,'1996-03-31'),
(107,'SHIVANI','VIRAR',1000,'1995-09-05'),
(108,'KRANTI','NEHRU PLACE',5000,'1995-07-02'),
(109,'MINU','POWAI',7000,'1995-08-10');

--2 BRANCH TABLE
INSERT INTO branch (BNAME,CITY) VALUES
('VRCE','NAGPUR'),
('AJNI','NAGPUR'),
('KARBOLBAGH','DELHI'),
('CHANDI','DELHI'),
('DHARAMPETH','NAGPUR'),
('M.G. ROAD','BANGLORE'),
('ANDHERI','BOMBAY'),
('VIRAR','BOMBAY'),
('NEHRU PLACE','DELHI'),
('POWAI','BOMBAY')

--3 CUSTOMER TABLE
INSERT INTO customers (CNAME,CITY) VALUES
('ANIL','CALCUTTA'),
('SUNIL','DELHI'),
('MEHUL','BARODA'),
('MANDAR','PATNA'),
('PRAMOD','NAGPUR'),
('SANDIP','SURAT'),
('SHIVANI','BOMBAY'),
('KRANTI','BOMBAY'),
('NAREN','BOMBAY')

--4 BORROW TABLE
INSERT INTO borrow (LOANNO,CNAME,BNAME,AMOUNT) VALUES
(201,'anil','vrce',1000),
(206,'mehul','ajni',5000),
(311,'sunil','dharampeth',3000),
(321,'madhuri','andheri',2000),
(375,'pramod','virar',8000),
(481,'kranti','nehru place',3000)


--Select Operation
--Part - A :-

--1. Retrieve all data from table DEPOSIT. 
select * from deposit

--2. Retrieve all data from table BORROW
select * from borrow 

--3. Display Account No, Customer Name & Amount from DEPOSIT.
SELECT ACTNO,CNAME,AMOUNT FROM deposit;

--4. Display Loan No, Amount from BORROW.
SELECT LOANNO,AMOUNT FROM borrow;

--5. Display loan details of all customers who belongs to ‘ANDHERI’ branch from borrow table.
SELECT LOANNO,CNAME,BNAME,AMOUNT FROM borrow WHERE BNAME='ANDHERI';

--6. Give account no and amount of depositor, whose account no is equals to 106 from deposit table. 
SELECT ACTNO,AMOUNT FROM deposit WHERE ACTNO=106;

--7. Give name of borrowers having amount greater than 5000 from borrow table. 
SELECT CNAME FROM borrow WHERE AMOUNT>5000;

--8. Give name of customers who opened account after date '1-12-95' from deposit table. 
SELECT CNAME FROM deposit WHERE ADATE>'1995-12-1';

--9. Display name of customers whose account no is less than 105 from deposit table.
SELECT CNAME FROM deposit WHERE ACTNO<105;

--10. Display name of customer who belongs to either ‘NAGPUR’ or ‘DELHI’ from customer table. (USE OR & IN)
SELECT CNAME FROM customers WHERE CITY = 'DELHI' OR CITY = 'NAGPUR';
SELECT CNAME FROM customers WHERE CITY IN('nagpur','delhi');

--11. Display name of customers with branch whose amount is greater than 4000 and account no is less than 105 from deposit table.
SELECT CNAME FROM deposit WHERE AMOUNT>4000 AND ACTNO<105;

--12. Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000 from borrow table. (USE AND & BETWEEN)
SELECT CNAME FROM borrow WHERE AMOUNT BETWEEN 3000 AND 8000;

--13. Find all depositors who do not belongs to ‘ANDHERI’ branch from deposit table.
SELECT CNAME FROM deposit WHERE BNAME != 'ANDHERI';

--14. Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’ Or ‘M.G. ROAD’ and Account No is less than 104 from deposit table.
SELECT ACTNO, CNAME, AMOUNT FROM deposit WHERE BNAME='AJNI' OR BNAME='KAROLBAGH' OR BNAME='M.G. ROAD' AND ACTNO<104;

--15. Display all loan no, customer from borrow table does not belong to ‘VIRAR’ or ‘AJNI’ branch. (use NOT IN)
SELECT LOANNO,CNAME FROM borrow WHERE BNAME NOT IN('VIRAR','AJNI');

--16. Display all the customer’s name other than ‘MINU’ from deposit table (Use: NOT, <>, !=)
SELECT * FROM customers WHERE CNAME!='MINU';
SELECT * FROM customers WHERE CNAME<>'MINU';
SELECT * FROM customers WHERE NOT CNAME='MINU';

--17. Display customer name from deposit table whose branch name is not available. (NULL)
SELECT CNAME FROM deposit WHERE BNAME=null;

--18. Retrieve all unique branches using DISTINCT. (Use Branch Table)
SELECT DISTINCT BNAME FROM branch;

--19. Retrieve first 50% record from borrow table


--20. Retrieve first five account number from deposit table.



--Part => B

--1. Display all the details of first five customers from deposit table.


--2. Display all the details of first three depositors from deposit table whose amount is greater than 1000.

	
--3. Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to �ANDHERI�
--from borrow table

	
--4. Select all details with account numbers not in the range 105 to 109 in deposit table.
select * from deposit where actno not between 105 and 109

--5. Select all records from BORROW where the amount is greater than 1000 and less than or equal to 7000, and
--the loan number is between 250 and 600

select * from borrow where (amount > 1000 and amount <= 7000)  and (loanno between 250 and  600)

--Part => C

--1. Display all the detail of customer who deposited more than 5000 without using * from deposit table.	
SELECT ACTNO,CNAME,BNAME,AMOUNT,ADATE FROM deposit WHERE AMOUNT>5000;

--2. Retrieve all unique customer names with city. (Use Customer table)
SELECT DISTINCT CNAME,CITY FROM customers;

--3. Retrieve records from the BORROW table where the loan amount is greater than 3000 and the loan number is not a multiple of 3.
SELECT * FROM borrow WHERE AMOUNT>5000 AND (loanno%3!=0);

--4. Retrieve records from the DEPOSIT table where amount is greater than 2000 also account number is between 100 and 110 and date is after '1-MAR-1995' or before '27-MAR-1996'.
SELECT * FROM deposit WHERE (AMOUNT>2000) AND (ACTNO BETWEEN 100 AND 110) AND (ADATE>'1995-3-1' OR ADATE<'1996-3-27');

--5. Retrieve all odd/even value loan number from Borrow table
select * from borrow where loanno % 2 != 0
select * from borrow where loanno % 2 = 0
