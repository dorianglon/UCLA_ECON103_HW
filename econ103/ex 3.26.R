# Title     : TODO
# Objective : TODO
# Created on: 2/9/23


library(POE5Rdata)
library(TAF)
data(cps5_small)

# a
regout <- lm(wage ~ exper, cps5_small)
regsum <- summary(regout)

# b
# H0 : b2 = 0
# H1 : b2 > 0

n2 <- regout$df.residual
b2 <- regsum$coefficients[2,1]
se2 <- regsum$coefficients[2, 2]
t <- qt(0.95, n2)
test_statistic <- (b2 - 0)/se2

# c
df <- cps5_small[cps5_small$metro == 1,]
regout <- lm(wage ~ exper, df)
regsum <- summary(regout)
n2 <- regout$df.residual
b2 <- regsum$coefficients[2,1]
se2 <- regsum$coefficients[2, 2]
t <- qt(0.99, n2)
test_statistic <- (b2 - 0)/se2
pt <- 1-pt((b2-0)/se2,n2)

# d
df <- cps5_small[cps5_small$metro == 0,]
regout <- lm(wage ~ exper, df)
regsum <- summary(regout)
n2 <- regout$df.residual
b2 <- regsum$coefficients[2,1]
se2 <- regsum$coefficients[2, 2]
pt <- 1-pt((b2-0)/se2,n2)
t <- qt(0.99, n2)
test_statistic <- (b2 - 0)/se2
print(t)
print(test_statistic)
print(pt)