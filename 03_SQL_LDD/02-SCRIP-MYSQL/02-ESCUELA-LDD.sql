CREATE DATABASE Escuela;

USE Escuela;

CREATE TABLE Estudiantes(
    numEstudiante INT NOT NULL auto_increment,
    matricula INT NOT NULL,
    nombre VARCHAR(50),
    apPaterno VARCHAR(50),
    apMaterno VARCHAR(50),
    CONSTRAINT pk_Estudiantes
    PRIMARY KEY(numEstudiante)
)

CREATE TABLE Cursos(
    numCurso INT NOT NULL auto_increment,
    nombreCurso VARCHAR(50),
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
    REFERENCES Estudiantes(numEstudiante),
    CONSTRAINT fk_Inscripciones_Cursos
    FOREIGN KEY(numCurso)
    REFERENCES Cursos(numCurso)
)