CREATE DATABASE COMPAÑIA;
GO

USE COMPAÑIA;
GO 

CREATE TABLE Suppliers(
SuplierId int not null,
CompanyName varchar(45) not null,
adress varchar(45) not null,
fax varchar(45) not null,
Region varchar(45) not null,
homePage int not null

CONSTRAINT pk_Suppliers
PRIMARY KEY (SuplierId)
);

CREATE TABLE ContactSupplies(
ContactId int not null,
SupplierId int not null,
FullName varchar(45) not null,

CONSTRAINT pk_ContactSupplies
PRIMARY KEY(ContactId),

CONSTRAINT fk_ContactSupplies_Supliers
FOREIGN KEY (SupplierId)
REFERENCES Suppliers(SuplierId)
);

CREATE TABLE Categories(
CategoryId int not null,
CategoryName varchar(45) not null,
Descriptions varchar(45) not null,

CONSTRAINT pk_Categories
PRIMARY KEY (CategoryId)
);

CREATE TABLE Products(
ProductId int not null,
UnitPrice decimal(10,2) not null,
UnitSinstock smallint not null,
QuantityPerUnit varchar(45) not null,
SupplierId int not null,
CategoryId int not null,

CONSTRAINT pk_Products
PRIMARY KEY (ProductId),

CONSTRAINT fk_Products_Suppliers
FOREIGN KEY (SupplierId)
REFERENCES Suppliers(SuplierId),

CONSTRAINT fk_Products_Categories
FOREIGN KEY (CategoryId)
REFERENCES Categories(CategoryId)
);

CREATE TABLE Shippers (
ShippersId int not null,
CompanyName varchar(45) not null,

CONSTRAINT pk_Shippers
PRIMARY KEY (ShippersId),
);

CREATE TABLE PhonesShipped (
PhaneShipperId int not null,
ShippersId int not null,
phone int not null,

CONSTRAINT pk_PhonesShipped
PRIMARY KEY (PhaneShipperId),

CONSTRAINT fk_PhonesShipped_Shippers
FOREIGN KEY (ShippersId)
REFERENCES Shippers(ShippersId)
);

CREATE TABLE Customers(
CustomerId int not null,
CompanyName varchar(45) not null,
city varchar(45) not null,
region varchar(45) not null,
phone int not null,

CONSTRAINT pk_Customers
PRIMARY KEY (CustomerId) ,
);

CREATE TABLE ContactCustamers(
ContactId int not null,
CustomerId int not null,
FullName varchar(45) not null,

CONSTRAINT pk_ContactCustamers
PRIMARY KEY(ContactId),

CONSTRAINT fk_ContactCustamers_Customers
FOREIGN KEY (CustomerId)
REFERENCES Customers(CustomerId)
);

CREATE TABLE Employees (
EmployId int not null,
FirstName varchar(45) not null,
LastName varchar(45) not null,
BirthDate date not null,
city varchar(45) not null,
Repor_to INT not null,

CONSTRAINT pk_Employees
PRIMARY KEY (EmployId),

CONSTRAINT fk_Employees_Employees
FOREIGN KEY (Repor_to)
REFERENCES Employees(EmployId)
);

CREATE TABLE Orders(
OrderId int not null,
code int not null,
ShipRegion int not null,
OrderDate date not null,
RequierDate varchar(45) not null,
EmployeeId int not null,
CustormerId int not null,

CONSTRAINT pk_Orders
PRIMARY KEY (OrderId),

CONSTRAINT fk_Orders_Shippers
FOREIGN KEY (ShipRegion)
REFERENCES Shippers(ShippersId),

CONSTRAINT fk_Orders_Employees
FOREIGN KEY (EmployeeId)
REFERENCES Employees(EmployId),

CONSTRAINT fk_Orders_Customers
FOREIGN KEY (CustormerId)
REFERENCES Customers(CustomerId)
);

CREATE TABLE Details (
ProductoId int not null,
OrderId int not null,
UnitPrice money not null,
Cuantity int not null,
Discount varchar(45),

CONSTRAINT fk_Details_Orders
FOREIGN KEY (ProductoId)
REFERENCES Orders(OrderId),

CONSTRAINT fk_Details_Products
FOREIGN KEY (OrderId)
REFERENCES Products(ProductId)
);