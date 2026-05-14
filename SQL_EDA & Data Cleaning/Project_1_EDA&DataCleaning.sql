                                       --- Data Cleaing ----

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Changing the incorrect value (-99999)  to medium value 

update EXTERNAL_CIBIL_DATA
set time_since_recent_payment = m_val
from EXTERNAL_CIBIL_DATA 
cross join (
select PERCENTILE_CONT(0.5) within group (order by time_since_recent_payment) over() m_val
from EXTERNAL_CIBIL_DATA
where time_since_recent_payment <> -99999
)m
where time_since_recent_payment = -99999

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Changing the incorrect data in columns time_since_first_deliquency,
time_since_recent_deliquency, max_delinquency_level to 0 */


update EXTERNAL_CIBIL_DATA
set time_since_first_deliquency = 0 
where time_since_first_deliquency = -99999

update EXTERNAL_CIBIL_DATA
set time_since_recent_deliquency = 0 
where time_since_recent_deliquency = -99999


update EXTERNAL_CIBIL_DATA
set max_delinquency_level = 0 
where max_delinquency_level = -99999

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


/*Changing the incorrect data in columns CC_utilization PL_utilization,
max_unsec_exposure_inPct to Null */


update EXTERNAL_CIBIL_DATA
set CC_utilization = null
where CC_utilization > 1 or CC_utilization < 0

update EXTERNAL_CIBIL_DATA
set PL_utilization = null
where PL_utilization > 1 or CC_utilization < 0

update EXTERNAL_CIBIL_DATA
set max_unsec_exposure_inPct = null
where max_unsec_exposure_inPct > 1 or CC_utilization < 0

update EXTERNAL_CIBIL_DATA
set pl_utilization = null
where pl_utilization = -99999

update EXTERNAL_CIBIL_DATA
set max_unsec_exposure_inPct = null
where max_unsec_exposure_inPct = -99999

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Replacing The Incorrect Value -99999 to medium of those columns are
 max_deliq_6mts,  max_deliq_12mts,  tot_enq,  CC_enq,  CC_enq_L6m,  CC_enq_L12m,
 PL_enq,  PL_enq_L6m,  PL_enq_L12m,  time_since_recent_enq,  enq_L12m,  enq_L6m,  enq_L3m,*/

-- max_deliq_6mts
UPDATE t
SET max_deliq_6mts = m.median_val
FROM external_cibil_data t
CROSS JOIN (
SELECT DISTINCT 
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY max_deliq_6mts) OVER () AS median_val
FROM external_cibil_data
WHERE max_deliq_6mts <> -99999
) m
WHERE t.max_deliq_6mts = -99999;


-- max_deliq_12mts
UPDATE t
SET max_deliq_12mts = m.median_val
FROM external_cibil_data t
CROSS JOIN (
SELECT DISTINCT 
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY max_deliq_12mts) OVER () AS median_val
FROM external_cibil_data
WHERE max_deliq_12mts <> -99999
) m
WHERE t.max_deliq_12mts = -99999;


-- tot_enq
UPDATE t
SET tot_enq = m.median_val
FROM external_cibil_data t
CROSS JOIN (
SELECT DISTINCT 
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY tot_enq) OVER () AS median_val
FROM external_cibil_data
WHERE tot_enq <> -99999
) m
WHERE t.tot_enq = -99999;


-- CC_enq
UPDATE t
SET CC_enq = m.median_val
FROM external_cibil_data t
CROSS JOIN (
SELECT DISTINCT 
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY CC_enq) OVER () AS median_val
FROM external_cibil_data
WHERE CC_enq <> -99999
) m
WHERE t.CC_enq = -99999;


-- CC_enq_L6m
UPDATE t
SET CC_enq_L6m = m.median_val
FROM external_cibil_data t
CROSS JOIN (
 SELECT DISTINCT 
 PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY CC_enq_L6m) OVER () AS median_val
 FROM external_cibil_data
 WHERE CC_enq_L6m <> -99999
) m
WHERE t.CC_enq_L6m = -99999;


