df <- read.csv("50_Startups.csv")
View(df)
library(psych)
library(lattice)
library(ggplot2)
library(caret)

summary(df)
describe(df)
sum(is.na(df))
cor(df[-4]) #excluding State column
boxplot(df$R.D.Spend)
hist(df$R.D.Spend)
boxplot(df$Administration)
hist(df$Administration)
boxplot(df$Marketing.Spend)
hist(df$Marketing.Spend)
boxplot(df$Profit)
hist(df$Profit)
plot(df$R.D.Spend, df$Profit, main = "Scatter Plot")
plot(df$Administration, df$Profit, main = "Scatter Plot")
plot(df$Marketing.Spend, df$Profit, main = "Scatter Plot")

#One Hot Encoding to Categorical Variable State
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

