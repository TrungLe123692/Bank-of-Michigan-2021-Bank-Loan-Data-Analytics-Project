# Bank of Michigan 2021 Bank Loan Data Analytics
## Business Objective
The goal of this project is to help Bank of Michigan improve lending performance, portfolio health, and risk management by analyzing detailed bank loan data. By using structured SQL queries a dynamic Tableau dashboard, the analysis uncovers trends in loan applications, funded amounts, repayment behavior, interest rates, and borrower profiles. Key insights include monthly and state-wise loan distribution, good vs. bad loan percentages, and payment collection patterns. These findings enable the bank to make data-driven decisions on credit risk assessment, customer targeting, and loan product design - ensuring more effective lending strategies and stronger financial outcomes in a competitive financial services market.

## About the data 
The dataset was obtained from the Bank Loan dataset available from [2021 Bank of Michigan Loan Data](https://drive.google.com/file/d/1WNlzRVDZ2rKdiwpGUFBSuGA50EsI-j2v/view?usp=sharing). It contains detailed loan information for Bank of Michigan, covering all details of loan applications in 2021. The data includes 14 columns and over 38,000 rows:

<img width="912" height="580" alt="Screenshot 2025-07-14 102929" src="https://github.com/user-attachments/assets/fafccc33-d21d-4541-9dd8-02812319e622" />

## Key Business Metrics 
### Key Performance Indicators (KPIs) Requirements 
`Total Loan Applications:` We need to calculate the total number of loan applications received during a specified period. Additionally, it is essential to monitor the Month-to-Date (MTD) Loan Applications and track changes Month-over-Month (MoM).

`Total Funded Amount:` Understanding the total amount of funds disbursed as loans is crucial. We also want to keep an eye on the MTD Total Funded Amount and analyse the Month-over-Month (MoM) changes in this metric.

`Total Amount Received:` Tracking the total amount received from borrowers is essential for assessing the bank's cash flow and loan repayment. We should analyse the Month-to-Date (MTD) Total Amount Received and observe the Month-over-Month (MoM) changes.

`Average Interest Rate:` Calculating the average interest rate across all loans, MTD, and monitoring the Month-over-Month (MoM) variations in interest rates will provide insights into our lending portfolio's overall cost.


`Average Debt-to-Income Ratio (DTI):` Evaluating the average DTI for our borrowers helps us gauge their financial health. We need to compute the average DTI for all loans, MTD, and track Month-over-Month (MoM) fluctuations.

### Good Loan v Bad Loan KPI's
#### Good Loan KPIs
`Good Loan Percenatge:` We need to calculate the percentage of loan applications classified as 'Good Loans.' This category includes loans with a loan status of 'Fully Paid' and 'Current.'

`Good Loan Applications:` Identifying the total number of loan applications falling under the 'Good Loan' category, which consists of loans with a loan status of 'Fully Paid' and 'Current.'

`Good Loan Funded Amount:` Determining the total amount of funds disbursed as 'Good Loans.' This includes the principal amounts of loans with a loan status of 'Fully Paid' and 'Current.'

`Good Loan Total Received Amount:`  Tracking the total amount received from borrowers for 'Good Loans,' which encompasses all payments made on loans with a loan status of 'Fully Paid' and 'Current.'

#### Bad Loan KPIs
`Bad Loan Applications Percentage:` Calculating the percentage of loan applications categorized as 'Bad Loans.' This category specifically includes loans with a loan status of 'Charged Off.'

`Bad Loan Applications:` Identifying the total number of loan applications categorized as 'Bad Loans,' which consists of loans with a loan status of 'Charged Off.'

`Bad Loan Funded Amount:` Determining the total amount of funds disbursed as 'Bad Loans.' This comprises the principal amounts of loans with a loan status of 'Charged Off.'

`Bad Loan Total Received Amount:` Tracking the total amount received from borrowers for 'Bad Loans,' which includes all payments made on loans with a loan status of 'Charged Off.'

### Loan Status Grid View
By providing insights into metrics such as 'Total Loan Applications,' 'Total Funded Amount,' 'Total Amount Received,' 'Month-to-Date (MTD) Funded Amount,' 'MTD Amount Received,' 'Average Interest Rate,' and 'Average Debt-to-Income Ratio (DTI),' this grid view will empower us to make data-driven decisions and assess the health of our loan portfolio.

## Analysis List 
`Monthly Trends Analysis by Issue Date:` Determining how 'Total Loan Applications,' 'Total Funded Amount,' and 'Total Amount Received' vary over time, allowing us to identify seasonality and long-term trends in lending activities.

`Regional Analysis:` Representing lending metrics categorized by state, enabling us to identify regions with significant lending activity and assess regional disparities.

`Loan Term Analysis:` Depicting loan statistics based on different loan terms, allowing us to understand the distribution of loans across various term lengths.

`Employee Length Analysis:` Illustrating how lending metrics are distributed among borrowers with different employment lengths, helping us assess the impact of employment history on loan applications.

`Loan Purpose Breakdown Analysis:` Providing a visual breakdown of loan metrics based on the stated purposes of loans, aiding in the understanding of the primary reasons borrowers seek financing.

`Home Ownership Analysis:` Displaying loan metrics categorized by different home ownership statuses, allowing for a hierarchical view of how home ownership impacts loan applications and disbursements.

`Details Analysis:` Providing a consolidated view of all the essential information within our loan data. This Details Dashboard aims to offer a holistic snapshot of key loan-related metrics and data points, enabling users to access critical information efficiently.

## The Following Actons for This Project 
`Importing Data:` Moved outside data into a system or database so that it might be used for the project.

`Creating Database:` To effectively store, manage, and retrieve data, set up a structured system.

`Writing Queries:` Created guidelines for updating, retrieving, and manipulating data in a database.

`Creating Report:` Generated a structured summary of data insights for analysis or presentation

`Excel Data Cleaning:` Organized and presented spreadsheet information clearly to uncover patterns and insights.

`Creating Tableau Charts and Dashboard:` Summarized key insights and metrics into structured formats and interactive visual tools for easier interpretation and decision-making.

 ## Business Impacts 
This project empowered stakeholders at the Bank of Michigan to gain a clearer understanding of their loan portfolio performance and borrower behavior. The insights from this project supported: 

`A more strategic allocation of funds toward low-risk loan categories`

`Improved early identification of high-risk loans using DTI and verification status`

`Tailored loan product offerings based on state, term, and purpose trends`

`Overall:` This analytics solution contributed to optimizing the bank’s loan approval process, enhancing recovery strategies, and improving profitability through smarter risk segmentation.




