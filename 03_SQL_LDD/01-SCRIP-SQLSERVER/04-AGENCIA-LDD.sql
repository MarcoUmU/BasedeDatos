CREATE DATABASE Agencia;
GO

USE Agencia;
GO

CREATE TABLE Sucursal(
    sucursalID INT NOT NULL IDENTITY(1,1),
    nombre NVARCHAR(50),
    ubicacion NVARCHAR(50),
    CONSTRAINT pk_Sucursal
    PRIMARY KEY(sucursalID)
)

CREATE TABLE Carro(
    carroID INT NOT NULL IDENTITY(1,1),
    año DATE,
    modelo NVARCHAR(50),
    marca NVARCHAR(30),
    placa CHAR(8),
    sucursalID INT,
    CONSTRAINT pk_Carro
    PRIMARY KEY(carroID),
    CONSTRAINT fk_Carro_Sucursal
    FOREIGN KEY(sucursalID)
    REFERENCES Sucursal
)

CREATE TABLE Clientes(
    clienteID INT NOT NULL IDENTITY(1,1),
    calle NVARCHAR(50),
    numero INT,
    ciudad NVARCHAR(50),
    nombrePila NVARCHAR(20),
    apellidoPaterno NVARCHAR(30),
    apellidoMaterno NVARCHAR(30),
    CURP CHAR(16),
    CONSTRAINT pk_Clientes
    PRIMARY KEY(clienteID)
)

CREATE TABLE Rentar(
   carroID INT,
   clienteID INT,
   fechaInicio DATE,
   fechaFin DATE,
   CONSTRAINT fk_Rentar_Clientes
   FOREIGN KEY(clienteID)
   REFERENCES Clientes,
   CONSTRAINT fk_Rentar_Carro
   FOREIGN KEY(carroID)
   REFERENCES Carro
)