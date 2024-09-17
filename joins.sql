--// CROSS JOIN (unión cruzada) //-- 
SELECT * FROM Employees, Orders 

SELECT * FROM Employees CROSS JOIN Orders 

--// INNER JOIN (unión interna) //--
SELECT * FROM Employees e CROSS JOIN Orders o
WHERE e.EmployeeID = o.EmployeeID

SELECT * FROM Employees e INNER JOIN Orders o
ON e.EmployeeID = o.EmployeeID

--// Ejercicio:
CREATE TABLE "Rewards" (
"RewardID" INTEGER,
"EmployeeID" INTEGER,
"Reward" INTEGER,
"Month" TEXT,
PRIMARY KEY("RewardID" AUTOINCREMENT)
)

INSERT INTO Rewards (EmployeeID,Reward,Month) VALUES
(3,200,"January"),
(2,180,"February"),
(5,250,"March"),
(1,280,"April"),
(8,160,"May"),
(null,null,"June")
--// INNER JOIN
SELECT FirstName,RewardID,Reward,Month FROM Employees e 
INNER JOIN Rewards r ON e.EmployeeID = r.EmployeeID
--// LEFT JOIN
SELECT FirstName,RewardID,Reward,Month FROM Employees e 
LEFT JOIN Rewards r ON e.EmployeeID = r.EmployeeID
--// RIGHT JOIN
SELECT FirstName,RewardID,Reward,Month FROM Employees e 
RIGHT JOIN Rewards r ON e.EmployeeID = r.EmployeeID
--// FULL JOIN
SELECT FirstName,RewardID,Reward,Month FROM Employees e
FULL JOIN Rewards r ON e.EmployeeID = r.EmployeeID