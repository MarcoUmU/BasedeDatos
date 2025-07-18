CREATE DATABASE Biblioteca;

USE Biblioteca;

CREATE TABLE Libros(
    numLibro INT NOT NULL auto_increment,
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
    numLector INT NOT NULL auto_increment,
    numMembresia INT NOT NULL,
    nombrePila VARCHAR(30),
    apellido1 VARCHAR(30),
    apellido2 VARCHAR(30),
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
    REFERENCES Libros(numLibro),
    CONSTRAINT fk_presta_lectores
    FOREIGN KEY(numLector,numMembresia)
    REFERENCES Lectores(numLector,numMembresia)
)