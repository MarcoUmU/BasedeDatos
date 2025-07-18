CREATE DATABASE ejercicio1999;
GO

USE ejercicio1999;
GO

CREATE TABLE EMPLEADO(
    EmpleadoId INT NOT NULL IDENTITY(1,1),
    Nombre NVARCHAR(15) NOT NULL,
    Apellido1 NVARCHAR(15) NOT NULL,
    Apellido2 NVARCHAR(15),
    Direccion NVARCHAR(50) NOT NULL,
    Salario DECIMAL(10,2) NOT NULL,
    Jef INT,
    Departamento INT NOT NULL,

    CONSTRAINT pk_empleado
    PRIMARY KEY(EmpleadoId),

    CONSTRAINT chk_salario
    CHECK (Salario BETWEEN 200 AND 50000),

    CONSTRAINT fk_empleado_jefe
    FOREIGN KEY(Jef)
    REFERENCES EMPLEADO(EmpleadoId)

    ON DELETE NO ACTION     --ESTOS NO IMPORTAN EN EL EXAMEN
    ON UPDATE NO ACTION     --ESTOS NO IMPORTAN EN EL EXAMEN
)
GO

CREATE TABLE DEPARTAMENTO(
    Departamento INT NOT NULL IDENTITY(1,1),
    NombreDepto NVARCHAR(20) NOT NULL,
    Estatus CHAR(2) NOT NULL,
    Administrador INT NOT NULL,
    CONSTRAINT pk_departamento
    PRIMARY KEY(Departamento),

    CONSTRAINT unique_nombredepto
    UNIQUE(NombreDepto),

    CONSTRAINT chk_estatus
    CHECK(Estatus IN ('SI', 'NO')),

    CONSTRAINT fk_departamento_empleado
    FOREIGN KEY(Administrador)
    REFERENCES EMPLEADO(EmpleadoId)
)
GO

ALTER TABLE EMPLEADO
ADD CONSTRAINT fk_empleado_depto
FOREIGN KEY(Departamento)
REFERENCES DEPARTAMENTO(Departamento)
GO

CREATE TABLE UBICACION(
    UbicacionId INT NOT NULL IDENTITY(1,1),
    Ubicacion NVARCHAR(15),
    DeptoId INT NOT NULL,
    CONSTRAINT pk_ubicacion
    PRIMARY KEY(UbicacionId),
    CONSTRAINT unique_DeptoId
    UNIQUE(DeptoId),
    CONSTRAINT fk_ubicacion_depto
    FOREIGN KEY(DeptoId)
    REFERENCES DEPARTAMENTO(Departamento)
)