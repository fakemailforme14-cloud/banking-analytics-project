WITH income_groups AS (
    SELECT 
        customer_id,
        annual_income,
        NTILE(5) OVER (ORDER BY annual_income desc) AS income_group
    FROM customers
)
SELECT 
    income_group,
    round (MIN(annual_income),0) AS min_income,
   round( MAX(annual_income),0) AS max_income,
    COUNT(*) AS num_customers,
    ROUND(AVG(loan_amount), 0) AS avg_loan,
    round(avg(annual_income),0)as avg_income
FROM income_groups ig
JOIN loans l ON ig.customer_id = l.customer_id
GROUP BY income_group
ORDER BY income_group;