--// UNION: une dos o mas tablas, si hay filas repetidas con el mismo valor, solo muestra una
SELECT FirstName,RewardID,Reward,Month FROM Employees e 
LEFT JOIN Rewards r ON e.EmployeeID = r.EmployeeID
UNION
SELECT FirstName,RewardID,Reward,Month FROM Employees e 
RIGHT JOIN Rewards r ON e.EmployeeID = r.EmployeeID

--// UNION ALL: une dos o mas tablas, s hay filas repetidas, igual muestra todas
SELECT FirstName,RewardID,Reward,Month FROM Employees e 
LEFT JOIN Rewards r ON e.EmployeeID = r.EmployeeID
UNION ALL
SELECT FirstName,RewardID,Reward,Month FROM Employees e 
RIGHT JOIN Rewards r ON e.EmployeeID = r.EmployeeID