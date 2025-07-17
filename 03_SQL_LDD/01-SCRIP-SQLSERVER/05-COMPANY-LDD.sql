CREATE DATABASE COMPANY;
GO

USE COMPANY;
GO

-- Crear DEPARTMENT 
CREATE TABLE DEPARTMENT (
    departmentID INT NOT NULL IDENTITY(1,1),
    numDepartment INT,
    nameDepartment NVARCHAR(50),
    startDate DATE,
    managerID INT, -- referencia a EMPLOYEE
    CONSTRAINT pk_department 
    PRIMARY KEY(departmentID)
);
GO

-- EMPLOYEE (después de DEPARTMENT)
CREATE TABLE EMPLOYEE (
    employeeID INT NOT NULL IDENTITY(1,1),
    ssn INT,
    firstName NVARCHAR(20),
    lastName NVARCHAR(20),
    name1 NVARCHAR(20),
    salary INT,
    birthday DATE,
    address1 NVARCHAR(50),
    sex NVARCHAR(10),
    departmentID INT,
    bossID INT,
    CONSTRAINT pk_employee 
    PRIMARY KEY(employeeID),
    CONSTRAINT fk_employee_boss 
    FOREIGN KEY (bossID)
    REFERENCES EMPLOYEE(employeeID),
    CONSTRAINT fk_employee_department 
    FOREIGN KEY (departmentID)
    REFERENCES DEPARTMENT(departmentID)
);
GO

-- Agregar la FK del manager ahora que EMPLOYEE ya existe
ALTER TABLE DEPARTMENT
ADD CONSTRAINT fk_department_employee 
FOREIGN KEY (managerID)
REFERENCES EMPLOYEE(employeeID);
GO

-- DEPENDENT
CREATE TABLE DEPENDENT (
    employeeID INT,
    name1 NVARCHAR(20),
    sex NVARCHAR(20),
    birthday DATE,
    relationship NVARCHAR(50),
    CONSTRAINT fk_dependent_employee 
    FOREIGN KEY (employeeID)
    REFERENCES EMPLOYEE(employeeID)
);
GO

-- PROJECT
CREATE TABLE PROJECT (
    projectID INT NOT NULL IDENTITY(1,1),
    numProject INT,
    nameProject NVARCHAR(50),
    location1 NVARCHAR(20),
    departmentID INT,
    CONSTRAINT pk_project 
    PRIMARY KEY(projectID),
    CONSTRAINT fk_project_department 
    FOREIGN KEY(departmentID)
    REFERENCES DEPARTMENT(departmentID)
);
GO

-- WORKS_ON
CREATE TABLE WORKS_ON (
    employeeID INT,
    projectID INT,
    CONSTRAINT fk_workson_employee 
    FOREIGN KEY (employeeID)
    REFERENCES EMPLOYEE(employeeID),
    CONSTRAINT fk_workson_project 
    FOREIGN KEY (projectID)
    REFERENCES PROJECT(projectID)
);
GO

-- LOCATIONS
CREATE TABLE LOCATIONS (
    locationsID INT NOT NULL IDENTITY(1,1),
    location1 NVARCHAR(20),
    departmentID INT,
    CONSTRAINT pk_locations 
    PRIMARY KEY(locationsID),
    CONSTRAINT fk_locations_department 
    FOREIGN KEY (departmentID)
    REFERENCES DEPARTMENT(departmentID)
);
GO
