-- =============================================
-- SUPERSTORE SALES ANALYSIS - SQL QUERIES
-- =============================================

-- 1. Total sales and profit
SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales) * 100), 2) AS Profit_Margin_Pct
FROM superstore;

-- 2. Top 10 products by sales
SELECT 
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(*) AS Order_Count
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- 3. Sales and profit by category
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales) * 100), 2) AS Profit_Margin_Pct
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 4. Monthly sales trend
SELECT 
    strftime('%Y', `Order Date`) AS Year,
    strftime('%m', `Order Date`) AS Month,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Year, Month
ORDER BY Year, Month;

-- 5. Sales by state (Top 10)
SELECT 
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales) * 100), 2) AS Profit_Margin_Pct
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

-- 6. Sales by segment
SELECT 
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales) * 100), 2) AS Profit_Margin_Pct,
    COUNT(*) AS Order_Count
FROM superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- 7. Sub-Category profitability
SELECT 
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / NULLIF(SUM(Sales),0) * 100), 2) AS Profit_Margin_Pct
FROM superstore
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;

-- 8. The impact of the discount on profit
SELECT 
    ROUND(Discount * 100, 0) AS Discount_Percent,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales) * 100), 2) AS Profit_Margin_Pct
FROM superstore
GROUP BY Discount_Percent
ORDER BY Discount_Percent;