-- CC_enq_L12m
UPDATE t
SET CC_enq_L12m = m.median_val
FROM external_cibil_data t
CROSS JOIN (
 SELECT DISTINCT 
 PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY CC_enq_L12m) OVER () AS median_val
 FROM external_cibil_data
 WHERE CC_enq_L12m <> -99999
) m
WHERE t.CC_enq_L12m = -99999;


-- PL_enq
UPDATE t
SET PL_enq = m.median_val
FROM external_cibil_data t
CROSS JOIN (
 SELECT DISTINCT 
 PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY PL_enq) OVER () AS median_val
 FROM external_cibil_data
 WHERE PL_enq <> -99999
) m
WHERE t.PL_enq = -99999;


-- PL_enq_L6m
UPDATE t
SET PL_enq_L6m = m.median_val
FROM external_cibil_data t
CROSS JOIN (
 SELECT DISTINCT 
 PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY PL_enq_L6m) OVER () AS median_val
 FROM external_cibil_data
 WHERE PL_enq_L6m <> -99999
) m
WHERE t.PL_enq_L6m = -99999;


-- PL_enq_L12m
UPDATE t
SET PL_enq_L12m = m.median_val
FROM external_cibil_data t
CROSS JOIN (
 SELECT DISTINCT 
 PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY PL_enq_L12m) OVER () AS median_val
 FROM external_cibil_data
 WHERE PL_enq_L12m <> -99999
) m
WHERE t.PL_enq_L12m = -99999;


-- time_since_recent_enq
UPDATE t
SET time_since_recent_enq = m.median_val
FROM external_cibil_data t
CROSS JOIN (
 SELECT DISTINCT 
 PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY time_since_recent_enq) OVER () AS median_val
 FROM external_cibil_data
 WHERE time_since_recent_enq <> -99999
) m
WHERE t.time_since_recent_enq = -99999;


-- enq_L12m
UPDATE t
SET enq_L12m = m.median_val
FROM external_cibil_data t
CROSS JOIN (
  SELECT DISTINCT 
 PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY enq_L12m) OVER () AS median_val
 FROM external_cibil_data
 WHERE enq_L12m <> -99999
) m
WHERE t.enq_L12m = -99999;


-- enq_L6m
UPDATE t
SET enq_L6m = m.median_val
FROM external_cibil_data t
CROSS JOIN (
 SELECT DISTINCT 
 PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY enq_L6m) OVER () AS median_val
 FROM external_cibil_data
 WHERE enq_L6m <> -99999
) m
WHERE t.enq_L6m = -99999;


-- enq_L3m
UPDATE t
SET enq_L3m = m.median_val
FROM external_cibil_data t
CROSS JOIN (
SELECT DISTINCT 
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY enq_L3m) OVER () AS median_val
FROM external_cibil_data
 WHERE enq_L3m <> -99999
) m
WHERE t.enq_L3m = -99999;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- converting the 0 value to null In  NETMONTHLYINCOME

update EXTERNAL_CIBIL_DATA
set NETMONTHLYINCOME = null 
where NETMONTHLYINCOME = 0

-- Replaceing  the zero value to medium of the NETMONTHLYINCOME column

WITH MedianCTE AS (
SELECT
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY NETMONTHLYINCOME) OVER () AS median_val
FROM external_cibil_data
WHERE NETMONTHLYINCOME IS NOT NULL
),
MedianValue AS (
    SELECT DISTINCT median_val FROM MedianCTE
)
UPDATE external_cibil_data
SET NETMONTHLYINCOME = m.median_val
FROM external_cibil_data 
CROSS JOIN MedianValue  m
WHERE NETMONTHLYINCOME IS NULL


-------------------------------------------------------------------------------------------------------------------------------------

--- converting the 0 value to null in Time_With_Curr_Empr
update EXTERNAL_CIBIL_DATA
set Time_With_Curr_Empr = null 
where Time_With_Curr_Empr = 0


