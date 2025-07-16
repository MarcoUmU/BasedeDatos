-- Crear una base de datos empresapatito
CREATE DATABASE empresapatito;
GO

-- Usar base de sdatos
USE empresapatito;
GO

--Crear una tabla empleados
CREATE TABLE empleados(
    IdEmpleado int not null,
    nombre varchar(100) not null,
    puesto varchar(50),
    fechaIngreso date,
    salario decimal(10,2),
    CONSTRAINT pk_empleados
    PRIMARY KEY (IdEmpleado)
);
GO

-- AGREGAR UNA COLUMNA EN LA TABLA EMPLEADOS
ALTER TABLE empleados
ADD correoElectronico varchar(100);
GO

-- MODIFICAR EL TIPO DE DATO DE UN CAMPO
ALTER TABLE empleados
ALTER COLUMN salario money not null;

-- RENOMBRAR UN CAMPO
EXEC sp_rename 'empleados.correoElectronico',
'email', 'COLUMN';
GO

-- CREAR TABLA DEPARTAMENTOS
CREATE TABLE departamentos(
    IdDepartamento int not null identity(1,1) PRIMARY KEY,
    nombreDepto varchar(100),
);
GO

-- AGREGAR UN CAMPO A LA TABLA EMPLEADOS,
-- PAA QUE SEA UNA FOREING KEY
ALTER TABLE empleados 
ADD IdDepartamento int not null;
GO

-- AGREGAR LLAVE FORANEA
ALTER TABLE empleados
ADD CONSTRAINT fk_empleados_departamento
FOREIGN KEY(IdDepartamento)
REFERENCES departamentos(IdDepartamento);
GO

-- ELIMINAR LA PRIMARY KEY DE EMPLEADOS
ALTER TABLE empleados
DROP CONSTRAINT pk_empleados
GO

-- ELIMINAR LA FOREING KEY DE LA TABLA EMPLEADOS
ALTER TABLE empleados
DROP CONSTRAINT fk_empleados_departamento
GO

-- ELIMINAR LA PRIMARY KEY DE DEPARTAMENTO
ALTER TABLE departamentos
DROP CONSTRAINT PK__departam__787A433D1B32DFCD;
GO

-- CREAR UN CONSTRAINT DE VERIFICACION
-- EN SALARIO
ALTER TABLE empleados
ADD CONSTRAINT chk_salario
CHECK (salario > 0.0);
GO



CREATE TABLE categoria(
    Id int not null PRIMARY KEY DEFAULT -1,
    nombre varchar(20),
    estatus char(1) default 'A'
    );
    GO

INSERT INTO categoria
VALUES (1, 'Carnes', 'D');

INSERT INTO categoria
VALUES (DEFAULT, 'Carnes', default);

SELECT * FROM categoria;

DROP TABLE categoria;



-- ELIMINAR LA COLUMNA EMAIL
ALTER TABLE empleados
DROP COLUMN email;


ALTER TABLE empleados
ADD CONSTRAINT pk_empleados
PRIMARY KEY(IdEmpleado);
GO

ALTER TABLE departamentos
ADD CONSTRAINT pk_departamentos
PRIMARY KEY(IdDepartamento);
GO



-- ELIMINAR LAS TABLAS
DROP TABLE empleados;
GO

DROP TABLE departamentos;
GO

DROP TABLE categoria;
GO


use master;
GO
-- ELIMINAR BASE DE DATOS
DROP DATABASE empresapatito;
GO