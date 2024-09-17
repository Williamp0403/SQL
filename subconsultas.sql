--// Obtener el productID, la cantidad vendida y el nombre del producto de las tablas OrderDetails y Products.
SELECT ProductID,Quantity,
	(SELECT ProductName FROM Products WHERE OrderDetails.ProductID = ProductID) AS Name
FROM OrderDetails

--// Obtener la cantidad total de prodcutos vendidos y el total recaudado de las tablas OrderDetails y Products
SELECT ProductID,
   (SELECT ProductName FROM Products WHERE OD.ProductID = ProductID) AS Nombre,
	SUM(Quantity) AS cantidad_vendido,
	(SUM(Quantity)*(SELECT Price FROM Products WHERE OD.ProductID = ProductID)) AS total_recaudado
FROM OrderDetails OD
GROUP BY ProductID
ORDER BY total_recaudado DESC

--// Subconsulta en un FROM
SELECT Nombre,total_recaudado FROM(
SELECT ProductID,
   (SELECT ProductName FROM Products WHERE OD.ProductID = ProductID) AS Nombre,
	SUM(Quantity) AS cantidad_vendido,
	(SUM(Quantity)*(SELECT Price FROM Products WHERE OD.ProductID = ProductID)) AS total_recaudado
FROM OrderDetails OD
GROUP BY ProductID
ORDER BY total_recaudado DESC
)

--// Subconsulta en un WHERE
SELECT ProductID,
	ProductName,
	Price,
	(SELECT SUM(Quantity) FROM OrderDetails WHERE Products.ProductID = ProductID) AS Quantity
FROM Products
WHERE Quantity > 200
ORDER BY Quantity

--// Ejericicio
SELECT FirstName,LastName,
(SELECT SUM(od.Quantity) FROM Orders o, OrderDetails od
WHERE o.EmployeeID = e.EmployeeID AND od.OrderID = o.OrderID) as unidades_totales
FROM Employees e
WHERE unidades_totales < (SELECT AVG(unidades_totales) FROM (
SELECT(SELECT SUM(od.Quantity) FROM Orders o, OrderDetails od
WHERE o.EmployeeID = e2.EmployeeID AND od.OrderID = o.OrderID) as unidades_totales
FROM Employees e2
GROUP BY e2.EmployeeID
))