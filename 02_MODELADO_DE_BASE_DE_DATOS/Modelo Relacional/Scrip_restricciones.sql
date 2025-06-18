-- Crear Base de Datos
CREATE DATABASE restriccionesbdg1;

--Utilizar la base de datos
USE restriccionesbdg1;

--Crear la tabla categoria
CREATE TABLE categoria(
categoriaid int,
nombre nvarchar(30)
);

INSERT INTO categoria
VALUES(1,'Carnes Frìas');

INSERT INTO categoria
VALUES(1 ,'Vinos y Licores');

INSERT INTO categoria
VALUES(Null ,'Ropa');

SELECT * FROM categoria;

DROP TABLE categoria;

CREATE TABLE categoria(
categoriaid int not null,
nombre nvarchar(30),
CONSTRAINT pk_categoria
PRIMARY KEY(categoriaid)
);

INSERT INTO categoria
VALUES(1,'Carnes Frìas');

INSERT INTO categoria
VALUES(2 ,'Vinos y Licores');

INSERT INTO categoria
VALUES(3 ,'Ropa');

INSERT INTO categoria
VALUES(4 ,'Ropa');

DROP TABLE categoria;

CREATE TABLE categoria(
categoriaid int not null,
nombre nvarchar(30) not null,
CONSTRAINT pk_categoria
PRIMARY KEY(categoriaid),
CONSTRAINT unique_nombre
UNIQUE(nombre),
);

INSERT INTO categoria
VALUES(1,'Carnes Frìas');

INSERT INTO categoria
VALUES(2,'Vinos y Licores');

CREATE TABLE categoria(
categoriaid int not null,
nombre nvarchar(30) not null,
CONSTRAINT pk_categoria
PRIMARY KEY(categoriaid),
CONSTRAINT unique_nombre
UNIQUE(nombre),
);


DROP TABLE producto;

CREATE TABLE producto(
productoid int not null,
nombreprod nvarchar(20) not null,
precio money not null,
existencia numeric(10,2) not null,
categoria int,
CONSTRAINT pk_producto
primary key(productoid),
CONSTRAINT unique_nombreprod
UNIQUE(nombreprod),
CONSTRAINT chk_precio
CHECK(precio>0 and precio<=4000),
CONSTRAINT chk_existencia
CHECK(existencia>=0),
CONSTRAINT fk_producto_caategoria
FOREIGN KEY(categoria)
REFERENCES categoria (categoriaid)
);

INSERT INTO categoria
VALUES(1,'Carnes Frìas');

INSERT INTO categoria
VALUES(8,'Ropa de Shein');

INSERT INTO categoria
VALUES(2,'Vinos y Licores');

INSERT INTO producto
VALUES (1, 'Tonayan', 4000, 4, 2);

INSERT INTO producto
VALUES (2, 'Tonayan2', 1250.2, 40, 2);

INSERT INTO producto
VALUES (3, 'Bucaña', 200, 8, 2);

INSERT INTO producto
VALUES (4, 'Calzon Chino', 6.3, 890, 8);

SELECT * FROM producto

select *
from producto as p
INNER JOIN categoria as c
ON c.categoriaid = p.categoria;