-- CONSULTAS AVANZADAS
-- HALLAR TODOS LOS REPRESENTANTES QUE O BIEN:
-- a) TRABAJAN EN DAIMIEL, NAVARRA O CASTELLÓN; o bien: 22,11,12
-- b) NO TIENEN JEFE Y ESTAN CONTRATADOS DESDE JUNIO DE 1988; O
-- c) SUPERAN SU CUOTA PERO TIENEN VENTAS DE 600,000 O MENOS

USE BDEJEMPLO2

SELECT r.Num_Empl as [Numero Empleado],
       r.Nombre as [Nombre Empleado],
       r.Fecha_Contrato as [Fecha de Contrato],
       r.Cuota as [Cuota de ventas],
       r.Ventas as [Ventas totales],
       o.Ciudad as [Ciudad de la Oficina],
       r.Jefe AS [NUmero de Jefe]
FROM Representantes as r
INNER JOIN Oficinas as o
ON o.Oficina = r.Oficina_Rep
WHERE (o.Ciudad IN ('Daimiel', 'Navarra', 'Castellón')) OR
      (Jefe IS NULL AND Fecha_Contrato >= '1988-06-01') OR
      (r.Ventas > Cuota AND r.Ventas <= 600000);

-- LISTAR TODOS LOS PEDIDOS MOSTRANDO EL NUMERO DE PEDIDO, SU IMPORTE, EL NOMBRE, LIMITE DE CREDIO DEL CLIENTE

SELECT p.Num_Pedido as [NUMERO DE PEDIDO],
       p.Importe as [IMPORTE DEL PEDIDO],
       c.Empresa as [NOMBRE DEL PEDIDO],
       c.Limite_Credito as [LIMITE DE CREDITO DEL CLIENTE]
FROM Pedidos as p
INNER JOIN Clientes as c
ON c.Num_Cli = p.Cliente



-- Listar las oficinas con un objetivo superior a 600000
-- mostrando el nombre de la ciudad, nombre representante y su puesto

SELECT O.Ciudad AS [Oficina],
       R.Nombre AS [Representante],
       R.Puesto AS [Puesto],
       O.Objetivo AS [Objetivo]
FROM Oficinas AS O
INNER JOIN Representantes AS R
ON o.Jef = R.Num_Empl
WHERE O.Objetivo > 600000;

-- Listar todos los pedidos, mostrando el numero de pedido, el importe, el nombre, limite de credito del cliente

SELECT P.Num_Pedido AS [Numero Pedido],
       P.Importe AS [Importe],
       C.Empresa AS [Cliente],
       C.Limite_Credito AS [Limite de Credito]
FROM Pedidos AS P
INNER JOIN Clientes AS C
ON P.Cliente = C.Num_Cli


SELECT *
FROM Pedidos AS P
INNER JOIN Clientes AS C
ON P.Cliente = C.Num_Cli

-- Listar cada representqantew mostrando su nombre, la ciudad y la region en la que trabaja

SELECT R.Nombre AS [Nombre Representante],
       O.Ciudad AS [Ciudad],
       O.Region AS [Region]
FROM Oficinas AS O
INNER JOIN Representantes AS R
ON O.Oficina = R.Oficina_Rep


-- Listar las Oficinas (Ciudad), nombres y puestos de sus jefes
SELECT O.Ciudad AS [Ciudad],
       R.Nombre AS [Nombre],
       R.Puesto AS [Puesto Jefe]
FROM Oficinas AS O
INNER JOIN Representantes AS R
ON O.Jef = R.Num_Empl

-- Listar todoss los pedidos, mostrando el numero de pedido, el importe y la cantidad de cada producto

SELECT Pe.Num_Pedido AS [Numero Pedido],
       Pe.Importe AS [Importe],
       Pr.Descripcion AS [Descripcion],
       Pr.Stock AS [Cantidad]
FROM Productos AS Pr
INNER JOIN Pedidos AS Pe
ON (Pr.Id_fab = Pe.Fab) AND (Pr.Id_producto = Pe.Producto)


-- Listar los nombres de los empleado y los nombres de sus jefes

SELECT Empleado.Nombre AS [Nombre Empleado],
       Jefe.Nombre AS [Nombre Jefe]
FROM Representantes AS Empleado
INNER JOIN Representantes AS Jefe
ON Jefe.Num_Empl = Empleado.Jefe


select *
from Representantes


-- Listar los pedidos con un importe superior a 25,000
-- NUmero del pedido, Importe, el nombre del representante que tomo nota del pedido y el nombre del cliente

SELECT P.Num_Pedido AS [Numero Pedido],
       P.Importe AS [Importe],
       R.Nombre AS [Nombre Representante],
       C.Empresa AS [Cliente]
