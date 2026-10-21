# 03 - Pricing GLM with R - Gamma Model

**Link to Project 01 SQL:** ../01-insurance-claims - SQL Risk Score segmented charges $5,076 vs $14,092 (2.7x lift)

**Why GLM not Linear Model?**
Linear Model assumes normal errors, but charges are right-skewed (see hist). As per CS1, correct distribution is Gamma with log link - multiplicative rating factors.

**Dataset:** 1338 policies, same as Project 01

**Model:** `glm(charges ~ age + bmi + smoker + region, family=Gamma(link="log"))`

**Key Finding:**
- Smoker coefficient = ~1.20 => exp(1.20) = **3.32x multiplier**
- SQL Analysis (Project 01) found 3.8x raw difference (32050 vs 8434)
- GLM gives 3.32x AFTER adjusting for age/bmi - proves smoker is strongest rating factor, independent of age/bmi

**SQL vs GLM:**
| Method | Smoker Impact | Logic |
|---|---|---|
| SQL my_risk_score | 3.8x (raw avg) | age*0.3 + bmi*1.5 + 50*smoker |
| GLM Gamma | 3.32x (adjusted) | Actuarial standard |

**Validation:** Actual vs Predicted close by smoker group.

## Screenshots
- 01_lm_summary, 02_glm_summary, 03_hist_charges, 04_actual_vs_predicted
