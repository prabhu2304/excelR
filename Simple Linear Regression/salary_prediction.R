df <- read.csv("Salary_Data.csv")
View(df)
library(psych)

#EDA
summary(df)
describe(df)
is.na(df)
boxplot(df$YearsExperience)
boxplot(df$Salary)
hist(df$YearsExperience)
hist(df$Salary)
plot(df$YearsExperience, df$Salary, main="Scatter Plot")
cor(df)

#Linear Regression Model
model <- lm(Salary~YearsExperience, data=df)
summary(model)
model$residuals
predict(model,data.frame(YearsExperience=c(1.5,2.2,3.3,4.9)))

#log transformation
plot(log(df$YearsExperience),df$Salary)
cor(log(df$YearsExperience),df$Salary)
reg_log <- lm(Salary~log(YearsExperience), data=df)
summary(reg_log)
reg_log$residuals
predict(reg_log,data.frame(YearsExperience=c(1.5,2.2,3.3,4.9)))

#exponential transformation
plot(df$YearsExperience,log(df$Salary))
cor(df$YearsExperience,log(df$Salary))
reg_exp <- lm(log(Salary)~YearsExperience, data=df)
summary(reg_exp)
reg_exp$residuals
predict(reg_exp,data.frame(YearsExperience=c(1.5,2.2,3.3,4.9)))

#polynomial transformation
plot(df$YearsExperience*df$YearsExperience, df$Salary, main='Scatter Plot')
cor(df$YearsExperience*df$YearsExperience, df$Salary)
reg_poly <- lm(Salary~YearsExperience+I(YearsExperience^2), data=df)
summary(reg_poly)
reg_poly$residuals
predict(reg_poly, data.frame(YearsExperience=c(1.5,2.2,3.3,4.9)))

#cubic transformation
plot((df$YearsExperience^3), df$Salary, main="Scatter Plot")
cor(df$YearsExperience^3,df$Salary)
reg_poly3 <- lm(Salary~YearsExperience+I(YearsExperience^2)+I(YearsExperience^3), data=df)
summary(reg_poly3)
reg_poly3$residuals
predict(reg_poly3,data.frame(YearsExperience=c(1.5,2.2,3.3,4.9)))

#cubic model has highest r^2 value 
plot(reg_poly3)
