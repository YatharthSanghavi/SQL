-- Part–>A
-- 1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.
-- Department INSERT

CREATE PROCEDURE PR_Department_Insert
 @DepartmentID INT,
 @DepartmentName VARCHAR(100)
AS
BEGIN
 INSERT INTO Department (DepartmentID, DepartmentName)
 VALUES (@DepartmentID, @DepartmentName);
END;

-- Department UPDATE

CREATE PROCEDURE PR_Department_Update
@DepartmentID INT,
 @DepartmentName VARCHAR(100)
AS
BEGIN
 UPDATE Department
 SET DepartmentName = @DepartmentName
 WHERE DepartmentID = @DepartmentID;
END;

-- Department DELETE Procedure

CREATE PROCEDURE PR_Department_Delete
 @DepartmentID INT
AS
BEGIN
 DELETE FROM Department
 WHERE DepartmentID = @DepartmentID;
END

-- Designation INSERT

CREATE PROCEDURE PR_Designation_Insert
 @DesignationID INT,
 @DesignationName VARCHAR(100)
AS
BEGIN
 INSERT INTO Designation (DesignationID, DesignationName)
 VALUES (@DesignationID, @DesignationName);
END

-- Designation UPDATE

CREATE PROCEDURE PR_Designation_Update
 @DesignationID INT,
 @DesignationName VARCHAR(100)
AS
BEGIN
 UPDATE Designation
 SET DesignationName = @DesignationName
 WHERE DesignationID = @DesignationID;
END

-- Designation DELETE

CREATE PROCEDURE PR_Designation_Delete
 @DesignationID INT
AS
BEGIN
 DELETE FROM Designation
 WHERE DesignationID = @DesignationID;
END

-- Person INSERT

CREATE PROCEDURE PR_Person_Insert
 @FirstName VARCHAR(100),
 @LastName VARCHAR(100), 
 @Salary DECIMAL(8, 2),
 @JoiningDate DATETIME,
 @DepartmentID INT = NULL,
 @DesignationID INT = NULL
AS
BEGIN
 INSERT INTO Person (FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID)
 VALUES (@FirstName, @LastName, @Salary, @JoiningDate, @DepartmentID, @DesignationID);
END

-- Person UPDATE

CREATE PROCEDURE PR_Person_Update
 @PersonID INT,
 @FirstName VARCHAR(100),
 @LastName VARCHAR(100),
 @Salary DECIMAL(8, 2),
 @JoiningDate DATETIME,
 @DepartmentID INT = NULL,
 @DesignationID INT = NULL
AS
BEGIN
 UPDATE Person
 SET FirstName = @FirstName, LastName = @LastName, Salary = @Salary, JoiningDate =
@JoiningDate,
 DepartmentID = @DepartmentID, DesignationID = @DesignationID
 WHERE PersonID = @PersonID;
END;

-- Person DELETE
CREATE PROCEDURE PR_Person_Delete
 @PersonID INT
AS
BEGIN
 DELETE FROM Person
 WHERE PersonID = @PersonID;
END

-- 2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY

-- Department SELECTBYPRIMARYKEY

CREATE PROCEDURE PR_Department_SelectByPrimaryKey
 @DepartmentID INT
AS
BEGIN
 SELECT * FROM Department
 WHERE DepartmentID = @DepartmentID;
END

-- Designation SELECTBYPRIMARYKEY

CREATE PROCEDURE PR_Designation_SelectByPrimaryKey 
 @DesignationID INT
AS
BEGIN
 SELECT * FROM Designation
 WHERE DesignationID = @DesignationID;
END

-- Person SELECTBYPRIMARYKEY

CREATE PROCEDURE PR_Person_SelectByPrimaryKey
 @PersonID INT
AS
BEGIN
 SELECT P.*, D.DepartmentName, G.DesignationName
 FROM Person P
 LEFT JOIN Department D ON P.DepartmentID = D.DepartmentID
 LEFT JOIN Designation G ON P.DesignationID = G.DesignationID
 WHERE P.PersonID = @PersonID;
END

3. Department, Designation & Person Table’s (If foreign key is available then do write join and take
columns on select list)

-- Department SelectAllWithDetails

CREATE PROCEDURE PR_Department_SelectAllWithDetails
AS
BEGIN
 SELECT * FROM Department
END

-- Designation SelectAllWithDetails

CREATE PROCEDURE PR_Designation_SelectAllWithDetails
AS
BEGIN
 SELECT * FROM Designation
END

-- Person SelectAllWithDetails

CREATE PROCEDURE PR_Person_SelectAllWithDetails
AS
BEGIN
 SELECT P.PersonID, P.FirstName, P.LastName, P.Salary, P.JoiningDate, D.DepartmentName,
G.DesignationName
 FROM Person P
 LEFT JOIN Department D ON P.DepartmentID = D.DepartmentID
 LEFT JOIN Designation G ON P.DesignationID = G.DesignationID;
END

-- 4. Create a Procedure that shows details of the first 3 persons.

CREATE PROCEDURE PR_Person_ShowFirstThree 
AS
BEGIN
 SELECT TOP 3 * FROM Person;
END