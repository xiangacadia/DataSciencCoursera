library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Iris Classification using Decision Tree"),
    
    
    sidebarLayout(
        sidebarPanel(
            
            selectInput("x", "Choose x axis:", 
                        choices = c("Sepal.Length", "Sepal.Width", "Petal.Length","Petal.Width")),
            
            selectInput("y", "Choose y axis:", 
                        choices = c("Sepal.Length", "Sepal.Width", "Petal.Length","Petal.Width")),
            
            sliderInput("iSepal.Length", "Sepal.Length:", 
                        min = 4.3, max = 7.9, value = 6, step= 0.1),
            
            sliderInput("iSepal.Width", "Sepal.Width:", 
                        min = 2, max = 4.4, value = 3, step= 0.1),
            
            sliderInput("iPetal.Length", "Petal.Length:", 
                        min = 1, max = 6.9, value = 3, step= 0.1),
            
            sliderInput("iPetal.Width", "Petal.Width:", 
                        min = 0.1, max = 2.5, value = 1, step= 0.1)
        ),
        
        
       
        mainPanel(
            tabsetPanel(
                tabPanel("Exploratory Analysis", plotOutput("distPlot")),
                tabPanel("Decision Tree", plotOutput("tree")),
                tabPanel("Predictions", textOutput("prediction"))
            )
        )
    )
))