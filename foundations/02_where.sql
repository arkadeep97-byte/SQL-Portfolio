-- =====================================
-- SQL FOUNDATIONS: WHERE Clause
-- =====================================
-- Purpose: Filter rows based on conditions

-- Example 1: Simple condition
SELECT * 
FROM employees
WHERE salary > 50000;

-- Example 2: Multiple conditions (AND)
SELECT *
FROM employees
WHERE salary > 50000 
  AND department = 'Sales';

-- Example 3: Multiple conditions (OR)
SELECT *
FROM employees
WHERE department = 'Sales' 
   OR department = 'Marketing';

-- Example 4: IN operator
SELECT *
FROM employees
WHERE department IN ('Sales', 'Marketing', 'IT');

-- Example 5: BETWEEN operator
SELECT *
FROM employees
WHERE salary BETWEEN 40000 AND 60000;

-- Example 6: LIKE operator (pattern matching)
SELECT *
FROM employees
WHERE first_name LIKE 'J%';  -- Names starting with J
