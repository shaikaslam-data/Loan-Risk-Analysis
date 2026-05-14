# Loan-Risk-Analysis
A data-driven loan risk analysis project using SQL, Power BI, and machine learning to identify high-risk customers and improve lending decisions.
Loan Risk Analytics & Prediction System

## View the Model

https://loan-default-app-doavvhrbjcp9mdiv3fxrcp.streamlit.app

### Project Overview
This project focuses on building an end-to-end Bank Loan Risk Analytics and Prediction System to help financial institutions minimize credit losses, identify risky applicants, and make data-driven loan approval decisions.

### The project combines:

SQL-based analytical reporting

Advanced Exploratory Data Analysis (EDA)

Statistical hypothesis testing

Predictive modeling using Logistic Regression

Interactive Power BI dashboards

Streamlit deployment for real-time prediction

The complete workflow simulates a real-world banking risk analytics pipeline used in modern financial institutions.

### Business Problem

Banks face significant losses due to:

approving high-risk customers

hidden behavioral risk patterns

over-leveraged borrowers

customers with aggressive credit demand

weak traditional approval policies

### The objective of this project is to:

✔ Identify high-risk borrowers

✔ Detect hidden behavioral risk

✔ Improve loan approval quality

✔ Reduce future defaults

✔ Build interpretable risk analytics system

✔ Enable real-time risk prediction

### Dataset Description

The dataset contains customer-level credit behavior, delinquency, loan exposure, enquiry behavior, demographic, and repayment-related features.

Major Feature Categories

Customer Profile
age
gender
maritalstatus
education
netmonthlyincome
 Credit Profile
credit_score
total_tl
secured_tl
unsecured_tl
pct_currentbal_all_tl
 Credit Enquiry Behavior
enq_l3m
enq_l6m
enq_l12m
cc_enq
pl_enq
time_since_recent_enq
⚠ Delinquency & Risk Behavior
num_times_delinquent
num_times_30p_dpd
num_times_60p_dpd
max_deliq_12mts
recent_level_of_deliq
 Loan Portfolio Features
pl_flag
cc_flag
hl_flag
pl_tl
cc_tl
home_tl
unsecured_tl
### Data Cleaning & Preprocessing

The dataset underwent extensive preprocessing before modeling.

**✔ Missing Value Treatment**

Handled missing values using:

mean imputation

median imputation

mode replacement

business-rule based filling

**✔ Outlier Treatment**

Applied percentile-based clipping:

lower bound = 1st percentile

upper bound = 99th percentile

This reduced extreme value influence without removing records.

**✔ Feature Encoding**

Performed encoding for categorical variables:

Label Encoding

One-Hot Encoding

Examples:

gender

maritalstatus

education

loan type indicators

**✔ Feature Scaling**

Applied scaling for numerical stability during modeling.

Methods used:

StandardScaler

MinMaxScaler (where required)

**✔ Data Type Corrections**

Converted:

object → numeric

binary categories → integer flags

 ### Advanced Exploratory Data Analysis (EDA)

Instead of traditional basic EDA, the project focused on discovering behavioral and portfolio-level risk insights.

### Key Advanced Insights

**Credit Hunger Signal**

Customers with high recent enquiry activity showed significantly higher default probability.

**Insight**

Aggressive credit-seeking behavior acts as an early warning signal for financial stress.

**Over-Leveraging Risk**

Customers with high credit utilization ratios exhibited substantially elevated risk.

**Insight**

Heavy dependency on existing credit exposure indicates repayment pressure.

 **Silent Risk Customers**

Detected customers with:

no delinquency history
but high predicted risk probability

**Insight**

Traditional delinquency-based approval systems may miss hidden risky borrowers.

 **Risk Amplification Effect**

Simultaneous high enquiries and high utilization created amplified default risk.

**Insight**

Combined behavioral factors are more dangerous than individual factors alone.

 **Behavioral Instability Detection**

Sudden spikes in recent enquiries were identified as strong distress indicators.

**Insight**

Behavior volatility is an important early-stage credit deterioration signal.

 **Portfolio Risk Concentration**

A small segment of customers contributed disproportionately to total portfolio risk.

**Insight**

Targeted monitoring of top-risk segments can significantly reduce losses.

 ### Statistical Analysis

The project included statistical validation of important risk drivers.

 **Hypothesis Testing**
 
**✔ t-Test**

Used to compare numerical features between risky and safe customers.

Example Tests

Credit Score Difference

Utilization Difference

Employment Stability Difference

Enquiry Behavior Difference

**✔ ANOVA**

Used to compare risk across multiple customer groups.

Example Tests

Risk across Credit Score Bands

Risk across Income Buckets

Risk across Utilization Groups

**✔ Chi-Square Test**

Used for categorical relationship validation.

Example Tests

Loan Type vs Risk

Marital Status vs Risk

Gender vs Risk

Predictive Modeling

### A Logistic Regression model was built to predict loan risk.

**Feature Selection Techniques**

Multiple feature selection methods were applied:

**✔ ANOVA Feature Significance**

Selected statistically important variables using p-values.

**✔ Recursive Feature Elimination (RFE)**

Used iterative model-based feature ranking.

**✔ Variance Inflation Factor (VIF)**

Removed multicollinearity among selected variables.

**✔ Weight of Evidence (WOE) & Information Value (IV)**

Used to evaluate predictive strength of variables.


### The model was evaluated using multiple classification metrics.

**✔ Evaluation Metrics**

Accuracy

Precision

Recall (Sensitivity)

Specificity

ROC-AUC

Confusion Matrix

**✔ Threshold Optimization**

Optimal classification threshold selected using:

ROC analysis

business trade-off evaluation

**✔ Final Performance**

The model achieved:

high sensitivity

strong specificity

strong precision

effective risk separation

 ### Power BI Dashboard

Developed advanced interactive dashboards for banking decision-making.

 ### Dashboard Modules
 
**(1) Executive Risk Overview Dashboard**

Focused on:

portfolio health

approval quality

risk exposure

customer segmentation

**(2) Risk Driver Analytics Dashboard**

Focused on:

behavioral risk drivers

utilization stress

enquiry behavior

amplification effects

**(3) Predictive Risk Monitoring Dashboard**

Focused on:

predicted risk probability

high-risk concentration

model-driven insights

decision simulation

Advanced KPIs

***Created advanced banking KPIs using DAX.**

Examples:

Behavioral Instability Index

Credit Dependency Ratio

Driver Impact

Risk Concentration Ratio

Portfolio Exposure Metrics

Early Risk Ratio

Streamlit Deployment

### The final model was deployed using Streamlit Community Cloud for real-time loan risk prediction.

**Deployment Features**

Users can:

✔ Input customer information

✔ Predict loan risk instantly

✔ View approval probability

✔ Understand risk indicators

 **Tech Stack**
Programming & Analytics

Python

Pandas

NumPy

Scikit-learn

Statsmodels

SciPy

Visualization

Matplotlib

Seaborn

Power BI

Database

SQL Server

Deployment

Streamlit

Streamlit Community Cloud

## View the Model
https://loan-default-app-doavvhrbjcp9mdiv3fxrcp.streamlit.app
