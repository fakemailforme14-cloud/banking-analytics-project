WITH customer_status AS (
    SELECT 
        loans.customer_id,
        MAX(loan_payments.late_payment_flag) AS has_late_payment
    FROM loan_payments
    JOIN loans ON loans.loan_id = loan_payments.loan_id
    GROUP BY loans.customer_id
)
SELECT 
    cs.has_late_payment,
    COUNT(*) AS num_customers,
    ROUND(AVG(customers.annual_income), 0) AS avg_income,
    ROUND(AVG(customers.credit_score), 2) AS avg_credit
FROM customer_status cs
JOIN customers ON customers.customer_id = cs.customer_id
GROUP BY cs.has_late_payment;