-- Replaceing  the zero value to medium of the Time_With_Curr_Empr

WITH MedianCTE AS (
SELECT
 PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Time_With_Curr_Empr) OVER () AS median_val
 FROM external_cibil_data
 WHERE Time_With_Curr_Empr IS NOT NULL
),
MedianValue AS (
SELECT DISTINCT median_val FROM MedianCTE
)
UPDATE external_cibil_data
SET Time_With_Curr_Empr = m.median_val
FROM external_cibil_data 
CROSS JOIN MedianValue  m
WHERE Time_With_Curr_Empr IS NULL

-----------------------------------------------------------------------------------------------------------------
---converting the incorrcet value to null in pct_currentBal_all_TL

update EXTERNAL_CIBIL_DATA
set pct_currentBal_all_TL = null 
where  pct_currentBal_all_TL >1 or pct_currentBal_all_TL<0


---Replaceing the null values to Mean of the pct_currentBal_all_TL
update EXTERNAL_CIBIL_DATA
set pct_currentBal_all_TL = (select round(avg(pct_currentBal_all_TL),2) from EXTERNAL_CIBIL_DATA)
where pct_currentBal_all_TL is null

--Rounding up the column to 2 decimal points 
update EXTERNAL_CIBIL_DATA
set pct_currentBal_all_TL = round(pct_currentBal_all_TL * 100,2)

----------------------------------------------------------------------------------------------------------------------------------------------
--Converting the Datatype of Approved_Flag From Float to Int(1.00 to 1)

Alter Table EXTERNAL_CIBIL_DATA
Alter Column Approved_Flag Int

-----------------------------------------------------------------------------------------------------------------------------------------------

-- Converting the incorrect value(-99999) to medium of the Age_Newest_TL 

update INTERNAL_BANK_DATA
set Age_Newest_TL = m_val
from INTERNAL_BANK_DATA
cross join (
select PERCENTILE_CONT(0.5) within group (order by Age_Newest_TL) over () as m_val
from INTERNAL_BANK_DATA
where Age_Newest_TL <> -99999
)m
where Age_Newest_TL = -99999

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Converting the incorrect value(-99999) to medium of the Age_Oldest_TL 

update INTERNAL_BANK_DATA
set Age_Oldest_TL = m_val
from INTERNAL_BANK_DATA
cross join (
select PERCENTILE_CONT(0.5) within group (order by Age_Oldest_TL) over() as m_val
from INTERNAL_BANK_DATA
where Age_Oldest_TL <> -99999
)m
where Age_Oldest_TL = -99999

----------------------------------------------------------------------------------------------------------------------------------------------------------
/* Rounding up to 2 decimal point to all the pct columns in the data*/

--Rounding up the column to 2 decimal points 
update INTERNAL_BANK_DATA
set pct_active_tl = round(pct_active_tl * 100,2)

--Rounding up the column to 2 decimal points 
update INTERNAL_BANK_DATA
set pct_closed_tl = round(pct_closed_tl * 100,2)

--Rounding up the column to 2 decimal points 
update INTERNAL_BANK_DATA
set pct_tl_closed_L12M = round(pct_tl_closed_L12M * 100,2)

--Rounding up the column to 2 decimal points 
update INTERNAL_BANK_DATA
set pct_tl_closed_L6M= round(pct_tl_closed_L6M * 100,2)

--Rounding up the column to 2 decimal points 
update INTERNAL_BANK_DATA
set pct_tl_open_L12M= round(pct_tl_open_L12M * 100,2)

--Rounding up the column to 2 decimal points 
update INTERNAL_BANK_DATA
set pct_tl_open_L6M= round(pct_tl_open_L6M * 100,2)

--Rounding up the column to 2 decimal points 
update EXTERNAL_CIBIL_DATA
set pct_of_active_TLs_ever = round(pct_of_active_TLs_ever * 100,2)

