# ==============================================
# Project 03: GLM Pricing Model - Insurance Claims
# Author: Pragya | IFoA - CS1, CM1, CB2
# Dataset: 1338 policies - insurance.csv
# Goal: Compare SQL my_risk_score vs Actuarial GLM
# ==============================================

# 0. Load data
data <- read.csv("insurance.csv")
dim(data) # Should be 1338 x 7
head(data)



# 1. EDA - Your 3.8x finding from SQL project - Revalidate in R
# This proves smoker is key rating factor
aggregate(charges ~ smoker, data, function(x) c(count=length(x), mean=mean(x), median=median(x)))

# Charges are right-skewed - check
hist(data$charges, breaks=30, main="Charges Distribution - Right Skewed = Need Gamma GLM")



# 2. Model 1: Linear Model (What beginners do - Violates CS1 assumptions)
m1_lm <- lm(charges ~ age + bmi + children + smoker + region, data=data)
summary(m1_lm) # Screenshot 01




# 3. Model 2: GLM Gamma with log link (Correct Actuarial Approach - CS1)
# Why Gamma? Charges >0 and skewed. Why log link? Multiplicative rating factors
m2_glm <- glm(charges ~ age + bmi + children + smoker + region, 
              family = Gamma(link="log"), data=data)
summary(m2_glm) # Screenshot 02 - MAIN RESULT



# 4. Interpretation - Your Differentiator
# Coef of smokerYes ~ 1.2 => exp(1.2) = 3.32x 
# Your SQL found 3.8x, GLM says 3.32x after adjusting for age/bmi
cat("Smoker Multiplier (GLM):", exp(coef(m2_glm)["smokeryes"]), "\n")



# 5. Prediction & Validation - Compare SQL vs GLM logic
data$predicted_glm <- predict(m2_glm, type="response")

# Aggregate by smoker - Does GLM predict close to actual?
aggregate(cbind(actual=charges, predicted=predicted_glm) ~ smoker, data, mean)



# 6. Diagnostic Plots (For GitHub)
plot(m2_glm) # Check residuals
# Actual vs Predicted
plot(data$charges, data$predicted_glm, main="Actual vs Predicted - GLM",
     xlab="Actual Charges", ylab="Predicted GLM")
abline(0,1, col="red", lwd=2)


# 7. Save output for README
# Compare lift: Your SQL risk bucket gave $5k vs $14k = 2.7x lift
# GLM should give similar/better

















