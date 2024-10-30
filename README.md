## Sales Performance Analysis for a Retail Store
### Project Overview
This project analyzes sales data from a retail store to provide insights into sales performance across various dimensions, such as products, regions, and time periods. The final deliverable is an interactive Power BI dashboard that visualizes key findings.
### Objectives
- Identify top-selling products, high-performing regions, and monthly sales trends.
- Produce insights to help the retail store make data-driven decisions for inventory and marketing.
- Present findings through an interactive dashboard for easy access and continuous monitoring.
### Project Structure
The project consists of three main components: Excel Data Exploration, SQL Query Analysis, and Power BI Dashboard.
###### Folders and Files
- https://github.com/MercyArik/LITA_Capstone_Project/blob/main/Raw_Project_Dataset.xlsx/data: Contains raw sales data used for this analysis.
- https://github.com/MercyArik/LITA_Capstone_Project/blob/main/projectquery.sql/scripts: SQL queries and scripts.
- /Excel Reports: Contains Excel summary tables and initial analysis.
- /PowerBI: Contains Power BI files for the dashboard.
### Tools Used
The following applications was used for data cleaning, analysis, manipulation and visualizations:
- Microsoft Excel: Data cleaning, exploration and initial metrics calculation.
- SQL Server DB: for running SQL queries
- PowerBI: for interactive data visualization dashboard
- Github to document my portfolio

### Data Cleaning & Preprocessing
The preprocessing stage took the following shape:
1. Data loading and inspection
2. Removing duplicates and blanks (null vales)
3. Data cleaning and formatting
4. Transformation of the variables and datatypes
### Exploraroty Data Analysis 
The EDA will be use to explore the data while providing answer to the following questions about revenue trend such as;
- Total sales by product, region, and month.
- Average sales per product 
- Total revenue by region.
- Total sales for each product category.
- Find the number of sales transactions in each region.
- Find the highest-selling product by total sales value.
- Fcalculate total revenue per product.
- Calculate monthly sales totals for the current year.
- Find the top 5 customers by total purchase amount.
- Calculate the percentage of total sales contributed by each region.
- Identify products with no sales in the last quarter
### Data analysis
Descriptive Statistics: Initial insights, like average sales, top-selling products, and monthly trends using
Pivot Tables, Excel formula and SQL queries.
```Excel
=AVERAGE(I:I)
=SUM(F2*G2)
=SUMIF(H:H,D:D,"North")
=AVERAGEIF(C:C,"shirt",H:H)
```
##### Pivot Tables
![Salesdata2](https://github.com/user-attachments/assets/805c9e84-dc78-43de-b90a-123774b249c9)
#### SQL Queries
```
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
```
### Data Visualization
![Salesdata3](https://github.com/user-attachments/assets/c3d5b47e-e2cf-49cb-8d11-92f9a3c80c20)
![Salesdata4](https://github.com/user-attachments/assets/68229dce-702f-475d-8d3f-c645c69b845a)
![salesdata5](https://github.com/user-attachments/assets/1e13e631-4c23-46dd-87ba-64fb5199d7bc)
#### PowerBI Visuals
![salesdata](https://github.com/user-attachments/assets/1d2874ea-5171-4a99-8438-dbb2ab510897)
### Key Findings & Insights










  
