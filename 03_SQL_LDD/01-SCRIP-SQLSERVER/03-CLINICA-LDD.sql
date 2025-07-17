CREATE DATABASE Clinica;
GO

USE Clinica;
GO

CREATE TABLE Doctores(
    IdDoctor INT NOT NULL IDENTITY(1,1),
    nombrePila NVARCHAR(50),
    apPaterno NVARCHAR(50),
    apMaterno NVARCHAR(50),
    CONSTRAINT pk_Doctores
    PRIMARY KEY(IdDoctor)
)

CREATE TABLE Pacientes(
    numPaciente INT NOT NULL IDENTITY(1,1),
    nombrePila NVARCHAR(50),
    apPaterno NVARCHAR(50),
    apMaterno NVARCHAR(50),
    CONSTRAINT pk_Pacientes
    PRIMARY KEY(numPaciente)
)

CREATE TABLE Atender(
    IdDoctor INT,
    numPaciente INT,
    fecha DATE,
    diagnostico NVARCHAR(500),
    CONSTRAINT fk_Atender_Doctores
    FOREIGN KEY(IdDoctor)
    REFERENCES Doctores,
    CONSTRAINT fk_Atender_Pacientes
    FOREIGN KEY(numPaciente)
    REFERENCES Pacientes,
)