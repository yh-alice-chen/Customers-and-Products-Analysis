# Customers-and-Products-Analysis

## Table Of Content 
[Project Overview](#project-overview)

[Objective](#objective)

[Data Source](#data-source)

[Tools](#tools_used)

[Table Overview](#table-overview)

[Results](#results)

## Project Overview
This project leverages SQL and Power BI to analyze a retail company's sales data, aiming to uncover insights into customer behaviors and product performance. Through meticulous data analysis, we explore trends, patterns, and opportunities to drive strategic decisions.

## Objective: 
The goal of this project is to answer critical business questions related to sales performance, customer engagement, and product popularity.

- Question 1: Which product line should the company priority for restocking?

- Question 2: How should the company tailor marketing and communication strategies to customer behaviors?

- Question 3: How much can the company spend on acquiring new customers?

## Data Source:
The analysis is based on a comprehensive dataset from a Dataquest Guided Project: Customers and Products Analysis Using SQL.

## Tools Used
- SQL - For data querying, manipulation, and analysis
- Power BI - For visualizing data and uncovering insights through interactive dashboards

## Table Overview
- Customers
- Employees
- Offices
- Product_Lines
- Products
- Order_Details
- Orders
- Payments

![EER diagram](https://github.com/yh-alice-chen/Customers-and-Products-Analysis/assets/147277276/1fe1dcc4-387c-4272-9d99-36d3b035dd8a)

|Table_name|Number_of_Attributes|Number_of_Rows|
|----------|--------------------|--------------|
|Customers|13|122|
|Products|9|110|
|Product_Lines|4|7|
|Orders|7|326|
|Order_Details|5|2996|
|Payments|4|273|
|Employees|8|23|
|Offices|9|7|

## Results

### Question 1: Which product line should the company priority for restocking? 

#### Methodology
To answer this question, a detailed analysis was performed using SQL queries to investigate products characterised by both low inventory and high sales performance. The methodology employed two principal steps: 

1. Identifying low inventory products: The inventory ratio for each product was calculated by dividing the total ordered quantity by its current inventory, identifying products nearing out of stock. The top 10 highest ratios indicated the products with the most critically low inventory levels.

2. Analysing Product Performance: Subsequently, product performance was assessed by summing sales per product, which provided insights into each product's sales success.

By using Common Table Expressions (CTEs), the data on low inventory and product performance were integrated, facilitating a cross-analysis. This approach pinpointed the top 10 products that not only are nearly out of stock due to high demand but also exhibit strong sales performance, highlighting key areas for inventory management and restocking initiatives.

#### Summary of Findings
The analysis highlights a range of products facing low inventory levels that correspond with strong sales performance, suggesting they are in high demand. The data reveals:

- A significant presence of "Classic Cars" in the low inventory, high-performance category, with models such as the 1992 Ferrari 360 Spider red, 2001 Ferrari Enzo, and 1952 Alpine Renault 1300 indicating robust sales.
- "Motorcycles" also show notable performance, particularly the 2003 Harley-Davidson Eagle Drag Bike and the 2002 Suzuki XREO.
- The "Planes" category, with the 1980s Black Hawk Helicopter, indicates a specialised but important market segment.
- The 1917 Grand Touring Sedan stands out within "Vintage Cars," suggesting a niche market interest.

#### Data Visualisations
|Product_Name|Product_Line|
|------------|------------|
|1992 Ferrari 360 Spider red|Classic Cars|
|2001 Ferrari Enzo|Classic Cars|
|1952 Alpine Renault 1300|Classic Cars|
|2003 Harley-Davidson Eagle Drag Bike|Motorcycles|
|1968 Ford Mustang|Classic Cars|
|1969 Ford Falcon|Classic Cars|
|1980s Black Hawk Helicopter|Planes|
|1998 Chrysler Plymouth Prowler|Classic Cars|
|1917 Grand Touring Sedan|Vintage Cars|
|2002 Suzuki XREO|Motorcycles|

#### Interpretations
These findings imply that specific product lines have a consistent consumer demand that outpaces current inventory levels. The Classic Cars line, being most represented, may indicate a strong market trend or a collector's demand driving sales. The presence of motorcycles, vintage cars, and planes suggests varied consumer interests, catering to both practical uses and specialty hobbies.

#### Recommendations
- Inventory Replenishment: Prioritise restocking the high-demand classic cars and motorcycles to prevent potential sales loss due to inventory shortages.
- Marketing Strategies: Develop targeted marketing campaigns that cater to the interests of collectors and enthusiasts, particularly for the classic cars and motorcycles categories.
- Product Diversification: Evaluate the potential for expanding the planes and vintage cars product lines to meet niche market demands.
- Sales Forecasting: Implement improved sales forecasting methods to anticipate inventory needs better and prevent similar low-stock scenarios in the future.
  
### Question 2: How should the company tailor marketing and communication strategies to customer behaviors?

#### Methodology
To determine how the company can tailor marketing and communication strategies according to customer behaviours, an in-depth analysis was conducted to identify customer engagement levels. The process consisted of the following steps:

1. Data Consolidation: Relevant tables, including Orders, Order_Details, Customers, and Products, were joined to create a comprehensive dataset, ensuring a holistic view of customer activities.

2. Customer Engagement Assessment: Engagement levels were quantified by calculating the profit generated by each customer, reflecting their contribution to the company's earnings.

3. Limiting Results: To maintain a focused approach, the dataset was narrowed down to display only the top 5 customers with the highest and lowest profit margins, revealing the most and least engaged customers.

By focusing on both the most and least engaged customers, the company can strive to not only retain its most profitable customers but also to elevate the engagement and profitability of other customer segments.

#### Summary of Findings
The analysis identified the top 5 VIP customers, who are contributing significantly to the company’s profit, with Diego Freyre leading the list with a profit contribution of $326,519.66. Following him are Susan Nelson, Jeff Young, Peter Ferguson, and Janine Labrune, all providing substantial profits ranging from approximately $60,000 to $236,000. 
Conversely, the top 5 least engaging customers were identified, with profits ranging from about $2,600 to $10,800, indicating a lower level of transactional activity with the company.

####  Data Visualisations
##### Top 5 VIP customers
|Customer_ID|First_Name|Last_Name|Profit|
|-----------|----------|---------|------|
|141|Diego|Freyre|326519.661|
|124|Susan|Nelson|236769.391|
|151|Jeff|Young|72370.089|
|114|Peter|Ferguson|70311.069|
|119|Janine|Labrune|60875.3|

##### Top 5 least engaging customers
|Customer_ID|First_Name|Last_Name|Profit|
|-----------|----------|---------|------|
|219|Mary|Young|2610.87|
|198|Leslie|Taylor|6586.02|
|473|Franco|Ricotti|9532.93|
|103|Carine|Schmitt|10063.80|
|489|Thomas|Smith|10868.04|

#### Interpretations
The contrast between the profit contributions of VIP and least engaging customers suggests that a small segment of customers is driving a large portion of the company’s revenue. This disparity indicates the presence of a highly valuable customer base that may require personalised attention and retention strategies to maintain their high engagement levels.

#### Recommendations 
- Personalised Engagement: Develop bespoke engagement plans for the top 5 VIP customers, such as personalised discounts, loyalty programmes, and exclusive previews of new products, to maintain their high level of engagement and loyalty.
- Re-engagement Strategies: For the least engaging customers, implement re-engagement strategies that could involve special offers, feedback surveys to understand their low engagement, and customised communications to rekindle their interest in the company’s offerings.
- Segmentation Analysis: Conduct a deeper segmentation analysis to understand the behavioural and demographic factors that distinguish VIP customers from less engaged ones. This can inform more nuanced marketing and service approaches.
- Profit Margin Analysis: While the top customers by profit have been identified, it’s also important to consider the profit margins of the products they are purchasing. This could reveal opportunities to promote higher-margin products to all customer segments.

### Question 3: How much can the company spend on acquiring new customers?

#### Methodology
To address the question of optimal expenditure for acquiring new customers, a multi-step analysis was conducted with the aim to discern the monthly arrival of new customers, their contribution to total sales, and the average Customer Lifetime Value (LTV). This analysis employed the following sequential approach:

1.  Temporal Analysis of Payments: A subquery was created using the Payments table to extract the year and month from the Payment_Date, enabling a temporal grouping of the data.

2. Customer Aggregation: A comprehensive table was then formed by aggregating the number of customers and total amount spent per month, which served as a foundational dataset for further analysis.
  
3. New Customer Identification: A dedicated table was constructed to count new customers—those who made their first purchase in the respective month. This table also calculated the total spend of these new customers.

4. Engagement Ratio Calculation: The proportion of new customers and their spending was calculated against the overall monthly figures to understand their impact on sales.

5. Lifetime Value Computation: The LTV was determined by calculating the average revenue generated per customer, which is pivotal in deciding the sustainable cost of acquiring new customers.

The query syntax utilised Common Table Expressions (CTEs) for better readability and management of the data flow. This structured query facilitated the extraction of meaningful metrics essential for strategic decision-making regarding customer acquisition costs.

#### Summary of Findings
#### Data Visualisations
##### New customers percentage and they contribute to the total sales by monthly
|Year_Month|New_Customer_Props|New_Customer_Total|Props|
|----------|------------------|------------------|-----|
|200301|100|100|
|200302|100|100|
|200303|100|100|
|200304|100|100|
|200305|100|100|
|200306|100|100|
|200307|75|68.3|
|200308|66.7|54.2|
|200309|80|95.9|
|200310|69.2|69.3|
|200311|57.9|53.9|
|200312|60|54.9|
|200401|33.3|41.1|
|200402|33.3|26.5|
|200403|54.5|55|
|200404|40|40.3|
|200405|12.5|17.3|
|200406|33.3|43.9|
|200407|10|6.5|
|200408|18.2|26.2|
|200409|40|56.4|

##### Customer LifeTime Value (LTV)
|LTV_Value|
|---------|
|39039.59|

#### Interpretations
#### Recommendations

## Conclusion
The analysis offers valuable insights into customer preferences and product performance, guiding data-driven decisions to enhance sales and customer satisfaction.


