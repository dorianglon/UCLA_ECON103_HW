# Title     : TODO
# Objective : TODO
# Created on: 3/9/23

library(POE5Rdata)
library(TAF)
library(car)
data(cps5_small)

# a
cps5_small7 <- subset(cps5_small, educ>7)
reg <- lm(log(wage) ~ educ + exper, data = cps5_small7)
print(linearHypothesis(reg , c( "educ=.112" , "exper=.008")))
# p-value = 0.6777 > 0.05 thus we cannot reject null hypothesis

# b
# df <- cps5_small[cps5_small$educ > 7,]
# reg <- lm(log(wage) ~ educ + exper, data = df)
# df$y_2 <- predict(reg)^2
# df$y_3 <- predict(reg)^3
#
# reset1 <- lm(log(wage)~educ + exper + y_2, data = df)
# print(linearHypothesis(reset1 , c( "y_2=0")))
# reset2 <- lm(log(wage)~educ + exper + y_2 + y_3, data = df)
# print(linearHypothesis(reset2 , c( "y_2=0", "y_3=0")))

# c
