# Title     : TODO
# Objective : TODO
# Created on: 3/16/23

library(AER)
data(HousePrices)
HousePrices <- subset(HousePrices, select = -c(driveway, recreation, fullbase, gasheat, aircon, prefer))


# price <- HousePrices$price
# lotsize <- HousePrices$lotsize
# bedrooms <- HousePrices$bedrooms
# bathrooms <- HousePrices$bathroooms
# stories <- HousePrices$bathroooms
# garage <- HousePrices$garage

# res <- cor(HousePrices)
# round(res, 2)

model <- lm(price ~ lotsize + bedrooms + bathrooms + stories + garage, data=HousePrices)
summary(model)
vf1<-vif(model)
VIF<-c("N/A",round(as.numeric(vf1),2))
tbl<-cbind(tidy(mod1),VIF)
kable(tbl, caption="Unrestricted Model with Data from HousePrices",
      digits=4,align="c")