--Database Creation
CREATE DATABASE eCommerce

USE eCommerce 

--For viewing all columns
SELECT * FROM E_commerce

--To get a Product name Without duplicate
SELECT DISTINCT Product_Name FROM E_commerce

--To get a Category Without duplicate
SELECT DISTINCT Category FROM E_commerce

--For Region
SELECT DISTINCT Region FROM E_commerce

--For Total sales
SELECT SUM(Sales) AS Total_sales FROM E_commerce 

--For Total Profit
SELECT SUM(Profit) AS Total_Profit FROM E_commerce 

--For Total Quantity
SELECT SUM(Quantity) AS Total_Quantity FROM E_commerce

-- For Average sales by Region
SELECT Region,AVG(sales) AS Avg_Sales 
FROM E_commerce
GROUP BY Region

--Average Profit by Region
SELECT Region,AVG(Profit) AS Avg_Profit
FROM E_commerce
GROUP BY Region

--Total sales per each product
SELECT Product_Name,SUM(Sales) AS Total_Sales
FROM E_commerce
GROUP BY Product_Name

--Total Profit per each product
SELECT Product_Name,SUM(Profit) AS Total_Profit
FROM E_commerce
GROUP BY Product_Name

--Total Quantity per each product
SELECT Product_Name,SUM(Quantity) AS Total_Quantity
FROM E_commerce
GROUP BY Product_Name
ORDER BY Total_Quantity DESC

--For total sales per each region and product
SELECT Region,Product_name,SUM(Sales) AS Total_sales_Region
FROM E_commerce
GROUP BY Region,Product_name
ORDER BY Total_sales_Region DESC

--For total Profit per each region and product
SELECT Region,Product_name,SUM(Profit) AS Total_Profit_Region
FROM E_commerce
GROUP BY Region,Product_name
ORDER BY Total_Profit_Region DESC

--For total Quantity per each region and product
SELECT Region,Product_name,SUM(Quantity) AS Total_Quantity_Region
FROM E_commerce
GROUP BY Region,Product_name
ORDER BY Total_Quantity_Region DESC

--To get total profit for category wise
SELECT Category,SUM(Profit) AS Category_Wise_Profit
FROM E_commerce
GROUP BY Category
ORDER BY Category_Wise_Profit DESC

--To get total profit for Region wise
SELECT Region,SUM(Profit) AS Total_Profit_Region
FROM E_commerce
GROUP BY Region
ORDER BY Total_Profit_Region DESC

--To get total Quantity for category wise
SELECT Category,SUM(Quantity) AS Category_Wise_Quantity
FROM E_commerce
GROUP BY Category
ORDER BY Category_Wise_Quantity DESC

--To get a Total profit in 2024 for each region and category
SELECT YEAR(Order_Date) AS Year_,Region,Category,CAST(SUM(Profit) AS DECIMAl (10,2)) AS Total_Profit
FROM E_commerce
WHERE YEAR(Order_Date) = 2024
GROUP BY YEAR(Order_Date),Region,Category

--monthly trends for total sales
SELECT DATENAME(MONTH,Order_Date) AS Order_month,SUM(Sales) AS Monthly_sales
FROM E_commerce
GROUP BY DATENAME(MONTH,Order_Date)

--Percentange of sales by Category
SELECT Category,SUM(Sales)*100/(SELECT SUM(Sales) FROM E_commerce) AS Percentage_of_Sales
FROM E_commerce
GROUP BY Category

--Percentange of sales by Region
SELECT Region,SUM(Sales)*100/(SELECT SUM(Sales) FROM E_commerce) AS Percentage_of_Sales
FROM E_commerce
GROUP BY Region

--Top 5 Best Products by Total Sales
SELECT TOP 5 Product_Name,SUM(Sales) AS Total_Sales
FROM E_commerce
GROUP BY Product_Name
ORDER BY Total_Sales DESC

--Top 5 Best Products by Total Profit
SELECT TOP 5 Product_Name,CAST(SUM(Profit) AS DECIMAL(10,2)) AS Total_Profit
FROM E_commerce
GROUP BY Product_Name
ORDER BY Total_Profit DESC
