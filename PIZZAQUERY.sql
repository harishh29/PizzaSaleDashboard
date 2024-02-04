
SELECT distinct total_price FROM pizza_sales

--unit and total price clean
UPDATE pizza_sales
SET unit_price = CAST(unit_price AS DECIMAL(10,2)) ,
total_price = CAST(total_price AS DECIMAL(10,2))


ALTER TABLE pizza_sales
ALTER COLUMN total_price DECIMAL(10,2)


--KPI
--I)	Total Revenue

SELECT ROUND(SUM(total_price),2) as "Total Revenue" 
FROM pizza_sales

--II)	Average Order Value

SELECT ROUND((SUM(total_price)/COUNT(DISTINCT order_id)),2) as "Average Order Value"
FROM pizza_sales

--III)	Total Pizza Sold

SELECT SUM(quantity) as "Total Pizza Sold"
FROM pizza_sales

--IV)	Total Order

SELECT COUNT(DISTINCT order_id) as "Total Order"
FROM pizza_sales;

--V)	Average Pizza per Order 
-- Change to decimal to get accurate average value

SELECT CAST(CAST(SUM(quantity)as decimal)/ COUNT(DISTINCT order_id)as decimal(10,2)) as "Average Pizza per Order"
FROM pizza_sales



--CHART
--I)	Daily trend for Total Orders
SELECT DATENAME(DW, order_date) as Order_Day, COUNT(DISTINCT order_id) as Total_Order
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)


--II)	Monthly trend for Total Orders
SELECT DATENAME(MM, order_date) as Order_Month, COUNT(DISTINCT order_id) as Total_Order
FROM pizza_sales
GROUP BY DATENAME(MM, order_date)


--III)	Percentage of Sales by Pizza Category

SELECT pizza_category, SUM(total_price) as total_revenue, CAST(SUM(total_price)*100/(SELECT SUM(total_price)FROM pizza_sales) as DECIMAL(10,2))as PCT
FROM pizza_sales
GROUP BY pizza_category

--IV)	Percentage of Sales by Pizza Size
SELECT pizza_size,  SUM(total_price) as total_revenue, CAST(SUM(total_price)*100/(SELECT SUM(total_price)FROM pizza_sales) as DECIMAL(10,2))as PCT
FROM pizza_sales
GROUP BY pizza_size 
ORDER BY pizza_size

--V)	Totals Pizza Sold by Pizza Category

SELECT pizza_category, SUM(quantity) as Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category



--VI)	Top 5 Best Sellers by Revenue, Total Quantity and Total Orders
SELECT TOP 5 pizza_name, SUM(total_price) as Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue DESC

SELECT TOP 5 pizza_name, SUM(quantity) as Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) as Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--VII)	Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders

SELECT TOP 5 pizza_name, SUM(total_price) as Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue 

SELECT TOP 5 pizza_name, SUM(quantity) as Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity 

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) as Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders 

/*SELECT order_id, SUM(total_price) AS total_sales
FROM pizza_sales
GROUP BY order_id
order by order_id*/


select distinct pizza_size from pizza_sales

SELECT * FROM [PIZZA VIEW]


Select 'TEST String';