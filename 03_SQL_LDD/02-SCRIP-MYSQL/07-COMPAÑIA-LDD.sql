CREATE DATABASE COMPAÑIA;
USE COMPAÑIA;

# Tabla Suppliers
CREATE TABLE Suppliers (
    SuplierId INT NOT NULL,
    CompanyName VARCHAR(45) NOT NULL,
    adress VARCHAR(45) NOT NULL,
    fax VARCHAR(45) NOT NULL,
    Region VARCHAR(45) NOT NULL,
    homePage INT NOT NULL,
    PRIMARY KEY (SuplierId)
);

# Tabla ContactSupplies
CREATE TABLE ContactSupplies (
    ContactId INT NOT NULL,
    SupplierId INT NOT NULL,
    FullName VARCHAR(45) NOT NULL,
    PRIMARY KEY (ContactId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers(SuplierId)
);

# Tabla Categories
CREATE TABLE Categories (
    CategoryId INT NOT NULL,
    CategoryName VARCHAR(45) NOT NULL,
    Descriptions VARCHAR(45) NOT NULL,
    PRIMARY KEY (CategoryId)
);

# Tabla Products
CREATE TABLE Products (
    ProductId INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    UnitSinstock SMALLINT NOT NULL,
    QuantityPerUnit VARCHAR(45) NOT NULL,
    SupplierId INT NOT NULL,
    CategoryId INT NOT NULL,
    PRIMARY KEY (ProductId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers(SuplierId),
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
);

# Tabla Shippers
CREATE TABLE Shippers (
    ShippersId INT NOT NULL,
    CompanyName VARCHAR(45) NOT NULL,
    PRIMARY KEY (ShippersId)
);

# Tabla PhonesShipped
CREATE TABLE PhonesShipped (
    PhaneShipperId INT NOT NULL,
    ShippersId INT NOT NULL,
    phone VARCHAR(20) NOT NULL,
    PRIMARY KEY (PhaneShipperId),
    FOREIGN KEY (ShippersId) REFERENCES Shippers(ShippersId)
);

# Tabla Customers
CREATE TABLE Customers (
    CustomerId INT NOT NULL,
    CompanyName VARCHAR(45) NOT NULL,
    city VARCHAR(45) NOT NULL,
    region VARCHAR(45) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    PRIMARY KEY (CustomerId)
);

# Tabla ContactCustomers
CREATE TABLE ContactCustamers (
    ContactId INT NOT NULL,
    CustomerId INT NOT NULL,
    FullName VARCHAR(45) NOT NULL,
    PRIMARY KEY (ContactId),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

# Tabla Employees
CREATE TABLE Employees (
    EmployId INT NOT NULL,
    FirstName VARCHAR(45) NOT NULL,
    LastName VARCHAR(45) NOT NULL,
    BirthDate DATE NOT NULL,
    city VARCHAR(45) NOT NULL,
    Repor_to INT,
    PRIMARY KEY (EmployId),
    FOREIGN KEY (Repor_to) REFERENCES Employees(EmployId)
);

# Tabla Orders
CREATE TABLE Orders (
    OrderId INT NOT NULL,
    code INT NOT NULL,
    ShipRegion INT NOT NULL,
    OrderDate DATE NOT NULL,
    RequierDate VARCHAR(45) NOT NULL,
    EmployeeId INT NOT NULL,
    CustormerId INT NOT NULL,
    PRIMARY KEY (OrderId),
    FOREIGN KEY (ShipRegion) REFERENCES Shippers(ShippersId),
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployId),
    FOREIGN KEY (CustormerId) REFERENCES Customers(CustomerId)
);

# Tabla Details
CREATE TABLE Details (
    ProductoId INT NOT NULL,
    OrderId INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    Cuantity INT NOT NULL,
    Discount VARCHAR(45),
    PRIMARY KEY (ProductoId, OrderId),
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (ProductoId) REFERENCES Products(ProductId)
);
