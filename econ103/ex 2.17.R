# Title     : TODO
# Objective : TODO
# Created on: 2/13/23


library(POE5Rdata)
library(TAF)

data(collegetown)
# plot(collegetown$sqft, collegetown$price,
#       xlab="House Size",
#       ylab="House Price",
#       main = "Scatterplot of Living Area v Price",
#       type = "p")

regout_linear <- lm(price ~ sqft, collegetown)
# par(mfrow = c(1,2))
# plot(collegetown$sqft, resid(regout_linear), xlab = "sqft, 100s", ylab= "Residuals, linear",
# main = " Residuals from linear model")
# abline(0,0)
regout_quadratic <- lm(price ~ I(sqft ^ 2), collegetown)
# plot(collegetown$sqft, resid(regout_quadratic), xlab = "sqft, 100s", ylab= "Residuals, quadratic",
# main = " Residuals from quadratic model")
# abline(0,0)

sum(resid(regout_linear)^2)
sum(resid(regout_quadratic)^2)

# curve(regout$coefficients[1] + regout$coefficients[2]*x ^ 2, add = TRUE)

# dy_dx <- 2*regout$coefficients[2]*20
# y_hat <- predict(regout, data.frame(sqft = c(20)))
# elasticity <- dy_dx * (20/y_hat)
# print(elasticity)
