select * from SALESDATA$
---DESKTOP-194OHGQ\SQLEXPRESS---
---to remove duplicates from salesdata set---

WITH DuplicateRows AS (
select
ROW_NUMBER() OVER (PARTITION BY Product_type, Region, OrderDate, Quantity, UnitPrice, Revenue ORDER BY OrderID, CustomerId) AS RowNum
FROM Salesdata$
)
DELETE FROM DuplicateRows
WHERE RowNum > 1;

---retrieve the total sales for each product category.----

select Product_type, sum(revenue) as Total_Sales from salesdata$ group by Product_type order by Total_Sales asc

---Find the number of sales transactions in each region.----

select Region, count(OrderDate) as Number_of_Sales_Transactions from salesdata$ group by Region


----- calculate monthly sales totals for the current year.---

select 
year(orderdate) as Year,
month(orderDate) as Month,
sum(revenue) as Totalsales
from salesdata$
where year(orderDate)=year(GETDATE())
GROUP BY 
YEAR(orderdate), MONTH(orderDate)
ORDER BY
YEAR, month


---Find the top 5 customers by total purchase amount.----

select top 5
Customerid,
Product_type,
sum(revenue) as Totalpurchase
from SalesData$
group by customerid, product_type
order by Totalpurchase desc;


---Calculate the percentage of total sales contributed by each region---

SELECT Region, SUM(Revenue) AS Total_Sales, (SUM(Revenue) / (SELECT SUM(Revenue) FROM Salesdata$) * 100) AS Percentage
FROM Salesdata$
GROUP BY Region
ORDER BY SUM(Revenue) DESC;


---Identify products with no sales in the last quarter---

select Orderid, customerId, Product_type
from Salesdata$
where Orderid NOT IN (
select orderid
from Salesdata$
where Orderdate>=dateadd(day, -90, getdate())
)


---Find the highest-selling product by total sales value---

 select top 1
 orderid,
 product_type,
 sum(revenue) as TotalSales from salesdata$
 group by orderid, product_type
 order by
 Totalsales desc;

 ---Calculate total revenue per product---

 select product_type,
 sum(revenue) as TotalRevenue from salesdata$
 group by product_type
 order by TotalRevenue desc;

