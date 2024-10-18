create database shivani;
use shivani;

select * from amazon;

set sql_safe_updates = 0;

-- finding the null values
select * from amazon
where 'invoice id' is null
or 'branch' is null
or 'city' is null
or 'customer type' is null
or 'gender' is null
or 'product line' is null
or 'unit price' is null
or 'tax 5%' is null
or 'total' is null
or 'date' is null
or 'time' is null
or 'payment' is null
or 'cogs' is null
or 'gross margin percent' is null
or 'gross income' is null
or 'rating' is null;

-- generating some new columns from existing ones.
update amazon
set timeofday = case when time(time)>='00:00:00' and time(time)<'12:00:00' then 'Morning'
					 when time(time)>='12:00:00' and time(time)<'18:00:00' then 'Afternoon'
                     else 'Evening'
				end;

alter table amazon
add day_name varchar(10);
update amazon
set day_name = left(dayname(date),3);

alter table amazon 
add month_name varchar(10);
update amazon
set month_name = left(monthname(date),3);

select * from amazon;

-- business questions
-- 1. What is the count of distinct cities in the dataset?
select count(distinct city) as distinct_city_count from amazon;

-- For each branch, what is the corresponding city?
select branch, city from amazon
group by branch, city
order by branch asc;

-- What is the count of distinct product lines in the dataset?
select count(distinct `product line`) as distinct_product_lines_count from amazon;

-- Which payment method occurs most frequently?
select payment, count(payment) as frequency from amazon
group by payment
order by frequency desc
limit 1;

-- Which product line has the highest sales?
select `product line` as product_line, sum(total) as total_sale from amazon
group by product_line 
order by total_sale desc
limit 1;

-- How much revenue is generated each month?
select month_name, sum(total) as total_revenue from amazon
group by month_name;

-- In which month did the cost of goods sold reach its peak?
select month_name, sum(cogs) as total_cogs from amazon
group by month_name
order by total_cogs desc
limit 1;

-- Which product line generated the highest revenue?
select `product line` as product_line, sum(total) as total_revenue from amazon
group by Product_line
order by total_revenue desc
limit 1;

-- In which city was the highest revenue recorded?
select city, sum(total) as total_revenue from amazon
group by city 
order by total_revenue desc
limit 1;

-- Which product line incurred the highest Value Added Tax?
select `product line` as product_line, sum(`tax 5%`) as highest_value_added_tax from amazon
group by product_line
order by highest_value_added_tax desc
limit 1;

-- For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
select `product line` as product_line, sum(total) as total_sale,
case when sum(total)> (select avg(total) from amazon) then 'good'
     else 'bad'
     end as sales_status 
from amazon
group by Product_line
order by total_sale desc;

-- Identify the branch that exceeded the average number of products sold.
select Branch, sum(quantity) as total_quantity from amazon
group by Branch
having sum(quantity)>(select avg(quantity) from amazon)
limit 1;

-- Which product line is most frequently associated with each gender?
select gender, `product line`, count(`product line`) as count_product_line from amazon
group by gender, `product line`
order by count(`Product line`) desc;

-- Calculate the average rating for each product line.
select `product line`, avg(rating) as avg_rating from amazon
group by `product line`;

-- Count the sales occurrences for each time of day on every weekday.
select timeofday,day_name, count(*) as count_sale_occurrence from amazon
where day_name in ('Mon','tue','wed','thu','fri')
group by timeofday, day_name
order by count_sale_occurrence desc;

-- Identify the customer type contributing the highest revenue.
select `customer type`, sum(total) as highest_revenue from amazon
group by `customer type`
order by highest_revenue desc
limit 1;

-- Determine the city with the highest VAT percentage.
select city, sum(`tax 5%`) as highest_vat, sum(total) as total_sale, 
(sum(`tax 5%`)/sum(total))*100 as highest_vat_percentage from amazon
group by city
order by highest_VAT_percentage desc
limit 1;

-- Identify the customer type with the highest VAT payments.
select `customer type`, sum(`tax 5%`) as highest_vat_payment from amazon
group by`customer type` 
order by highest_VAT_payment desc
limit 1;

-- What is the count of distinct customer types in the dataset?
select count(distinct `customer type`) as distinct_customer_type_count from amazon;

-- What is the count of distinct payment methods in the dataset?
select count(distinct payment) as distinct_payment_count from amazon;

-- Which customer type occurs most frequently?
select `customer type`, count(*) as frequency from amazon
group by `customer type`
order by frequency desc
limit 1;

-- Identify the customer type with the highest purchase frequency.
select `customer type`, count(*) as highest_purchase_frequency from amazon
group by `customer type`
order by highest_purchase_frequency desc;

-- Determine the predominant gender among customers.
select gender, count(*) as predominant_gender_count
from amazon
group by gender
order by count(*) desc
limit 1;

-- Examine the distribution of genders within each branch.
select branch, gender, count(*) as count_of_distribution from amazon
group by branch, gender
order by branch, gender;

-- Identify the time of day when customers provide the most ratings.
select timeofday, count(rating) as count_rating from amazon
group by timeofday
order by count_rating desc;

-- Determine the time of day with the highest customer ratings for each branch.
select timeofday, branch, avg(rating) as highest_customer_ratings from amazon
group by branch, timeofday
order by highest_customer_ratings desc;

-- Identify the day of the week with the highest average ratings.
select day_name, avg(rating) as highest_avg_ratings from amazon
group by day_name
order by highest_avg_ratings desc
limit 1;

-- Determine the day of the week with the highest average ratings for each branch.
select branch, day_name, avg(rating) as highest_avg_ratings from amazon
group by branch, day_name
order by highest_avg_ratings desc;



