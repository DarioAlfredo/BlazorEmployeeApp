-- Create Table: EmployeeTitle
CREATE TABLE EmployeeTitle (
    EmployeeTitleID INT PRIMARY KEY IDENTITY(1,1),
    Descr NVARCHAR(100) NOT NULL
);
GO

-- Create Table: Employee
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeTitleID INT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_Employee_EmployeeTitle FOREIGN KEY (EmployeeTitleID)
        REFERENCES EmployeeTitle(EmployeeTitleID)
);
GO

-- Index for better search performance
CREATE NONCLUSTERED INDEX IX_Employee_EmployeeTitleID ON Employee(EmployeeTitleID);
GO