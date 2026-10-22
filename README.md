# Insurance Analytics Portfolio - Actuarial Projects

**Actuarial Analyst | SQL, R, Excel | CS1, CM2 , CB2| Jaipur, India**
**Aspiring Actuary | BCOM (HONS) EAFM | 1338 Policies | 3 Projects | Interview Ready**

> Each project has 30-sec interview story + screenshot proofs - No need to run code

### 📊 Projects at a Glance

| # | Project | Tool | Key Result | Status |
|---|---------|------|------------|--------|
| 01 | Insurance Claims Analysis | MySQL (girrafe, 1338 rows) | Smoker 3.8x ($32k vs $8.4k), Risk Score $8.2k vs $32k, 12% high-risk = 31% money | [View Project 01](01-insurance-claims) |
| 02 | Chain Ladder Reserving | Excel (10x10, 2015-2024) | Total IBNR Rs 19.95L (1995.12), LDF 1.63→1.002, 2024 needs Rs 8.36L | [View Project 02](02-chain-ladder-reserving) |
| 03 | Pricing GLM | R - Gamma GLM log link | Smoker 4.45x (1.49 coef), Age 2.9%/yr, AIC 26382, Deviance 1056→338 | [View Project 03](03-pricing-glm-r) |

### 👩‍💼 About Me
Aspiring Actuary | BCOM (HONS) EAFM | Learning SQL, R, Excel for IFoA
Building actuarial portfolio to demonstrate Pricing & Reserving skills for entry-level Actuarial Analyst roles.

### 📁 Projects Detail

#### 01 - Insurance Claims Analysis [DONE]
- **Tool:** MySQL (DB: girrafe, 1338 rows)
- **My Innovation:** Created `my_risk_score = age*0.3 + bmi*1.5 + IF(smoker='yes',50,0)` and validated
- **Key Finding:** Smoker = 3.8x costly ($32k vs $8.4k) | My score Low $8.2k vs High $32k = score works | 12% high-risk = 31% of money
- **Files:** [View Project](01-insurance-claims)
- **Skills:** Pricing, Risk Buckets, SQL Aggregations, Fixed ERROR 3948 & ONLY_FULL_GROUP_BY

#### 02 - Chain Ladder Reserving [DONE]
- **Tool:** Excel (10x10 Triangle, 2015-2024)
- **My Innovation:** Calculated 9 development factors, CDF 2.69, IBNR Rs 19.95L from scratch
- **Key Finding:** 2024 needs Rs 8.36L reserve | Total IBNR 1995.12 | LDF stable 1.63 to 1.002 proving development slows
- **Files:** [View Project 02](02-chain-ladder-reserving)
- **Skills:** Reserving, CM2, Chain Ladder, IBNR, Development Factors, Ultimate Claims

#### 03 - Pricing GLM with R [DONE] - MAIN
- **Tool:** R - Gamma GLM with log link (CS1 Correct)
- **My Innovation:** Proved LM is wrong (violates CS1), Gamma is correct for >0 skewed charges; Log link = multiplicative factors
- **Key Finding:** Smoker coef 1.493434 => **4.45x** | Age 2.9%/yr, BMI 1.39%/point | SQL 3.8x raw vs GLM 4.45x adjusted = pure effect
- **Files:** [View Project 03](03-pricing-glm-r)
- **Skills:** Pricing GLM, Gamma Family, Log Link, Relativities exp(coef), AIC, Deviance, CS1

### 🛠 Tech Stack
MySQL, R, Excel | Actuarial Concepts (CS1, CM1, CS2, CM2) | Pricing, Reserving, GLM

### 🎯 How to Run
- 01: Open MySQL Workbench, DB girrafe, run `queries.sql` in `01-insurance-claims`
- 02: Open `chain_ladder_model.xlsx` in `02-chain-ladder-reserving`, see formulas
- 03: Run `glm_pricing.R` in RStudio 4.4.1, check `exp(coef(m2_glm)["smokeryes"])` = 4.45

### 📬 Contact
- LinkedIn: https://www.linkedin.com/in/pragya-agarwal-a9b788317
- GitHub: pragya-actuarial
- Location: Jaipur, Rajasthan

### 💡 Why Hire Me?
I don't just run models - I connect business impact:
- SQL: Created risk score and validated $8.2k vs $32k
- Excel: Built 10x10 triangle from scratch, IBNR 19.95L
- R: Proved why LM is wrong and Gamma GLM is correct - 4.45x pricing factor