--Rounding up the column to 2 decimal points 
update EXTERNAL_CIBIL_DATA
set pct_opened_TLs_L6m_of_L12m = round(pct_opened_TLs_L6m_of_L12m * 100,2)

--Rounding up the column to 2 decimal points 
update EXTERNAL_CIBIL_DATA
set pct_PL_enq_L6m_of_L12m = round(pct_PL_enq_L6m_of_L12m * 100,2)


--Rounding up the column to 2 decimal points 
update EXTERNAL_CIBIL_DATA
set pct_CC_enq_L6m_of_L12m = round(pct_CC_enq_L6m_of_L12m * 100,2)


--Rounding up the column to 2 decimal points 
update EXTERNAL_CIBIL_DATA
set pct_PL_enq_L6m_of_ever= round(pct_PL_enq_L6m_of_ever * 100,2)

--Rounding up the column to 2 decimal points 
update EXTERNAL_CIBIL_DATA
set pct_CC_enq_L6m_of_ever = round(pct_CC_enq_L6m_of_ever * 100,2)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--combining the table tables into one data set as Loan_analysis_data

select i.PROSPECTID,time_since_recent_payment,time_since_first_deliquency,time_since_recent_deliquency,num_times_delinquent,max_delinquency_level,
max_recent_level_of_deliq,num_deliq_6mts,num_deliq_12mts,num_deliq_6_12mts,max_deliq_6mts,max_deliq_12mts,num_times_30p_dpd,num_times_60p_dpd,
num_std,num_std_6mts,num_std_12mts,num_sub,num_sub_6mts,num_dbt,num_dbt_6mts,num_dbt_12mts,num_lss,num_lss_6mts,
num_lss_12mts,recent_level_of_deliq,tot_enq,CC_enq,CC_enq_L6m,CC_enq_L12m,PL_enq,PL_enq_L6m,PL_enq_L12m,time_since_recent_enq,enq_L12m,
enq_L6m,enq_L3m,MARITALSTATUS,EDUCATION,AGE,GENDER,NETMONTHLYINCOME,Time_With_Curr_Empr,pct_of_active_TLs_ever,pct_opened_TLs_L6m_of_L12m,pct_currentBal_all_TL,CC_utilization,
CC_Flag,PL_utilization,PL_Flag,pct_PL_enq_L6m_of_L12m,pct_CC_enq_L6m_of_L12m,pct_PL_enq_L6m_of_ever,pct_CC_enq_L6m_of_ever,
 max_unsec_exposure_inPct,HL_Flag,GL_Flag,last_prod_enq2,first_prod_enq2,Credit_Score,Approved_Flag,Total_TL,Tot_Closed_TL,Tot_Active_TL,
Total_TL_opened_L6M,Tot_TL_closed_L6M,pct_tl_open_L6M,pct_tl_closed_L6M,pct_active_tl,pct_closed_tl,Total_TL_opened_L12M,Tot_TL_closed_L12M,pct_tl_open_L12M,pct_tl_closed_L12M,
Tot_Missed_Pmnt,Auto_TL,CC_TL,Consumer_TL,Gold_TL,Home_TL,PL_TL,Secured_TL,Unsecured_TL,Other_TL,Age_Oldest_TL,Age_Newest_TL
into Loan_analysis_data
from EXTERNAL_CIBIL_DATA e
join INTERNAL_BANK_DATA i 
on e.PROSPECTID = i.PROSPECTID  
order by i.PROSPECTID 

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                         --- EDA and Analysis ---
--Adding Creating new Column in  Table (Risk_flag)

Alter table Loan_analysis_data
add Risk_flag  varchar(10)

-- IF Approved_Flag is P1 or P2 then 'Low Risk' esle 'High Risk'

update Loan_analysis_data
set Risk_flag = case 
              when  Approved_Flag in(1,2) then 'Low Risk'
                else 'High Risk' end 

