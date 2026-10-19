# 01 - Insurance Claims Analysis

**Dataset:** 1338 policies | DB: girrafe
**My Innovation:** my_risk_score = age*0.3 + bmi*1.5 + IF(smoker='yes',50,0)

### Why I Made This Score?
Smoker avg $32,050 vs non-smoker $8,434 = 3.8x difference. So I gave 50 points to smoker.

### Key Results
1. **Smoker = 3.8x** - Biggest factor
2. **My Score Works:** Low risk (<40) $8.2k vs High risk (>70) $32k
3. **High risk = 12% people but 31% of money** ($6.1M of $17.7M) - Need more reserves
4. **Children = Small impact** only

### 30 sec Interview Story
"I found smoker is 4x costly, so I created my own risk score. My low risk bucket was $8k and high risk $32k, proving my score works."

### Tech Issues Fixed
- ERROR 3948 - Fixed with SET GLOBAL local_infile=1
- ONLY_FULL_GROUP_BY error - Fixed in Q4
