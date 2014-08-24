library(shiny)
library(datasets)
library(ggplot2)
library(caret)
library(rattle)
library(rpart)
library(rpart.plot)

# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
   data(iris)
   fit <- rpart(Species~., data=iris)
   
   makePrediction <- reactive(
       paste("Prediction for the current input is:", as.character(predict(fit, type="class", newdata=data.frame(Sepal.Length=input$iSepal.Length, Sepal.Width=input$iSepal.Width, 
                                                                                                                Petal.Length=input$iPetal.Length,Petal.Width=input$iPetal.Width))))
       )
    
    
    output$distPlot <- renderPlot({
        
        # generate an rnorm distribution and plot it
        qplot(get(input$x), get(input$y), data=iris, color=Species, xlab=input$x, ylab=input$y)
    })
    
   output$tree <- renderPlot({
       fancyRpartPlot(fit)
   })
   
   output$prediction <- renderText({
       makePrediction()
       })
})