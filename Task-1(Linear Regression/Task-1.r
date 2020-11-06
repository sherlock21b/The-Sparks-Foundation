#importing required libraries
library(ggplot2)
library(caTools)
library(Metrics)

data<-read.csv("http://bit.ly/w-data")

data

str(data)

summary(data)

ggplot(data,aes(x=Hours,y=Scores))+
geom_point()

#splitting the data set in the ratio of 0.8
split<-sample.split(data,SplitRatio=0.8)
train<-subset(data,split=="TRUE")
test<-subset(data,split=="FALSE")

model<-lm(Scores~.,train)

model

plot(data)
abline(model)

pred<-predict(model,test)

pred

#Now we should check the predicted data against the original data
p<-data.frame(Actual=test$Scores,Prediction=pred)

p

#Now lets predict the score against the given input(hours)
k<-data.frame(Hours=9.25,Scores=0)

s<-predict(model,k)

k$Scores<-s

k

#to evaluate the model we use the Mean Absolute Error Method
x<-mae(test$Scores,pred)
cat("Mean Absolute Error :",x)


