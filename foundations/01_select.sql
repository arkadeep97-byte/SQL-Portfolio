-- =====================================
-- SQL FOUNDATIONS: SELECT Statement
-- =====================================
-- Purpose: Basic data retrieval from tables
-- Author: Arkaprabha Ray
-- Date: January 2025

-- Example 1: Select all columns
SELECT * 
FROM employees;

-- Example 2: Select specific columns
SELECT 
    employee_id,
    first_name,
    last_name,
    salary
FROM employees;

-- Example 3: Select with calculations
SELECT 
    employee_id,
    first_name,
    salary,
    salary * 1.1 AS salary_with_10pct_raise
FROM employees;

-- Example 4: Select distinct values
SELECT DISTINCT department 
FROM employees;

-- Practice Exercise:
-- Write a query to select employee names and their annual salary (monthly * 12)
