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

Wait times and satisfaction are not directly correlated. Departments with the longest wait times (Orthopaedics, Neurology) did not always have the lowest satisfaction — but Orthopaedics is a critical exception.

February had peak patient volume (4.4K), followed by a 39% drop into November. This could point to seasonal issues or capacity/resource misalignment.

Tinley Park ranks mid-tier in both wait time and satisfaction, suggesting opportunity for local optimization to enhance their flagship site’s performance.

![image](https://github.com/user-attachments/assets/535b9eef-f588-4dcd-a80d-6c28f1d45527)
]



# Insights Deep Dive
### Category 1:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 1]


### Category 2:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 2]


### Category 3:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 3]


### Category 4:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 4]



# Recommendations:

Based on the insights and findings above, we would recommend the [stakeholder team] to consider the following: 

* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  


# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Assumption 1 (ex: missing country records were for customers based in the US, and were re-coded to be US citizens)
  
* Assumption 1 (ex: data for December 2021 was missing - this was imputed using a combination of historical trends and December 2020 data)
  
* Assumption 1 (ex: because 3% of the refund date column contained non-sensical dates, these were excluded from the analysis)
