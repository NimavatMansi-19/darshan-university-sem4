--Part – A
--1. Write a function to print "hello world".
CREATE OR ALTER FUNCTION FN_MSG()
RETURNS VARCHAR(50)
AS
BEGIN
	RETURN 'HELLO WORLD'
END
SELECT dbo.FN_MSG()

--2. Write a function which returns addition of two numbers.
CREATE OR ALTER FUNCTION FN_ADD(@A INT,@B INT)
RETURNS INT
AS
BEGIN
	RETURN @A+@B
END
SELECT dbo.FN_ADD(3,5)

--3. Write a function to check whether the given number is ODD or EVEN.
CREATE OR ALTER FUNCTION FN_ODD_EVEN(@NUM INT)
RETURNS VARCHAR(50)
AS
BEGIN
	IF @NUM%2=0
		RETURN 'EVEN'
RETURN 'ODD'
END
SELECT dbo.FN_ODD_EVEN(4)

--4. Write a function which returns a table with details of a person whose first name starts with B.
CREATE OR ALTER FUNCTION FN_PERSON_B()
RETURNS TABLE
AS 
RETURN 
(
    SELECT * FROM Person WHERE FirstName LIKE 'B%'
);
SELECT * FROM dbo.FN_PERSON_B()

--5. Write a function which returns a table with unique first names from the person table.
CREATE OR ALTER FUNCTION FN_UNIQUE()
RETURNS TABLE 
AS
RETURN(
	SELECT DISTINCT FIRSTNAME FROM Person
)
SELECT * FROM dbo.FN_UNIQUE()

--6. Write a function to print number from 1 to N. (Using while loop) 
CREATE OR ALTER FUNCTION FN_NUMBER(@NUM INT)
RETURNS @RES TABLE(NUMBER INT)
AS
BEGIN
	DECLARE @I INT=1
	WHILE @I <=@NUM
		BEGIN
			INSERT INTO @RES VALUES (@I)
		SET @I=@I+1
		END
		RETURN
END
SELECT * FROM FN_NUMBER(10)

--7.Write a function to find the factorial of a given integer. 
CREATE OR ALTER FUNCTION FN_FAC(@NUM INT)
RETURNS INT
AS
BEGIN
	IF @NUM=1 OR @NUM=0
		RETURN 1
	
	RETURN @NUM*dbo.FN_FAC(@NUM-1)
END
SELECT dbo.FN_FAC(4)

--Part – B
--8. Write a function to compare two integers and return the comparison result.(Using Case statement) 
--9. Write a function to print the sum of even numbers between 1 to 20.
CREATE OR ALTER FUNCTION FN_SUM_ODD_EVEN()
RETURNS INT
AS
BEGIN
	DECLARE @ANS INT=0
	DECLARE @I INT =1
	WHILE @I<=20
		BEGIN
		IF @I%2=0
			SET @ANS=@ANS+@I
			SET @I=@I+1
		END
		RETURN @ANS
END
SELECT dbo.FN_SUM_ODD_EVEN()


--10. Write a function that checks if a given string is a palindrome
CREATE OR ALTER FUNCTION FN_PALINDROME(@STR VARCHAR(50))
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @TEMP VARCHAR(50)=REVERSE(@STR)
	IF @TEMP=@STR
		RETURN 'PALINDROME'
	RETURN 'NOT PALINDROME'

END
SELECT dbo.FN_PALINDROME('ABBA')

--Part – C 
--11. Write a function to check whether a given number is prime or not. 
CREATE OR ALTER FUNCTION FN_PRIME(@NUM INT)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @I INT =2
	WHILE @I<=(@NUM/2)
		BEGIN
		IF @NUM%@I=0
			RETURN('NOT PRIME')
			BREAK
		SET @I=@I+1
		END
	RETURN ('PRIME')
END
SELECT dbo.FN_PRIME(4)

--12. Write a function which accepts two parameters start date & end date, and returns a difference in days. 
CREATE OR ALTER FUNCTION FN_DIFFDATE(@D1 DATETIME,@D2 DATETIME)
RETURNS INT
AS
BEGIN
	RETURN (SELECT DATEDIFF(DAY,@D1,@D2))
END
SELECT dbo.FN_DIFFDATE('2006-01-19','2025-01-19')

--13. Write a function which accepts two parameters year & month in integer and returns total days each year. 
CREATE OR ALTER FUNCTION FN_COUNTDAYS(@MONTH INT,@YEAR INT)
RETURNS INT
AS
BEGIN
	DECLARE @DATE VARCHAR(50)
	SET @DATE=CONCAT(@YEAR,'-',@MONTH,'-','1')
	DECLARE @DA DATETIME=CAST(@DATE AS DATE)
	RETURN DAY(EOMONTH(@DA))
END 

SELECT dbo.FN_COUNTDAYS(2,2025)
--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons. 
CREATE OR ALTER FUNCTION FN_DEPTID(@DEPTID INT)
RETURNS TABLE
AS
RETURN (SELECT * FROM PERSON WHERE DepartmentID=@DEPTID)
SELECT * FROM dbo.FN_DEPTID(1)
SELECT * FROM Person
--15. Write a function that returns a table with details of all persons who joined after 1-1-1991. 
CREATE OR ALTER FUNCTION FN_PERSONDET()
RETURNS TABLE 
AS
RETURN (SELECT * FROM PERSON WHERE JoiningDate>'1-1-1991')
SELECT * FROM dbo.FN_PERSONDET()