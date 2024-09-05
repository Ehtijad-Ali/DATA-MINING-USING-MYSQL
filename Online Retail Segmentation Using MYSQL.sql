use retail_data;
select * from online_retail;
SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalInvoiceValue 
FROM online_retail 
GROUP BY CustomerID
order by TotalInvoiceValue desc;


# number of unique products has each customer purchased

select CustomerID, COUNT(DISTINCT StockCode) AS UniqueProductsPurchased 
from online_retail 
GROUP BY CustomerID;

# Customer with only single purchsed

select Customerid from online_retail
group by customerid
having count(distinct invoiceno) = 1;

# Products most commonly purchase together

SELECT t1.StockCode AS Product_1, t2.StockCode AS Product_2, COUNT(*) AS PurchasedCount
FROM online_retail t1
JOIN online_retail t2 ON t1.InvoiceNo = t2.InvoiceNo AND t1.StockCode < t2.StockCode  -- Ensure distinct pairs and avoid self-join
GROUP BY t1.StockCode, t2.StockCode
ORDER BY 
    PurchasedCount DESC;
    
# Customer Segmentation By Purchased Frequency;

SELECT 
    CustomerID,
    CASE 
        WHEN COUNT(DISTINCT InvoiceNo) > 10 THEN 'High Frequency'
        WHEN COUNT(DISTINCT InvoiceNo) > 5 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS PurchasedFrequencySegment
FROM 
    online_retail
GROUP BY 
    CustomerID;
    
# Average Order Value By Country

SELECT Country, AVG(Quantity * UnitPrice) AS AverageOrderValue
FROM online_retail
GROUP BY Country;

# Customer Churn Analysis

SELECT 
    CustomerID
FROM 
    online_retail
WHERE 
    CustomerID NOT IN (
        SELECT DISTINCT 
            CustomerID 
        FROM 
            online_retail
        WHERE 
            InvoiceDate >= CURDATE() - INTERVAL 6 MONTH
    );

# Product Affinity Analysis:                                                                                                             


SELECT t1.StockCode AS Product_1,t2.StockCode AS Product_2,
    COUNT(*) AS PurchasedCount
FROM online_retail t1
JOIN online_retail t2 ON t1.InvoiceNo = t2.InvoiceNo AND t1.StockCode < t2.StockCode  -- Avoid self-joins and duplicate pairs
GROUP BY t1.StockCode, t2.StockCode;
    
# Time Based Analysis

SELECT YEAR(InvoiceDate) AS Year, MONTH(InvoiceDate) AS Month,SUM(Quantity * UnitPrice) AS TotalSales
FROM online_retail
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY Year, Month;







