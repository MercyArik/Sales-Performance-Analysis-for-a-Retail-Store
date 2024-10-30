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
Pivot Tables
![Salesdata2](https://github.com/user-attachments/assets/805c9e84-dc78-43de-b90a-123774b249c9)




  
