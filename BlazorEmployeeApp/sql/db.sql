CREATE DATABASE EmployeeDb;
USE EmployeeDb;
-- Drop existing tables if they exist
IF OBJECT_ID('Employee', 'U') IS NOT NULL
    DROP TABLE Employee;
IF OBJECT_ID('EmployeeTitle', 'U') IS NOT NULL
    DROP TABLE EmployeeTitle;

-- Employee Table
CREATE TABLE Employee (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeTitleID INT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    IsActive BIT NOT NULL,
    CONSTRAINT FK_Employee_EmployeeTitle FOREIGN KEY (EmployeeTitleID) REFERENCES EmployeeTitle(EmployeeTitleID)
);

-- EmployeeTitle Table
CREATE TABLE EmployeeTitle (
    EmployeeTitleID INT IDENTITY(1,1) PRIMARY KEY,
    [Desc] NVARCHAR(100) NOT NULL
);

-- Index for faster lookups on EmployeeTitleID
CREATE INDEX IX_Employee_EmployeeTitleID ON Employee(EmployeeTitleID);