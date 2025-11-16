CREATE TABLE DEPT (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);

INSERT INTO DEPT (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block');

CREATE TABLE PERSON (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT NULL,
    Salary DECIMAL(8,2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    City VARCHAR(100) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES DEPT(DepartmentID)
);

INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES
(101, 'Rahul Tripathi', 2, 56000.00, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000.00, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000.00, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000.00, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000.00, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000.00, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000.00, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000.00, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500.00, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000.00, '2000-05-25', 'Jamnagar');

--Part->A

--1.Combine information from Person and Department table using cross join or Cartesian product.
select * from PERSON, DEPT;

--2. Find all persons with their department name
select p.PersonName,d.DepartmentName from PERSON as p full outer join DEPT as d on p.DepartmentID=d.DepartmentID;

--3. Find all persons with their department name & code.
select p.PersonName,d.DepartmentName,d.DepartmentCode from PERSON as p full outer join DEPT as d on p.DepartmentID=d.DepartmentID;

--4. Find all persons with their department code and location.
select p.PersonName,d.DepartmentCode,d.Location from PERSON as p full outer join DEPT as d on p.DepartmentID=d.DepartmentID;

--5. Find the detail of the person who belongs to Mechanical department
select p.PersonName,p.DepartmentID,p.Salary,p.JoiningDate,p.city,d.DepartmentName from PERSON as p inner join DEPT as d on p.DepartmentID=d.DepartmentID where d.DepartmentName='Mechanical';

--6. Final person’s name, department code and salary who lives in Ahmedabad city. 
select p.PersonName,d.DepartmentCode,p.Salary from PERSON as p  inner join DEPT as d on p.DepartmentID=d.DepartmentID where p.City='Ahmedabad';

--7. Find the person's name whose department is in C-Block.
select p.PersonName from PERSON as p inner join DEPT as d on p.DepartmentID=d.DepartmentID where d.Location='C-Block';

--8. Retrieve person name, salary & department name who belongs to Jamnagar city.
select p.PersonName,p.Salary,d.DepartmentName from PERSON as p inner join DEPT as d on p.DepartmentID=d.DepartmentID where p.City='Jamnagar';

--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001.
select p.PersonName,p.Salary,p.JoiningDate,d.DepartmentName from PERSON as p full outer join DEPT as d on p.DepartmentID=d.DepartmentID where d.DepartmentName='Civil' and p.JoiningDate>1-10-2001;

--10. Display all the person's name with the department whose joining date difference with the current date is more than 365 days.
select p.PersonName,p.Salary,p.JoiningDate,d.DepartmentName from PERSON as p full outer join DEPT as d on p.DepartmentID=d.DepartmentID where DATEDIFF(day,p.JoiningDate,GETDATE())>365;

--11. Find department wise person counts.
select DepartmentID,COUNT(PersonID) as total from PERSON Group By DepartmentID order by total;

--12. Give department wise maximum & minimum salary with department name.
select d.DepartmentName,COUNT(p.PersonID) as total ,MAX(p.Salary) as maxsal,MIN(p.salary) as minsal from PERSON as p inner join DEPT as d on p.DepartmentID=d.DepartmentID Group By d.DepartmentName order by total;
 
--13. Find city wise total, average, maximum and minimum salary.
select p.City as city,MAX(p.Salary) as maxsal,MIN(p.salary) as minsal, SUM(p.Salary) as sumsal, AVG(p.Salary) as avgsal from PERSON as p group by City order by city;

--14. Find the average salary of a person who belongs to Ahmedabad city.
select p.City as city, AVG(p.Salary) as avgsal from PERSON as p where p.City ='Ahmedabad' group by City order by city;