-- Which 5 products Generating the Highest Revenue?
-- Simple Ranking
SELECT top 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- Complex but Flexibly Ranking Using Window Functions
select * 
from (

    SELECT 
        p.product_name,
        SUM(f.sales_amount) AS total_revenue,
        ROW_NUMBER() over(order by sum(f.sales_amount) desc) as rank_products
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.product_name ) t

where rank_products <= 5 ;




-- What are the 5 worst-performing products in terms of sales?
SELECT top 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue Asc;


-- Find the top 10 customers who have generated the highest revenue
select top 10
	c.customer_key,
	c.first_name,
	c.last_name,
	sum(f.sales_amount) as total_revenue
from gold.fact_sales f

left join gold.dim_customers c 
	on c.customer_key = f.customer_key
group by 
	c.customer_key,
	c.first_name,
	c.last_name
order by total_revenue desc ;



-- The 3 customers with the fewest orders placed
select top 3
	c.customer_key,
	c.first_name,
	c.last_name,
	count(distinct order_number) as total_orders
from gold.fact_sales f

left join gold.dim_customers c 
	on c.customer_key = f.customer_key
group by 
	c.customer_key,
	c.first_name,
	c.last_name
order by total_orders asc ;