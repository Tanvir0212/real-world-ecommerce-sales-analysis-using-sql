# 1. Import the data and do usual exploratory analysis steps like checking the structure & characteristics of the data:
# Data type of all columns in the "customers" table.
select * from `tanvirquerylab.Target_SQL.customers` limit 5;


# Get the time range between which the orders were placed.
select
    min(extract(Year from order_purchase_timestamp )) As start_date,
    min(order_purchase_timestamp ) As start_order_date,
    max(order_purchase_timestamp ) As end_order_date,
    max(extract(Year from order_purchase_timestamp )) As end_date
from `tanvirquerylab.Target_SQL.orders`;


# Count the Cities & States of customers who ordered during the given period.
select
  c.customer_city,
  c.customer_state,
  count(o.order_id) As total_order
from `Target_SQL.customers` c 
join `Target_SQL.orders` o  
on c.customer_id = o.customer_id
where extract(Year from o.order_purchase_timestamp ) between 2016 and 2018
group by c.customer_city, c.customer_state
order by total_order desc;


# 2. In-depth Exploration:
# Is there a growing trend in the no. of orders placed over the past years?
select
  extract(year from order_purchase_timestamp) As year_trend,
  count(*) As order_count
from `Target_SQL.orders`
group by year_trend
order by year_trend;


# Can we see some kind of monthly seasonality in terms of the no. of orders being placed?
SELECT
  EXTRACT(MONTH FROM order_purchase_timestamp) AS month,
  COUNT(*) AS order_count
FROM `Target_SQL.orders`
GROUP BY month
ORDER BY month;


# During what time of the day, do the Brazilian customers mostly place their orders? (Dawn, Morning, Afternoon or Night)
# ■ 0-6 hrs : Dawn
# ■ 7-12 hrs : Mornings
# ■ 13-18 hrs : Afternoon
# ■ 19-23 hrs : Night
SELECT
  CASE
    WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 0 AND 6 THEN 'Dawn'
    WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 7 AND 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 13 AND 18 THEN 'Afternoon'
    WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 19 AND 23 THEN 'Night'
  END AS time_category,
  COUNT(*) AS order_count
FROM `Target_SQL.orders`
GROUP BY time_category
ORDER BY order_count DESC;


# 3. Evolution of E-commerce orders in the Brazil region:
# Get the month on month no. of orders placed in each state.
SELECT
  FORMAT_DATE('%Y-%m', DATE(o.order_purchase_timestamp)) AS year_month,
  c.customer_state,
  COUNT(o.order_id) AS total_orders
FROM `Target_SQL.customers` c 
JOIN `Target_SQL.orders` o  
ON c.customer_id = o.customer_id
GROUP BY year_month, c.customer_state
ORDER BY year_month, c.customer_state;


# How are the customers distributed across all the states?
select 
  count(*) As state_customer,
  customer_state
from `Target_SQL.customers`
group by customer_state
order by state_customer desc;



# 4. Impact on Economy: Analyze the money movement by e-commerce by looking at order prices, freight and others.
# Get the % increase in the cost of orders from year 2017 to 2018 (include months between Jan to Aug only).
WITH yearly_cost as (
select
  extract(Year FROM o.order_purchase_timestamp) As yearr,
  round(sum(p.payment_value),2)As total_cost
from Target_SQL.orders o 
join Target_SQL.payments p 
on o.order_id = p.order_id
where extract(Year FROM o.order_purchase_timestamp) in (2017, 2018) and 
extract(Month FROM o.order_purchase_timestamp) between 1 and 8
group by yearr
)

select
    round(
      (max(case when yearr = 2018 then total_cost end) -
      max(case when yearr = 2017 then total_cost end)) 
      / max(case when yearr = 2017 then total_cost end) * 100, 2
    ) AS percentage_increase
from yearly_cost;


# You can use the "payment_value" column in the payments table to get the cost of orders.
select
  order_id,
  round(sum(payment_value), 2) As order_cost
from `Target_SQL.payments`
group by order_id
order by order_cost desc;

# Calculate the Total & Average value of order price and freight for each state.
select
  c.customer_state,
  round(sum(oi.price),2) As total_price,
  round(sum(oi.price) / count(DISTINCT o.order_id),2) As avg_order_value,
  round(avg(oi.price),2) As avg_item_price,
   
  round(sum(oi.freight_value),2) As total_freight_value,
  round(sum(oi.freight_value) / count(DISTINCT o.order_id),2) As avg_freight_value_per_cus,
  round(avg(oi.freight_value),2 ) avg_freight_value
from `Target_SQL.customers` c 
join `Target_SQL.orders` o 
on c.customer_id = o.customer_id
join Target_SQL.order_items oi 
on oi.order_id = o.order_id 
group by c.customer_state;

# Calculate the Total & Average value of order price and freight for each state. (with cta method)
with avg_values AS (
  select 
    o.order_id,
    c.customer_state,
    sum(oi.price) As total_price,
    sum(oi.freight_value) As total_freight_value
  from `Target_SQL.order_items` oi 
  join `Target_SQL.orders` o 
  on oi.order_id = o.order_id
  join `Target_SQL.customers` c 
  on c.customer_id = o.customer_id
  GROUP BY o.order_id, c.customer_state
)

select
  customer_state,
  sum(total_price) As total_revenu_price,
  round(sum(total_price) / count(order_id),2) As avg_order_value,
  round(sum(total_freight_value),2) As total_freight_price_value,
  round(sum(total_freight_value) / count(order_id),2) As avg_order_freight_value
from avg_values
group by customer_state;

# 5. Analysis based on sales, freight and delivery time.
# Find the no. of days taken to deliver each order from the order’s purchase date as delivery time. 
# Also, calculate the difference (in days) between the estimated & actual delivery date of an order.
# Do this in a single query.
select
   order_id,
   date_diff(order_delivered_customer_date, order_purchase_timestamp, day) As time_to_deliver,
   date_diff(order_delivered_customer_date,order_estimated_delivery_date, day) As diff_estimated_delivery
from `Target_SQL.orders`;


# Find out the top 5 states with the highest & lowest average freight value.
select
  c.customer_state,
  avg(oi.freight_value) As avg_freight_value
from `Target_SQL.customers` c 
  join `Target_SQL.orders` o 
  on c.customer_id = o.customer_id
  join Target_SQL.order_items oi 
  on oi.order_id = o.order_id 
  group by c.customer_state
  order by avg_freight_value desc
  limit 5;

# Find out the top 5 states with the highest & lowest average delivery time.
select
  c.customer_state,
  round(avg(date_diff(o.order_delivered_customer_date, o.order_purchase_timestamp, day)),2)  As avg_time_to_deliver
from `Target_SQL.orders` o
join Target_SQL.customers c  
  on c.customer_id = o.customer_id
  where o.order_delivered_customer_date is not null
  group by c.customer_state
  order by avg_time_to_deliver desc
  limit 5;

# Find out the top 5 states where the order delivery is really fast as compared to the estimated date of delivery.
# You can use the difference between the averages of actual & estimated delivery date to figure out how fast the#  #delivery was for each state.
select
   c.customer_state,
     ROUND(
    AVG(DATE_DIFF(o.order_estimated_delivery_date, o.order_delivered_customer_date, DAY)),
    2
  ) AS avg_delivery_diff
from `Target_SQL.orders` o 
join Target_SQL.customers c  
on c.customer_id = o.customer_id
where o.order_delivered_customer_date is not null
group by c.customer_state
order by avg_delivery_diff DESC
limit 5;

# 6. Analysis based on the payments:
# Find the month on month no. of orders placed using different payment types.
SELECT
  FORMAT_DATE('%Y-%m', DATE(o.order_purchase_timestamp)) AS year_month,
  p.payment_type,
  COUNT(DISTINCT o.order_id) AS order_count
FROM `Target_SQL.orders` o 
JOIN `Target_SQL.payments` p 
  ON o.order_id = p.order_id
GROUP BY year_month, p.payment_type
ORDER BY year_month, order_count DESC;


# Find the no. of orders placed on the basis of the payment installments that have been paid.
select 
  payment_installments,
  count(distinct order_id) As order_count
from Target_SQL.payments
group by payment_installments
order by order_count desc;





