# 🏦 Bank of Michigan 2021 Bank Loan Data Analytics  
![Language](https://img.shields.io/badge/Language-SQL-blue)  ![Visualization](https://img.shields.io/badge/Visualization-Tableau-purple)  ![Status](https://img.shields.io/badge/Project-Completed-brightgreen)  ![Data](https://img.shields.io/badge/Data-BankLoan-orange)

---

## 1. Project Overview

- **This project analyzes over **38,000 loan applications** from the Bank of Michigan to evaluate approval trends, repayment patterns, and loan quality. The end-to-end workflow includes:**

   - Data ingestion and cleaning** in SQL and Excel  
   - Transformation and metric calculation** via structured SQL queries  
   - Interactive dashboards** built with Tableau for business decision-makers

- **Designed for **data analyst and data engineering roles**, this project applies core **ETL principles**, such as filtering, aggregating, and classifying large financial datasets for insights and decision-making.**

---

## 📂 Resources

- SQL Script: [Bank Loan Data Analytics SQL Script](https://github.com/TrungLe123692/Bank-of-Michigan-2021-Bank-Loan-Data-Analytics-Project/blob/main/Bank%20of%20Michigan%20Loan%20Analytcis%20Project%20SQL%20Script.sql)
- Tableau Dashboard: [Bank Loan Dashboard](https://public.tableau.com/app/profile/trung.le6260/viz/BankLoanWorkbook_Incomplete/Overview)
- Dataset Source: [Bank Loan Dataset](https://github.com/TrungLe123692/Bank-of-Michigan-2021-Bank-Loan-Data-Analytics-Project/blob/main/Bank%20of%20Michigan%20Bank%20Loan%20Data.csv)
- SQL Report: [SQL Script Report](https://github.com/TrungLe123692/Bank-of-Michigan-2021-Bank-Loan-Data-Analytics-Project/blob/main/Bank%20Loan%20Data%20Analytics_SQL%20Queries.pdf)

---

## 2. Business Objectives

### 2.1. Business Problem

As a financial institution, Bank of Michigan seeks to better understand the performance of its loan portfolio. The goal is to reduce credit risk, allocate capital effectively, and identify customer trends.

- **Key business questions:**

  - What percentage of loans are high-risk (“Charged Off”)?
  - Which states or borrower profiles yield the healthiest returns?
  - How do debt-to-income (DTI) and interest rates impact loan quality?
  - What loan purposes or terms are most common and profitable?

### 2.2. Business Impact

  - Enhanced risk segmentation using DTI and loan verification status  
  - Identification of underperforming loan types and geographies  
  - Support for smarter product design, loan term offerings, and targeting  
  - Clear visualization of monthly trends to guide underwriting strategies

---

## 3. About the Data and Structure 

The dataset includes loan applications from 2021, with **14 columns and 38,000+ rows**. Each row represents a unique loan application with borrower details and financial metrics.

### 🔗 Download Dataset  
[📁 Google Drive Link](https://drive.google.com/file/d/1WNlzRVDZ2rKdiwpGUFBSuGA50EsI-j2v/view?usp=sharing)

### 📊 Data Dictionary

| Column Name     | Description                                       |
|------------------|---------------------------------------------------|
| `id`             | Unique loan application ID                        |
| `issue_date`     | Date the loan was issued                          |
| `loan_amount`    | Total amount funded for the loan                  |
| `total_payment`  | Total amount received from the borrower           |
| `int_rate`       | Interest rate applied to the loan (decimal)       |
| `dti`            | Debt-to-Income ratio of the applicant             |
| `loan_status`    | Status of the loan (e.g., Fully Paid, Charged Off)|
| `address_state`  | State of the borrower’s address                   |
| `term`           | Loan term (e.g., 36 months, 60 months)            |
| `emp_length`     | Employment length of the borrower                 |
| `purpose`        | Purpose of the loan (e.g., credit card, home)     |
| `home_ownership` | Type of home ownership (e.g., Rent, Mortgage)     |

[Project Structure](https://github.com/TrungLe123692/Bank-of-Michigan-2021-Bank-Loan-Data-Analytics-Project/blob/main/Bank%20of%20Michigan%20Bank%20Loan%20Data.csv)

```
movie-financial-success-analysis/
│
├── data/
│   ├── imdb_movies_dataset.csv                
│   └── README_data.md                         
│
├── notebooks/
│   ├── Movie_Financial_Success_Analysis.ipynb 
│   └── Experimental_Analysis.ipynb            
│
├── scripts/
│   ├── correlation_regression_analysis.py     
│   ├── data_preprocessing.py                  
│   └── feature_engineering.py                  
│
├── visuals/
│   ├── budget_vs_gross_regression.png          
│   ├── score_vs_gross_regression.png           
│   ├── correlation_heatmap_pearson.png         
│   ├── correlation_heatmap_spearman.png       
│   ├── boxplot_gross_outliers.png              
│   ├── top_production_companies.png            
│   └── visuals_readme.md                       
│
├── output/
│   ├── Movie_Financial_Success_Report.pdf      
│   ├── model_results_summary.csv               
│   └── key_findings.txt                      
│
├── docs/
│   ├── methodology.md                         
│   └── references.md                           
│
├── README.md                                  
├── LICENSE                                    
├── .gitignore                               
└── requirements.txt     
```
---

## 4. Data Architecture Overview

### ETL Workflow
> ✅ This project follows a robust ETL (Extract, Transform, Load) pipeline to process raw bank loan data and convert it into actionable insights. The workflow was built using Excel (Power Query), SQL (SQLite), and Tableau, and demonstrates skills in data profiling, cleaning, KPI creation, and dashboard development.

### 4.1. Extract

Raw data was ingested from `.csv` files and loaded into both Excel and SQL environments for initial processing:

- **4.1.1. Excel (Power Query):**
  - Performed initial **data profiling** using built-in tools to identify missing values, outliers, and inconsistencies
  - Applied data cleansing techniques including:
    - Removal of empty or null-heavy rows
    - Type conversion checks (e.g., ensuring numeric columns were not read as text)
    - Filtering out invalid records (e.g., loans with zero term or missing borrower ID)
  - Created intermediate summary tables to validate row counts and distribution across variables like loan term and status

- **4.1.2. SQL (SQLite):**
  - Imported cleaned `.csv` files using `sqlite3` CLI and Python scripts
  - Created **normalized relational schemas** using `CREATE TABLE`, assigning appropriate data types (`INTEGER`, `REAL`, `TEXT`, `DATE`)
  - Established **primary keys** and **foreign key relationships** to ensure referential integrity
  - Used `PRAGMA` statements to validate schema integrity and indexing

---

### 4.2. Transform

The transformation stage involved substantial SQL scripting to prepare the data for analytical consumption:

- **4.2.1 Data Cleaning & Standardization:**
  - Used `COALESCE()` to replace `NULL` values with fallback values
  - Applied `CASE WHEN` logic to normalize inconsistent entries in `loan_status`, `grade`, and `employment_length`
  - Used `TRIM()`, `UPPER()`, and `SUBSTR()` to clean up text fields (e.g., state abbreviations, purpose descriptions)

- **4.2.2. KPI Derivation:**
  - Calculated key business metrics including:
    - **Default Rate:**  
      `SUM(CASE WHEN loan_status = 'Default' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)`
    - **Average Loan Amount by Term and Grade:**  
      Aggregated using `GROUP BY term, grade`
    - **Debt-to-Income (DTI) Risk Bands:**  
      Bucketed using `CASE` logic for high/medium/low categories

- **4.2.3. Feature Engineering:**
  - Created derived fields such as:
    - `loan_age` (based on issue date)
    - `monthly_installment` (calculated using interest rate, amount, and term)
  - Built temporary views to simplify multi-step calculations and join logic

- **4.2.4. Aggregations & Segmentations:**
  - Used nested subqueries and `CTE`s (Common Table Expressions) for layered transformations
  - Grouped data by borrower attributes (e.g., credit grade, employment length) for cohort analysis
  - Created final summary tables to feed Tableau dashboards

---

### 4.3. 📊 Load

The final transformed dataset was loaded into **Tableau Desktop** for dynamic and interactive data visualization:

- **4.3.1. Data Connection:**
  - Connected Tableau to `.csv` outputs from SQL or directly via live connection to SQLite database
  - Verified data integrity by comparing row counts and key metrics to SQL output

- **4.3.2. Dashboard Development:**
  - Built multi-sheet dashboards featuring:
    - **Filled maps** to show default rates by state
    - **Stacked bar charts** for loan distributions by term and grade
    - **Scatter plots** for interest rate vs. loan amount
    - **Donut charts** to visualize loan status ratios
    - **KPI cards** for total loan volume, default rate, and average interest rate
  - Incorporated **parameters** and **interactive filters** for:
    - Loan term
    - Credit grade
    - Issue year
    - State

- **4.3.3. Performance Optimization:**
  - Used Tableau **LOD (Level of Detail) expressions** to preserve KPI accuracy across filters
  - Minimized data bloat by filtering unused columns and pre-aggregating in SQL

---

## 5. Methodology & SQL Analysis

Structured SQL queries were written to:

- Compute total and monthly loan KPIs  
- Segment loans into “Good” (Fully Paid, Current) and “Bad” (Charged Off)  
- Analyze impact of terms, DTI, purpose, and state on performance  
- Filter by time (MTD, PMTD) for near-real-time monitoring

### 5.1 KPI Summary

> ✅ These SQL queries provided key performance metrics, tracking loan application volumes and funding amounts across current and prior months, as well as total payments collected.

- **5.1.1 Total Loan Applications**
```sql
SELECT COUNT(id) AS Total_Applications 
FROM bank.loan_data;
```

- **5.1.2 MTD Loan Applications**
```sql
SELECT COUNT(id) AS Total_Applications 
FROM bank.loan_data
WHERE MONTH(issue_date) = 12;
```

- **5.1.3. PMTD Loan Applications**
```sql
SELECT COUNT(id) AS Total_Applications 
FROM bank.loan_data
WHERE MONTH(issue_date) = 11;
```

- **5.1.4. Total Funded Amount**
```sql
SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM bank.loan_data;
```

- **5.1.5. MTD Funded Amount**
```sql
SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM bank.loan_data
WHERE MONTH(issue_date) = 12;
```

- **5.1.6. PMTD Funded Amount**
```sql
SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM bank.loan_data
WHERE MONTH(issue_date) = 11;
```

- **5.1.7. Total Amount Received**
```sql
SELECT SUM(total_payment) AS Total_Amount_Collected 
FROM bank.loan_data;
```

---

### 5.2. Interest Rate & DTI Metrics

> ✅ These queries calculated average interest rates and debt-to-income ratios, enabling month-to-month comparisons and overall portfolio assessment.

- **5.2.1. Average Interest Rate**
```sql
SELECT AVG(int_rate)*100 AS Avg_Int_Rate 
FROM bank.loan_data;
```

- **5.2.2. MTD Average Interest Rate**
```sql
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate 
FROM bank.loan_data
WHERE MONTH(issue_date) = 12;
```

- **5.2.3. PMTD Average Interest Rate**
```sql
SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate 
FROM bank.loan_data
WHERE MONTH(issue_date) = 11;
```

- **5.2.4. Average DTI**
```sql
SELECT AVG(dti)*100 AS Avg_DTI 
FROM bank.loan_data;
```

---

### 5.3. Loan Quality Breakdown

> ✅ These queries categorized loans by performance status, calculating good and bad loan percentages while providing comprehensive breakdowns of loan counts, payment amounts, funded amounts, interest rates, and debt-to-income ratios by status

- **5.3.1. Good Loan Percentage**
```sql
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
    COUNT(id) AS Good_Loan_Percentage
FROM bank.loan_data;
```

- **5.3.2. Bad Loan Percentage**
```sql
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
    COUNT(id) AS Bad_Loan_Percentage
FROM bank.loan_data;
```

---

- **5.3.3. Loan Status Summary**
```sql
SELECT
    loan_status,
    COUNT(id) AS LoanCount,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount,
    AVG(int_rate * 100) AS Interest_Rate,
    AVG(dti * 100) AS DTI
FROM bank.loan_data
GROUP BY loan_status;
```

---

### 5.4. Monthly Trend Report

> ✅ This query analyzed monthly lending trends by aggregating loan applications, funded amounts, and received payments by issue date month.

```sql
SELECT 
    MONTH(issue_date) AS Month_Number, 
    EXTRACT(MONTH FROM issue_date) AS Month_name, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank.loan_data
GROUP BY MONTH(issue_date), EXTRACT(MONTH FROM issue_date)
ORDER BY MONTH(issue_date);
```

---

### 5.5. Loan Breakdown by Attributes

> ✅ These queries segmented loan portfolio performance across key demographics (state, term, employment length, purpose, and home ownership), aggregating applications, funded amounts, and received payments for each attribute category.
 
- **5.5.1. By State**
```sql
SELECT 
    address_state AS State, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank.loan_data
GROUP BY address_state
ORDER BY address_state;
```

- **5.5.2. By Term**
```sql
SELECT 
    term AS Term, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank.loan_data
GROUP BY term
ORDER BY term;
```

- **5.5.3.By Employment Length**
```sql
SELECT 
    emp_length AS Employee_Length, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank.loan_data
GROUP BY emp_length
ORDER BY emp_length;
```

- **5.5.4. By Purpose**
```sql
SELECT 
    purpose AS PURPOSE, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank.loan_data
GROUP BY purpose
ORDER BY purpose;
```

- **5.5.5. By Home Ownership**
```sql
SELECT 
    home_ownership AS HomeOwnership, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank.loan_data
GROUP BY home_ownership
ORDER BY home_ownership;
```
## 6. 📊 Tableau Dashboard Design

- **Loan Default Rate by State (Filled Map):**  
  Highlights geographic trends in default risk, enabling regional risk assessments.

- **Loan Distribution by Term and Grade (Stacked Column Chart):**  
  Compares loan volumes across different term lengths and credit grades.

- **Average Loan Amount by DTI Group (Bar Chart):**  
  Identifies how debt-to-income ratios impact borrowing behavior and loan sizing.

- **Interest Rate vs. Loan Amount (Scatter Plot):**  
  Explores the relationship between loan pricing and principal amount by borrower profile.

- **Loan Status Breakdown (Donut Chart):**  
  Visualizes the proportion of fully paid, charged-off, and late loans for quick portfolio assessment.

- **KPI Cards (Dynamic with Filters):**  
  Key performance indicators such as total loan volume, average interest rate, and default rate, powered by Tableau calculations and responsive to user filters.

- **Interactive Filters (State, Term, Grade, Year):**  
  Let users drill down to specific borrower segments and time periods for focused analysis.


👉 **[Click here to explore the live Tableau dashboard](https://public.tableau.com/app/profile/trung.le6260/viz/BankLoanWorkbook_Incomplete/Overview)**  

This dashboard visualizes key loan metrics such as default rates, average loan amounts, and risk segmentation by state, credit grade, and term. Interactive filters and KPI cards allow users to dynamically explore the portfolio from multiple perspectives.
