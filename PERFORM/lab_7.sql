use [MCA_153]

CREATE TABLE STU_INFO (
    Rno INT,
    Name VARCHAR(50),
    Branch VARCHAR(10)
);

INSERT INTO STU_INFO (Rno, Name, Branch) VALUES
(101, 'Raju', 'CE'),
(102, 'Amit', 'CE'),
(103, 'Sanjay', 'ME'),
(104, 'Neha', 'EC'),
(105, 'Meera', 'EE'),
(106, 'Mahesh', 'ME');

CREATE TABLE RESULT (
    Rno INT,
    SPI DECIMAL(3,1)
);

INSERT INTO RESULT (Rno, SPI) VALUES
(101, 8.8),
(102, 9.2),
(103, 7.6),
(104, 8.2),
(105, 7.0),
(107, 8.9);

CREATE TABLE EMPLOYEE_MASTER (
    EmployeeNo VARCHAR(5),
    Name VARCHAR(50),
    ManagerNo VARCHAR(5)
    
);

INSERT INTO EMPLOYEE_MASTER (EmployeeNo, Name, ManagerNo) VALUES
('E01', 'Tarun', NULL),
('E02', 'Rohan', 'E02'),  
('E03', 'Priya', 'E01'),
('E04', 'Milan', 'E03'),
('E05', 'Jay', 'E01'),
('E06', 'Anjana', 'E04');

--PART->A
--1. Combine information from student and result table using cross join or Cartesian product.
SELECT * FROM STU_INFO CROSS JOIN RESULT;

--2. Perform inner join on Student and Result tables.
SELECT * FROM STU_INFO S INNER JOIN RESULT R ON R.Rno =S.Rno;

--3. Perform the left outer join on Student and Result tables.
SELECT * FROM STU_INFO S LEFT OUTER JOIN RESULT R ON S.Rno = R.Rno;

--4. Perform the right outer join on Student and Result tables.
SELECT * FROM STU_INFO S RIGHT OUTER JOIN RESULT R ON S.Rno = R.Rno;

--5. Perform the full outer join on Student and Result tables. 
SELECT * FROM STU_INFO S FULL OUTER JOIN RESULT R ON S.Rno = R.Rno;

--6. Display Rno, Name, Branch and SPI of all students.
SELECT S.Rno , S.NAME, S.Branch , R.SPI FROM STU_INFO S full outer JOIN RESULT R ON S.Rno = r.Rno;

--7. Display Rno, Name, Branch and SPI of CE branch’s student only.
SELECT S.Rno , S.NAME, S.Branch , R.SPI FROM STU_INFO S full outer JOIN RESULT R ON S.Rno = r.Rno WHERE S.Branch='CE';

--8 Display Rno, Name, Branch and SPI of other than EC branch’s student only.SELECT S.Rno , S.NAME, S.Branch , R.SPI FROM STU_INFO S full outer JOIN RESULT R ON S.Rno = r.Rno WHERE S.Branch!='CE';--9. Display average result of each branch.SELECT S.Branch , AVG(R.SPI) FROM STU_INFO S full outer JOIN RESULT R ON S.Rno = r.Rno GROUP BY S.Branch;--10. Display average result of CE and ME branch.SELECT S.Branch , AVG(R.SPI) FROM STU_INFO S full outer JOIN RESULT R ON S.Rno = r.Rno WHERE S.Branch ='CE' OR S.Branch='ME' GROUP BY S.Branch;--11.Display Maximum and Minimum SPI of each branch.SELECT S.Branch , MAX(R.SPI) AS MAX_SPI, MIN(R.SPI) AS MIN_SPI FROM STU_INFO S full outer JOIN RESULT R ON S.Rno = r.Rno GROUP BY S.Branch;--12. Display branch wise student’s count in descending order.SELECT S.Branch , COUNT(S.Rno) AS COUNT_1 FROM STU_INFO S GROUP BY S.Branch ORDER BY COUNT_1 DESC;--PART->B--1. Display average result of each branch and sort them in ascending order by SPI.SELECT S.Branch , AVG(R.SPI) AS AVG_1 FROM STU_INFO S full outer JOIN RESULT R ON S.Rno = r.Rno GROUP BY S.Branch ORDER BY AVG_1 ASC;--2. Display highest SPI from each branch and sort them in descending order.SELECT S.Branch , MAX(R.SPI) AS MAX_1 FROM STU_INFO S full outer JOIN RESULT R ON S.Rno = r.Rno GROUP BY S.Branch ORDER BY MAX_1 DESC;--PART->C--1. Retrieve the names of employee along with their manager’s name from the Employee table.SELECT E.EMPLOYEENO , E.ManagerNo FROM EMPLOYEE_MASTER E INNER JOIN EMPLOYEE_MASTER M ON E.ManagerNo=M.EmployeeNo;SELECT E.Name , M.Name FROM EMPLOYEE_MASTER E INNER JOIN EMPLOYEE_MASTER M ON E.ManagerNo=M.EmployeeNo;