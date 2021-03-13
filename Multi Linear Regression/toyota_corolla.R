df <- read.csv("ToyotaCorolla.csv")
df <- df[c("Price","Age_08_04","KM","HP","cc","Doors","Gears","Quarterly_Tax","Weight")]
View(df)

#EDA
pairs(df)
cor(df)

#Multi Linear Model
model <- lm(Price~Age_08_04+KM+HP+cc+Doors+Gears+Quarterly_Tax+Weight, data=df)
summary(model)
