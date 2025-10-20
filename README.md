# SQL-Portfolio
SQL journey from foundations to production: window functions, CTEs, stored procedures, and real-world data cleaning projects
# SQL Portfolio

![SQL](https://img.shields.io/badge/SQL-Expert-blue?style=flat-square&logo=postgresql)
![BigQuery](https://img.shields.io/badge/BigQuery-Advanced-4285F4?style=flat-square&logo=googlebigquery)

Practical SQL from foundations to production patterns. This repository documents my SQL learning journey and showcases production-grade data cleaning and analysis projects.

---

## 📂 Structure
```
sql-portfolio/
├── foundations/         # Core SQL concepts
├── intermediate/        # Joins, subqueries, string functions
├── advanced/           # CTEs, window functions, stored procedures
└── projects/
    └── layoffs_2023/   # 🌟 Featured Project: Data cleaning + EDA
```

---

## 🌟 Featured Project: Global Layoffs 2023

**Complete data pipeline:** Raw data → Production-ready dataset → Insights

**Skills Demonstrated:**
- Data cleaning with CTEs and window functions
- Exploratory data analysis with complex aggregations
- Documentation and data quality standards

👉 **[View Project](./projects/layoffs_2023/)**

---

## 📚 Learning Path

### Foundations
- SELECT, WHERE, GROUP BY, ORDER BY
- LIMIT, ALIAS, HAVING vs WHERE

### Intermediate
- All types of JOINs (INNER, LEFT, RIGHT, FULL)
- String functions and manipulation
- Subqueries and CASE statements
- Window functions (RANK, ROW_NUMBER, DENSE_RANK)

### Advanced
- Common Table Expressions (CTEs)
- Temporary tables
- Stored procedures
- Triggers and events

---

## 🚀 How to Use

**Prerequisites:**
- PostgreSQL, MySQL, or BigQuery access
- Basic SQL knowledge

**Run the layoffs project:**
1. Load `layoffs.csv` to your database
2. Execute `01_data_cleaning.sql`
3. Execute `02_eda.sql`
4. Review insights in comments

---

## 💡 Key Highlights

**Dense rank vs row_number:**
```sql
-- See advanced/14_window_functions_rank_rownum.sql
ROW_NUMBER() -- Sequential numbering, no ties
RANK()       -- Gaps after ties
DENSE_RANK() -- No gaps after ties
```

**CTE chains for auditable cleaning:**
```sql
-- See projects/layoffs_2023/01_data_cleaning.sql
WITH duplicates_flagged AS (...),
     cleaned_companies AS (...),
     standardized_industries AS (...)
SELECT * FROM standardized_industries;
```

---

## 📈 Next Steps

- [ ] Add performance tuning notes (EXPLAIN plans)
- [ ] Implement data quality unit tests
- [ ] Add real-time data pipeline examples
- [ ] Build dbt transformation models

---

## 📫 Questions?

Feel free to open an issue or reach out via [LinkedIn](your-linkedin-url)

---

⭐️ **Found this helpful?** Star this repo!
