CREATE DATABASE TIENDA;
GO

USE TIENDA;
GO

CREATE TABLE Cliente(
 IdCliente int not null identity(1,1),
 nombreCliente varchar(25) not null,
 RFC varchar(25) not null,
 direccion varchar(25) not null,
 CONSTRAINT pk_cliente
 PRIMARY KEY (IdCliente),
 CONSTRAINT unique_RFC 
 UNIQUE(RFC),
);
 GO


 CREATE TABLE Pedido(
    IdPedido int not null identity(1,1),
    fecha date not null,
    IdCliente int,
    CONSTRAINT pk_pedido
    PRIMARY KEY(IdPedido),
    CONSTRAINT fk_pedido_cliente
    FOREIGN KEY(IdCliente)
    REFERENCES CLiente(IdCliente)
 );
 GO
 
 CREATE TABLE DetallePedido(
   IdProducto int,
   IdPedido int,
   precioVenta money not null,
   cantidadVendida int not null,
   CONSTRAINT pk_detalles
   PRIMARY KEY (IdProducto, IdPedido),
   CONSTRAINT chk_precioVenta
   CHECK (precioVenta > 0.0),
   CONSTRAINT chk_cantidadVendida
   CHECK (cantidadVendida > 0 and cantidadVendida < 10000),
   CONSTRAINT fk_detalles_productos
   FOREIGN KEY (IdProducto)
   REFERENCES Productos(IdProducto),
   CONSTRAINT fk_detalles_pedidos
   FOREIGN KEY (IdPedido)
   REFERENCES Pedido(IdPedido)
 );
 GO
 
 CREATE TABLE Productos(
    IdProducto int not null identity(1,1),
    nombreProducto varchar(25) not null,
    existencia int not null,
    precioUnitario money not null,
    IdCategoria int,
    CONSTRAINT pk_producto
    PRIMARY KEY (IdProducto),
    CONSTRAINT chk_existencia
    CHECK (existencia > 0 and existencia < 1000),
    CONSTRAINT chk_precioUnitario
    CHECK (precioUnitario > 0.0),
    CONSTRAINT unique_nombreProducto
    UNIQUE (nombreProducto),
    CONSTRAINT fk_producto_categoria
    FOREIGN KEY (IdCategoria)
    REFERENCES Categoria(IdCategoria)
 );
 GO

CREATE TABLE Categoria(
    IdCategoria int not null identity(1,1),
    NombreCategoria varchar(25) not null,
    CONSTRAINT pk_categoria
    PRIMARY KEY (IdCategoria)
 );
 GO