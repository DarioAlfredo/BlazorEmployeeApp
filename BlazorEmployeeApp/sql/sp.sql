-- Insert EmployeeTitle
CREATE PROCEDURE InsertEmployeeTitle
    @Desc NVARCHAR(100)
AS
INSERT INTO EmployeeTitle ([Desc]) VALUES (@Desc);

-- Update EmployeeTitle
CREATE PROCEDURE UpdateEmployeeTitle
    @EmployeeTitleID INT,
    @Desc NVARCHAR(100)
AS
UPDATE EmployeeTitle SET [Desc] = @Desc WHERE EmployeeTitleID = @EmployeeTitleID;

-- Insert Employee
CREATE PROCEDURE InsertEmployee
    @EmployeeTitleID INT = NULL,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @DOB DATE,
    @IsActive BIT
AS
INSERT INTO Employee (EmployeeTitleID, FirstName, LastName, DOB, IsActive)
VALUES (@EmployeeTitleID, @FirstName, @LastName, @DOB, @IsActive);

-- Update Employee
CREATE PROCEDURE UpdateEmployee
    @EmployeeID INT,
    @EmployeeTitleID INT = NULL,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @DOB DATE,
    @IsActive BIT
AS
UPDATE Employee
SET EmployeeTitleID = @EmployeeTitleID,
    FirstName = @FirstName,
    LastName = @LastName,
    DOB = @DOB,
    IsActive = @IsActive
WHERE EmployeeID = @EmployeeID;

-- Select Employees with Titles (including those with NULL title)
CREATE PROCEDURE GetEmployeesWithTitles
AS
SELECT e.EmployeeID, e.FirstName, e.LastName, e.DOB, e.IsActive, t.[Desc] AS EmployeeTitle
FROM Employee e
LEFT JOIN EmployeeTitle t ON e.EmployeeTitleID = t.EmployeeTitleID;

-- Bonus: Count of Employees per Title
CREATE PROCEDURE GetEmployeeCountPerTitle
AS
SELECT t.[Desc] AS EmployeeTitle, COUNT(e.EmployeeID) AS EmployeeCount
FROM EmployeeTitle t
LEFT JOIN Employee e ON t.EmployeeTitleID = e.EmployeeTitleID
GROUP BY t.[Desc];


