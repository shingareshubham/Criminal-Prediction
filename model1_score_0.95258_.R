# 0.95258 score in HackerEarth
# full training dataset used in this model

setwd("C:/R/hackerearth/criminal")
library(randomForest)
train <- read.csv("criminal_train.csv")
test <- read.csv("criminal_test.csv")
summary(train)
str(train)
head(train)
#View(train)

train$Criminal <- as.factor(train$Criminal)
str(train)
summary(train)


train_data <- train[,-1]

dim(train_data)
summary(train_data)

#optimised value of mtry
#bestmtry <- tuneRF(train_data, train_data$Criminal, stepFactor = 1.2, improve = 0.01, trace = TRUE, plot = TRUE)


model1 <- randomForest(Criminal~. , data = train_data)
model1

#Gni index
model1$importance

varImpPlot(model1)

Criminal <- predict(model1, newdata = test, type ="Class" )

test_data <- data.frame(test,Criminal)
summary(test_data)
names(test_data)
str(test_data)

result <- test_data[,c(1,72)]
summary(result)

write.csv(result, "submission2.csv", row.names=FALSE)

sub = read.csv("submission2.csv")
View(sub)