-------------------------------------------------------------------------------------------------------------------------------------
---As Credit score increases Risk sharply decreases
/*“High credit score customers are relatively safe and can be prioritized for faster approvals.”*/

SELECT 
CASE 
WHEN Credit_Score < 600 THEN 'Low_CS'
WHEN Credit_Score BETWEEN 600 AND 750 THEN 'Medium_CS'
ELSE 'High_CS'
END AS score_bucket,
COUNT(*) AS total,
SUM(CASE WHEN risk_flag = 'High Risk' THEN 1 ELSE 0 END)*100.0 / COUNT(*) AS high_risk_pct
FROM Loan_analysis_data
GROUP BY 
CASE 
WHEN Credit_Score < 600 THEN 'Low_CS'
WHEN Credit_Score BETWEEN 600 AND 750 THEN 'Medium_CS'
ELSE 'High_CS'
END;


------------------------------------------------------------------------------------------------------------------------
--(9)The analysis shows a strong threshold effect, where customers in the lowest credit 
---score segments exhibit extremely high risk, but risk drops sharply beyond a certain score level

WITH ranked AS (
SELECT *,
NTILE(10) OVER (ORDER BY Credit_Score) AS score_decile
FROM Loan_analysis_data
)
SELECT 
score_decile,
COUNT(*) AS total,
AVG(CASE WHEN risk_flag='High Risk' THEN 1.0 ELSE 0 END)*100 AS risk_pct
FROM ranked
GROUP BY score_decile
ORDER BY score_decile;
--------------------------------------------------------------------------------------------------------------------------------------
--(8) Out off 25% high risk customers there are 11% of Silent Risk Customers

SELECT 
COUNT(*) AS total_silent_risk,
SUM(CASE WHEN risk_flag = 'High Risk' THEN 1 ELSE 0 END)*100.0 / COUNT(*) AS risk_pct
FROM Loan_analysis_data
WHERE 
num_times_delinquent = 0
AND enq_L3m = 0
AND pct_currentBal_all_TL < 30
AND Credit_Score > 700 ;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--(2)Low Credit Score + High Delinquency Have 100% high risk	
/*“Found that combining credit score and delinquency creates a much stronger risk signal
    than analyzing them individually.*/

SELECT 
CASE 
WHEN Credit_Score < 650 AND num_times_delinquent > 2 THEN 'High Risk Combo'
ELSE 'Others'
END AS segment,
COUNT(*) AS total,
SUM(CASE WHEN risk_flag = 'High Risk' THEN 1 ELSE 0 END)*100.0 / COUNT(*) AS risk_pct
FROM Loan_analysis_data
GROUP BY 
CASE 
WHEN Credit_Score < 650 AND num_times_delinquent > 2 THEN 'High Risk Combo'
ELSE 'Others'
END;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
(3) Observed that risk increases sharply at early stages of delinquency, 
indicating that even initial payment issues are strong indicators of future risk*/

SELECT 
CASE 
 WHEN num_times_delinquent = 0 THEN 'No Delinquency'
 WHEN num_times_delinquent BETWEEN 1 AND 2 THEN 'Low'
WHEN num_times_delinquent BETWEEN 3 AND 5 THEN 'Medium'
ELSE 'High'
END AS delinquency_bucket,
 COUNT(*) AS total,
SUM(CASE WHEN risk_flag = 'High Risk' THEN 1 ELSE 0 END)*100.0 / COUNT(*) AS risk_pct
FROM Loan_analysis_data
GROUP BY 
CASE 
WHEN num_times_delinquent = 0 THEN 'No Delinquency'
WHEN num_times_delinquent BETWEEN 1 AND 2 THEN 'Low'
WHEN num_times_delinquent BETWEEN 3 AND 5 THEN 'Medium'
ELSE 'High'
END;

----------------------------------------------------------------------------------------------------------
--- (4) High delinquency + high 60+ DPD Have ~40% risk Compared to others (~25%)
/*
We observed that combining delinquency frequency and severe payment delays significantly increases 
customer risk compared to considering them individually
*/

