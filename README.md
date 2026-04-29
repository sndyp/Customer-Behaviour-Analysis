# Customer Shopping Behavior Analysis

An end-to-end data analytics project focused on uncovering patterns in retail transactions, customer loyalty, and demographic spending habits. This project demonstrates a full data pipeline: from raw data cleaning in Python to strategic SQL querying and interactive visualization in Power BI.

## Project Overview
The goal of this project is to analyze 3,900 customer transactions to provide actionable insights for a retail business. Key focus areas include:
* **Customer Segmentation:** Identifying new vs. loyal buyers.
* **Revenue Drivers:** Analyzing which demographics (age/gender) and categories contribute most to sales.
* **Loyalty Impact:** Evaluating the effectiveness of the subscription model.

## Dataset
The dataset contains **3,900 records** with 18 initial features, including:
* **Demographics:** Age, Gender, Location, Subscription Status.
* **Transactions:** Item, Category, Purchase Amount ($), Season.
* **Behavior:** Review Rating, Shipping Type, Previous Purchases, and Discount usage.

## Tools Used
* **Python (Pandas):** For data cleaning, handling missing values, and feature engineering.
* **SQL Server:** For deep-dive analysis and advanced data aggregation.
* **Power BI:** For creating an interactive executive dashboard.
* **Markdown:** For professional documentation and reporting.

## Project Steps

### 1. Data Cleaning & EDA (Python)
* Handled missing values in the `Review Rating` column.
* Performed **Feature Engineering**:
    * Created `age_group` bins (Young Adult, Adult, Middle-aged, Senior).
    * Standardized categorical frequencies into numerical days for analysis.
* Exported the cleaned dataset for SQL and BI use.

### 2. SQL Analysis
Imported the cleaned data into SQL Server to answer business-critical questions:
* Calculated total revenue by gender and age group.
* Segmented customers based on purchase history (New, Returning, Loyal).
* Analyzed the correlation between high ratings and repeat purchases.

### 3. Data Visualization (Power BI)
Developed an interactive dashboard with the following views:
* **Executive Summary:** High-level KPIs (Total Revenue, Avg. Spend, Avg. Rating).
* **Demographic Breakdown:** Revenue trends across age groups and locations.
* **Product Performance:** Sales distribution by category and season.

## Results & Insights
* **Top Performers:** Clothing and Accessories are the primary revenue drivers.
* **Subscription Potential:** Non-subscribers (73%) represent a massive opportunity for conversion through targeted loyalty programs.
* **Seasonal Peak:** Sales show significant spikes during Spring and Fall seasons.

## How to Run
1. **Python:** Open `Customer Behaviour Code.ipynb` in Jupyter or Colab and run all cells to process the raw data.
2. **SQL:** Execute the scripts in `Customer Behaviour SQL Query.sql` on your SQL Server instance to generate the analytical views.
3. **Power BI:** Open `Customer Behaviour Dashboard.pbix` to view the interactive visualizations (requires Power BI Desktop).
