--Q1--From the humanresources.employee table, write a query in SQL to retrieve all fields and records from the employee table in the adventure works database.
--sort the result in ascending order of the job title.FOR SORTING, USE THE ORDER BY THEN SPECIFY YOUR COLUMN OF CHOICE.

SELECT * 
FROM HumanResources.Employee
ORDER BY BirthDate asc;


-- Q2.From the person.person table, write a query in SQL to retrieve all fields and records from the employee table using table aliasing in the 
--adventure works database. sort the output in ascending order on last name.

SELECT *
FROM Person.Person
ORDER BY LastName asc;


--- Q3. From the production.product table, write a query that displays the productid, name, and color columns.display only the rows in which the colors is not blue.

SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color!= 'Blue'

-- Q4.From the person.person table,write a query in SQL to return all rows and a subset of the columns (FirstName, LastName, businessentityid) 
--from the person table in the AdventureWorks database. The third column heading is renamed to Employee_id. 
--Arranged the output in ascending order by lastname.

SELECT FirstName, LastName, BusinessEntityID as Employee_id
FROM Person.Person
ORDER BY LastName asc;

-- Q5.From the sales.salesorderheader table write a query in SQL to return all rows from the salesorderheader table in Adventureworks database 
--and calculate the percentage of tax on the subtotal as decided. Return salesorderid, customerid, orderdate, subtotal, percentage of tax column. 
--Arranged the result set in ascending order on subtotal

SELECT SalesOrderID, CustomerID, OrderDate, SubTotal, (TaxAmt/SubTotal) * 100 as [Tax Percent]
FROM Sales.SalesOrderHeader
ORDER BY SubTotal asc;


--Q6. From the humanresources.employee table write a query in SQL to create a list of unique jobtitles in the employee table in 
--Adventureworks database. Return jobtitle column and arranged the resultset in ascending order.

SELECT DISTINCT(JobTitle)
FROM HumanResources.Employee
ORDER BY JobTitle ASC;

--Q7. From the sales.salesorderheader table write a query in SQL to calculate the total freight paid by each customer. 
--Return customerid and total freight. Sort the output in ascending order on customerid

SELECT customerid, SUM(Freight) AS Total_Freight
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY CustomerID ASC;


--Q8.From the production.productinventory table, write a query in SQL to retrieve total quantity of each productid which are in shelf of
--'A' or 'C' or 'H'. Filter the results for sum quantity is more than 500. Return productid and sum of the quantity. 
--Sort the results according to the productid in ascending order.

SELECT productid, SUM(Quantity) as TotalQty
FROM Production.ProductInventory
WHERE Shelf in ('A','C', 'H')
GROUP BY productID
HAVING SUM(Quantity) > 500
ORDER BY ProductID asc;


--Q9.From the production.productinventory table, write a query in SQL to find the sum of the quantity of all combination 
--of group of distinct locationid and shelf column. Return locationid, shelf and sum of quantity as TotalQuantity.

SELECT LocationID, Shelf, SUM(Quantity) as TotalQuantity
FROM Production.ProductInventory
GROUP BY LocationID, Shelf;

-- Q10.From the Person.BusinessEntityAddress table write a query in SQL to retrieve the number of employees for each City. Return city and number of employees. 
--Sort the result in ascending order on city

SELECT city, COUNT(BusinessEntityID) as [Number of Employees]
FROM Person.BusinessEntityAddress as BE
JOIN Person.Address as A
on A.AddressID =BE.AddressID
GROUP BY City
ORDER BY City asc;





