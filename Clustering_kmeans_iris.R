library(dplyr)
library(ggplot2)
library(ROCR)
View(iris)
str(iris)
a = iris
a = select(a,c(1,2,3,4))
a
str(a)

### Within sun of square
wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")
  wss
}

wssplot(a)
# note: A bend in the graph can suggest the appropriate number of clusters.
# from wss graph we can see point 3 is more appt.78.85144 after this the variation is very minute

# kmeans clustering 
km = kmeans(a, 3)
library(ggfortify)
autoplot(km,a,frame = TRUE)

