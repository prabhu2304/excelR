cutlets <- read.csv("Cutlets.csv")
View(cutlets)
attach(cutlets)

library(nortest)
ad.test(cutlets$Unit.A) #p-value =0.2866
ad.test(cutlets$Unit.B) #p-value =0.6869

#Variance test
#H0 <- both the variance are same
#Ha <- both have diff variance
var.test(cutlets$Unit.A,cutlets$Unit.B)
#variances=0.70536 , p-value =0.3136 
#Failed to reject null hypothesis

#2-sample t-test for equal variance
#H0 <- cutlets have same diameter of 2 units
#Ha <- cutlets have diff diameter of 2 units

t.test(Unit.A,Unit.B,alternative = 'two.sided',conf.level = 0.95)

#failed to reject null hypothesis 
#Both cutlets have same diameters