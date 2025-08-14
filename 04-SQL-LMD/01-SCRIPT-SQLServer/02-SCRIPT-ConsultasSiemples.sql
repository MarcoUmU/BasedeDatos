use Northwind;
go

select * 
from Customers; 

--seleccionar todos los costuer slecionando solomante la clase, nombre,la cuidad y el pais(Proyeccion)

select CustomerID as NumeroCliente, CompanyName as 'Nombre cliente' ,City as Ciudad,Country as [Ciudad chida]
from Customers;

--campos calculados
--seleccionar las ordenes de compra mostrando los productos, la cantidad, el precio, descuento y el total

Select  ProductID as [Nombre Producto],UnitPrice as [Precio],
		Quantity as Cantidad,Discount as [Descuento] ,
		(UnitPrice*Quantity) As [Importe sin descuento],
		(UnitPrice*Quantity*(1-Discount)) As [Importe ]
from [Order Details]


--mostrar ordenes de compra mostrando el cliente al que se le vendio, el empleado que la realizo, la fecha de la orden
--el transportista y la fecha de la orden hay que dividirla en año, mes, dia, trimestre

select OrderID as [Numero de orden],OrderDate as [Fecha orden],CustomerID[Cliente],
EmployeeID as [Empleado],ShipVia as [Transportista],
Year(OrderDate) as [Año de la compra], Month(OrderDate) as [mes de la compra],
Day(OrderDate) as [Dia dre al compra] 

from Orders;


select OrderID as [Numero de orden],
OrderDate as [Fecha orden],
CustomerID[Cliente],
EmployeeID as [Empleado],
ShipVia as [Transportista],
DATEPART(YEAR, OrderDate) as [Año de la compra], 
DATEPART(MM, OrderDate) as [mes de la compra],
DATEPART(D, OrderDate) as [Dia dre al compra],
DATEPART(QQ, OrderDate) as [Trimestre],
DATEPART(WEEK, OrderDate) as [Semana],
DATEPART(WEEKDAY, OrderDate) as [Dia Semana],
DATENAME(WEEKDAY, OrderDate) as [Nombre Dia]
FROM Orders
ORDER BY 9 ASC;

-- SELECCIONAR TODOS LOS PRODUCTOS QUE SU PRECIO SEA MAYOR A 40.3
-- mostrar numero de producto, nombre del produto y precio unitario

SELECT ProductID as [Numero de Producto],
       ProductName as [Nombre Producto],
       UnitPrice as [Precio]
FROM Products
WHERE UnitPrice > 40.3;

SELECT ProductID as [Numero de Producto],
       ProductName as [Nombre Producto],
       UnitPrice as [Precio]
FROM Products
WHERE ProductName = 'Carnarvon Tigers';

SELECT ProductID as [Numero de Producto],
       ProductName as [Nombre Producto],
       UnitPrice as [Precio]
FROM Products
WHERE ProductName <> 'Carnarvon Tigers';

SELECT ProductID as [Numero de Producto],
       ProductName as [Nombre Producto],
       UnitPrice as [Precio]
FROM Products
WHERE ProductName != 'Carnarvon Tigers';

-- SELECCIONAR TODAS LAS ORDENES QUE SEAN DE BRAZIL  - RIO DE JANEIRO
-- MOSTRAR SOLO EL NUMERO DE ORDEN, FECHA ORDEN, PAIS DE ENVÍO, CIUDAD, TRANSPORTISTA

SELECT OrderID as [Numero de Orden],
       OrderDate as [Fecha de Orden],
       ShipCountry as [País de Envío],
       ShipCity as [Ciudad de Envío],
       ShipVia as [Transportista]
FROM Orders
WHERE ShipCountry = 'Brazil' AND ShipCity = 'Rio de Janeiro';


-- INNER JOIN
SELECT o.OrderID as [Numero de Orden],
       o.OrderDate as [Fecha de Orden],
       o.ShipCountry as [País de Envío],
       o.ShipCity as [Ciudad de Envío],
       s.ShipperID as [Numero de Transportista],
       s.CompanyName as [Transportista]
FROM Orders as o
INNER JOIN Shippers as s
ON s.ShipperID = o.ShipVia
WHERE ShipCountry = 'Brazil' AND ShipCity = 'Rio de Janeiro';

--SELECCIONAR TODAS ORDENES
-- MOSTRANDO LO MISMO QUE LA CONSULTA ANTERIOR
-- PERO SOLO AQUELLAS QUE NO TENGAN REGION DE ENVIO

SELECT OrderID as [Numero de Orden],
       OrderDate as [Fecha de Orden],
       ShipCountry as [País de Envío],
       ShipCity as [Ciudad de Envío],
       ShipVia as [Transportista]
FROM Orders
WHERE ShipRegion is not Null;

--SELECICONAR TODAS LAS ORDENES ENVIADAS A BRAZIL, ALEMANIA Y TENGAN REGION
-- ORDENAS DE FORMA ASCENDENTE POR EL SHIPCOUTRY

SELECT OrderID as [Numero de Orden],
       OrderDate as [Fecha de Orden],
       ShipCountry as [País de Envío],
       ShipCity as [Ciudad de Envío],
       ShipVia as [Transportista],
       ShipRegion as [Region]
FROM Orders
WHERE (ShipCountry = 'Brazil' OR ShipCountry = 'Germany' OR ShipCountry = 'Mexico') AND ShipRegion is not NUll;


--ordenar -> ordenar los datos de forma ascendente y desendente
--seleccionar los empleados por su pais 

