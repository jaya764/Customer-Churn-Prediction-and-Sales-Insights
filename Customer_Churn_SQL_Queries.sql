use training_project;

/* checking null values in each column */ 
select * from customer_data;
select count(*) from customer_data;

select * from customer_data where customer_name is null;
select 
sum(case when Purchase_date is null then 1 else 0 end ) 
as purchase_date_nulls,
sum(case when Product_category is null then 1 else 0 end ) 
as product_category_nulls,
sum(case when Product_price is null then 1 else 0 end ) 
as product_price_nulls,
sum(case when Quantity is null then 1 else 0 end ) 
as Quantity_nulls,
sum(case when Total_amount is null then 1 else 0 end ) 
as total_amount_nulls,
sum(case when Payment_Method is null then 1 else 0 end ) 
as payment_method_nulls,
sum(case when Customer_Age is null then 1 else 0 end ) 
as customer_age_nulls,
sum(case when Returns is null then 1 else 0 end ) 
as returns_nulls,
sum(case when Customer_name is null then 1 else 0 end ) 
as customer_name_nulls,
sum(case when Gender is null then 1 else 0 end ) 
as gender_nulls,
sum(case when Churn is null then 1 else 0 end ) 
as churn_nulls
from customer_data;
/* checking duplicates present in dataset*/
select Customer_id,count(*)
from customer_data
group by customer_id
having count(*)>1;

select * ,count(*) from customer_data 
group by customer_id,Purchase_date,Product_category,Product_price,Quantity,total_amount,Payment_Method,Customer_Age,Returns,Customer_name,Age,Gender,Churn
having count(*) >1;

select Churn, count(*) from customer_data group by Churn;
select churn, count(*) from customer_summary group by churn;

select Customer_id,max(Customer_name) as customername,
max(Gender) as gender, max(Age) as age, count(*) as total_purchases, sum(Total_amount) as total_spent,
avg(Total_amount) as avg_purchase_value, max(Churn) as churn 
from customer_data group by Customer_id;

/*creating customer level table*/

create table customer_summary as 
select Customer_id,max(Customer_name) as customername,
max(Gender) as gender, max(Age) as age, count(*) as total_purchases, sum(Total_amount) as total_spent,
avg(Total_amount) as avg_purchase_value, max(Churn) as churn 
from customer_data group by Customer_id;
 describe customer_summary;
 
 select Customer_id,avg_purchase_value from customer_summary limit 10;


