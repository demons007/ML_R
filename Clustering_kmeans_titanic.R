### Titanic data set
library(dplyr)
library(ggplot2)
library(ROCR)
View(Titanic)
View(str(Titanic))
t_ds = Titanic
t_ds = select(t_ds,c(1:3))
View(t)

