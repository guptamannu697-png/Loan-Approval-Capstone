# Power BI Dashboard – Loan Approval Analytics

This folder contains the Power BI dashboard created for the Loan Approval Capstone Project.

## Dashboard Highlights
- Total Applications
- Approved vs Rejected Loans
- Approval Rate %
- Analysis by Gender, Education, Property Area
- Income & Loan Amount Group insights

## Key KPIs (Train Dataset)
- Total Applications: 614
- Approved: 422
- Rejected: 192
- Approval Rate: ~69%

## Filters / Slicers
- Gender
- Education
- Property Area
- Income Group (if added)

## DAX Measures Used
- Total Applications = COUNT(Loan_ID)
- Approved Loans = CALCULATE(COUNT(Loan_ID), Loan_Status = "Y")
- Rejected Loans = CALCULATE(COUNT(Loan_ID), Loan_Status = "N")
- Approval Rate % = DIVIDE([Approved Loans], [Total Applications], 0)

## Dashboard Preview
![Dashboard Preview](dashboard_preview.png)
