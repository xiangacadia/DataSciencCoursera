x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)

fit <- lm(y ~ x)
summary(fit)

y <- mtcars$mpg
x <- mtcars$wt
fit <- lm(y ~ x)
summary(fit)
# to predict for one new value, the name for the new value should be pointed out in the data frame
result <- predict(fit, newdata=data.frame(x=mean(x)), level=0.95, interval="confidence") 
result <- predict(fit, newdata=data.frame(x=3), level=0.95, interval="confidence") 


