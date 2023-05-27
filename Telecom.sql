USE telecom_cln;
SHOW TABLES;
SELECT * FROM telecom_cleaned;
#Question_No-2--
SELECT Data_Plan,AVG(MonthlyCharge) AS "AV_MC" FROM telecom_cleaned GROUP BY Data_Plan;
#OR 

#Question_No-5--
SELECT AVG(Data_Usage) AS "Data_Usage_Details",Data_Plan
FROM telecom_cleaned GROUP BY Data_Plan;
#OR#
#Question_No-6--
SELECT SUM(MonthlyCharge)+SUM(OverageFee) AS "Revenue" ,Data_Plan FROM telecom_cleaned WHERE Data_Usage>3 GROUP BY Data_Plan;
#Question_No_7--
SELECT 
(SUM(CASE WHEN Data_Plan =0 THEN MonthlyCharge + OverageFee ELSE 0 END)/(SUM(MonthlyCharge)+SUM(OverageFee))) *100  AS "PERCENTAGE" FROM telecom_cleaned;

SELECT 
(SUM(CASE WHEN Data_Plan = 0 THEN MonthlyCharge+OverageFee ELSE 0 END)/(SUM(MonthlyCharge) + SUM(OverageFee)))*100 AS "PERCENT" FROM telecom_cleaned;

#Question 9--
SELECT * FROM telecom_cleaned;
SELECT 
(AVG(CASE WHEN Data_Plan = 1 THEN Contract_Renewal END)/AVG(CASE WHEN Data_Plan = 0 THEN Contract_Renewal END)) AS"Renewal_Rate" FROM telecom_cleaned;

#Question 8--
SELECT 
AVG(CASE WHEN Data_Plan =1 THEN  MonthlyCharge+OverageFee END)/ AVG(CASE WHEN Data_Plan =0 THEN MonthlyCharge+OverageFee END) AS "REVENUE_RATIO" FROM telecom_cleaned; 

#Question 10---
SELECT 
CASE 
WHEN Data_Usage = 0 THEN "NO_Data_Plan"
WHEN Data_Usage>=1 AND Data_Usage<=3 THEN "1_3_GB" 
WHEN Data_Usage>3 THEN ">_3_GB" END AS "DATA_RANGE",SUM(OverageFee)/(SUM(MonthlyCharge) +SUM(OverageFee))*100 AS "REV_FRO_OverageFee" FROM telecom_cleaned GROUP BY DATA_RANGE;

# Question -11
SELECT 
CASE 
WHEN Weeks >50 THEN "Weeks_above_50"
WHEN Weeks >=31 AND Weeks<=50 THEN "Weeks_btw_31_50"
END AS "RANG",AVG(DayMins)/AVG(DayCalls) AS "Result" FROM telecom_cleaned GROUP BY RANG;

#Question-12
SELECT Data_Plan,AVG(OverageFee) FROM telecom_cleaned WHERE Weeks>30 AND Data_Usage<1 GROUP BY Data_Plan;

SELECT * FROM telecom_cleaned;

#Question-13--
SELECT AVG(MonthlyCharge),Data_Plan FROM telecom_cleaned WHERE Weeks>50 AND Contract_Renewal =1 GROUP BY Data_Plan;

#Question-14--
SELECT AVG(RoamMins), Data_Plan, Weeks FROM telecom_cleaned WHERE Weeks BETWEEN 31 AND 50 AND Data_Usage >3 GROUP BY Data_Plan;

#Question-15--
SELECT AVG(Data_Usage), Contract_Renewal FROM telecom_cleaned WHERE Weeks > 30 GROUP BY Contract_Renewal;  