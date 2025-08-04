# 🏦 Bank of Michigan 2021 Bank Loan Data Analytics  
![Language](https://img.shields.io/badge/Language-SQL-blue)  
![Visualization](https://img.shields.io/badge/Visualization-Tableau-purple)  
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)  
![Data](https://img.shields.io/badge/Data-BankLoan-orange)

> A data analytics and visualization project using SQL and Tableau to uncover trends in lending performance, borrower risk, and portfolio health.

---

## 1. Overview

This project analyzes over **38,000 loan applications** from the Bank of Michigan to evaluate approval trends, repayment patterns, and loan quality. The end-to-end workflow includes:

- **Data ingestion and cleaning** in SQL and Excel  
- **Transformation and metric calculation** via structured SQL queries  
- **Interactive dashboards** built with Tableau for business decision-makers

Designed for **data analyst and data engineering roles**, this project applies core **ETL principles**, such as filtering, aggregating, and classifying large financial datasets for insights and decision-making.

---

## 2. Business Objectives

### 2.1. Business Problem

As a financial institution, Bank of Michigan seeks to better understand the performance of its loan portfolio. The goal is to reduce credit risk, allocate capital effectively, and identify customer trends.

**Key business questions:**

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

## 3. Data Architecture Overview

This ETL pipeline follows a structured 3-layer architecture:

### 🔄 Workflow Stages

1. **Extract**  
   Raw loan data loaded from `.csv` into SQL and Excel for preliminary cleaning

2. **Transform**  
   SQL queries calculate KPIs, clean missing values, group by attributes like state, term, DTI, loan status

3. **Load**  
   Final results are visualized via Tableau to deliver decision-ready dashboards

---

## 4. Dataset & Schema

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

---

## 5. Methodology & SQL Analysis

Structured SQL queries were written to:

- Compute total and monthly loan KPIs  
- Segment loans into “Good” (Fully Paid, Current) and “Bad” (Charged Off)  
- Analyze impact of terms, DTI, purpose, and state on performance  
- Filter by time (MTD, PMTD) for near-real-time monitoring

## 🔹 KPI Summary

### Total Loan Applications
```sql
SELECT COUNT(id) AS Total_Applications 
FROM bank.loan_data;
```

### MTD Loan Applications
```sql
SELECT COUNT(id) AS Total_Applications 
FROM bank.loan_data
WHERE MONTH(issue_date) = 12;
```

### PMTD Loan Applications
```sql
SELECT COUNT(id) AS Total_Applications 
FROM bank.loan_data
WHERE MONTH(issue_date) = 11;
```

### Total Funded Amount
```sql
SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM bank.loan_data;
```

### MTD Funded Amount
```sql
SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM bank.loan_data
WHERE MONTH(issue_date) = 12;
```

### PMTD Funded Amount
```sql
SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM bank.loan_data
WHERE MONTH(issue_date) = 11;
```

### Total Amount Received
```sql
SELECT SUM(total_payment) AS Total_Amount_Collected 
FROM bank.loan_data;
```

---

## 🔹 Interest Rate & DTI Metrics

### Average Interest Rate
```sql
SELECT AVG(int_rate)*100 AS Avg_Int_Rate 
FROM bank.loan_data;
```

### MTD Average Interest Rate
```sql
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate 
FROM bank.loan_data
WHERE MONTH(issue_date) = 12;
```

### PMTD Average Interest Rate
```sql
SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate 
FROM bank.loan_data
WHERE MONTH(issue_date) = 11;
```

### Average DTI
```sql
SELECT AVG(dti)*100 AS Avg_DTI 
FROM bank.loan_data;
```

---

## 🔹 Loan Quality Breakdown

### Good Loan Percentage
```sql
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
    COUNT(id) AS Good_Loan_Percentage
FROM bank.loan_data;
```

### Bad Loan Percentage
```sql
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
    COUNT(id) AS Bad_Loan_Percentage
FROM bank.loan_data;
```

---

## 🔹 Loan Status Summary
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

## 🔹 Monthly Trend Report
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

## 🔹 Loan Breakdown by Attributes

### By State
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

### By Term
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

### By Employment Length
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

### By Purpose
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

### By Home Ownership
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
