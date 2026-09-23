with credit_score_groups  as (select customer_id,
ntile(5) over(order by credit_score) as tier
from customers)
,group_averages  as(
select 
round(avg(customers.credit_score),0)as avg_credit_score,
round(avg(annual_income),0)as avg_income,tier,
round(avg(loans.interest_rate),1)as avg_interest_rate
from credit_score_groups  
join customers on customers.customer_id = credit_score_groups .customer_id
join loans on loans.customer_id = credit_score_groups .customer_id
group by credit_score_groups .tier)
select avg_credit_score,avg_income,tier,avg_interest_rate
from group_averages 
order by tier