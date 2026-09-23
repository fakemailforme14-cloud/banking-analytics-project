WITH cte_1 AS (
    SELECT 
        customers.customer_id,
        customers.credit_score,
        round(customers.annual_income, 0) AS annual_income,
        customers.occupation,
        round(SUM(accounts.balance), 0) AS acc_bal,
        CASE WHEN customers.annual_income < 500000 THEN 1 ELSE 0 END AS annual_test,
        CASE WHEN customers.credit_score < 400 THEN 1 ELSE 0 END AS credit_test,
        CASE WHEN customers.occupation = 'Student' THEN 1 ELSE 0 END AS occupation_test,
        CASE WHEN ROUND(SUM(accounts.balance), 0) < 5000 THEN 1 ELSE 0 END AS balance_test
    FROM customers
    JOIN accounts ON accounts.customer_id = customers.customer_id
    GROUP BY customers.customer_id)
, cte_2 as (SELECT *,CASE WHEN annual_test+credit_test+occupation_test+balance_test >= 2 THEN 'no' ELSE 'yes' END AS allowed_loan
FROM cte_1 )

select  
        count(customer_id) as num_customers,
        sum(occupation_test)as student_num,
        round(avg(credit_score),0) as credit_score,
        round(avg(annual_income),0) as annual_income,
        round(avg(acc_bal),0) as acc_bal,
        allowed_loan
from cte_2
group by allowed_loan



 







