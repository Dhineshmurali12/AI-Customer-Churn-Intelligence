-- AI Customer Churn Intelligence System
-- Day 3 - Database Setup

-- SQLite database table structure
-- The customer_churn table is created from the processed dataset
-- using the Python SQL pipeline.

SELECT
    name,
    type
FROM pragma_table_info('customer_churn');