CREATE TABLE EMPLOYEEDETAILS
(
	EmployeeID Int Primary Key,
	EmployeeName Varchar(100) Not Null,
	ContactNo Varchar(100) Not Null,
	Department Varchar(100) Not Null,
	Salary Decimal(10,2) Not Null,
	JoiningDate DateTime Null
)
CREATE TABLE EmployeeLogs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
	EmployeeName VARCHAR(100) NOT NULL,
    ActionPerformed VARCHAR(100) NOT NULL,
    ActionDate DATETIME NOT NULL
);

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieTitle VARCHAR(255) NOT NULL,
    ReleaseYear INT NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    Rating DECIMAL(3, 1) NOT NULL,
    Duration INT NOT NULL
);
CREATE TABLE MoviesLog
(
	LogID INT PRIMARY KEY IDENTITY(1,1),
	MovieID INT NOT NULL,
	MovieTitle VARCHAR(255) NOT NULL,
	ActionPerformed VARCHAR(100) NOT NULL,
	ActionDate	DATETIME  NOT NULL
);
--1)	Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to display 
--the message "Employee record inserted", "Employee record updated", "Employee record deleted"
CREATE OR ALTER   TRIGGER TR_INSERT
ON EmployeeDetails
AFTER INSERT
AS
BEGIN
	print('Employee record inserted')
END
CREATE OR ALTER  TRIGGER TR_update
ON EmployeeDetails
AFTER update
AS
BEGIN
	print('Employee record updated')
END
CREATE OR ALTER  TRIGGER TR_delete
ON EmployeeDetails
AFTER delete
AS
BEGIN
	print('Employee record deleted')
END
insert into EmployeeDetails values(2,'mansi','2345678','ce',2344.56,GETDATE())
--2)	Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to log all operations
--into the EmployeeLog table.
CREATE OR ALTER  TRIGGER TR_INSERT
ON EmployeeDetails
AFTER INSERT
AS
BEGIN
	insert into EmployeeLogs( EmployeeID, EmployeeName, ActionPerformed, ActionDate)
	values((select EmployeeID from inserted),(select EmployeeName from inserted),'insert',getdate())
END
select * from EMPLOYEEDETAILS
CREATE OR ALTER  TRIGGER TR_update
ON EmployeeDetails
AFTER update
AS
BEGIN
	insert into EmployeeLogs( EmployeeID, EmployeeName, ActionPerformed, ActionDate)
	values((select EmployeeID from inserted),(select EmployeeName from inserted),'update',getdate())
END


CREATE OR ALTER  TRIGGER TR_delete
ON EmployeeDetails
AFTER delete
AS
BEGIN
	insert into EmployeeLogs( EmployeeID, EmployeeName, ActionPerformed, ActionDate)
	values((select EmployeeID from deleted),(select EmployeeName from deleted),'delete',getdate())
END
--3)	Create a trigger that fires AFTER INSERT to automatically calculate the joining bonus (10% of the salary) for new employees
--and update a bonus column in the EmployeeDetails table.
create or alter trigger Tr_modify_sal
on EmployeeDetails
after insert
as
begin
		update EmployeeDetails set
		Salary=((select Salary from inserted)+(0.1*(select Salary from inserted)))
		where EmployeeID=(select EmployeeID from inserted)
end
--4)	Create a trigger to ensure that the JoiningDate is automatically set to the current date if it is NULL during an INSERT operation.
create or alter  trigger  Tr_set_Jdate
on EmployeeDetails
after insert
as
begin
		declare @jdate datetime=(select joiningDate from inserted)
		if @jdate is null
			update EmployeeDetails set
			JoiningDate=GETDATE()
			where EmployeeID=(select EmployeeID from inserted)
end
insert into EmployeeDetails (EmployeeID, EmployeeName, ContactNo, Department, Salary,JoiningDate)
values(5,'mansi','2345678','ce',2344,getdate())
select * from EMPLOYEEDETAILS
--5)	Create a trigger that ensure that ContactNo is valid during insert and update (Like ContactNo length is 10)
create or alter trigger tr_valid_contact
on EmployeeDetails
after insert,update
as
begin
	declare @no varchar(100)=(select contactNo from inserted)
	if len(@no)!=10
		delete from EMPLOYEEDETAILS where EmployeeID=(select EmployeeID from inserted)
end
--1.	Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Movies table. For that,
--log all operations performed on the Movies table into MoviesLog.
CREATE OR ALTER   TRIGGER TR_INSERT
ON Movies
INSTEAD OF INSERT
AS
BEGIN
	insert into MoviesLog(MovieID, MovieTitle, ActionPerformed, ActionDate)
	values((select MovieID from inserted),(select MovieTitle from inserted),'insert',getdate())
END
insert into Movies values(1,'abc',2012,'xyz',3.5,4)
select * from MoviesLog
CREATE OR ALTER TRIGGER TR_update
ON Movies
INSTEAD OF update
AS
BEGIN
	insert into MoviesLog(MovieID, MovieTitle, ActionPerformed, ActionDate)
	values((select MovieID from inserted),(select MovieTitle from inserted),'update',getdate())
END


CREATE OR ALTER  TRIGGER TR_delete
ON Movies
INSTEAD OF delete
AS
BEGIN
	insert into MoviesLog(MovieID, MovieTitle, ActionPerformed, ActionDate)
	values((select MovieID from deleted),(select MovieTitle from deleted),'delete',getdate())
END
--2.	Create a trigger that only allows to insert movies for which Rating is greater than 5.5 .
CREATE OR ALTER   TRIGGER TR_Rating
ON Movies
INSTEAD OF INSERT
AS
BEGIN
	declare @rate decimal(3,1)=(select Rating from inserted)
	if @rate>=5.5
		insert into Movies
		values((select MovieID from inserted),(select MovieTitle from inserted),(select ReleaseYear from inserted),(select Genre from inserted),
		(select Rating from inserted),(select Duration from inserted))
	else
		print('Invalid Rating')
END
insert into Movies values(3,'abc',2012,'xyz',3.5,4)
select * from Movies


--3.	Create trigger that prevent duplicate 'MovieTitle' of Movies table and log details of it in MoviesLog table.
CREATE OR ALTER  TRIGGER TR_Dup_Movie
ON Movies
INSTEAD OF INSERT
AS
BEGIN
	insert into Movies
	select 
	MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration
	from inserted
	where MovieTitle not in (select MovieTitle from Movies)

end
--4.	Create trigger that prevents to insert pre-release movies.

--5.	Develop a trigger to ensure that the Duration of a movie cannot be updated to a value greater
--than 120 minutes (2 hours) to prevent unrealistic entries.
CREATE OR ALTER   TRIGGER TR_time
ON Movies
INSTEAD OF update
AS
BEGIN
	declare @time int=(select Duration from inserted)
	if @time<=120
		update Movies set 
		Duration=(select Duration from inserted)
		where MovieID=(select Duration from inserted)
	else
		print('Invalid Duration')
END
update Movies set 
Duration=110
where MovieID=3
select * from Movies


