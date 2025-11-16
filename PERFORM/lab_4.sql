create table EMP (
 EID int,
 EName varchar(50),
 Department varchar(50),
 Salary int,
 JoiningDate varchar(50),
 City varchar(50),
 Gender varchar(50)
 );

insert into EMP (EID,EName,Department,Salary,JoiningDate,City,Gender) values 
(101,'Rahul','Admin',56000,'1-Jan-90','Rajkot','Male'),
(102,'Hardik','IT',18000,'25-Sep-90','Ahmedabad','Male'),
(103,'Bhavin','HR',25000,'14-May-91','Baroda','Male'),
(104,'Bhoomi','Admin',39000,'8-Feb-91','Rajkot','Female'),
(105,'Rohit','IT',17000,'23-Jul-90','Jamnagar','Male'),
(106,'Priya','IT',9000,'18-Oct-90','Ahmedabad','Female'),
(107,'Bhoomi','HR',34000,'25-Dec-91','Rajkot','Female');

select *from EMP

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
select MAX(Salary) as Maximum,MIN(Salary) as Minimun from EMP 

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively.
select SUM(Salary) as Total_Sal,AVG(Salary) as Average_Sal from EMP 

--3. Find total number of employees of EMPLOYEE table. 
SELECT COUNT(EID) AS TOTAL_EMPLOYEE FROM EMP

--4. Find highest salary from Rajkot city. 
SELECT MAX(SALARY) AS HIGHEST_RAJKOT FROM EMP WHERE City='Rajkot'

--5. Give maximum salary from IT department. 
SELECT MAX(SALARY) AS HIGHEST_IT FROM EMP WHERE Department='IT'

--6. Count employee whose joining date is after 8-feb-91. 
SELECT * FROM EMP
SELECT COUNT(EID) FROM EMP WHERE JoiningDate > '23-Jul-90'

--7.Display average salary of Admin department. 
SELECT AVG(Salary) AS AVG_SAL_ADMIN FROM EMP WHERE Department='Admin'

--8. Display total salary of HR department. 
SELECT sum(Salary) AS TOTAL_SAL_HR FROM EMP WHERE Department='HR'

--9. Count total number of cities of employee without duplication. 
SELECT City,COUNT(City) FROM EMP GROUP BY City

--10.Count unique departments. 
SELECT Department,COUNT(Department) FROM EMP GROUP BY Department

--11. Give minimum salary of employee who belongs to Ahmedabad. 
SELECT MIN(Salary) FROM EMP WHERE City='Ahmedabad'

--12. Find city wise highest salary. 
SELECT City,MAX(Salary) AS SALARY FROM EMP GROUP BY City

--13. Find city wise highest salary. 
SELECT Department,MIN(Salary) AS SALARY FROM EMP GROUP BY Department

--14.Display city with the total number of employees belonging to each city. 
SELECT City,COUNT(*) AS NO_OF_EMPLOYEES FROM EMP GROUP BY City

--15.Give total salary of each department of EMP table.
SELECT Department, SUM(Salary) AS TOTAL_SALARY FROM EMP GROUP BY Department

--16. Give average salary of each department of EMP table without displaying the respective department name. 
--SELECT Department, AVG(Salary) AS AVG_SALARY FROM EMP GROUP BY Department
SELECT  AVG(Salary) AS AVG_SALARY FROM EMP GROUP BY Department

--17. Count the number of employees for each department in every city.
SELECT Department,City,COUNT(*) AS NO_OF_EMPLOYEES FROM EMP GROUP BY Department,City

--18. Calculate the total salary distributed to male and female employees.
SELECT Gender,sum(Salary) AS Total_Salary FROM EMP GROUP BY Gender

--19.Give city wise maximum and minimum salary of female employees. 
SELECT City,MAX(Salary) AS MAX_Salary,MIN(Salary) AS MIN_Salary FROM EMP WHERE Gender='Female'GROUP BY City

--20.Calculate department, city, and gender wise average salary. 
SELECT Department, City, Gender, AVG(Salary) AS AVG_SALARY FROM EMP GROUP BY Department, City, Gender

--PART B 
--1.Count the number of employees living in Rajkot. 
SELECT COUNT(*) AS IN_RAJKOT FROM EMP WHERE City='Rajkot'

--2.Display the difference between the highest and lowest salaries. Label the column DIFFERENCE. 
SELECT (MAX(Salary)-MIN(Salary)) AS DIFFERENCE FROM EMP 

--3.Display the total number of employees hired before 1st January, 1991. 
SELECT COUNT(*) FROM EMP WHERE JoiningDate > '1-jan-91'

--PART C
--1. Count the number of employees living in Rajkot or Baroda.
SELECT COUNT(*) FROM EMP WHERE City in ('Rajkot','Baroda')

--2. Display the total number of employees hired before 1st January, 1991 in IT department. 
SELECT COUNT(*) FROM EMP WHERE JoiningDate > '1-jan-91' and Department='IT'

--3.Find the Joining Date wise Total Salaries. 
SELECT JoiningDate,SUM(Salary) FROM EMP GROUP BY JoiningDate

--4.Find the Maximum salary department & city wise in which city name starts with ‘R’.
SELECT Department,City,MAX(Salary) AS SALARY FROM EMP WHERE City LIKE 'R%' GROUP BY Department,City

