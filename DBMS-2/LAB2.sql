-- Create Department Table
CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Designation Table
CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);

-- Create Person Table
CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);
--Part – A 
--1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.
CREATE OR ALTER PROCEDURE PR_INSPER
@FNAME VARCHAR(50),
@LNAME VARCHAR(50),
@SAL DECIMAL(8, 2),
@JD DATETIME,
@DEPTID INT,
@DESID INT
AS
BEGIN
	INSERT INTO PERSON VALUES (@FNAME,@LNAME,@SAL,@JD,@DEPTID,@DESID)
END

CREATE OR ALTER PROCEDURE PR_UPDPER
@FNAME VARCHAR(50),
@LNAME VARCHAR(50)
AS
BEGIN
	UPDATE PERSON SET
	LastName=@LNAME
	WHERE FirstName=@FNAME	
END


CREATE OR ALTER PROCEDURE PR_DELPER
@FNAME VARCHAR(50)
AS
BEGIN
	DELETE FROM PERSON
	WHERE FirstName=@FNAME
END

CREATE OR ALTER PROCEDURE PR_DELDE 
@DEPNAME VARCHAR(50)
AS
BEGIN
	DELETE FROM Department
	WHERE DepartmentName=@DEPNAME
END


CREATE OR ALTER PROCEDURE PR_INSDE
@DEPID INT,
@DEPNAME VARCHAR(50)
AS
BEGIN
		INSERT INTO Department VALUES (@DEPID,@DEPNAME)
END

CREATE OR ALTER PROCEDURE PR_UPDDE
@DEPID INT,
@DEPNAME VARCHAR(50)
AS
BEGIN
		UPDATE Department SET
		DepartmentName=@DEPNAME
		WHERE DepartmentID=@DEPID
END

CREATE OR ALTER PROCEDURE PR_DELDG 
@DEGNAME VARCHAR(50)
AS
BEGIN
	DELETE FROM Designation
	WHERE DesignationName=@DEGNAME
END

CREATE OR ALTER PROCEDURE PR_INSDG
@DEGID INT,
@DEGNAME VARCHAR(50)
AS
BEGIN
		INSERT INTO Designation VALUES (@DEGID,@DEGNAME)
END

CREATE OR ALTER PROCEDURE PR_UPDDEG
@DEGID INT,
@DEGNAME VARCHAR(50)
AS
BEGIN
		UPDATE Designation SET
		DesignationName=@DEGNAME
		WHERE DesignationID=@DEGID
END

PR_DELDG 'XYZA'
SELECT * FROM Designation

--2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY 
CREATE OR ALTER PROCEDURE PR_SELPER
@PERSONID INT
AS 
BEGIN
SELECT * FROM PERSON 
WHERE PersonID=@PERSONID
END

CREATE OR ALTER PROCEDURE PR_SELDEP
@DEPTID INT
AS 
BEGIN
SELECT * FROM Department 
WHERE DepartmentID=@DEPTID
END

CREATE OR ALTER PROCEDURE PR_SELDG
@DEGID INT
AS 
BEGIN
SELECT * FROM Designation 
WHERE DesignationID=@DEGID
END

PR_SELDG 11

--3. Department, Designation & Person Table’s (If foreign key is available then do write join and take columns on select list) 
CREATE OR ALTER PROCEDURE PR_SELECTALL
--this will repeat dep id and deg id so write particular column
AS
BEGIN
SELECT * FROM PERSON P
LEFT JOIN Department D
ON P.DepartmentID=D.DepartmentID
LEFT JOIN Designation DG
ON P.DesignationID=DG.DesignationID
END

PR_SELECTALL

--4. Create a Procedure that shows details of the first 3 persons.
CREATE OR ALTER PROCEDURE PR_TOP3
AS
BEGIN
 SELECT TOP 3 * FROM Person
 END
 PR_TOP3

--Part – B 
--5. Create a Procedure that takes the department name as input and returns a table with all workers working in that department. 
CREATE OR ALTER PROCEDURE PR_SEL_BY_DEP
@DEPNAME VARCHAR(50)
AS
BEGIN
SELECT * FROM Person
WHERE DepartmentID=(SELECT DepartmentID FROM Department WHERE DepartmentName=@DEPNAME)
END
PR_SEL_BY_DEP 'ADMIN'

--6. Create Procedure that takes department name & designation name as input and returns a table with worker’s 
--first name, salary, joining date & department name.
CREATE OR ALTER PROCEDURE PR_SEL_DEP_DEG
@DEPNAME VARCHAR(50),
@DEGNAME VARCHAR(50)

AS
BEGIN
SELECT P.FirstName,P.Salary,P.JoiningDate,D.DepartmentName FROM PERSON P
 JOIN Department D
ON P.DepartmentID=D.DepartmentID
 JOIN Designation DG
ON P.DesignationID=DG.DesignationID
END
PR_SEL_DEP_DEG 'ADMIN','CEO'

--7. Create a Procedure that takes the first name as an input parameter and display all
--the details of the worker with their department & designation name.
CREATE OR ALTER PROCEDURE PR_SEL_NAME
@FNAME VARCHAR(50)

