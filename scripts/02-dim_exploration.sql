USE DataWarehouseAnalytics;


-- Retrieve a list of unique countries from which customers originate
SELECT DISTINCT COUNTRY FROM GOLD.dim_customers

-- Retrieve a list of unique categories, subcategories, and products
SELECT DISTINCT category,subcategory,product_name FROM GOLD.dim_products
order by 1,2,3