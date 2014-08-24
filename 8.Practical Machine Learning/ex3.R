#######
# Q1
library(AppliedPredictiveModeling)
library(caret)
data(segmentationOriginal)
library(caret)
library(rpart)
library(rattle)
library("rpart.plot")


#Subset the data to a training set and testing set based on the Case variable in the data set
train <- segmentationOriginal[segmentationOriginal$Case=='Train',]
test <- segmentationOriginal[segmentationOriginal$Case=='Test',]

set.seed(125) 

# grow tree 
fit <- train(Class ~., method = "rpart", data=train)

printcp(fit) # display the results 
plotcp(fit) # visualize cross-validation results 
summary(fit) # detailed summary of splits

# plot tree 
plot(fit)
text(fit)
fancyRpartPlot(fit$finalModel)

##############
# Q3.
library(pgmm)
data(olive)
olive = olive[,-1]

# Fit a classification tree where Area is the outcome variable. 
fit <- train(Area ~., method = "rpart", data=olive)

# plot tree 
fancyRpartPlot(fit$finalModel)

# make prediction
newdata = as.data.frame(t(colMeans(olive)))
prediction <- predict(fit$finalModel, newdata)

#################
# Q4
library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

set.seed(13234)
fit <- train(chd ~ age+alcohol+obesity+tobacco+typea+ldl,method="glm", family="binomial", data=SAheart)
trainPrediction <- predict(fit, trainSA,type="raw")
missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}
missClass(trainSA$chd, trainPrediction)


####################
# Q5
library(ElemStatLearn)
data(vowel.train)
data(vowel.test) 

vowel.train$y <- factor(vowel.train$y)
vowel.test$y <- factor(vowel.test$y)
set.seed(33833)

fit <- train(y ~., data=vowel.train, method="rf",prox=TRUE)
order(varImp(fit$finalModel))
