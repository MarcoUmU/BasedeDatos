CREATE DATABASE Clinica;

USE Clinica;

CREATE TABLE Doctores(
    IdDoctor INT NOT NULL auto_increment,
    nombrePila VARCHAR(50),
    apPaterno VARCHAR(50),
    apMaterno VARCHAR(50),
    CONSTRAINT pk_Doctores
    PRIMARY KEY(IdDoctor)
)

CREATE TABLE Pacientes(
    numPaciente INT NOT NULL auto_increment,
    nombrePila VARCHAR(50),
    apPaterno VARCHAR(50),
    apMaterno VARCHAR(50),
    CONSTRAINT pk_Pacientes
    PRIMARY KEY(numPaciente)
)

CREATE TABLE Atender(
    IdDoctor INT,
    numPaciente INT,
    fecha DATE,
    diagnostico VARCHAR(500),
    CONSTRAINT fk_Atender_Doctores
    FOREIGN KEY(IdDoctor)
    REFERENCES Doctores(IdDoctor),
    CONSTRAINT fk_Atender_Pacientes
    FOREIGN KEY(numPaciente)
    REFERENCES Pacientes(numPaciente)
)