
USE LoanCapstone;
SELECT TOP 20 * FROM dbo.loan_raw;


        ELSE CAST(Dependents AS INT)
    END AS Dependents_Clean,USE LoanCapstone;
go

CREATE VIEW vw_loan_clean AS
SELECT 
    Loan_ID,
    Gender,
    Married,
    
    -- Dependents clean
    CASE 
        WHEN Dependents = '3+' THEN 3

    Education,
    Self_Employed,

    ApplicantIncome,
    CoapplicantIncome,

    -- Total Income
    (ApplicantIncome + CoapplicantIncome) AS TotalIncome,

    LoanAmount,
    Loan_Amount_Term,
    Credit_History,
    Property_Area,

    -- Loan Status convert (Y/N → 1/0)
    CASE 
        WHEN Loan_Status = 'Y' THEN 1
        ELSE 0
    END AS Loan_Status_Flag,

    -- Income Group
    CASE 
        WHEN (ApplicantIncome + CoapplicantIncome) < 4000 THEN 'Low Income'
        WHEN (ApplicantIncome + CoapplicantIncome) BETWEEN 4000 AND 8000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS Income_Group,

    -- Loan Amount Group
    CASE 
        WHEN LoanAmount < 100 THEN 'Small Loan'
        WHEN LoanAmount BETWEEN 100 AND 200 THEN 'Medium Loan'
        ELSE 'High Loan'
    END AS Loan_Group

FROM dbo.loan_raw;

SELECT TOP 10 * FROM dbo.vw_loan_clean;

--1) Missing values count (important for report)--

SELECT
  SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Null_Gender,
  SUM(CASE WHEN Married IS NULL THEN 1 ELSE 0 END) AS Null_Married,
  SUM(CASE WHEN Dependents_Clean IS NULL THEN 1 ELSE 0 END) AS Null_Dependents,
  SUM(CASE WHEN LoanAmount IS NULL THEN 1 ELSE 0 END) AS Null_LoanAmount,
  SUM(CASE WHEN Credit_History IS NULL THEN 1 ELSE 0 END) AS Null_CreditHistory
FROM dbo.vw_loan_clean;


--2) Target distribution (Approved vs Rejected)--

SELECT Loan_Status_Flag, COUNT(*) AS Total
FROM dbo.vw_loan_clean
GROUP BY Loan_Status_Flag;



SELECT * 
FROM dbo.vw_loan_clean;


SELECT
  COUNT(*) AS Total_Rows,
  SUM(CASE WHEN Gender        IS NULL THEN 1 ELSE 0 END) AS Missing_Gender,
  SUM(CASE WHEN Married       IS NULL THEN 1 ELSE 0 END) AS Missing_Married,
  SUM(CASE WHEN Dependents    IS NULL THEN 1 ELSE 0 END) AS Missing_Dependents,
  SUM(CASE WHEN Self_Employed IS NULL THEN 1 ELSE 0 END) AS Missing_Self_Employed,
  SUM(CASE WHEN LoanAmount    IS NULL THEN 1 ELSE 0 END) AS Missing_LoanAmount,
  SUM(CASE WHEN Credit_History IS NULL THEN 1 ELSE 0 END) AS Missing_Credit_History
FROM dbo.loan_raw;

SELECT Loan_ID, COUNT(*) AS Cnt
FROM dbo.loan_raw
GROUP BY Loan_ID
HAVING COUNT(*) > 1
ORDER BY Cnt DESC;

SELECT TOP 20 Loan_ID, Gender, Married, Dependents, Education, Self_Employed, Credit_History, LoanAmount, Property_Area, Income_Group, Loan_Group
FROM dbo.loan_raw


SELECT Loan_ID, COUNT(*) AS Cnt
FROM dbo.loan_raw
GROUP BY Loan_ID
HAVING COUNT(*) > 1
ORDER BY Cnt DESC;

SELECT TOP 10 * FROM dbo.vw_loan_clean;