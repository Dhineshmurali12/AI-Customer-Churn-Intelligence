-- AI Customer Churn Intelligence System
-- Day 3 - Churn Business Analysis

-- 1. Overall Churn Performance

SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN churn = 'No' THEN 1 ELSE 0 END) AS retained_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn;


-- 2. Churn by Subscription Plan

SELECT
    plan_type,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN churn = 'No' THEN 1 ELSE 0 END) AS retained_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY plan_type
ORDER BY churn_rate_percentage DESC;


-- 3. Churn by Login Engagement

SELECT
    login_recency_category,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY login_recency_category
ORDER BY churn_rate_percentage DESC;


-- 4. Churn by Support Risk

SELECT
    support_risk,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY support_risk
ORDER BY churn_rate_percentage DESC;


-- 5. Churn by Payment Risk

SELECT
    payment_risk,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY payment_risk
ORDER BY churn_rate_percentage DESC;


-- 6. Churn by Usage Level

SELECT
    usage_level,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY usage_level
ORDER BY churn_rate_percentage DESC;


-- 7. Churn by Tenure

SELECT
    CASE
        WHEN tenure_months <= 6 THEN '0-6 Months'
        WHEN tenure_months <= 12 THEN '7-12 Months'
        WHEN tenure_months <= 24 THEN '13-24 Months'
        ELSE '25+ Months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY tenure_group
ORDER BY churn_rate_percentage DESC;


-- 8. Combined High-Risk Customer Segment

SELECT
    CASE
        WHEN login_recency_category = 'Inactive'
         AND payment_risk = 'High'
         AND support_risk = 'High'
        THEN 'High Risk'
        ELSE 'Other Customers'
    END AS risk_segment,

    COUNT(*) AS total_customers,

    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,

    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percentage

FROM customer_churn
GROUP BY risk_segment
ORDER BY churn_rate_percentage DESC;


-- 9. High-Risk Customer Identification

SELECT
    user_id,
    plan_type,
    monthly_fee,
    avg_weekly_usage_hours,
    support_tickets,
    payment_failures,
    tenure_months,
    last_login_days_ago,
    churn
FROM customer_churn
WHERE login_recency_category = 'Inactive'
  AND payment_risk = 'High'
  AND support_risk = 'High'
ORDER BY
    payment_failures DESC,
    support_tickets DESC,
    last_login_days_ago DESC;