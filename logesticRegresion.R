library(dplyr)
library(ggplot2)
str(mtcars)
View(mtcars)

library(caTools)
sample.split(mtcars, SplitRatio = 0.75) -> split_tag
split_tag
subset(mtcars,split_tag==TRUE) -> train
subset(mtcars,split_tag==FALSE) -> test
nrow(train)
nrow(test)

glm(vs~wt+disp,train,family = "binomial") -> log_reet1
summary(log_reet1)

prd = predict(log_reet1,test,type = "response")
prd
table(PredictedValue=prd>0.5,ActualValue = test$vs)


library(ROCR)
ROCRPred = prediction(prd,train$vs)
ROCPerf = performance(ROCRPred,"tpr","fpr")
plot(ROCPerf,colorize=TRUE,print.cutoffs.at=seq(0.1,by=0.1))

