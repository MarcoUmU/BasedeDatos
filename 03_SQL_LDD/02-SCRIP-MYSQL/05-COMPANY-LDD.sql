CREATE DATABASE COMPANY;

USE COMPANY;

# Crear DEPARTMENT 
CREATE TABLE DEPARTMENT (
    departmentID INT NOT NULL auto_increment,
    numDepartment INT,
    nameDepartment VARCHAR(50),
    startDate DATE,
    managerID INT, 
    CONSTRAINT pk_department 
    PRIMARY KEY(departmentID)
);

# EMPLOYEE (después de DEPARTMENT)
CREATE TABLE EMPLOYEE (
    employeeID INT NOT NULL auto_increment,
    ssn INT,
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    name1 VARCHAR(20),
    salary INT,
    birthday DATE,
    address1 VARCHAR(50),
    sex VARCHAR(10),
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

# Agregar la FK del manager ahora que EMPLOYEE ya existe
ALTER TABLE DEPARTMENT
ADD CONSTRAINT fk_department_employee 
FOREIGN KEY (managerID)
REFERENCES EMPLOYEE(employeeID);

# DEPENDENT
CREATE TABLE DEPENDENT (
    employeeID INT,
    name1 VARCHAR(20),
    sex VARCHAR(20),
    birthday DATE,
    relationship VARCHAR(50),
    CONSTRAINT fk_dependent_employee 
    FOREIGN KEY (employeeID)
    REFERENCES EMPLOYEE(employeeID)
);

# PROJECT
CREATE TABLE PROJECT (
    projectID INT NOT NULL auto_increment,
    numProject INT,
    nameProject VARCHAR(50),
    location1 VARCHAR(20),
    departmentID INT,
    CONSTRAINT pk_project 
    PRIMARY KEY(projectID),
    CONSTRAINT fk_project_department 
    FOREIGN KEY(departmentID)
    REFERENCES DEPARTMENT(departmentID)
);

# WORKS_ON
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

# LOCATIONS
CREATE TABLE LOCATIONS (
    locationsID INT NOT NULL auto_increment,
    location1 VARCHAR(20),
    departmentID INT,
    CONSTRAINT pk_locations 
    PRIMARY KEY(locationsID),
    CONSTRAINT fk_locations_department 
    FOREIGN KEY (departmentID)
    REFERENCES DEPARTMENT(departmentID)
);