-- Project 01: Insurance Claims Analysis
-- DB: girrafe | Table: insurance_claims | Rows: 1338

-- My Innovation Score
ALTER TABLE insurance_claims ADD COLUMN my_risk_score DECIMAL(10,2);
UPDATE insurance_claims SET my_risk_score = age*0.3 + bmi*1.5 + IF(smoker='yes',50,0);

-- Q1: Total policies and exposure
SELECT COUNT(*) as total_policies, SUM(charges) as total_exposure, AVG(charges) as avg_claim FROM insurance_claims;

-- Q2: Smoker impact - main pricing factor
SELECT smoker, COUNT(*) as count, ROUND(AVG(charges),2) as avg_claim, ROUND(AVG(my_risk_score),2) as my_score FROM insurance_claims GROUP BY smoker;

-- Q3: Age bands for term pricing
SELECT CASE WHEN age<30 THEN '18-29' WHEN age<45 THEN '30-44' ELSE '45+' END as age_band, COUNT(*) as cnt, ROUND(AVG(charges),2) as avg_claim FROM insurance_claims GROUP BY age_band;

-- Q4: BMI + Smoker interaction (Fixed ONLY_FULL_GROUP_BY error)
SELECT CASE WHEN bmi<25 THEN 'Normal' WHEN bmi<30 THEN 'Overweight' ELSE 'Obese' END as bmi_cat, smoker, ROUND(AVG(charges),2) as avg_claim FROM insurance_claims GROUP BY bmi_cat, smoker ORDER BY avg_claim DESC;

-- Q5: Region analysis
SELECT region, COUNT(*) as policies, ROUND(AVG(charges),2) as avg_claim, ROUND(AVG(my_risk_score),2) as my_score FROM insurance_claims GROUP BY region ORDER BY my_score DESC;

-- Q6: My risk buckets validation (Only I have this)
SELECT CASE WHEN my_risk_score<40 THEN 'Low' WHEN my_risk_score<70 THEN 'Medium' ELSE 'High' END as risk_bucket, COUNT(*) as count, ROUND(AVG(charges),2) as avg_claim FROM insurance_claims GROUP BY risk_bucket ORDER BY avg_claim;

-- Q7: High-risk cohort for reserving
SELECT COUNT(*) as high_risk_count, ROUND(AVG(charges),2) as avg_claim, SUM(charges) as total_exposure FROM insurance_claims WHERE my_risk_score > 75;

-- Q8: Children impact
SELECT children, COUNT(*) as cnt, ROUND(AVG(charges),2) as avg_claim FROM insurance_claims GROUP BY children ORDER BY children;

-- Q9: Top 10 outlier claims
SELECT age, bmi, smoker, region, charges, my_risk_score FROM insurance_claims ORDER BY charges DESC LIMIT 10;

-- Q10: Summary
SELECT MIN(charges) as min_claim, MAX(charges) as max_claim, ROUND(STDDEV(charges),2) as stddev, ROUND(AVG(my_risk_score),2) as avg_risk FROM insurance_claims;
