CREATE DATABASE Biblioteca;

USE Biblioteca;

CREATE TABLE Libros(
    numLibro INT NOT NULL IDENTITY(1,1),
    ISBN NVARCHAR(20),
    Autor NVARCHAR(50),
    Titulo NVARCHAR(50),
    Cantidad INT,
    CONSTRAINT pk_libros
    PRIMARY KEY(numLibro),
    CONSTRAINT unique_ISBN
    UNIQUE(ISBN)
)

CREATE TABLE Lectores(
    numLector INT NOT NULL IDENTITY(1,1),
    numMembresia INT NOT NULL,
    nombrePila NVARCHAR(30),
    apellido1 NVARCHAR(30),
    apellido2 NVARCHAR(30),
    CONSTRAINT pk_lectores
    PRIMARY KEY(numLector,numMembresia),
    CONSTRAINT unique_numMembresia
    UNIQUE(numMembresia)
)

CREATE TABLE Presta(
    numLibro INT,
    numLector INT,
    numMembresia INT,
    CONSTRAINT fk_presta_libros
    FOREIGN KEY(numLibro)
    REFERENCES Libros,
    CONSTRAINT fk_presta_lectores
    FOREIGN KEY(numLector,numMembresia)
    REFERENCES Lectores
)