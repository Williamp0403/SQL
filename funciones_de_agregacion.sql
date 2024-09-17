--// COUNT(): devuelve la cantidad de valores de una columna //--
SELECT COUNT(ProductName) AS Cantidad_de_productos FROM products

--// SUM(): suma la cantidad de valores de una columna //--
SELECT SUM(Price) AS suma_de_precios FROM products

--// AVG(): calcula el promedio de los valores de una columna //--
SELECT AVG(Price) AS promedio_de_precios FROM products

--// ROUND(): redondea un valor //-- 
SELECT ROUND(AVG(Price),4) AS promedio_de_precios_redondeada FROM products

--// MIN(): devuelve el menor valor de una columna //--
SELECT MIN(price) AS minino FROM products
WHERE ProductName IS NOT NULL

--// MAX(): devuelve el mayor valor de una columna //--
SELECT MAX(price) AS maximo FROM products