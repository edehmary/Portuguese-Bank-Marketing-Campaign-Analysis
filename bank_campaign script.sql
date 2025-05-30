-- Create a database for the bank marketing campaign
CREATE DATABASE Marketing_Campaign;
USE Marketing_Campaign;
-- Create a table for the dataset
CREATE TABLE Campaign_Data(
age INT,
job VARCHAR(50),
marital VARCHAR(25),
education VARCHAR(50),
`default` VARCHAR(10),
balance INT,
housing VARCHAR(10),
loan VARCHAR(10),
contact VARCHAR(25),
`day` INT,
`month` VARCHAR(10),
duration INT,
campaign INT,
pdays INT,
previous INT,
poutcome VARCHAR(25),
y VARCHAR(10));

-- Display the imported dataset
SELECT * FROM campaign_data;


-- Exploratory Data Analysis(EDA)
-- Check for possible inconsistencies in the dataset
-- Check for the missing values or the unknowns
SELECT * 
FROM campaign_data
WHERE education = 'unknown' or job = 'unknown' or `month` = 'unknown' or housing = 'unknown' or job = 'unknown' or `default` = 'unknown';

-- Check for the nan or missing values in the numerical columns
SELECT  COUNT(*) AS age_null
FROM campaign_data
WHERE age IS NULL;

SELECT COUNT(*) AS balance_null
FROM campaign_data
WHERE balance IS NULL;

SELECT COUNT(*) AS duration_null
FROM campaign_data
WHERE duration IS NULL;

SELECT COUNT(*) AS pdays_null
FROM campaign_data
WHERE pdays IS NULL;

-- Check for duplicated rows
SELECT *, COUNT(*) AS count
FROM campaign_data
GROUP BY age, job, marital, education, `default`, balance, housing, loan,
         contact, `day`, `month`, duration, campaign, pdays, previous, poutcome, y
HAVING count > 1;
      
-- Bank marketing campaign analysis
-- What is  the campaign subscription rate by the job type ?
SELECT job, 
		COUNT(*) AS total_contact,
		SUM( CASE WHEN y = 'yes' THEN 1 ELSE 0 END ) AS succesful_subscription,
        SUM(CASE WHEN y = 'no' THEN 1 ELSE 0 END) AS non_successful_subscription,
		ROUND(100 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*)) AS success_rate,
        ROUND(100 * SUM(CASE WHEN y = 'no' THEN 1 ELSE 0 END) / COUNT(*)) AS non_subscription_rate
FROM campaign_data
GROUP BY job;

-- What is the campaign subscription rate by age group?
SELECT
	CASE
		WHEN age < 25 THEN 'under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
	END AS age_group,
    COUNT(*) AS total,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed,
    SUM(CASE WHEN y = 'NO' THEN 1 ELSE 0 END) AS no_subscription,
    ROUND(100 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*)) AS success_rate,
    ROUND(100 * SUM(CASE WHEN y = 'NO' THEN 1 ELSE 0 END) / COUNT(*)) AS no_subscription_rate
FROM campaign_data
GROUP BY age_group;

-- What is the subscription rate by marital status?
SELECT marital,
				COUNT(*) AS total,
				SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS susbribed,
                SUM(CASE WHEN y = 'no' THEN 1 ELSE 0 END) AS non_subscribed,
                ROUND(100* SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)/COUNT(*)) AS success_rate
FROM campaign_data
GROUP BY marital;

-- What is the subscription rate by educational status?
SELECT education,
	COUNT(*) AS total,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed,
    SUM(CASE WHEN y = 'no' THEN 1 ELSE 0 END) AS not_subscirbed,
    ROUND(100 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)/ COUNT(*)) AS success_rate
FROM campaign_data
GROUP BY education
ORDER BY success_rate DESC;

-- Does housing loan influence customer subscription rate?
SELECT housing,
		COUNT(*) AS total,
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed,
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS not_subscribed,
        ROUND(100 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)/COUNT(*)) AS success_rate
FROM campaign_data
GROUP BY housing;
-- Which monthly has the highest conversion rate or success rate by subscription?
SELECT `month`,
		COUNT(*) AS total,
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed,
        SUM(CASE WHEN y = 'no' THEN 1 ELSE 0 END) AS not_subscribed,
        ROUND(100 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)/ COUNT(*)) AS success_rate
FROM campaign_data
GROUP BY `month`
ORDER BY FIELD(`month`,  'jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec');

-- What is the subscription rate by previous campaign outcome?
SELECT poutcome,
       COUNT(*) AS total,
       SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed,
       SUM(CASE WHEN y = 'no' THEN 1 ELSE 0 END) AS not_subscribed,
       ROUND(100 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*)) AS success_rate
FROM campaign_data
GROUP BY poutcome;

-- How does the call duration influence the customer subscription rate?

SELECT 
				COUNT(*) AS total,
                CASE
                WHEN duration < 100 THEN '< 100 sec'
                WHEN duration BETWEEN 100 AND 200 THEN '100-200 sec'
                WHEN duration BETWEEN 200 AND 300 THEN '200-300 sec'
                WHEN duration BETWEEN 300 AND 400 THEN '300-400 sec'
                WHEN duration BETWEEN 400 AND 500 THEN '400-500 sec '
                ELSE '> 500'
                END AS duration_group,
                COUNT(*) AS total,
				SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed,
                SUM(CASE WHEN y = 'no' THEN 1 ELSE 0 END) AS not_subscribed,
                ROUND(100 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*)) AS success_rate
FROM campaign_data
GROUP BY duration_group;

-- What is the overall campaign success rate?
SELECT y AS subscription_status,
		COUNT(*) AS total_count
FROM campaign_data
GROUP BY y;

				
                
SELECT duration FROM campaign_data;


        

    
        




