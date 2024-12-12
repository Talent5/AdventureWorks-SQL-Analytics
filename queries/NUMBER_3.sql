-- Question 3: Joins with Four Tables and Filtering
-- Identify sales representatives who handled at least 50 orders in 2013-2014 combined but have no orders in 2015.
-- Display SalesRepFullName, TotalOrders2013_2014, TotalRevenue2013_2014, and HireDate.
-- Order results by TotalRevenue2013_2014 in descending order.

-- Step 1: Join SalesOrderHeader with related tables to access sales and personnel data.
-- Step 2: Filter orders by year (2013-2014) and exclude representatives with orders in 2015.
-- Step 3: Aggregate data to calculate total orders and revenue for each representative.

SELECT 
    CONCAT(pp.FirstName, ' ', pp.LastName) AS SalesRepFullName, -- Full name of the sales representative
    COUNT(soh.SalesOrderID) AS TotalOrders2013_2014, -- Total orders handled in 2013-2014
    SUM(soh.TotalDue) AS TotalRevenue2013_2014, -- Total revenue generated in 2013-2014
    e.HireDate -- Hire date of the sales representative
FROM 
    Sales.SalesOrderHeader soh
JOIN 
    Sales.SalesPerson sp ON soh.SalesPersonID = sp.BusinessEntityID
JOIN 
    Person.Person pp ON sp.BusinessEntityID = pp.BusinessEntityID
JOIN 
    HumanResources.Employee e ON sp.BusinessEntityID = e.BusinessEntityID
WHERE 
    YEAR(soh.OrderDate) IN (2013, 2014) -- Filter orders from 2013 and 2014
GROUP BY 
    CONCAT(pp.FirstName, ' ', pp.LastName), 
    e.HireDate
HAVING 
    COUNT(CASE WHEN YEAR(soh.OrderDate) = 2015 THEN 1 ELSE NULL END) = 0 -- Exclude representatives with orders in 2015
    AND COUNT(soh.SalesOrderID) >= 50 -- Include representatives with at least 50 orders in 2013-2014
ORDER BY 
    TotalRevenue2013_2014 DESC; -- Order by revenue in descending order
GO