# Customers-and-Products-Analysis

## Table of Contents 
[Project Overview](#project-overview)

[Objective](#objective)

[Data Source](#data-source)

[Tools Used](#tools-used)

[Table Overview](#table-overview)

[Analysis & Results](#analysis-&-results)

[Conclusions](#conclusions)

## Project Overview
This project applies SQL to analyse a retail company's sales data, aiming to uncover insights into customer behaviors and product performance. Through meticulous data analysis, we explore trends, patterns, and opportunities to drive strategic decisions.

## Objective: 
The goal of this project is to answer critical business questions related to sales performance, customer engagement, and product popularity.

- Question 1: Which product line should the company priority for restocking?

- Question 2: How should the company tailor marketing and communication strategies to customer behaviors?

- Question 3: How much can the company spend on acquiring new customers?

## Data Source:
The dataset used for this analysis is sourced from Dataquest's Guided Project: "Customers and Products Analysis Using SQL". It is publicly available and can be accessed directly through Dataquest's platform. This dataset has been instrumental in providing a comprehensive view of the retail company's sales data, allowing for a detailed exploration of customer behaviors and product performance.

## Tools Used
- MySQL - For data querying, manipulation, and analysis

## Table Overview
The database schema consists of eight tables, each capturing a unique aspect of the business operation:
- Customers: Contains customer demographic information, such as names, addresses, and phone numbers, enabling customer segmentation and targeted marketing efforts.
- Employees: Lists employee details, such as names and job titles, along with their office assignments. 
- Offices: Provides information on each of the company’s office locations, including phone numbers and addresses. 
- Product_Lines: Categorizes products into different lines based on their type, such as "Classic Cars" or "Motorcycles".
- Products: Includes detailed information on each product, including name, scale, vendor,inventory levels, buy_price and MSRP.
- Order_Details: Detailing the quantity of each product ordered and the price at which it was sold. This is a junction table that links the 'Products' and 'Orders' tables.
- Orders: Tracks all customer orders, including order dates and shipping details.
- Payments: Records all customer payments, providing data on customer purchasing power and payment patterns.

The relationships among these tables are crucial for a holistic analysis. Foreign keys, like 'Product_ID' and 'Customer_ID', serve as the links that tie sales data to specific products and customers, respectively. This relational structure enables complex queries that can answer business-critical questions.

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

## Analysis & Results

### Question 1: Which product line should the company priority for restocking? 

#### Methodology
To answer this question, a detailed analysis was performed using SQL queries to investigate products with the Top 10 high sales performance. The methodology employed two principal steps: 

1. Identifying Inventory Ratio: The inventory ratio for each product was calculated by dividing the total ordered quantity by its current inventory, the higher value suggesting that the stock is indeed low and may need replenishment. The top 10 highest ratios indicated the products with the most critically low inventory levels.

2. Analysing Product Sales Performance: Subsequently, product sales performance was assessed by summing sales per product, which provided insights into each product's sales success.

By using Common Table Expressions (CTEs), the data presents the Top 10 highest sales performance products and their inventory status respectively, presenting critical information to continuously monitor these products to prevent from out of stock. 

#### Summary of Findings
The analysis highlights a range of products facing low inventory levels that correspond with strong sales performance, suggesting they are in high demand. The data reveals:

- A significant presence of "Classic Cars" in the high-performance category, with models such as the 1992 Ferrari 360 Spider red, 2001 Ferrari Enzo, and 1952 Alpine Renault 1300 indicating robust sales.
- "Motorcycles" also show notable performance, particularly the 2003 Harley-Davidson Eagle Drag Bike and the 2002 Suzuki XREO.
- The "Planes" category, with the 1980s Black Hawk Helicopter, indicates a specialised but important market segment.
- The 1917 Grand Touring Sedan stands out within "Vintage Cars," suggesting a niche market interest.
- In most cases, these high-performance products maintain a stock level that is not yet critical but warrants close monitoring to prevent stockouts.

#### Analysis Output
##### The top ten products identified for prioritising restocking due to low inventory and strong sales performance are:
|Product_Name|Product_Line|Product_Performance|Low_Stock|
|------------|------------|-------------------|---------|
|1992 Ferrari 360 Spider red|Classic Cars|276839.98|0.22|
|2001 Ferrari Enzo|Classic Cars|190755.86|0.28|
|1952 Alpine Renault 1300|Classic Cars|190017.96|0.13|
|2003 Harley-Davidson Eagle Drag Bike|Motorcycles|170686|0.18|
|1968 Ford Mustang|Classic Cars|161531.48|13.72|
|1969 Ford Falcon|Classic Cars|152543.02|0.92|
|1980s Black Hawk Helicopter|Planes|144959.91|0.20|
|1998 Chrysler Plymouth Prowler|Classic Cars|142530.63|0.21|
|1917 Grand Touring Sedan|Vintage Cars|140535.6|0.34|
|2002 Suzuki XREO|Motorcycles|135767.03|0.10|

#### Data Visualisation 
![Q1](https://github.com/yh-alice-chen/Customers-and-Products-Analysis/assets/147277276/5855a4a7-0630-4505-901a-c2a590760331)

#### Interpretations
These findings imply that specific product lines have a consistent consumer demand that outpaces current inventory levels. The Classic Cars line, being most represented, may indicate a strong market trend or a collector's demand driving sales. The presence of motorcycles, vintage cars, and planes suggests varied consumer interests, catering to both practical uses and specialty hobbies.

#### Recommendations
- Inventory Replenishment: Prioritise restocking the high-demand, especially classic cars and motorcycles to prevent potential sales loss due to inventory shortages.
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

#### Analysis Output
##### Top 5 VIP customers
|Customer_ID|First_Name|Last_Name|Profit|Country|City|
|-----------|----------|---------|------|-------|----|
|141|Diego|Freyre|326519.661|Spain|Madrid|
|124|Susan|Nelson|236769.391|USA|San Rafael|
|151|Jeff|Young|72370.089|USA|NYC|
|114|Peter|Ferguson|70311.069|Australia|Melbourne|
|119|Janine|Labrune|60875.3|France|Nantes|

##### Top 5 least engaging customers
|Customer_ID|First_Name|Last_Name|Profit|Country|City|
|-----------|----------|---------|------|-------|----|
|219|Mary|Young|2610.87|USA|Glendale|
|198|Leslie|Taylor|6586.02|USA|Brickhaven|
|473|Franco|Ricotti|9532.93|Italy|Milan|
|103|Carine|Schmitt|10063.80|France|Nantes|
|489|Thomas|Smith|10868.04|UK|London|

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
The analysis has determined the average Customer Lifetime Value (LTV) to be $39,039.59. Additionally, it has revealed a fluctuating pattern of new customer acquisition and their sales contributions over a two-year period. The initial 100% new customer proportions indicate the early stages of the company, where all customers were newcomers. However, there is a noticeable decline in new customer proportions and their contribution to sales as the company moves into 2004, with the lowest new customer proportion being 10% in July 2004.

#### Analysis Output
##### New customers percentage and they contribute to the total sales by monthly
|Year_Month|New_Customer_Props|New_Customer_Total_Props|
|----------|------------------|------------------------|
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
The high LTV suggests that customers, once acquired, have the potential to contribute significant revenue over time. The initial 100% new customer proportions indicate the startup phase of the company, where all customers were new. The decreasing trend in new customer proportions and their sales contribution over time could suggest market saturation, increased competition, or challenges in attracting new customers.

#### Recommendations
Given the significant LTV, the company could justify a considerable investment in customer acquisition. However, the declining trend in new customer acquisition underscores the need for a revised strategy:

- Enhanced Acquisition Efforts: Invest in marketing campaigns that focus on reaching new segments to increase the inflow of new customers.
- Customer Retention Programs: Implement programs aimed at retaining existing customers, capitalising on the high LTV.
- Market Analysis: Conduct market research to understand the factors contributing to the decline in new customer acquisition.
- Adjustment of Acquisition Costs: Re-evaluate the customer acquisition cost in light of the LTV to ensure sustainable spending on new customer acquisition.

## Conclusions
The comprehensive analysis conducted in this project has provided valuable insights into the company's sales data, offering a clear understanding of customer behavior, product performance, and strategic financial planning. Through the meticulous use of SQL for data querying and manipulation, along with the powerful visualisation capabilities of Power BI, the project successfully answered several critical business questions:

1. Restocking Priority: The data analysis identified key product lines that the company should prioritise for restocking, with a significant focus on the classic cars and motorcycles categories due to their high demand and low inventory levels.
2. Marketing and Communication Strategies: The assessment of customer engagement levels has highlighted the importance of personalised marketing strategies, particularly for the top-tier customers who contribute the most to the company's profit, as well as the necessity to re-engage less active customers.
3. Customer Acquisition Cost: Finally, by establishing the average Customer Lifetime Value (LTV), the company can now make informed decisions about the investment in acquiring new customers, ensuring that the cost of acquisition is aligned with the long-term revenue potential.

The findings from this project not only answer the initial questions but also pave the way for actionable recommendations that the company can implement. These include restocking strategies, targeted marketing campaigns, customer segmentation analyses, and a re-evaluation of customer acquisition costs.

This project has demonstrated the critical role of data analysis in making evidence-based decisions that can lead to improved business outcomes. With these insights, the company is well-positioned to refine its strategies in inventory management, marketing, and financial planning to drive future growth and success.