SELECT 
CASE 
WHEN num_times_delinquent > 2 AND num_times_60p_dpd > 1 THEN 'High Risk Behavior'
ELSE 'Others'
END AS segment,
COUNT(*) AS total,
SUM(CASE WHEN risk_flag = 'High Risk' THEN 1 ELSE 0 END)*100.0 / COUNT(*) AS risk_pct
FROM Loan_analysis_data
GROUP BY 
CASE 
WHEN num_times_delinquent > 2 AND num_times_60p_dpd > 1 THEN 'High Risk Behavior'
ELSE 'Others'
END;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--(5) Customers with high credit demand show significantly higher risk, indicating potential financial stress.
SELECT 
CASE 
WHEN (enq_L3m * 2 + enq_L6m) < 3 THEN 'Low Demand'
WHEN (enq_L3m * 2 + enq_L6m) < 8 THEN 'Medium Demand'
ELSE 'High Demand'
END AS demand_bucket,
COUNT(*) AS total,
SUM(CASE WHEN risk_flag = 'High Risk' THEN 1 ELSE 0 END)*100.0 / COUNT(*) AS risk_pct
FROM Loan_analysis_data
GROUP BY 
CASE 
WHEN (enq_L3m * 2 + enq_L6m) < 3 THEN 'Low Demand'
WHEN (enq_L3m * 2 + enq_L6m) < 8 THEN 'Medium Demand'
ELSE 'High Demand'
END;

------------------------------------------------------------------------------------------------------------------------------------------
--(6) As enquiry + utilization increases >>> risk increases sharply
/*“Customers with high credit demand and high utilization show extremely high risk, indicating strong financial stress.” */

SELECT 
CASE 
WHEN enq_L3m = 0 THEN 'No Enquiry'
WHEN enq_L3m BETWEEN 1 AND 2 THEN 'Low'
WHEN enq_L3m BETWEEN 3 AND 5 THEN 'Medium'
ELSE 'High'
END AS enquiry_bucket,
COUNT(*) AS total,
SUM(CASE WHEN risk_flag = 'High Risk' THEN 1 ELSE 0 END)*100.0 / COUNT(*) AS risk_pct
FROM Loan_analysis_data
GROUP BY 
CASE 
WHEN enq_L3m = 0 THEN 'No Enquiry'
WHEN enq_L3m BETWEEN 1 AND 2 THEN 'Low'
WHEN enq_L3m BETWEEN 3 AND 5 THEN 'Medium'
ELSE 'High'
END

------------------------------------------------------------------------------------------------------------------------------------------
/*Customers with multiple high-risk factors show extremely high default risk, while customers with strong profiles have 
 significantly lower risk. This confirms that combining variables provides more accurate risk identification*/
--(7)
SELECT 
CASE 
WHEN Credit_Score < 600 AND enq_L3m > 3 AND pct_currentBal_all_TL > 70 
THEN 'Extreme Risk'
WHEN Credit_Score < 650 AND num_times_delinquent > 2 
THEN 'High Risk Combo'
WHEN Credit_Score >= 700 AND enq_L3m = 0 AND pct_currentBal_all_TL < 30 
THEN 'Low Risk Safe'
ELSE 'Moderate Risk'
END AS risk_segment,
COUNT(*) AS total,
Round(SUM(CASE WHEN risk_flag = 'High Risk' THEN 1 ELSE 0 END)*100.0 / COUNT(*),2) AS risk_pct

FROM Loan_analysis_data
GROUP BY 
CASE 
WHEN Credit_Score < 600 AND enq_L3m > 3 AND pct_currentBal_all_TL > 70 
THEN 'Extreme Risk'
WHEN Credit_Score < 650 AND num_times_delinquent > 2 
THEN 'High Risk Combo'
WHEN Credit_Score >= 700 AND enq_L3m = 0 AND pct_currentBal_all_TL < 30 
THEN 'Low Risk Safe'
ELSE 'Moderate Risk'
END;

