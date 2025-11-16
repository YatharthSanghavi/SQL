-- Part->A:

-- 1. Display details of students who are from computer department.

SELECT * FROM Stu_Data WHERE DID = ( SELECT DID FROM Department WHERE DNAME = 'COMPUTER')

-- 2. Displays name of students whose SPI is more than 8.

SELECT NAME FROM Stu_Data WHERE RNO IN ( SELECT RNO FROM Academic WHERE SPI > 8)

-- 3. Display details of students of computer department who belongs to Rajkot city.

SELECT * FROM Stu_Data WHERE CITY = 'RAJKOT' AND DID = ( SELECT DID FROM Department WHERE DNAME = 'COMPUTER')

-- 4. Find total number of students of electrical department.

SELECT COUNT(RNO) FROM Stu_Data WHERE DID = ( SELECT DID FROM Department WHERE DNAME = 'ELECTRICAL' )

-- 5. Display name of student who is having maximum SPI.

SELECT NAME FROM Stu_Data WHERE RNO = ( SELECT RNO FROM Academic WHERE SPI = ( SELECT MAX(SPI) FROM Academic))

-- 6. Display details of students having more than 1 backlog.

SELECT * FROM Stu_Data WHERE RNO IN ( SELECT RNO FROM Academic WHERE BKLOG > 1)

--Part–>B:
-- 1. Display name of students who are either from computer department or from mechanical department.

SELECT NAME FROM Stu_Data WHERE DID IN ( SELECT DID FROM Department WHERE DNAME IN ('COMPUTER','MECHANICAL'))

-- 2. Display name of students who are in same department as 102 studying in.
SELECT NAME FROM Stu_Data WHERE DID IN ( SELECT DID FROM Stu_Data WHERE RNO = 102)
