df <- read.csv("Salary_Data.csv")
View(df)

#EDA
boxplot(df$YearsExperience)
boxplot(df$Salary)
plot(df$YearsExperience, df$Salary, main="Scatter Plot")

#Linear Regression Model
model <- lm(Salary~YearsExperience, data=df)
summary(model)
