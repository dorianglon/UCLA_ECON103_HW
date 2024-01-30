# Title     : Exercise 6 HW 1
# Created on: 1/23/23

library(POE5Rdata)
library(TAF)

# get dataset
data(stockton5_small)

# scale SPRICE data by dividing each column value by 1000
data <- div(stockton5_small, 'sprice', by = 1000, grep = FALSE)
data$livarea <- 100*(data$livarea)
print(data)
#
# regout <- lm(sprice ~ livarea, data)
#
# plot(data$livarea, data$sprice,
#       xlab="Living Area",
#       ylab="Price",
#       main = "Scatterplot of Living Area v Price",
#       type = "p")
#
# curve(regout$coefficients[1] + regout$coefficients[2]*x, add = TRUE)
#
# # Clear the workspace
# rm(list = ls())
# library(POE5Rdata)
# data(stockton5_small)
#
# # scale SPRICE data by dividing each column value by 1000
# data <- div(stockton5_small, 'sprice', by = 1000, grep = FALSE)
#
# # Next let's regress food expenditure on income squared. Note the use of I() function
# regout <- lm(sprice ~ I(livarea ^ 2), data) # Let's do a scatter plot
# plot(data$livarea, data$sprice, xlab = "Living Area", ylab = "Price")
# # Now add the fitted line from our regression
# curve(regout$coefficients[1] + regout$coefficients[2]*x ^ 2, add = TRUE)





