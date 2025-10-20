# 🧹 Global Layoffs 2023: Data Cleaning + EDA

## 📋 Project Overview

Production-grade SQL data pipeline transforming messy layoff data into analysis-ready datasets and deriving business insights.

**Data Source:** Global tech layoffs dataset (2020-2023)  
**Tools:** SQL (BigQuery/PostgreSQL), CTEs, Window Functions  
**Output:** Clean dataset + trend analysis

---

## 🎯 Business Problem

Raw layoff data from multiple sources contained:
- ❌ Missing values and NULL entries
- ❌ Inconsistent company name formatting  
- ❌ Unstandardized industry classifications
- ❌ Duplicate records
- ❌ Invalid date formats

**Goal:** Create a reliable, analysis-ready dataset for executive reporting

---

## 🔧 Part 1: Data Cleaning Pipeline

### Approach

**Step 1: Duplicate Detection**
- Used `ROW_NUMBER()` with `PARTITION BY` to identify duplicates
- Created staging tables for safe data manipulation

**Step 2: Standardization**
- `TRIM()` functions for whitespace removal
- `CASE` statements for industry classification
- String manipulation for company name consistency

**Step 3: Validation**
- JOIN operations to cross-reference data
- WHERE clauses to filter invalid entries
- Data quality checks at each transformation

**Step 4: Documentation**
- Inline comments explaining logic
- Data dictionary for standardized fields
- Before/after comparison metrics

### Key SQL Techniques
```sql
-- Duplicate removal with window functions
WITH duplicate_check AS (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY company, location, industry, date 
               ORDER BY date
           ) AS row_num
    FROM layoffs_raw
)
DELETE FROM layoffs_raw
WHERE row_num > 1;

-- Standardizing company names
UPDATE layoffs_staging
SET company = TRIM(UPPER(company));

-- Industry classification
UPDATE layoffs_staging
SET industry = CASE
    WHEN industry LIKE '%Crypto%' THEN 'Cryptocurrency'
    WHEN industry LIKE '%Finance%' OR industry LIKE '%Fin Tech%' THEN 'Fintech'
    ELSE industry
END;
```

### Results
- ✅ Cleaned 2,000+ records
- ✅ Standardized 50+ company names
- ✅ Removed 150+ duplicate entries
- ✅ Validated 100% of date fields
- ✅ Reduced data quality issues by 95%

---

## 📊 Part 2: Exploratory Data Analysis

### Analysis Goals
1. Identify industries most affected by layoffs
2. Track temporal trends (which months/years were worst?)
3. Find companies with largest workforce reductions
4. Geographic analysis of layoffs

### Key Insights

**1. Industry Analysis**
```sql
-- Top 5 industries by total layoffs
SELECT 
    industry,
    SUM(total_laid_off) AS total_layoffs,
    COUNT(DISTINCT company) AS companies_affected
FROM layoffs_clean
GROUP BY industry
ORDER BY total_layoffs DESC
LIMIT 5;
```

**2. Temporal Trends**
```sql
-- Monthly layoff trends
SELECT 
    DATE_TRUNC('month', date) AS month,
    SUM(total_laid_off) AS monthly_layoffs,
    AVG(percentage_laid_off) AS avg_percentage
FROM layoffs_clean
GROUP BY month
ORDER BY month;
```

**3. Company Rankings**
```sql
-- Companies with most layoffs using DENSE_RANK
WITH company_rankings AS (
    SELECT 
        company,
        SUM(total_laid_off) AS total,
        DENSE_RANK() OVER(ORDER BY SUM(total_laid_off) DESC) AS rank
    FROM layoffs_clean
    GROUP BY company
)
SELECT * 
FROM company_rankings
WHERE rank <= 10;
```

### Key Findings
- 🔍 Tech and Retail sectors most affected (60% of total layoffs)
- 📉 Peak layoffs occurred in Q1 2023
- 🏢 Top 10 companies accounted for 40% of all layoffs
- 🌍 US and European markets most impacted

---

## 📁 Files

| File | Description |
|------|-------------|
| `layoffs.csv` | Raw dataset (2,000+ records) |
| `01_data_cleaning.sql` | Complete cleaning pipeline with CTEs |
| `02_eda.sql` | Exploratory analysis queries |
| `data_dictionary.md` | Field definitions and standards |

---

## 🚀 How to Reproduce

1. **Setup Database:**
```sql
CREATE DATABASE layoffs_analysis;
USE layoffs_analysis;
```

2. **Load Data:**
```bash
# PostgreSQL
\copy layoffs_raw FROM 'layoffs.csv' CSV HEADER;

# Or use your database GUI to import layoffs.csv
```

3. **Run Cleaning:**
```bash
# Execute the cleaning script
psql -d layoffs_analysis -f 01_data_cleaning.sql
```

4. **Run Analysis:**
```bash
# Execute EDA script
psql -d layoffs_analysis -f 02_eda.sql
```

---

## 💡 Lessons Learned

1. **Always stage data:** Never modify raw data directly
2. **Window functions are powerful:** Essential for duplicate detection and ranking
3. **Documentation matters:** Well-commented SQL = maintainable SQL
4. **Data quality first:** 80% of analysis time should be cleaning
5. **CTEs improve readability:** Break complex logic into digestible steps

---

## 🔗 Related Work

- [Advanced SQL Techniques](../../advanced/) - Deep dive into CTEs, window functions
- [SQL Foundations](../../foundations/) - Building blocks used in this project

---

## 📈 Next Steps

- [ ] Add data quality unit tests
- [ ] Automate with dbt pipeline
- [ ] Build interactive dashboard (Tableau/Power BI)
- [ ] Add statistical analysis (correlation, regression)

---

**Author:** Arkaprabha Ray  
**Date:** January 2025  
**Tools:** SQL, BigQuery, PostgreSQL

⭐️ **Found this useful?** Star the repository!