FROM Representantes AS R
INNER JOIN Pedidos AS P
ON R.Num_Empl = P.Rep
INNER JOIN Clientes AS C
ON P.Cliente = C.Num_Cli
WHERE P.Importe > 25000

-- Listar los pedidos superiores a 25,000 mostrando el numero de pedido, nombre del cliente, 
-- nombre del representante asignado del cliente y el importe

SELECT P.Num_Pedido AS [Numero Pedido],
       C.Empresa AS [Cliente],
       R.Nombre AS [Nombre Representante],
       P.Importe AS [Importe]
FROM Clientes AS C
INNER JOIN Pedidos AS P
ON C.Num_Cli = P.Cliente
INNER JOIN Representantes AS R
ON C.Rep_Cli = R.Num_Empl
WHERE P.Importe > 25000 

use BDEJEMPLO2
use ndg1joins;

SELECT *
FROM Categoria;

SELECT *
FROM Producto;

--INNER JOIN 

SELECT *
FROM Categoria AS c
JOIN Producto AS p
ON c.Categoriaid = p.Categoria;

--left join ó LEFT OUTER HOUN 
--la primera tabla que aparece en la lista en el from es la tabla izquierda

SELECT *
FROM Categoria AS c
LEFT JOIN Producto AS p
ON c.Categoriaid = p.Categoria;

--mostrar todos las categrorias que no tengan productos asignados

SELECT c.Categoriaid, c.nombre
FROM Categoria AS c
LEFT JOIN Producto AS p
ON c.Categoriaid IS NULL;

--RIGT JOIN o RIGHT OUTER JOIN 
--TOMA TODOS LOS DATRO SDE LA TABLA DERECHA Y LOS QUE NO COINSIDEN CON LA TABLA IZQUIERDA, 
--Y OS QUE NO COINSIDE LOS POER EN NULL


--selecciona todos aquellos productos que no tinen categoria asignada


SELECT p.Nombre AS [NOMBRE PRODUCTO],
	   P.Precio AS [PRECIO]
FROM Categoria AS c
RIGHT JOIN Producto AS p
ON c.Categoriaid = p.Categoria
where Categoria is null;

--FULL JOIN 

--Obtiene los datos de la tabla izquierda , los datos de la tabla derecha 
--y todoslas coisidencias entre las dos

SELECT p.Nombre AS [NOMBRE PRODUCTO],
	   P.Precio AS [PRECIO]
FROM Categoria AS c
FULL JOIN Producto AS p
ON c.Categoriaid = p.Categoria

--PRODUCTO CARTESIAN
SELECT *
FROM Categoria AS c
CROSS JOIN Producto AS p;



SELECT *
FROM Categoria AS c,
	 Producto AS p

	 SELECT *
FROM Categoria AS c,
	 Producto AS p
WHERE c.Categoriaid = p.Categoria;


--agregacion 
--count(*),----Cuenta las filas 
--count(campo),  ----Cueta filas pero no los null
--min(),  -----------Obtiebe el valor minimo de un campo
--max() ,-----------Obtiebe el valor maximo de un campo
--avg(), -----------Obtine la medio aritmetica o el promedio
--sum()------------ Obtiene el total o la sumatoria 


use NORTHWND;

--CUATOS CLIENTES HAY
SELECT COUNT(*) AS [NUMERO CLIETES]
FROM Customers;

--CUATAS VENTAS HE REALIZADO
SELECT COUNT(*)
FROM Orders;

--CUNATAS VENTAS SE REALIZARON EN 1996
SELECT COUNT(*)
FROM Orders
WHERE DATEPART(YEAR, OrderDate) = 1996;

--SELECCIONAR LA VENTA DE LA FECHA MAS ANTIGUA QUE SE HIZO
SELECT MIN(OrderDate) AS [FECHA DE RIMERA VENTA]
FROM Orders;

--SELECCIONAR EL TOTAL QUE SE HA VENDIDO 
SELECT SUM(UnitPrice * Quantity) AS [TOTAL DE VENTAS]
FROM [Order Details]

--SELECIONAR EL TOTAL DE VENTAS ENTRE 1996 Y 1997
SELECT SUM(UnitPrice * Quantity) AS [TOTAL DE VENTAS]
FROM [Order Details] AS od
INNER JOIN Orders AS o
ON o.OrderID = od.OrderID
WHERE DATEPART(YY,OrderDate) BETWEEN 1996 AND 1997
AND O.CustomerID = 'AROUT';

--SELECCIONAR LAS VENTAS TOTALES HECHAS A CADA UNO DE LOS CLINETES 
SELECT o.CustomerID AS [Cliente],
SUM(UnitPrice * Quantity) AS [Total de Ventas]
FROM [Order Details] as od
INNER JOIN Orders as o
ON o.OrderID = od.OrderID
INNER JOIN Customers AS c
ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName

