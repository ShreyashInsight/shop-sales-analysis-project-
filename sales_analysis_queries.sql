create database sales_db;
use sales_db;

create table shop_db(
order_id varchar(15),
amount decimal(10,2),
profit decimal(10,2),
quantity int,
category varchar(30),
sub_category varchar(30),
payment_method varchar(20),
order_date date,
customer_name varchar(50),
state varchar(30),
city varchar(50)
);


1.which month has the highest and lowest sales.

select month(order_date)as month,
 sum(amount)as total_sales from 
 shop_db
 group by month 
 order by total_sales desc;

-- 2. why are sales dropping in certain months.
 select month(order_date)as certain_month,
 sum(amount)as sales
 from shop_db
group by certain_month
 order by sales;


3.what is the monthly sales trend over time .

 select month(order_date)as month,
 sum(amount) as sales_trend
from shop_db
 group by month(order_date)
 order by month;

4.which city generates contributes most company revenue.

select city,sum(amount)as revenue
from shop_db
group by city
order by revenue desc;

5.which customer generates highest revenue .
select customer_name,sum(amount)as highest_revenue
from shop_db
group by customer_name
order by highest_revenue desc limit 5;

-- 6.which product sell the most quantity.
select sub_category,sum(quantity)as quantity
from shop_db
group by sub_category
order by sub_category desc limit 5;

-- 7. which payment mode is used most .
select payment_method,count(order_id)as total_orders
from shop_db
group by payment_method
order by total_orders desc limit 5;


-- 8.do certain payment methods lead to higher sales.
select payment_method, sum(amount) as higher_sales
from shop_db
group by payment_method
order by higher_sales desc limit 4;