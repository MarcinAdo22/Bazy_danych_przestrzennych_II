
/*
SELECT EMPLOYEEKEY, FIRSTNAME, LASTNAME, TITLE 
INTO AdventureWorksDW2019.dbo.stg_dimemp 
FROM AdventureWorksDW2019.dbo.DimEmployee 
WHERE (EmployeeKey >= 270 AND EmployeeKey <= 275)
*/



IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME = 'stg_dimemp')
BEGIN
	
	PRINT 'stg_dimemp table exists'

	DROP TABLE dbo.stg_dimemp

END
ELSE
BEGIN
	
	SELECT EmployeeKey, FirstName, LastName, Title 
	INTO AdventureWorksDW2019.dbo.stg_dimemp 
	FROM AdventureWorksDW2019.dbo.DimEmployee 
	WHERE (EmployeeKey >= 270 AND EmployeeKey <= 275)
END

/*
CREATE TABLE AdventureWorksDW2019.dbo.scd_dimemp
(
	EmployeeKey int,
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	Title nvarchar(50),
	StartDate datetime,
	EndDate datetime
)
*/

INSERT INTO AdventureWorksDW2019.dbo.scd_dimemp (EmployeeKey, FirstName, LastName, Title, StartDate, EndDate)
SELECT EmployeeKey, FirstName, LastName, Title, StartDate, EndDate
FROM AdventureWorksDW2019.dbo.DimEmployee
WHERE EmployeeKey >= 270 and EmployeeKey <= 275

/*
UPDATE AdventureWorksDW2019.dbo.stg_dimemp
SET LastName = 'Nowak'
where EmployeeKey = 270;
*/
/*
UPDATE AdventureWorksDW2019.dbo.stg_dimemp
SET Title = 'Senior Design Engineer'
where EmployeeKey = 274;
*/


UPDATE AdventureWorksDW2019.dbo.stg_dimemp
SET FirstName = 'Ryszard'
where EmployeeKey = 275;

