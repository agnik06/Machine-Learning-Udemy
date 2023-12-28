# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
regressor=lm(formula=Salary~yearsExperience,data = training_set)
y=predict(regressor,newdata = test_set)
library(ggplot2)
  ggplot(test_set,aes(test_set$YearsExperience,test_set$Salary))+
  geom_point(size=1,colour="red")+
  geom_line(aes(test_set$YearsExperience,predict(regressor,newdata = test_set)),colour="purple")
  

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)