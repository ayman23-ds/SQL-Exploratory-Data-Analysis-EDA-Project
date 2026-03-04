USE DataWarehouseAnalytics;


-- Determine the first and last order date and the total duration in years
SELECT 
	MIN(order_date) AS FIRST_ORDER_DATE,
	MAX(order_date) AS LAST_ORDER_DATE,
	DATEDIFF(YEAR,MIN(order_date),MAX(order_date) ) AS ORDER_RANGE_YEARS
FROM gold.fact_sales 


-- Find the youngest and oldest customer based on birthdate
SELECT
    MIN(birthdate) AS oldest_birthdate,
    DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS oldest_age,
    MAX(birthdate) AS youngest_birthdate,
    DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers;
