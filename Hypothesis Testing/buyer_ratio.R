#chi-square test
buyer <- read.csv("BuyerRatio.csv")
View(buyer)
buyer_ration <- buyer[,-1]
buyer_ration
#H0 ->product sales ratio are same for males and females
#H1 ->product sales ratio are not same for males and females

chisq.test(buyer_ration)
#p =0.6603 >0.05 -> p value is high ->failed to reject null hypothesis

#Product sales ratio are same for males and females