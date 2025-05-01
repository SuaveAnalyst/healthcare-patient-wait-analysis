/*
==================================================================================
  Dataset Overview - Campbell Health Solutions: Patient Satisfaction & Wait Times
==================================================================================

The dataset consists of approximately 90,000 rows across 2 relational tables: 
`patients` and `satisfaction`. It represents historical patient visit data, 
including timestamps, satisfaction scores, and wait times, with demographic 
and geographic context. The goal is to evaluate operational efficiency and 
patient experience across multiple departments and cities.

  Tables & Columns:
--------------------------------------------------------------------------------

• patients              → Patient-level visit data
    • PatientID         → Unique identifier for each patient visit
    • PatientDate       → Date of the patient encounter (YYYY-MM-DD)
    • Area              → Department or clinical area visited (e.g., Neurology, Surgery)
    • WaitingTime       → Time waited before service, in minutes
    • City              → City where the visit occurred
    • SatisfactionID    → Foreign key linking to satisfaction table
    • VisitTime         → Simulated visit time (HH:MM format)
    • Age               → Age of the patient at time of visit

• satisfaction          → Mapped satisfaction survey data
    • SatisfactionID    → Unique identifier for each satisfaction entry
    • Score             → Satisfaction score (typically 1–10 scale)

Each patient record is associated with a satisfaction score and can be segmented
by time, department, and location for operational analysis and performance KPIs.
*/

/*
====================================================
🧹	Data Cleaning Plan 
	Tables:
		patients
		satisfaction
====================================================
*/

-- View patient table
SELECT 
    *
FROM
    patients; -- Headers correct, noticed mispelled category Area = 'Concology'/'Oncology', 'Gynaecology'/'Gynecology'

-- View satisfaction table
select*
from satisfaction; -- Headers correct, no spelling errors

-- Check for missing null values in patients table
SELECT 
    COUNT(*) AS total_rows,
    SUM(PatientID IS NULL) AS null_patient_id,
    SUM(PatientDate IS NULL) AS null_patient_date,
    SUM(Area IS NULL) AS null_area,
    SUM(WaitingTime IS NULL) AS null_waiting,
    SUM(City IS NULL) AS null_city,
    SUM(SatisfactionID IS NULL) AS null_satisfaction_id
FROM patients;

-- Check for missing null values in satisfaction table
SELECT 
    COUNT(*) AS total_rows,
    SUM(SatisfactionID IS NULL) AS null_satisfaction_id,
    SUM(Score IS NULL) AS null_score
FROM satisfaction;

-- Fix inconsistent Area values
UPDATE patients
SET Area = 'Oncology'
WHERE Area = 'Concology';

-- Fix inconsistent Area values
UPDATE patients
SET Area = 'Gynecology'
WHERE Area = 'Gynaecology';

-- Check for duplicates for primary key
SELECT PatientID, COUNT(*) 
FROM patients
GROUP BY PatientID
HAVING COUNT(*) > 1; -- No duplicates

-- Check for duplicates for primary key
SELECT SatisfactionID, COUNT(*) 
FROM satisfaction
GROUP BY SatisfactionID
HAVING COUNT(*) > 1; -- No duplicates

-- Check for out-of-range or incorrect dates
SELECT *
FROM patients
WHERE PatientDate < '2000-01-01' OR PatientDate > CURDATE(); -- Nothing returned

-- Ensure every SatisfactionID in patients exists in satisfaction
SELECT DISTINCT SatisfactionID
FROM patients
WHERE SatisfactionID NOT IN (
    SELECT SatisfactionID FROM satisfaction
); -- Nothing returned


/*Check for outliers*/
-- Long waits
SELECT * FROM patients
WHERE WaitingTime > 240;  -- 4+ hours, No outliers

-- Satisfaction scores not between 1–10
SELECT * FROM satisfaction
WHERE Score < 1 OR Score > 10; -- No outliers

/*
================================
Check Distribution of Key Fields
================================
*/
-- Departments
SELECT Area, COUNT(*) FROM patients GROUP BY Area;
-- The analysis of patient volume by department reveals notable disparities in service demand across clinical areas

-- Cities
SELECT City, COUNT(*) FROM patients GROUP BY City;
-- The distribution of patient visits by city shows a significant geographic concentration

-- Scores
SELECT Score, COUNT(*) FROM satisfaction GROUP BY Score;
-- The satisfaction score data shows a skewed distribution, concentrated around mid-level scores


/*
====================================================
Exploratory Data Analysis (EDA) Queries
====================================================
*/

