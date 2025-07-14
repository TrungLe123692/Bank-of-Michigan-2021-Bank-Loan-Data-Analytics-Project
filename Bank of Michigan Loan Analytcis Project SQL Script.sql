                                                               -- Bank Loan Analytics --
# KPI's 
# Total Loan Application 
SELECT COUNT(id) AS Total_Applications 
FROM bank.loan_data;

# MTD Loan Application
SELECT COUNT(id) AS Total_Applications 
FROM bank.loan_data
WHERE MONTH(issue_date) = 12;

# PMTD Loan Application 
SELECT COUNT(id) AS Total_Applications 
FROM bank.loan_data
WHERE MONTH(issue_date) = 11id;

# Total Funded Amount 
SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM bank.loan_data;

# MTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM bank.loan_data
WHERE MONTH(issue_date) = 12;

# PMTD Total Funded Amount 
SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM bank.loan_data
WHERE MONTH(issue_date) = 11;

# Total Amount Received 
SELECT SUM(total_payment) AS Total_Amount_Collected 
FROM bank.loan_data;

# MTD Total Amount Received 
SELECT SUM(total_payment) AS Total_Amount_Collected 
FROM bank.loan_data
WHERE MONTH(issue_date) = 12;

# PMTD Total Amount Received 
SELECT SUM(total_payment) AS Total_Amount_Collected 
FROM bank.loan_data
WHERE MONTH(issue_date) = 11;

# Average Interest Rate
SELECT AVG(int_rate)*100 AS Avg_Int_Rate 
FROM bank.loan_data;

# MTD Average Interest Rate 
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate 
FROM bank.loan_data
WHERE MONTH(issue_date) = 12;

# PMTD Averge Interest Rate 
SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate 
FROM bank.loan_data
WHERE MONTH(issue_date) = 11;

# Average DTI 
SELECT AVG(dti)*100 AS Avg_DTI 
FROM bank.loan_data;

# MTD Average DTI 
SELECT AVG(DTI) as MTD_AVG_DTI 
FROM bank.loan_data
WHERE MONTH(issue_date) = 11;

# PMTD Average DTI 
SELECT AVG(DTI) AS PMTD_AVG_DTI
FROM bank.loan_data 
WHERE MONTH(issue_date) = 11; 

# GOOD LOAN ISSUED 
# Good Loan Percentage 
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM bank.loan_data; 

# Good Loan Applciations 
SELECT COUNT(id) AS Good_Loan_Applications 
FROM bank.loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

# Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount 
FROM bank.loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

# Good Loan Amount Received 
SELECT SUM(total_payment) AS Good_Loan_amount_received 
FROM bank.loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

# BAD LOAN ISSUED
# Bad Loan Percnetage 
SELECT
    (COUNT(CASE WHEN 
		    loan_status = 'Charged Off' 
			THEN id 
            END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank.loan_data;

# Bad Loan Applications
SELECT
    (COUNT(CASE WHEN 
            loan_status = 'Charged Off' 
		   THEN id 
		   END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank.loan_data;

# Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount 
FROM bank.loan_data
WHERE loan_status = 'Charged Off';

# Bad Loan Amount Received 
SELECT SUM(total_payment) AS Bad_Loan_amount_received 
FROM bank.loan_data
WHERE loan_status = 'Charged Off'; 

# LOAN STATUS 
SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank.loan_data
    GROUP BY
        loan_status; 

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bankloan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status;

# B. BANK LOAN REPORT RANKING 
SELECT 
	MONTH(issue_date) AS Month_Munber, 
	EXTRACT(MONTH FROM issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank.loan_data
GROUP BY MONTH(issue_date), EXTRACT(MONTH FROM issue_date)
ORDER BY MONTH(issue_date);

# State
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank.loan_data
GROUP BY address_state
ORDER BY address_state;

# TERM
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank.loan_data
GROUP BY term
ORDER BY term;

# Employee Length 
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank.loan_data
GROUP BY emp_length
ORDER BY emp_length;

# Purpose
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank.loan_data
GROUP BY purpose
ORDER BY purpose;

# Home Ownership 
SELECT 
	home_ownership AS HomeOwnership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank.loan_data
GROUP BY home_ownership
ORDER BY home_ownership;




