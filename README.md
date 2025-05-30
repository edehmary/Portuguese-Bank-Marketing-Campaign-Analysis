# Portuguese-Bank-Marketing-Campaign-Analysis
## 📁Project Overview
This project presents a comprehensive analysis of a direct marketing campaign conducted by a Portuguese banking institution. The campaign targeted potential clients through phone call outreach, aiming to persuade them to subscribe to a term deposit product.

As part of this project, data analytics skills are applied to investigate the campaign dataset, uncover actionable insights, and identify patterns that can inform and improve future marketing strategies. The analysis involves exploring key customer attributes, behavioral trends, and campaign performance metrics using SQL for data exploration and Power BI for interactive visualizations.

## 🎯Research Objectives

* Performed Exploratory Data Analysis (EDA) to identify trends, patterns, and potential areas of improvement.

* Examined how different attributes (e.g., job, age, marital status, education, previous outcomes) affect campaign success.

* Developed a Power BI dashboard that visually communicates insights to both technical and non-technical stakeholders.

## ⚒️Tools & Technologies
* SQL (MySQL syntax) – for data cleaning, transformation, and analytical querying.

* Power BI – for designing an interactive and dynamic dashboard.

* GitHub – for version control and project sharing.

## 🔍 Key Analysis Performed

**1. Data Quality Checks** : Missing/Unknown Values & Duplicates.

* SQL queries were used to check for:

* Unknown categorical values (e.g., 'unknown' in columns like job, education, default, etc.)

* Null values in numeric columns (age, balance, duration, pdays)

* Duplicate rows using GROUP BY on all fields with a HAVING COUNT(*) > 1

**Result:**

* Some rows had 'unknown' values in education, job, and other fields, which may reduce the accuracy of insights.

* No null values were found in key numeric fields.

* Duplicate entries existed and could bias results if not handled.

**2. Subscription Success Rate by Job Title**

* Grouped the data by job, then counted total contacts, successful (y = 'yes') and unsuccessful subscriptions, and calculated success rates.

**Result:**

* Students had the **highest success rate (~30%).**

* Retired and unemployed individuals also showed relatively higher conversion.

* Blue-collar and admin. roles had **lower success rates.**

**3. Subscription Success Rate by Age Group**

* Created custom age buckets (<25, 25–34, 35–44, etc.) using CASE statements in SQL, then aggregated subscription outcomes per group.

**Result:**

* Clients **aged 35–44** had the highest number of subscriptions.

* **Success rate increased with age**, with the 55+ group showing strong conversions.

**4. Subscription Success Rate by Marital Status**

* Grouped data by marital status and computed success counts and rates.

**Result:**

* **Single clients** had the highest subscription success rate.

* Divorced clients also responded better than married ones.

**5. Subscription Success Rate by Education Level**

* Grouped data by education, calculated subscription counts and derived success rates.

**Result:**

* Individuals with **tertiary education (university degrees)** had the highest success rate.

* Lower education levels correlated with lower subscription rates.

* 'Unknown' category had a moderate success rate, but its ambiguity is a concern.

**6. Influence of Housing Loan Status**

* Grouped by the housing column and evaluated subscription outcomes.

**Result:**

* Clients without housing loans were more likely to subscribe.

* Those with housing loans had significantly lower success rates.

**7. Impact of Previous Campaign Outcomes**

* Grouped by the poutcome column (outcome of previous campaign), and calculated success metrics.

**Result:**

* Previous success in a campaign was the strongest predictor of subscription.

* Clients who had a 'success' previously were much more likely to subscribe again.

* Outcomes of 'unknown' or 'failure' led to lower conversion.

**8. Effect of Call Duration**

* Call durations were grouped into buckets (e.g., <100 sec, 100–200 sec, etc.), then analyzed for subscription success.

**Result:**

* Success rate increased significantly with longer call duration.

* Calls over 500 seconds had much higher conversion, showing the importance of engaging conversations.

**9. Subscription Rate by Month of Contact**

* Grouped by the month column, ordered by calendar sequence, and computed subscription success rates.

**Result:**

* **May and August** had the highest contact volume, but lower success.

* **March, December, and October** showed higher success rates, suggesting they may be ideal periods for future campaigns.

**10. Overall Campaign Success Rate**

* Simple group count by the y column (subscription outcome).

**Result:**

* Out of the total contacts, only a small percentage (approx. 11–12%) subscribed.

* This highlights a low conversion rate, reinforcing the need for more targeted marketing strategies.


## 📈 Dashboard Overview (Power BI)
The dashboard includes:

* A summary of overall campaign performance

* Success rate segmented by age, job, and education

* Visual filters for interactive exploration

* Charts highlighting call duration impact and monthly performance trends


## 🧠 Key Insights
* Job and education level significantly affect subscription success.

* Call duration has a strong correlation with successful outcomes.

* Certain months perform better in conversions, suggesting seasonal factors.

* Customers with a positive previous outcome were more likely to subscribe.


## 📌 Recommendations
* Focus future campaigns on customer segments with higher success rates (e.g., professionals, college-educated individuals).

* Prioritize longer, personalized calls over shorter ones.

* Optimize campaign timing by targeting months with historically better conversion rates.

* Re-engage contacts who previously responded positively.


## 👤 Author
**Mary Edeh**– Data Analyst at InternPulse

**Skills**: SQL, Power BI, Data Visualization, Exploratory Data Analysis