-- Summary Stats: Avg, Min, Max by Department (Area) --
CREATE OR REPLACE VIEW vw_department_stats AS
    SELECT 
        Area,
        COUNT(*) AS total_patients,
        ROUND(AVG(WaitingTime), 2) AS avg_waiting_time,
        MIN(WaitingTime) AS min_waiting_time,
        MAX(WaitingTime) AS max_waiting_time,
        ROUND(AVG(s.Score), 2) AS avg_satisfaction
    FROM patients p
    JOIN satisfaction s ON p.SatisfactionID = s.SatisfactionID
    GROUP BY Area;
-- This analysis compares key operational metrics across departments, 
-- including average wait time, satisfaction scores, and patient volume.


-- Monthly Trend: Patient Volume & Wait Time --
CREATE OR REPLACE VIEW vw_monthly_trends AS
    SELECT
        DATE_FORMAT(PatientDate, '%Y-%m') AS month,
        COUNT(*) AS total_patients,
        ROUND(AVG(WaitingTime), 2) AS avg_waiting_time
    FROM patients
    GROUP BY DATE_FORMAT(PatientDate, '%Y-%m');
-- This summary highlights monthly fluctuations in patient volume and average wait times across the 2018 calendar year.

--  Top 5 Longest Avg Wait Cities (with RANK) --
CREATE OR REPLACE VIEW vw_city_wait_ranks AS
    SELECT 
        City,
        ROUND(AVG(WaitingTime), 2) AS avg_wait,
        RANK() OVER (ORDER BY AVG(WaitingTime) DESC) AS wait_rank
    FROM patients
    GROUP BY City;
-- This query ranks cities based on average wait time using a window function (RANK) 
-- to highlight the top 5 locations with the longest delays in care.


-- Rolling 3-Month Avg Satisfaction per Department --
CREATE OR REPLACE VIEW vw_rolling_satisfaction AS
SELECT 
    Area,
    PatientDate,
    ROUND(AVG(AVG(s.Score)) OVER (
        PARTITION BY Area 
        ORDER BY PatientDate 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) AS rolling_3_day_avg
FROM patients p
JOIN satisfaction s ON p.SatisfactionID = s.SatisfactionID
GROUP BY Area, PatientDate;
-- This analysis tracks satisfaction trends over time using a 
-- rolling 3-month average, which smooths short-term fluctuations 
-- and reveals more stable sentiment patterns


-- 80/20 Rule: Which Departments Cause 80% of Total Wait Time --
CREATE OR REPLACE VIEW vw_pareto_wait_impact AS
WITH total_wait AS (
    SELECT Area, SUM(WaitingTime) AS total_wait_time
    FROM patients
    GROUP BY Area
),
ranked AS (
    SELECT *,
        SUM(total_wait_time) OVER () AS grand_total,
        ROUND(100 * SUM(total_wait_time) OVER (
            ORDER BY total_wait_time DESC 
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) / SUM(total_wait_time) OVER (), 2) AS cumulative_pct
    FROM total_wait
)
SELECT * FROM ranked;
-- This Pareto-style breakdown evaluates which departments contribute most heavily to the total system-wide wait time, 
-- helping identify where performance improvements would yield the greatest impact.

-- Rank Departments by Patient Load --
CREATE OR REPLACE VIEW vw_department_load_rank AS
SELECT 
    Area,
    COUNT(*) AS total_patients,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS load_rank
FROM patients
GROUP BY Area;
-- This query evaluates and ranks hospital departments by 
-- total patient volume, offering insights into where operational demand is heaviest.


CREATE OR REPLACE VIEW vw_patient_details AS
SELECT 
    p.*,
    s.Score
FROM patients p
JOIN satisfaction s ON p.SatisfactionID = s.SatisfactionID;
-- The view vw_patient_details is designed to consolidate patient visit records with 
-- their corresponding satisfaction scores.


-- Month-over-Month Growth Rate in Patient Volume
CREATE OR REPLACE VIEW vw_monthly_growth AS
SELECT 
    month,
    total_patients,
    LAG(total_patients) OVER (ORDER BY month) AS prev_month_patients,
    ROUND(
        (total_patients - LAG(total_patients) OVER (ORDER BY month)) /
        LAG(total_patients) OVER (ORDER BY month) * 100, 2
    ) AS mom_growth_pct
FROM (
    SELECT 
        DATE_FORMAT(PatientDate, '%Y-%m') AS month,
        COUNT(*) AS total_patients
    FROM patients
    GROUP BY DATE_FORMAT(PatientDate, '%Y-%m')
) AS monthly_volume;
-- Volatility in patient volume was observed throughout the year, 
-- indicating fluctuating demand or scheduling patterns.