select *
from customer_shopping_behavior_cleaned

-- Total revenue generated male vs female customers
select gender, sum(purchase_amount) as total_revenue
from customer_shopping_behavior_cleaned
group by gender

-- Customers used a discount but still spent more than the average purchase amount
select customer_id, purchase_amount
from customer_shopping_behavior_cleaned
where discount_applied = 'yes'
and purchase_amount > (select avg(purchase_amount) from customer_shopping_behavior_cleaned)

--Top 5 products with the highest average review rating
select top 5 item_purchased, avg(review_rating) as "Average Product Rating"
from customer_shopping_behavior_cleaned
group by item_purchased
order by avg(review_rating) desc

--Comparison of average Purchase Amount between Standard and Express Shipping
select avg(purchase_amount) as "Average Purchase Amount", shipping_type
from customer_shopping_behavior_cleaned
where shipping_type in ('Express', 'Standard')
group by shipping_type

--Compare average spend and total revenue between subscribers and non-subscribers
select subscription_status, count(customer_id) as total_customer, avg(cast(purchase_amount as float)) as average_revenue, sum(purchase_amount) as total_revenue
from customer_shopping_behavior_cleaned
group by subscription_status

--5 products have the highest percentage of purchases with discounts applied
select top 5 item_purchased, sum(100 * case when discount_applied = 'Yes' then 1 else 0 end)/count(*) as discount_rate
from customer_shopping_behavior_cleaned
group by item_purchased
order by discount_rate desc

--Segmentation of new, returning, and loyal customer
with customer_type as (
select customer_id, previous_purchases,
case when previous_purchases = 1 then 'New'
when previous_purchases between 2 and 10 then 'Returning'
else 'Loyal'
end as customer_segment
from customer_shopping_behavior_cleaned
)

select customer_segment, count(*) as total_customer
from customer_type
group by customer_segment

--Top 3 most purchased products within each category
with item_counts as (
select category, item_purchased, count(customer_id) as total_orders,
row_number() over(partition by category order by count(customer_id) desc) as item_rank
from customer_shopping_behavior_cleaned
group by category, item_purchased
)

select category, item_purchased, total_orders, item_rank
from item_counts
--where item_rank <= 3

--cutomers who are repeat buyers also likely to subsribe
select subscription_status, count(customer_id) as repeat_buyers
from customer_shopping_behavior_cleaned
where previous_purchases > 5
group by subscription_status

--Revenue contribution of each age group
select age_group, sum(purchase_amount) as revenue
from customer_shopping_behavior_cleaned
group by age_group
order by revenue desc