import sqlite3
import pandas as pd
import matplotlib.pyplot as plt

#OBTENIENDO LOS 10 PRODUCTOS MAS RENTABLES
conn = sqlite3.connect("Northiwind.db")
query = '''    
    SELECT ProductName, SUM(Price * Quantity) AS Revenue FROM OrderDetails od
    JOIN Products p ON p.ProductID = od.ProductID
    GROUP BY od.ProductID
    ORDER BY Revenue DESC
    LIMIT 10
'''

top_products = pd.read_sql_query(query,conn)
top_products.plot(x="ProductName",y="Revenue",kind="bar",figsize=(10,5),legend=False)

plt.title("10 productos mas rentables")
plt.xlabel("Products")
plt.ylabel("Revenue")
plt.xticks(rotation=90)
plt.show()

#OBTENIENDO LOS 10 EMPLEADOS MAS EFICIENTES
query2 = '''
SELECT FirstName || " " || LastName AS Employee, COUNT(*) as Total FROM Orders o 
JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY o.EmployeeID
ORDER BY Total DESC
'''

top_employees = pd.read_sql_query(query2,conn)
top_employees.plot(x="Employee",y="Total",kind="bar",figsize=(10,5),legend=False)

plt.title("10 Empleados más efectivos")
plt.xlabel("Empleados")
plt.ylabel("Total vendido")
plt.xticks(rotation=45)
plt.show()

