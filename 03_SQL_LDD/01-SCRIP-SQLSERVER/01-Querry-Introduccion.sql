-- Lenguaje SQL-LDD

-- crear la base de datos empresa(0bjeto)
CREATE DATABASE empresa;
GO

--cambiar a la base de datos
USE empresa;
GO

--crear tabla empleado
CREATE TABLE Empleados(
 IdEmpleado int not null,
 Nombre varchar(100) not null,
 Puesto varchar(50) not null,
 FechaIngreso date,
 Salario money not null,
 CONSTRAINT pk_empleados
 PRIMARY KEY (IdEmpleado)
);
 GO


 CREATE TABLE Productos(
  ProductoId int primary key,
  NombreProducto nvarchar(50) not null,
  Existencia int not null,
  PrecioUnitario money not null
 );
 GO

 CREATE TABLE Productos2(
  ProductoId int not null identity(1,1),
  NombreProducto nvarchar(50) not null,
  Existencia int not null,
  Precio money not null,
  CONSTRAINT pk_Productos2 PRIMARY KEY(ProductoId),
  CONSTRAINT unique_nombreProducto UNIQUE(NombreProducto),
  CONSTRAINT chk_existencia CHECK (Existencia >0 AND Existencia<=1000),
  CONSTRAINT chk_Precio CHECK(Precio >0.0)
 );
 GO

 -- insertar en productos sin identity
 INSERT INTO Productos(ProductoId, NombreProducto, Existencia, PrecioUnitario)
 VALUES (1, 'Burritos de frijoles', 65, 20.99);
 GO
 
 SELECT * FROM Productos
 GO

 INSERT INTO Productos(ProductoId, NombreProducto, Existencia, PrecioUnitario)
 VALUES (2, 'Burritos de frijoles', 65, 20.99);
 GO
 
 SELECT * FROM Productos
 GO

 -- Insertar en tabla productos 2 CON IDENTITY

 INSERT INTO Productos2(NombreProducto, Existencia, Precio)
 VALUES ('Burritos de Chorizo Verde', 100, 21.0);
 GO
 
 SELECT * FROM Productos2
 GO

  INSERT INTO Productos2(NombreProducto, Existencia, Precio)
 VALUES ('Burritos de Chorizo Grueso', 300, 200);
 GO
 
 SELECT * FROM Productos2
 GO
  INSERT INTO Productos2(NombreProducto, Existencia, Precio)
 VALUES ('Burritos de Chorizo Grueso2', 300, 200);
 GO
 
 SELECT * FROM Productos2
 GO

 INSERT INTO Productos2(NombreProducto, Existencia, Precio)
 VALUES ('Burritos de Frijol', 300, 1200);
 GO
 
 SELECT * FROM Productos2
 GO

--crear  dos tablas con razon de cardinalidad de 1:n, con participacion total, esto quiere decir que la foreing key es not null
 create table categoria (
 idcategoria int not null identity(1,1),
 nombrecategoria nvarchar(25) not null,
 constraint pk_categoria
 primary key (idcategoria),
 constraint unique_nombrecategoria
 unique (nombrecategoria),

 );
 go

 create table producto3(
 productoid int not null identity(1,1),
 nombreproducto nvarchar(25) not null,
 existencia int not null,
 preciounitario money not null,
 categoriaid int not null,
 constraint pk_Productoid
 primary key (productoid),
 constraint chk_existencia3
check (existencia >0 and existencia<1000),
CONSTRAINT chk_preciounitario
CHECK (PrecioUnitario>0.0),
CONSTRAINT unique_nombreproducto3
UNIQUE(NombreProducto),
CONSTRAINT fk_producto3_categoria
FOREIGN KEY(categoriaid)
REFERENCES categoria(idcategoria)
 );



create table categoria2 (
 id int not null identity(1,1),
 nombrecategoria nvarchar(25) not null,
 constraint pk_categoria2
 primary key (id),
 constraint unique_nombrecategoria2
 unique (nombrecategoria),

 );
 go

 create table producto4(
 productoid int not null identity(1,1),
 nombreproducto nvarchar(25) not null,
 existencia int not null,
 preciounitario money not null,
 categoriaid int not null,
 constraint pk_productos4
 primary key (productoid),
 constraint chk_existencia4
check (existencia >0 and existencia<1000),
CONSTRAINT chk_preciounitario4
CHECK (PrecioUnitario>0.0),
CONSTRAINT unique_nombreproducto4
UNIQUE(NombreProducto),
CONSTRAINT fk_productos4_categoria
FOREIGN KEY(categoriaid)
REFERENCES categoria2(id)
 );


 -- CREAR LAS TABLAS DEL PROFE CARLOS
 CREATE TABLE TABLA1(
    tabla1ID int not null,
    tabla1ID2 int not null,
    Nombre nvarchar(25) not null,
    CONSTRAINT pk_tabla1
    PRIMARY KEY(tabla1ID, tabla1ID2)
 );
 GO


 CREATE TABLE TABLA2(
    IDTabla2 int not null,
    Nombre nvarchar(25) not null,
    tabla1ID int,
    tabla1ID2 int,
    CONSTRAINT pk_tabla2
    PRIMARY KEY(IDTabla2),
    CONSTRAINT fk_tabla2_tabla1
    FOREIGN KEY(tabla1ID, tabla1ID2)
    REFERENCES TABLA1(tabla1ID, tabla1ID2)
 );
 GO


 --CREAR TABLAS CON RAZON DE CARDINALIDAD 1:1

 CREATE TABLE EMPLOYEE(
    id int not null IDENTITY (1,1),
    nombre NVARCHAR(20) not null,
    ap1 NVARCHAR(20) not null,
    ap2 NVARCHAR(20) not null,
    sexo char(1) not null,
    salario money not null,
    CONSTRAINT pk_employee
    PRIMARY KEY(id)
 );
 GO

 CREATE TABLE DEPARTMENT(
    id int not null IDENTITY (1,1),
    nombre NVARCHAR(20) not null,
    ubicacion NVARCHAR(30) not null,
    employeeid int not null,
    CONSTRAINT pk_department
    PRIMARY KEY(id),
    CONSTRAINT fk_department_employee
    FOREIGN KEY(employeeid)
    REFERENCES EMPLOYEE(id),
    CONSTRAINT unique_employeeid
    UNIQUE(employeeid)
 );
 GO