# Loan Approval Analytics Capstone Project

End-to-End Loan Approval Analysis using **SQL + Python (Machine Learning) + Power BI Dashboard**

---

## 📌 Project Objective
To analyze loan application data and build a predictive model that determines whether a loan should be approved or rejected, and visualize key insights using Power BI.

---

# 🔹 1. SQL Data Cleaning & Preparation

## Objective
To clean raw loan data, handle missing values, and prepare a structured dataset for analysis.

## Tasks Performed
- Total row count validation
- Duplicate record check
- Missing value analysis
- Created cleaned view: `vw_loan_clean`
- Loan Amount grouped into Small, Medium, High
- Data validation after cleaning

## Sample SQL Logic

```sql
-- Loan Amount Group
CASE
    WHEN LoanAmount < 100 THEN 'Small Loan'
    WHEN LoanAmount BETWEEN 100 AND 200 THEN 'Medium Loan'
    ELSE 'High Loan'
END AS Loan_Group
Missing Values Calculation
SELECT
SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Null_Gender,
SUM(CASE WHEN Married IS NULL THEN 1 ELSE 0 END) AS Null_Married,
SUM(CASE WHEN Dependents IS NULL THEN 1 ELSE 0 END) AS Null_Dependents,
SUM(CASE WHEN LoanAmount IS NULL THEN 1 ELSE 0 END) AS Null_LoanAmount,
SUM(CASE WHEN Credit_History IS NULL THEN 1 ELSE 0 END) AS Null_CreditHistory
FROM vw_loan_clean;

## 🔹 2. Python Data Processing

# Objective

# Load dataset, explore data and prepare for modeling

import pandas as pd

train = pd.read_csv("train.csv")
test = pd.read_csv("test.csv")

print(train.shape)
print(test.shape)

train.head()

import pandas as pd

train = pd.read_csv("train.csv")
test = pd.read_csv("test.csv")

print(train.shape)
print(test.shape)

train.head()

import pandas as pd

train = pd.read_csv("train.csv")
test = pd.read_csv("test.csv")

print(train.shape)
print(test.shape)

train.head()

import pandas as pd

train = pd.read_csv("train.csv")
test = pd.read_csv("test.csv")

print(train.shape)
print(test.shape)

train.head()

## Target Distribution

train['Loan_Status'].value_counts()
train['Loan_Status'].value_counts(normalize=True)

Output:
	•	Approved (Y): 422
	•	Rejected (N): 192
	•	Approval Rate: 68.7%

**Machine Learning Model (Logistic Regression)**

 *Train Test Split*

from sklearn.model_selection import train_test_split

X_train, X_val, y_train, y_val = train_test_split(
    X, y,
    test_size=0.2,
    random_state=42,
    stratify=y
)

*Model Pipeline*

from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression

pipe = Pipeline([
    ("scaler", StandardScaler(with_mean=False)),
    ("lr", LogisticRegression(max_iter=5000))
])

pipe.fit(X_train, y_train)

*Model Evaluation*

from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

y_pred = pipe.predict(X_val)

print("Accuracy:", accuracy_score(y_val, y_pred))
print(confusion_matrix(y_val, y_pred))
print(classification_report(y_val, y_pred))

*Output Results*

*Accuracy: 0.8455*

*Confusion Matrix:*
[[20 18]
 [ 1 84]]

*Classification Report:*
Class
Precision
Recall
F1 Score
0 (Rejected)
0.95
0.53
0.68
1 (Approved)
0.82
0.99
0.90

**4. Power BI Dashboard**

*Dashboard Name:*

*Loan Approval Analytics Dashboard*

*Key KPIs:*
	•	Total Applications → 614
	•	Approved Loans → 422
	•	Rejected Loans → 192
	•	Approval Rate → 69%

Visuals Used:
	•	Donut Chart → Loan Status Distribution
	•	Bar Chart → Applications by Education
	•	Column Chart → Loan Amount Group
	•	Donut Chart → Gender Distribution
	•	Clustered Column → Property Area vs Loan Status
	•	Stacked Column → Income vs Loan Status

Filters Used:
	•	Gender
	•	Education
	•	Property Area
	•	Income Group

⸻

🔹 5. Business Insights
	•	Highest loan approvals observed in Semiurban areas
	•	Low income group has higher rejection rate
	•	Graduates receive more approvals
	•	Medium Loan category is most common
	•	Applicants with Credit History = 1 have highest approval probability

⸻

**🔹 6. Tools & Technologies Used**
	•	SQL Server
	•	Python (Pandas, Scikit-learn)
	•	Power BI
	•	Machine Learning (Logistic Regression)
	•	Data Cleaning & Feature Engineering

⸻

**🔹 7. Conclusion**

This project successfully demonstrates a complete Data Analytics + Machine Learning pipeline from raw data cleaning to business insights dashboard.

The model achieved 84.5% accuracy and provided meaningful business insights for loan approval decisions.

⸻

👩‍💻 Author

Manu Gupta
Aspiring Data Analyst | Power BI | SQL | Machine Learning

✅ View Full Project Files (GitHub Repo): https://github.com/guptamannu697-png/Loan-Approval--Capstone
