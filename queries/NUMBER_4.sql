-- Question 4: Advanced Window Functions
-- Analyze sales trends for each sales representative.
-- Step 1: Calculate yearly sales total grouped by sales representative and year.
-- Step 2: Compute a rolling 3-year average of sales totals starting from 2012.
-- Step 3: Include only sales representatives active for at least 3 years (first sale in or before 2012).

WITH YearlySales AS (
    SELECT 
        sp.BusinessEntityID, -- Identifier for the sales representative
        CONCAT(pp.FirstName, ' ', pp.LastName) AS SalesRepFullName, -- Full name of the sales representative
        YEAR(soh.OrderDate) AS SalesYear, -- Year of the sale
        SUM(sod.LineTotal) AS YearlySalesTotal -- Total sales for the year
    FROM 
        Sales.SalesOrderHeader soh
    JOIN 
        Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
    JOIN 
        Sales.SalesPerson sp ON soh.SalesPersonID = sp.BusinessEntityID
    JOIN 
        Person.Person pp ON sp.BusinessEntityID = pp.BusinessEntityID
    WHERE 
        YEAR(soh.OrderDate) >= 2012 -- Only consider sales from 2012 onwards
    GROUP BY 
        sp.BusinessEntityID, 
        CONCAT(pp.FirstName, ' ', pp.LastName), 
        YEAR(soh.OrderDate)
    HAVING 
        MIN(YEAR(soh.OrderDate)) >= 2012 -- Include representatives with sales in or before 2012
)
SELECT 
    SalesRepFullName, -- Full name of the sales representative
    SalesYear, -- Year of the sale
    YearlySalesTotal, -- Total sales for the year
    AVG(YearlySalesTotal) OVER (PARTITION BY SalesRepFullName ORDER BY SalesYear ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Rolling3YearAverage -- Rolling 3-year average of sales totals
FROM 
    YearlySales
ORDER BY 
    SalesRepFullName, SalesYear; -- Order results by sales representative and year
GO