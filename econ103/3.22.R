# Title     : TODO
# Objective : TODO
# Created on: 2/7/23


library(POE5Rdata)
library(TAF)
data(collegetown)

# a
regout <- lm(price ~ sqft, collegetown)
regsum <- summary(regout)
b2 <- regsum$coefficients[2,1]

sqft_sample_mean <- mean(collegetown$sqft)
price_sample_mean <- mean(collegetown$price)

elasticity <- (b2 * sqft_sample_mean)/price_sample_mean
n2 <- regout$df.residual
se2 <- regsum$coefficients[2, 2]
se_elasticity <- (se2 * sqft_sample_mean)/price_sample_mean
t <- qt(0.975, n2)

lbt <- elasticity - (t*se_elasticity)
ubt <- elasticity + (t*se_elasticity)

# b
critical_value <- qt(0.995, n2)
test_statistic <- (elasticity - 1)/se_elasticity
pt <- 2(1-pt((elasticity-1)/se_elasticity,n2))

# c
# ME = B2
# H0 : B2 <= 13
# H1 : B2 > 13

critical_value <- qt(0.95, n2)
test_statistic <- (b2 - 13)/se2
pt <- 1-pt((b2-13)/se2,n2)

# d

cov <- vcov(regout)[1, 2]
b1 <- regsum$coefficients[1,1]
se1 <- regsum$coefficients[1, 2]
expected_price <- b1 + (b2 * 20)
se_expected_price <- sqrt((se1^2) + (20^2 * se2^2) + (2*20*cov))

t <- qt(0.975, n2)
lbt <- expected_price - (t*se_expected_price)
ubt <- expected_price + (t*se_expected_price)

# e

df <- collegetown[collegetown$sqft == 20,]
price_sample_mean <- mean(df$price)