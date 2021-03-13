df <- read.csv("delivery_time.csv")
View(df)
library('lattice')

#EDA
boxplot(df$Sorting.Time)
boxplot(df$Delivery.Time)
plot(df$Sorting.Time, df$Delivery.Time, main = "Scatter Plot")

#Linear Regression Model
model <- lm(Delivery.Time~Sorting.Time, data=df)
summary(model)

#Prediction
predict(model, data.frame(Sorting.Time=c(10,9,8,7,6,5,4)))
