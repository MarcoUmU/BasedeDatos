## Crear una base de datos empresapatito
CREATE DATABASE empresapatito;

## Usar base de sdatos
USE empresapatito;

## Crear una tabla empleados
CREATE TABLE empleados(
    IdEmpleado int not null,
    nombre varchar(100) not null,
    puesto varchar(50),
    fechaIngreso date,
    salario decimal(10,2),
    CONSTRAINT pk_empleados
    PRIMARY KEY (IdEmpleado)
);

## AGREGAR UNA COLUMNA EN LA TABLA EMPLEADOS
ALTER TABLE empleados
ADD COLUMN 
correoElectronico varchar(100);

## MODIFICAR EL TIPO DE DATO DE UN CAMPO
ALTER TABLE empleados
MODIFY COLUMN salario
DECIMAL(12,2) not null;
## RENOMBRAR UN CAMPO
ALTER TABLE empleados
RENAME COLUMN correoElectronico to email;

## CREAR TABLA DEPARTAMENTOS
CREATE TABLE departamentos(
    IdDepartamento int not null auto_increment PRIMARY KEY,
    nombreDepto varchar(100)
);

## AGREGAR UN CAMPO A LA TABLA EMPLEADOS,
## PAA QUE SEA UNA FOREING KEY
ALTER TABLE empleados 
ADD COLUMN IdDepartamento int not null;

## AGREGAR LLAVE FORANEA
ALTER TABLE empleados
ADD CONSTRAINT fk_empleados_departamento
FOREIGN KEY(IdDepartamento)
REFERENCES departamentos(IdDepartamento);

## ELIMINAR LA PRIMARY KEY DE EMPLEADOS
ALTER TABLE empleados
DROP primary key;

## ELIMINAR LA FOREING KEY DE LA TABLA EMPLEADOS
ALTER TABLE empleados
DROP foreign key fk_empleados_departamento;

## ELIMINAR EL AUTOINCREMENT
ALTER TABLE departamentos
MODIFY COLUMN IdDepartamento INT NOT NULL;

## ELIMINAR LA PRIMARY KEY DE DEPARTAMENTO
ALTER TABLE departamentos
DROP primary key;


## CREAR UN CONSTRAINT DE VERIFICACION
## EN SALARIO
ALTER TABLE empleados
ADD CONSTRAINT chk_salario
CHECK (salario > 0.0);



CREATE TABLE categoria(
    Id int not null PRIMARY KEY DEFAULT -1,
    nombre varchar(20),
    estatus char(1) default 'A'
    );

INSERT INTO categoria
VALUES (1, 'Carnes', 'D');

INSERT INTO categoria
VALUES (DEFAULT, 'Carnes', default);

SELECT * FROM categoria;

DROP TABLE categoria;

## ELIMINAR LA COLUMNA EMAIL
ALTER TABLE empleados
DROP COLUMN email;


ALTER TABLE empleados
ADD CONSTRAINT pk_empleados
PRIMARY KEY(IdEmpleado);

ALTER TABLE departamentos
ADD CONSTRAINT pk_departamentos
PRIMARY KEY(IdDepartamento);



## ELIMINAR LAS TABLAS
DROP TABLE empleados;

DROP TABLE departamentos;

DROP TABLE categoria;


use master;
-- ELIMINAR BASE DE DATOS
DROP DATABASE empresapatito;