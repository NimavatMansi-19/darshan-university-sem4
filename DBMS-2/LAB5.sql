--Part – A 
--1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display
--a message “Record is Affected.”  
CREATE OR ALTER TRIGGER TR_INSERT
ON PERSONINFO
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
	PRINT 'RECORD IS AFFECTED'
END
INSERT INTO PERSONINFO VALUES(11,'Darshi',25000,'2023-12-3','MORBI',15,'2006-01-19')
UPDATE PERSONINFO SET PERSONNAME='NIMAVAT MANSI' WHERE PERSONID=1
DELETE FROM PERSONINFO WHERE PERSONID=1
select * from PersonInfo
drop trigger TR_Insert

--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, 
--log all operations performed on the person table into PersonLog.
CREATE OR ALTER  TRIGGER TR_INSERT
ON PERSONINFO
AFTER INSERT
AS
BEGIN
	insert into personlog (personid,personname,operation,updatedate)
	values((select personid from inserted),(select PersonName from inserted),'insert',getdate())
END
CREATE OR ALTER  TRIGGER TR_update
ON PERSONINFO
AFTER update
AS
BEGIN
	insert into personlog (personid,personname,operation,updatedate)
	values((select personid from inserted),(select PersonName from inserted),'update',getdate())
END
CREATE OR ALTER  TRIGGER TR_delete
ON PERSONINFO
AFTER delete
AS
BEGIN
	insert into personlog (personid,personname,operation,updatedate)
	values((select personid from deleted),(select PersonName from deleted),'delete',getdate())
END

INSERT INTO PERSONINFO VALUES(2,'MANSI',25000,'2023-12-3','MORBI',19,'2006-01-19')
select * from PersonLog

--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table.
--For that, log all operations performed on the person table into PersonLog.
CREATE OR ALTER  TRIGGER TR_INSERT
ON PERSONINFO
INSTEAD OF INSERT
AS
BEGIN
	insert into personlog (personid,personname,operation,updatedate)
	values((select personid from inserted),(select PersonName from inserted),'insert',getdate())
END
CREATE OR ALTER TRIGGER TR_update
ON PERSONINFO
INSTEAD OF update
AS
BEGIN
	insert into personlog (personid,personname,operation,updatedate)
	values((select personid from inserted),(select PersonName from inserted),'update',getdate())
END
CREATE OR ALTER  TRIGGER TR_delete
ON PERSONINFO
INSTEAD OF delete
AS
BEGIN
	insert into personlog (personid,personname,operation,updatedate)
	values((select personid from deleted),(select PersonName from deleted),'delete',getdate())
END 
--4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into 
--uppercase whenever the record is inserted. 
CREATE OR ALTER TRIGGER TR_INSERT
ON PERSONINFO
AFTER  INSERT
AS
BEGIN
	update  PersonInfo set
	PersonName=(upper((select PersonName from inserted)))
	where personid=(select Personid from inserted)	
END
--5. Create trigger that prevent duplicate entries of person name on PersonInfo table.
CREATE OR ALTER  TRIGGER TR_INSERT
ON PERSONINFO
INSTEAD OF INSERT
AS
BEGIN
	insert into personinfo
	select 
	PERSONID,
	PersonName,
	Salary,
	JoiningDate, 
	City,
	Age,
	BirthDate
	from inserted
	where personname not in (select PersonName from PersonInfo)

end
--6. Create trigger that prevent Age below 18 years. 
CREATE OR ALTER  TRIGGER TR_INSERT
ON PERSONINFO
INSTEAD OF INSERT
AS
BEGIN
	insert into personinfo
	select 
	PERSONID,
	PersonName,
	Salary,
	JoiningDate, 
	City,
	Age,
	BirthDate
	from inserted
	where age >=18

end
--Part – B 
--7. Create a trigger that fires on INSERT operation on person table, which calculates the age and 
--update that age in Person table. 
CREATE OR ALTER TRIGGER TR_INSERT
ON PERSONINFO
AFTER INSERT
AS
BEGIN
	UPDATE PersonInfo
	SET AGE=DATEDIFF(YEAR,(SELECT BIRTHDATE FROM INSERTED),GETDATE())
END
INSERT INTO PERSONINFO (PERSONID, PersonName, Salary, JoiningDate, City, BirthDate) 
VALUES(110,'Darshi',25000,'2023-12-3','MORBI','2006-01-19')
SELECT * FROM PersonInfo

--8. Create a Trigger to Limit Salary Decrease by a 10%.
CREATE OR ALTER TRIGGER TR_INSERT
ON PERSONINFO
AFTER UPDATE
AS
BEGIN
	DECLARE @SALOLD DECIMAL(8,2)=(SELECT SALARY FROM deleted)
	DECLARE @SALNEW DECIMAL(8,2)=(SELECT SALARY FROM INSERTED)
	DECLARE @ID INT=(SELECT PERSONID FROM INSERTED)
	IF @SALNEW<(@SALOLD+(@SALOLD*0.1))
	BEGIN
		UPDATE PersonInfo
		SET Salary=@SALOLD
		WHERE PERSONID=@ID
	END
	ELSE
	BEGIN
		UPDATE PersonInfo
		SET Salary=@SALNEW
		WHERE PERSONID=@ID
	END
END

--Part – C  
--9. Create Trigger to Automatically Update JoiningDate to Current Date on INSERT if JoiningDate is NULL
--during an INSERT. 
--10. Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints 
--‘Record deleted successfully from PersonLog’. 
 