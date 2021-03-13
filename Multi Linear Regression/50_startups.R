df <- read.csv("50_Startups.csv")
View(df)

#One Hot Encoding to Categorical Variable State
install.packages("caret")
library(lattice)
library(ggplot2)
library(caret)
dummy <- dummyVars(" ~ .", data=df)
newdata <- data.frame(predict(dummy, newdata = df))
new_df <- newdata[-4]
View(new_df)

#EDA
pairs(new_df)
cor(new_df)

#Multi Linear Model
model <- lm(Profit~R.D.Spend+Administration+Marketing.Spend+StateFlorida+StateNew.York, data=new_df)
summary(model)

#We will drop Marketing spend since we see a high collinearity between R.D Spend and Marketing Spend
model <- lm(Profit~R.D.Spend+Administration+StateFlorida+StateNew.York, data=new_df)
summary(model)

#We will drop States columns since the p value is very high for these 2.
model <- lm(Profit~R.D.Spend+Administration, data=new_df)
summary(model)

