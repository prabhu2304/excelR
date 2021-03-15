df <- read.csv("delivery_time.csv")
View(df)

#EDA
boxplot(df$Sorting.Time)
boxplot(df$Delivery.Time)
plot(df$Sorting.Time, df$Delivery.Time, main = "Scatter Plot")
cor(df$Sorting.Time,df$Delivery.Time)
summary(df)
describe(df)
is.na(df)

#Linear Regression Model
model <- lm(Delivery.Time~Sorting.Time, data=df)
summary(model)
model$residuals
predict(model, data.frame(Sorting.Time=c(10,9,8,7,6,5,4)))

#log transformation
plot(log(df$Sorting.Time),df$Delivery.Time)
cor(log(df$Sorting.Time),df$Delivery.Time)
reg_log <- lm(Delivery.Time~log(Sorting.Time), data=df)
summary(reg_log)
reg_log$residuals
predict(reg_log,data.frame(Sorting.Time=c(10,9,8,7,6,5,4)))


#exponential transformation
reg_exp <- lm(log(Delivery.Time)~Sorting.Time, data=df)
summary(reg_exp)
reg_exp$residuals
predict(reg_exp,data.frame(Sorting.Time=c(10,9,8,7,6,5,4)))


#polynomial transformation
cor(df$Sorting.Time*df$Sorting.Time,df$Delivery.Time)
reg_poly <- lm(Delivery.Time~Sorting.Time+I(Sorting.Time^2), data=df)
summary(reg_poly)
predict(reg_poly)
reg_poly$residuals
predict(reg_poly, data.frame(Sorting.Time=c(10,9,8,7,6,5,4)))


#cubic transformation
cor(df$Sorting.Time^3,df$Delivery.Time)
reg_poly3 <- lm(Delivery.Time~Sorting.Time+I(Sorting.Time^2)+I(Sorting.Time^3), data=df)
summary(reg_poly3)
reg_poly3$residuals
predict(reg_poly3,data.frame(Sorting.Time=c(10,9,8,7,6,5,4)))

#exponential model has higher value of r^2 value
plot(reg_exp)
