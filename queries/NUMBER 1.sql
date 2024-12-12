-- Question 1: Subqueries
-- Find the ProductID, Name, and ListPrice of the top 5 most expensive products in each ProductSubcategoryID.
-- Only include subcategories that have at least 5 products.
-- Display the ProductSubcategoryID and the average ListPrice of products in each subcategory alongside the results.

-- Step 1: Use a subquery to calculate the rank of each product based on ListPrice within its subcategory.
-- Step 2: Filter out subcategories with fewer than 5 products.
-- Step 3: Join the results to include ProductSubcategoryID and the average ListPrice.

SELECT 
    p.ProductID, 
    p.Name, 
    p.ListPrice, 
    ps.ProductSubcategoryID, 
    AVG(p.ListPrice) OVER (PARTITION BY ps.ProductSubcategoryID) AS AverageListPrice
FROM 
    Production.Product p
JOIN 
    Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE 
    ps.ProductSubcategoryID IN (
        SELECT ProductSubcategoryID
        FROM Production.Product
        GROUP BY ProductSubcategoryID
        HAVING COUNT(*) >= 5 -- Only include subcategories with at least 5 products
    )
    AND p.ProductID IN (
        SELECT ProductID
        FROM (
            SELECT 
                ProductID, 
                RANK() OVER (PARTITION BY ProductSubcategoryID ORDER BY ListPrice DESC) AS RankWithinSubcategory
            FROM Production.Product
        ) RankedProducts
        WHERE RankWithinSubcategory <= 5 -- Top 5 products within each subcategory
    );
GO