SELECT (TitleOfCourtesy + ' ' + FirstName + ' ' + LastName) As [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees

SELECT CONCAT(TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) As [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER by Country ASC;

SELECT CONCAT(TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) As [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER by 2 DESC;

SELECT CONCAT(TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) As [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER by CONCAT(TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) As [Nombre Completo]  DESC;

SELECT CONCAT(TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) As [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY [Nombre Completo]  DESC;

SELECT CONCAT(TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) As [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY Country,City  ;

USE BDEJEMPLO2;
GO


--seleccionar cuantos puestos diferentes tiene los representantes

select DISTINCT Puesto 
from Representantes;

--cUANTOS PUESTOS DIFERENTES TIENEN LOS REPRESENTANTES
--FUNCIONES AGREGADO (COUNT *, COUNT [CAMPO],MAX,MIN, SUM. AUG)

select  COUNT (DISTINCT Puesto) AS [NO. PUESTOS]
from Representantes;

--SELECIONAR EL PRECIO MINIMO DE LOS PRODUCTOS
select  MIN ( PRECIO) AS [PRECIO MIN]
from Productos;

--LISTAR LAS OFICIONAS CUYAS VENTAS ESTAN POR DEBAJO DEL 80% DE SUS OBJETIVOS

SELECT *
FROM Oficinas;

--MOSTRAR CIUDAD, VENTAS Y EL OBJETIVO

SELECT Ciudad, Ventas, Objetivo, (.8 * Objetivo) AS [80% del Objetivo]
FROM Oficinas
WHERE Ventas < (.8 * Objetivo);

--SELECCIONAR LOS PRIMEROS 5 REGISTROS DE LOS PEDIDOS
SELECT TOP 5 Num_Pedido, Fecha_Pedido, Cantidad, Importe
FROM Pedidos
ORDER BY Importe DESC;

--TEST DE RANGO (BETWEEN)
--HALLAR LOS PEDIDOS DEL ULTIMO TRIMESTRE DE 1989

SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
WHERE Fecha_Pedido BETWEEN '1989-10-01' AND '1989-12-31'
ORDER BY Fecha_Pedido DESC;

SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
WHERE Fecha_Pedido >= '1989-10-01' AND Fecha_Pedido <= '1989-12-31'
ORDER BY Fecha_Pedido DESC;

SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
WHERE DATEPART(QUARTER, Fecha_Pedido) = 4
ORDER BY Fecha_Pedido DESC;

-- HALLAR LOS PEDIDOS QUE TIENEN UN IMPORTE ENTRE 30,000 Y 39,999.99

SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
WHERE Importe BETWEEN 30000 AND 39999.99;

--LISTAR LOS REPRESENTANTES CUYAS VENTAS NO SE ENCUENTRE ENTRE 80% Y EL 120% DE SU CUOTA
SELECT *
FROM Representantes
WHERE Ventas not BETWEEN (.8 * Cuota) AND (1.2 * Cuota);

SELECT *
FROM Representantes
WHERE NOT (Ventas >= (.8 * Cuota) AND Ventas <= (1.2 * Cuota));

--Test de pertenencia a conjuntos (IN)
-- HALLAR LOS PEDIDOS DE CUATRO REPRESENTANTES EN CONCRETO

SELECT Num_Pedido, Fecha_Pedido, Importe, REP
FROM Pedidos
WHERE REP IN (107, 109, 101, 103);

SELECT Num_Pedido, Fecha_Pedido, Importe, REP
FROM Pedidos
WHERE REP = 107 OR
      REP = 109 OR
      REP = 101 OR
      REP = 103;

SELECT Num_Pedido, Fecha_Pedido, Importe, REP
FROM Pedidos
WHERE REP NOT IN (107, 109, 101, 103);

SELECT Num_Pedido, Fecha_Pedido, Importe, REP
FROM Pedidos
WHERE NOT (REP = 107 OR
      REP = 109 OR
      REP = 101 OR
      REP = 103);

-- TEST DE ENCAJE DE PATRONES (LIKE)

SELECT *
FROM Clientes
WHERE Empresa LIKE '%er%';

--INNER JOIN
--     SELECT campo1,campo2,campo3
--     FROM tabla1
--     INNER JOIN 
--     tabla2
--     ON tabla1.campo = tabla2.campo;

USE BDEJEMPLO2;
GO

SELECT *
FROM Clientes
WHERE Empresa LIKE '[A-D]%'

SELECT *
FROM Clientes
WHERE Empresa LIKE '[ADf]%'

SELECT *
FROM Clientes
WHERE Empresa LIKE '_ilas'

SELECT *
FROM Clientes
WHERE Empresa LIKE '____'

SELECT *
FROM Clientes
WHERE Empresa LIKE '[^ADf]%'   --  ^  es una negacion   
                               --   en este caso seria, dame todos los que no tengan ADf



-- HALLAR TODOS LOS REPRESENTANTES QUE O BIEN:
-- a) TRABAJAN EN DAIMIEL, NAVARRA O CASTELLÓN; o bien: 22,11,12
-- b) NO TIENEN JEFE Y ESTAN CONTRATADOS DESDE JUNIO DE 1988; O
-- c) SUPERAN SU CUOTA PERO TIENEN VENTAS DE 600,000 O MENOS

SELECT *
FROM Representantes
WHERE (Oficina_Rep = 22 OR Oficina_Rep = 11 OR Oficina_Rep = 12) OR 
      ((Jefe is null) AND (Fecha_Contrato >= '1988-06-01')) OR 
      ((Ventas > Cuota) AND (Ventas <= 600000));
