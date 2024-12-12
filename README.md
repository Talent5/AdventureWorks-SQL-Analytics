# AdventureWorks Database SQL Queries

## Overview
This repository contains a collection of SQL queries designed to analyze and explore the AdventureWorks2019 OLTP database. These queries were developed as part of a comprehensive practical examination in Big Data Technologies.

The AdventureWorks database is a robust sample dataset provided by Microsoft. It includes extensive information about a fictitious company that sells bicycles and related accessories, making it ideal for exploring various SQL concepts and techniques.

## Features
- **Subqueries**: Extract and rank the most expensive products within subcategories.
- **Complex Aggregations**: Calculate total sales, revenue, and contributions by product models.
- **Multi-Table Joins**: Analyze sales representatives' performance across multiple years.
- **Window Functions**: Analyze sales trends using rolling averages.
- **Ranking and Analytics**: Rank products by revenue within subcategories and calculate revenue differences.

## Contents
- **SQL Queries**: A collection of well-commented SQL queries answering various analytical questions.
- **AdventureWorks Insights**: Explore the database to uncover meaningful patterns and trends.

## Queries Overview
### Question 1: Subqueries
Find the top 5 most expensive products in each subcategory, excluding those with fewer than 5 products, and calculate the average price for each subcategory.

### Question 2: Complex Aggregations
Analyze product model sales by calculating total quantities sold, revenue, and percentage contributions for models with over 1000 units sold, excluding "Bike" subcategories.

### Question 3: Multi-Table Joins
Identify sales representatives who handled at least 50 orders in 2013-2014 but had no orders in 2015. Calculate their total orders, revenue, and hire dates.

### Question 4: Window Functions
Use window functions to calculate yearly sales totals and rolling 3-year averages for representatives active since 2012.

### Question 5: Ranking and Analytics
Rank products within each subcategory based on revenue and calculate the percentage difference between each product's revenue and the top-ranked product.

## How to Use
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/adventureworks-sql-queries.git
   ```
2. Ensure the AdventureWorks2019 OLTP database is installed on your SQL Server.
3. Open the `.sql` files in your preferred SQL editor.
4. Execute the queries to analyze the data and explore insights.

## Prerequisites
- SQL Server 2019 or later
- AdventureWorks2019 OLTP database

## License
This project is open-source and available under the [MIT License](LICENSE).

## Contributions
Contributions are welcome! Feel free to submit issues or pull requests to improve the queries or add new analyses.

## Author
Developed by a passionate data enthusiast with a focus on SQL best practices and analytical insights.

## Acknowledgments
- Microsoft for providing the AdventureWorks database.
- University of Zimbabwe for the examination challenge that inspired this project.

