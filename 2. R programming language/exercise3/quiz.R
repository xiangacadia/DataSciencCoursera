## Question 1
## mean of 'Sepal.Length' for the species virginica
library(datasets)
data(iris)
tapply(iris$Sepal.Length, iris$Species, mean)

## Question 2
## returns a vector of the means of the variables 
## 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
apply(iris[, 1:4], 2, mean)

## Question 3
## calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)
data(mtcars)
?mtcars
with(mtcars, tapply(mpg, cyl, mean))

