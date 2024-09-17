--// AS (como): cambia el nombre del campo temporalmente //--
SELECT LastName AS apellido FROM Employees
SELECT LastName AS apellido, FirstName AS nombre FROM Employees

--// ORDER BY (Ordenar por): ordena los registros //--                               null
-- ASC: de forma ascendente.                                                         numeros
SELECT * FROM Products                                                        caracteres especiales
ORDER BY Price ASC                                                                   letras
-- DESC: de forma descendente.
SELECT * FROM Products
ORDER BY Price DESC
-- NULLS LAST: los datos nulos aparecen de ultimo.
SELECT * FROM Products
ORDER BY ProductName ASC NULLS LAST
-- NULLS FIRST: los datos nulos aparecen de primero.
SELECT * FROM Products
ORDER BY ProductName DESC NULLS FIRST
-- RAMDOM: los ordena de forma aleatoria.
SELECT * FROM Products
ORDER BY RANDOM()

--// DISTINCT (distinto): selecciona solo los valores unicos, si hay iguales, no se repiten //--
SELECT DISTINCT ProductName FROM Products
 
--// WHERE (donde): es una clausula de condiciones para filtrar registros //--
SELECT ProductName FROM Products 
WHERE ProductID = 20

--// UPDATE (actualizar) //--
UPDATE turnos_medicos SET horario = "12:00"
WHERE id_turno = 1;
SELECT * from turnos_medicos

--// AND (y)  //--
SELECT * from customers 
WHERE CustomerID >= 50 AND CustomerID < 55

--// OR (o) //--
SELECT * from employees 
WHERE firstName = "Nancy" OR firstName = "Andrew"

--// NOT (no) //--
SELECT * from customers
WHERE NOT country = "USA"

--// IN (en) //--
SELECT * FROM products
WHERE SupplierID IN (2,5)

SELECT * FROM products
WHERE SupplierID NOT IN (2,5)

--// LIMIT //--
SELECT * FROM products
WHERE NOT CategoryID = 6 AND NOT SupplierID = 1 AND price <= 30
ORDER BY RANDOM()
LIMIT 3

--// BETWEEN (entre) //--
SELECT * FROM products
WHERE price BETWEEN 20 AND 30

SELECT * FROM employees 
WHERE BirthDate BETWEEN "1950-0-1" AND "1960-0-1"

--// Like //--
--// Comodin %:
SELECT * FROM employees 
WHERE LastName LIKE "%r"

SELECT * FROM employees 
WHERE LastName LIKE "%er%"
--// Comodin _
SELECT * FROM employees 
WHERE lastName LIKE "_u____"

SELECT * FROM employees 
WHERE lastName LIKE "_u_%"

--// IS NULL (es nulo) //--
SELECT * FROM products
WHERE ProductName IS NULL
ORDER BY ProductName ASC

SELECT * FROM products
WHERE ProductName IS NOT NULL
ORDER BY ProductName ASC

--// GROUP BY (agrupar por): Agrupa los registros de una columna dependiendo del valor del campo //--
SELECT CategoryID,ROUND(AVG(price)) AS promedio FROM Products 
WHERE CategoryID IS NOT NULL
GROUP BY CategoryID
ORDER BY promedio DESC

--// HAVING: se utiliza para filtrar grupos //--
SELECT SupplierID,ROUND(AVG(Price)) AS promedio FROM Products
WHERE SupplierID IS NOT NULL 
GROUP BY SupplierID
HAVING promedio > 40

SELECT ProductID, SUM(Quantity) AS suma_de_productos FROM OrderDetails
GROUP BY ProductID
HAVING suma_de_productos > 50
ORDER BY suma_de_productos DESC
LIMIT 1

--// VIEW: es un tabla virtual que permite acceder y manipular datos almacenados en una o varias tablas como si fuera una tabla individual //--
-- Creando tabla virtual
CREATE VIEW productos_simplificados as  
SELECT ProductID,ProductName,Price FROM Products
WHERE ProductID > 20
ORDER BY ProductID DESC
-- Llamando a al tabla virtual
SELECT * FROM productos_simplificados
-- Como eliminar la tabla virtual
DROP VIEW IF EXISTS productos_simplificados