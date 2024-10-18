# Amazon Data Analysis Project

## Purpose of the Project
The aim of this project is to gain insights into Amazon's sales data, focusing on understanding the factors affecting sales at different branches. The branches analyzed are located in Mandalay, Yangon, and Naypyitaw. The analysis will cover product performance, customer behavior, and sales trends to help improve business strategies.

## Dataset Description
The dataset includes the following columns:
- Invoice ID
- Branch
- City
- Customer type
- Gender
- Product line
- Unit price
- Quantity
- Tax (5%)
- Total
- Date
- Day name
- Month name
- Time
- Time of day
- Payment method
- Cost of goods sold (COGS)
- Gross margin percentage
- Gross income
- Rating

## Analytical Approach
1. Data Wrangling:
Built a database, created tables, and inserted the data.
Ensured data quality by filtering out null values.

3. Feature Engineering:
Added new columns to derive insights-
timeofday: Morning, Afternoon, Evening for time-based sales trends.
dayname: Day of the week for sales activity analysis.
monthname: Month of the year to understand sales seasonality.

3. Exploratory Data Analysis (EDA):
Analyzed product lines, customer behavior, and sales trends.
Generated actionable insights from sales performance, VAT, and revenue data.

## Technologies Used
- SQL

## Business Questions
- What is the count of distinct cities in the dataset?

- For each branch, what is the corresponding city?

- What is the count of distinct product lines in the dataset?

- Which payment method occurs most frequently?

- Which product line has the highest sales?

- How much revenue is generated each month?

- In which month did the cost of goods sold reach its peak?

- Which product line generated the highest revenue?

- In which city was the highest revenue recorded?

- Which product line incurred the highest Value Added Tax?

- For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."

- Identify the branch that exceeded the average number of products sold.

- Which product line is most frequently associated with each gender?

- Calculate the average rating for each product line.

- Count the sales occurrences for each time of day on every weekday.

- Identify the customer type contributing the highest revenue.

- Determine the city with the highest VAT percentage.

- Identify the customer type with the highest VAT payments.

- What is the count of distinct customer types in the dataset?

- What is the count of distinct payment methods in the dataset?

- Which customer type occurs most frequently?

- Identify the customer type with the highest purchase frequency.

- Determine the predominant gender among customers.

- Examine the distribution of genders within each branch.

- Identify the time of day when customers provide the most ratings.

- Determine the time of day with the highest customer ratings for each branch.

- Identify the day of the week with the highest average ratings.

- Determine the day of the week with the highest average ratings for each branch.

## Conclusion
This project helped uncover important insights about Amazon's sales patterns, customer preferences, and product performance across different locations. These insights can help Amazon improve its sales strategies and customer targeting.
