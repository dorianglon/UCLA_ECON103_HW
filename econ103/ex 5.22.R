# Title     : TODO
# Objective : TODO
# Created on: 3/6/23

library(POE5Rdata)
library(TAF)
data(toody5)

# a
reg <- lm(y~trend + rain + I(rain^2) + rain*trend, toody5)
regsum <- summary(reg)

# b
# ME wrt to Rain is beta3 + 2*beta4*rain_t + beta5*trend_t
# H_0 : beta3 + 2*beta4*rain_t + beta5*trend_t <= 0
# H_1 : beta3 + 2*beta4*rain_t + beta5*trend_t > 0

k <- reg$df.residual
t <- qt(0.95, k)

trend <- 2.4
rain <- 4.576

b3 <- regsum$coefficients[3,1]
b4 <- regsum$coefficients[4,1]
b5 <- regsum$coefficients[5,1]

cov_matrix <- vcov(reg)
var_b3 <- cov_matrix[3, 3]
var_b4 <- cov_matrix[4, 4]
var_b5 <- cov_matrix[5, 5]
cov_b3_b4 <- cov_matrix[3, 4]
cov_b3_b5 <- cov_matrix[3, 5]
cov_b4_b5 <- cov_matrix[4, 5]

test_stat_num <- b3 + 2*b4*rain + b5*trend

test_stat_se <- sqrt(var_b3 + ((2*rain)^2)*var_b4 + (trend^2)*var_b5 + 2*2*rain*cov_b3_b4 + 2*trend*cov_b3_b5
+ 2*2*rain*trend*cov_b4_b5)

test_statistic <- test_stat_num/test_stat_se

print(test_statistic)
print(t)

# since test stat < t then we fail to reject H_0

# c
# when trend = 1 : E[Y|Rain] = beta1 + beta2 + beta3*rain + beta4*rain^2 + beta5*rain
# when trend = 4.5 : E[Y|Rain] = beta1 + 4.5*beta2 + beta3*rain + beta4*rain^2 + 4.5*beta5*rain
# thus change in yield is = 3.5*beta2 + 3.5b*beta5*rain

b2 <- regsum$coefficients[2,1]
b5 <- regsum$coefficients[5,1]
cov_matrix <- vcov(reg)
var_b2 <- cov_matrix[2, 2]
var_b5 <- cov_matrix[5, 5]
cov_b2_b5 <- cov_matrix[2, 5]
k <- reg$df.residual

rain <- 3.8355
point_estimate <- 3.5*b2 + 3.5*b5*rain
print(point_estimate)

t <- qt(0.975, k)
el1 <- (3.5^2)*var_b2
el2 <- ((3.5*rain)^2)*var_b5
el3 <- 2*3.5*(3.5*rain)*cov_b2_b5
se <- sqrt(el1 + el2 + el3)

lb <- point_estimate - t*se
ub <- point_estimate + t*se
print(lb)
print(ub)

# d
# H0 : alpha2 >= 0
# H1 : alpha2 < 0

reg <- lm(rain~trend , toody5)
regsum <- summary(reg)
k <- reg$df.residual

a2 <- regsum$coefficients[2,1]
a2_se <- regsum$coefficients[2, 2]

t <- -1 * qt(0.95, k)
test_statistic <- (a2)/a2_se

print(t)
print(test_statistic)

# We reject null hypothesis

# e

# reg <- lm(rain~trend , toody5)
estimate_1960 <- predict(reg, newdata = data.frame(trend=1))
estimate_1995 <- predict(reg, newdata = data.frame(trend=4.5))

# f
# equation for change in yield is given by :
# beta3(rain_1995 - rain_1960) + beta4(rain_1995^2 - rain_1960^2) + beta5(rain_1995 - rain_1960)

change_in_yield <- b3*(estimate_1995 - estimate_1960) + b4*(estimate_1995^2 - estimate_1960^2) +
  b5*(estimate_1995 - estimate_1960)
print(change_in_mean_yield)

# g
# equation is 3.5*beta2 + 3.5*beta5*mean_rain_1960

reg1 <- lm(y~trend + rain + I(rain^2) + rain*trend, toody5)
regsum1 <- summary(reg1)
reg2 <- lm(rain~trend , toody5)
rain <- predict(reg2, newdata = data.frame(trend=1))

b2 <- regsum1$coefficients[2,1]
b5 <- regsum1$coefficients[5,1]

change_in_yield <- 3.5*b2 + 3.5*b5*rain
print(change_in_yield)