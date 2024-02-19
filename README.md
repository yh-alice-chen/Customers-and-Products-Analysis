# Customers-and-Products-Analysis

## Table Of Content 
[Project Overview](#project-overview)

[Objective](#objective)

[Data Source](#data-source)

[Tools](#tools)

[Table Overview](#table-overview)

[Results](#results)


## Project Overview

## Objective: 

The core objective is to gain insights from the sales record database for scale model cars, facilitating the company in answering following questions:
 
- Question 1: Which product line should the company priority for restocking?

- Question 2: How should the company tailor marketing and communication strategies to customer behaviors?

- Question 3: How much can the company spend on acquiring new customers?

## Data Source:
Dataquest Guided Project: Customers and Products Analysis Using SQL.

## Tools
- SQL - Data Analysis
- Power BI - Data Visualisation

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
#### Problem Statement
Given the company's budget constraints and maintain popular products with sufficient stock, optimising orders can be crucial. 
To do so, it is necessary to evaluate how the company can adjust the order qty effectively. 

#### Objectives
Find out products with low inventory and high product performance. 

#### Insights/ Findings
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

### Question 2: How should the company tailor marketing and communication strategies to customer behaviors?
#### Problem Statement
Effective strategies must be planned based on different target customer groups. 
To propose effective marketing strategies, the company is advised to develop strategies to customers who generate the most profit, aiming to enhance their loyalty. 
Conversely, for customers who contribute the least profit, it is crucial to propose different strategies with the goal of increasing brand impression or overall profitability.

#### Objectives
To help answers this questions, data analyst aims to find the customers most and the least engageing cusotmers so the company can target these customers to provide suitable strategies. 

#### Insights/ Findings
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

### Question 3: How much can the company spend on acquiring new customers?
#### Problem Statement

#### Objectives
To answer this question, we can start by understanding the number of new cusotmers monthly and the percentage they contribute to the total sales and the average customer lifetime value (LTV) before evaluating how much the comapny can spend on acquiring new customers.
#### Insights/ Findings
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




