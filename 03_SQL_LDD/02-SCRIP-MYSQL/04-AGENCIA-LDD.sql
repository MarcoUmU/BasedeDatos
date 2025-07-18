CREATE DATABASE Agencia;

USE Agencia;

CREATE TABLE Sucursal(
    sucursalID INT NOT NULL auto_increment,
    nombre VARCHAR(50),
    ubicacion VARCHAR(50),
    CONSTRAINT pk_Sucursal
    PRIMARY KEY(sucursalID)
)

CREATE TABLE Carro(
    carroID INT NOT NULL auto_increment,
    año DATE,
    modelo VARCHAR(50),
    marca VARCHAR(30),
    placa CHAR(8),
    sucursalID INT,
    CONSTRAINT pk_Carro
    PRIMARY KEY(carroID),
    CONSTRAINT fk_Carro_Sucursal
    FOREIGN KEY(sucursalID)
    REFERENCES Sucursal(sucursalID)
)

CREATE TABLE Clientes(
    clienteID INT NOT NULL auto_increment,
    calle VARCHAR(50),
    numero INT,
    ciudad VARCHAR(50),
    nombrePila VARCHAR(20),
    apellidoPaterno VARCHAR(30),
    apellidoMaterno VARCHAR(30),
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
   REFERENCES Clientes(clienteID),
   CONSTRAINT fk_Rentar_Carro
   FOREIGN KEY(carroID)
   REFERENCES Carro(carroID)
)