-------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------------
---Create Credit Hunger Segment
---As credit enquiries increase → risk increases sharply

SELECT 
CASE 
WHEN enq_L3m >= 3 THEN 'High Credit Hunger'
WHEN enq_L3m BETWEEN 1 AND 2 THEN 'Medium Credit Hunger'
ELSE 'Low Credit Hunger'
END AS demand_segment,
COUNT(*) AS total,
SUM(CASE WHEN risk_flag = 'High Risk' THEN 1 ELSE 0 END)*100.0 / COUNT(*) AS risk_pct
FROM Loan_analysis_data
GROUP BY 
CASE 
WHEN enq_L3m >= 3 THEN 'High Credit Hunger'
WHEN enq_L3m BETWEEN 1 AND 2 THEN 'Medium Credit Hunger'
ELSE 'Low Credit Hunger'
END;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Creating New Column Loan_analysis_data Risk_Score

ALter table Loan_analysis_data
Add RIsk_Score int

update Loan_analysis_data 
set RIsk_Score =  
 (  (900 - Credit_Score) / 8.0) * 0.30 +
    (enq_L3m * 10) * 0.20 +
    (pct_currentBal_all_TL) * 0.20 +
    (num_times_delinquent * 15) * 0.15 +
    (Unsecured_TL * 1.0 / NULLIF(Total_TL,0)) * 100 * 0.10 +
	CASE 
        WHEN Time_With_Curr_Empr > 100 THEN 0
        ELSE (100 - Time_With_Curr_Empr)
    END * 0.05 
-------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------
/*“A critical risk threshold is observed around 2–3 enquiries, 
   beyond which default risk increases significantly.”*/

WITH base AS (
SELECT 
enq_L3m,
COUNT(*) AS total,
AVG(CASE WHEN risk_flag = 'High Risk' THEN 1.0 ELSE 0 END) * 100 AS risk_pct
FROM Loan_analysis_data
GROUP BY enq_L3m
),
calc AS (
SELECT *,
LAG(risk_pct) OVER (ORDER BY enq_L3m) AS prev_risk
FROM base
)
SELECT 
enq_L3m,
total,
risk_pct,
(risk_pct - prev_risk) AS risk_change
FROM calc
ORDER BY enq_L3m;
----------------------------------------------------------------------------------------------------------------------------------------

/*
High Risk Customers / Total Customers
✔ Risk per Enquiry
High Risk Customers / Total Enquiries
✔ Portfolio Risk Exposure
SUM(risk_score) / COUNT(*)
✔ High-Risk Concentration
Top 20% customers contributing to total risk
✔ Early Risk Ratio
High Risk customers with NO delinquency*/
------------------------------------------------------------------------------

------------------------------------- KPIs------------------------------------------

---Customers’ recent enquiry behavior differs by ~0.75 enquiries from their expected behavior
SELECT 
    AVG(ABS(enq_L6m - enq_L12m/2.0)) AS behavior_instability
FROM Loan_analysis_data;


SELECT 
    CASE 
        WHEN ABS(enq_L6m - enq_L12m/2) = 0 THEN 'Stable'
        WHEN ABS(enq_L6m - enq_L12m/2) <= 2 THEN 'Moderate Change'
        ELSE 'High Instability'
    END AS behavior_segment,
    COUNT(*) AS total
FROM Loan_analysis_data
GROUP BY 
    CASE 
        WHEN ABS(enq_L6m - enq_L12m/2) = 0 THEN 'Stable'
        WHEN ABS(enq_L6m - enq_L12m/2) <= 2 THEN 'Moderate Change'
        ELSE 'High Instability'
    END;
------------------------------------------------------------------------------------------------------------
SELECT 
    AVG(pct_currentBal_all_TL) AS avg_credit_dependency
FROM Loan_analysis_data;


SELECT 
    AVG(enq_L3m * 1.0 / NULLIF(enq_L12m,0)) * 100 AS recent_pressure_pct
FROM lo;