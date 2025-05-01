# Patient Satisfaction & Operational Efficiency Analysis
Client: Campbell Health Solutions (Tinley Park, IL)
Stakeholder: Anna Padgett, Director of Patient Services

# Project Background
Campbell Health Solutions is a regional healthcare provider located in Tinley Park, Illinois, specializing in comprehensive outpatient services. With recent concerns about patient retention and growing complaints around wait times, the Director of Patient Services, Anna Padgett, requested a deep dive analysis of patient experience metrics across departments and cities.

As a data analyst embedded in the healthcare operations team, this analyst focused on uncovering insights that impact patient satisfaction, wait time trends, departmental efficiency, and geographic performance.

# Business Question
What operational and service delivery factors are driving patient dissatisfaction across Campbell Health Solutions’ departments and cities — and how can leadership improve patient experience without expanding cost-heavy resources?

Insights and recommendations are provided on the following key areas:

- **Category 1:** Departmental Performance 
- **Category 2:** City-Level Network Gaps 
- **Category 3:** Patient Volume Trends 
- **Category 4:** Satisfaction Stability 

The SQL queries used to inspect and clean the data for this analysis can be found here [https://github.com/SuaveAnalyst/healthcare-patient-wait-analysis/blob/3b7f625a255fb3df120315907b67c804569f6baa/Patient%20Analysis%20Views/patient_analysis_script.sql#L33-L113].

Targed SQL queries regarding various business questions can be found here [https://github.com/SuaveAnalyst/healthcare-patient-wait-analysis/blob/c107226905cc3e408b54dce7f5b08b42ef13de6e/Patient%20Analysis%20Views/patient_analysis_script.sql#L114-L254].

An interactive Power BI dashboard used to report and explore sales trends can be found here 🔗 [View the Live Power BI Dashboard](https://app.powerbi.com/reportEmbed?reportId=1a2fea91-afdd-4762-bb8c-2bba06b0d7bb&autoAuth=true&ctid=c207a2ac-fbb3-47dd-8955-d284c02dad59)



# Data Structure & Initial Checks

The companies main database structure as seen below consists of two tables: patient_details, satisfactory, and 7 seven created views with a total row count of 40,280 records. A description of each table is as follows:

**Sheet Name/Description**

![image](https://github.com/user-attachments/assets/b64d32fd-291a-4e9b-86a2-f5628435959e)



![image](https://github.com/user-attachments/assets/c41ddd6b-51f8-48a8-9d67-57083896d4c5)




# Executive Summary

### Overview of Findings

* Wait times and satisfaction are not directly correlated. Departments with the longest wait times (Orthopaedics, Neurology) did not always have the lowest satisfaction — but Orthopaedics is a critical exception.

* February had peak patient volume (4.4K), followed by a 39% drop into November. This could point to seasonal issues or capacity/resource misalignment.

* Tinley Park ranks mid-tier in both wait time and satisfaction, suggesting opportunity for local optimization to enhance their flagship site’s performance.

![image](https://github.com/user-attachments/assets/535b9eef-f588-4dcd-a80d-6c28f1d45527)



# Insights Deep Dive
### Category 1: Departmental Performance

* **Main insight 1.** Orthopedics has the highest average wait time (51.84 minutes) and lowest satisfaction (3.39/5) — signaling an urgent need for resourcing or operational changes.
  
* **Main insight 2.** Neurology also ranks poorly in wait times (51.13 minutes) but manages better satisfaction (3.76), suggesting patient expectations may vary.
  
* **Main insight 3.** Surgery performs well, balancing a wait time of ~46 minutes with high satisfaction (3.81).



### Category 2: City-Level Network Gaps

* **Main insight 1.** Geographic disparities exist across locations like Rockford and Downers Grove.
  
* **Main insight 2.** Tinley Park has average wait and satisfaction scores — a missed opportunity for performance leadership as the company's home base.


### Category 3: Patient Volume Trends

* **Main insight 1.** Patient traffic peaked in February, with a steady decline toward year-end — a 39% drop.
  
* **Main insight 2.** These trends could inform seasonal staffing plans and marketing initiatives.


### Category 4: Satisfaction Stability

* **Main insight 1.** Despite wait time fluctuations, patient satisfaction remained stable between 3.6–3.8.
  
* **Main insight 2.** Indicates other drivers (e.g., staff quality, facility conditions) may have stronger influence on patient perception.



# Recommendations:

Based on the insights and findings above, we would recommend the Anna Padgett to consider the following: 

* Specific observation that is related to a recommended action. **Address Orthopaedics' inefficiency by reallocating staff, adjusting appointment slots, or deploying urgent care pathways.**
  
* Specific observation that is related to a recommended action. **Leverage high-performing departments like Surgery as a benchmark for others.**
  
* Specific observation that is related to a recommended action. **Position Tinley Park as a “model site” through targeted investment in patient flow tools or concierge services.**
  
* Specific observation that is related to a recommended action. **Conduct patient surveys beyond wait time topics to capture holistic drivers of satisfaction.**
  
* Specific observation that is related to a recommended action. **Implement seasonal resource planning to better match patient volume with staffing.**
  


# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Assumption 1 Wait time is measured in average minutes per department, not per individual visit.
  
* Assumption 2 Satisfaction scores are self-reported on a 1–5 scale and may carry bias.
  
* Assumption 3 City rankings are based only on patients seen at those locations — no weighting by volume.

* Assumption 4 November and December data appeared to taper off and may be affected by incomplete reporting.
