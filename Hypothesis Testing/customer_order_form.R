co_form=read.csv("Costomer+OrderForm.csv")
View(co_form)
install.packages("BSDA")
install.packages("e1071")
library(BSDA)
library(e1071)
library(nortest)
attach(co_form)
install.packages("tidyr")
library(tidyr)
#table formation and stacking of data
df <- table(gather(co_form,nation,status,1:4))
df
#H0 <- all the centers have same defective% 
#H1 <- different centers have defective%
chisq.test(df)
#p-value>0.05, Failed to reject null hypothesis


#All centers have same defective percentage