AS
BEGIN
SELECT P.PersonID,P.FirstName,P.LastName,P.Salary,P.JoiningDate,D.DepartmentName,DG.DesignationName FROM PERSON P
 JOIN Department D
ON P.DepartmentID=D.DepartmentID
 JOIN Designation DG
ON P.DesignationID=DG.DesignationID
WHERE P.FirstName=@FNAME
END
 PR_SEL_NAME 'BHOOMI'
--8. Create Procedure which displays department wise maximum, minimum & total salaries.
CREATE OR ALTER PROCEDURE PR_SEL_MAX_MIN_SUM
AS
BEGIN
SELECT D.DEPARTMENTNAME, MAX(P.SALARY) AS MAXIMUM,MIN(P.SALARY) AS MINIMUM,SUM(P.SALARY)AS TOTAL FROM PERSON P
 JOIN Department D
ON P.DepartmentID=D.DepartmentID
GROUP BY D.DepartmentName
END
PR_SEL_MAX_MIN_SUM
--9. Create Procedure which displays designation wise average & total salaries.
CREATE OR ALTER PROCEDURE PR_SUM_AVG
AS
BEGIN
SELECT DG.DesignationName,AVG(P.SALARY) AS AVERAGE,SUM(P.SALARY)AS TOTAL FROM PERSON P
JOIN Designation DG
ON P.DesignationID=DG.DesignationID
GROUP BY DG.DesignationName
END
PR_SUM_AVG

--Part – C 
--10. Create Procedure that Accepts Department Name and Returns Person Count.
CREATE OR ALTER PROCEDURE PR_SEL_BY_NAME_PERCOUNT
@DEPNAME VARCHAR(50)
AS
BEGIN
SELECT D.DEPARTMENTNAME,COUNT(P.PersonID) AS TOTAL FROM PERSON P
 JOIN Department D
ON P.DepartmentID=D.DepartmentID
WHERE D.DepartmentName=@DEPNAME
GROUP BY D.DepartmentName
END
PR_SEL_BY_NAME_PERCOUNT 'ADMIN'

--11. Create a procedure that takes a salary value as input and returns all workers 
--with a salary greater than input salary value along with their department and 
--designation details.
CREATE OR ALTER PROCEDURE PR_SEL_BY_GREASAL
@SAL INT
AS
BEGIN
SELECT P.PersonID,P.FirstName,P.LastName,P.Salary,P.JoiningDate,D.DepartmentName,DG.DesignationName FROM PERSON P
 JOIN Department D
ON P.DepartmentID=D.DepartmentID
 JOIN Designation DG
ON P.DesignationID=DG.DesignationID
WHERE P.Salary>@SAL
END

PR_SEL_BY_GREASAL 25000

--12. Create a procedure to find the department(s) with the highest total salary among all departments. 
CREATE OR ALTER PROCEDURE PR_SEL_HIGHESTSAL
AS
BEGIN
SELECT D.DepartmentName,SUM(P.SALARY) FROM PERSON P
 JOIN Department D
ON P.DepartmentID=D.DepartmentID
 JOIN Designation DG
ON P.DesignationID=DG.DesignationID
GROUP BY D.DepartmentName
HAVING SUM(P.SALARY) = (
            SELECT MAX(TotalSalary)
            FROM (
                SELECT 
                    SUM(P1.SALARY) AS TotalSalary
                FROM 
                    PERSON P1
                JOIN 
                    Department D1 ON P1.DepartmentID = D1.DepartmentID
                GROUP BY 
                    D1.DepartmentName
            ) AS DeptSalaries
        );
END
PR_SEL_HIGHESTSAL

--13. Create a procedure that takes a designation name as input and returns a list of all 
--workers under that designation who joined within the last 10 years, along with their department.
CREATE OR ALTER PROCEDURE PR_GET_BY_DESIG
@DESIGNAME VARCHAR(50)
AS
BEGIN
SELECT P.FirstName,DG.DesignationName,D.DepartmentName FROM PERSON P
 JOIN Department D
ON P.DepartmentID=D.DepartmentID
 JOIN Designation DG
ON P.DesignationID=DG.DesignationID
WHERE DG.DesignationName=@DESIGNAME
AND DATEDIFF(YY,P.JoiningDate,GETDATE())=10
END
PR_GET_BY_DESIG 'CLERK'

--14. Create a procedure to list the number of workers in each department who do not have a designation assigned.
CREATE OR ALTER PROCEDURE PR_NO_DESIG
AS
BEGIN
SELECT D.DepartmentName,COUNT(P.PersonID) FROM PERSON P
 LEFT JOIN Department D
ON P.DepartmentID=D.DepartmentID
WHERE P.DesignationID IS NULL
GROUP BY D.DepartmentName
END 
PR_NO_DESIG
--15. Create a procedure to retrieve the details of workers in departments where the average salary is above 12000. 
CREATE OR ALTER PROCEDURE PR_AVGSALARY
AS 
BEGIN
SELECT * FROM PERSON WHERE DepartmentID IN(
	SELECT DepartmentID FROM Person
	GROUP BY DepartmentID
	HAVING AVG(SALARY)>12000)
END
 PR_AVGSALARY
 