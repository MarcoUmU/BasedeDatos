CREATE DATABASE Escuela;
GO

USE Escuela;
GO

CREATE TABLE Estudiantes(
    numEstudiante INT NOT NULL IDENTITY(1,1),
    matricula INT NOT NULL,
    nombre NVARCHAR(50),
    apPaterno NVARCHAR(50),
    apMaterno NVARCHAR(50),
    CONSTRAINT pk_Estudiantes
    PRIMARY KEY(numEstudiante)
)

CREATE TABLE Cursos(
    numCurso INT NOT NULL IDENTITY(1,1),
    nombreCurso NVARCHAR(50),
    codigoCurso INT,
    CONSTRAINT pk_Cursos
    PRIMARY KEY(numCurso)
)

CREATE TABLE Inscripciones(
    numCurso INT,
    numEstudiante INT,
    fechaInscripcion DATE,
    CONSTRAINT fk_Inscripciones_Estudiantes
    FOREIGN KEY(numEstudiante)
    REFERENCES Estudiantes,
    CONSTRAINT fk_Inscripciones_Cursos
    FOREIGN KEY(numCurso)
    REFERENCES Cursos
)