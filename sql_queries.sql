create schema pizza_sales_db;
Use pizza_sales_db;
select * from pizza_sales;

select sum(total_price) as Total_Revenue
from pizza_sales;

select sum(total_price)/count(distinct order_id) as Avg_Order_Value
from pizza_sales;

select sum(quantity) as Total_Pizza_Sold
from pizza_sales;

select count(distinct order_id) as Total_Orders
from pizza_sales;

select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizzas_Per_order
from pizza_sales;

select date(order_date) as order_day,
count(distinct order_id) as Total_orders
from pizza_sales
group by date(order_date);


SELECT 
    DAYNAME(order_date) AS order_day,
    COUNT(*) AS Total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date)
ORDER BY Total_orders DESC;

select
	monthname(order_date) as month_name,
    count(distinct order_id) as Total_orders
from pizza_sales
group by monthname(order_date)
order by Total_orders desc;

SELECT 
    pizza_size,
    cast(SUM(total_price) as decimal(10,2)) AS Total_sales,
    cast(SUM(total_price) * 100.0 / 
        (SELECT SUM(total_price) FROM pizza_sales) as decimal(10,2)) AS pct
FROM pizza_sales
GROUP BY pizza_size;

select pizza_name,sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue desc
limit 5;

select pizza_name,sum(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity desc
limit 5;
