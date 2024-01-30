# Title     : TODO
# Objective : TODO
# Created on: 2/13/23

library(POE5Rdata)
library(dplyr)
data(motel)

# aggregate(motel$motel_pct, by=list(motel$repair), FUN=mean)

regout <- lm(motel_pct ~ repair, motel)
regsum <- summary(regout)
print(regsum)
#
# n2 <- regout$df.residual
# b2 <- regsum$coefficients[2,1]
# se2 <- regsum$coefficients[2, 2]
# t <- qt(0.975, n2)
#
# lbt <- b2 - (t*se2)
# ubt <- b2 + (t*se2)
#
# test_statistic <- (b2 - 0)/se2

# regout2 <- lm(I(motel_pct - comp_pct)~repair, data = motel)
# regsum <- summary(regout2)
#
# n2 <- regout2$df.residual
# b2 <- regsum$coefficients[2,1]
# se2 <- regsum$coefficients[2, 2]
#
# # lbt <- b2 - (t*se2)
# # ubt <- b2 + (t*se2)
#
# critical_val <- qt(0.99, n2)
# t <- (b2 - 0)/se2
# p <- pt((b2-0)/se2,n2)
# print(critical_val)
# print(t)
# print(p)