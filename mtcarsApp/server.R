library(shiny)
library(ggplot2)
data(mtcar)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
        newdata <- subset(mtcars, cyl == input$cylinders)
        newdata <- subset(newdata,hp >= input$horsepower[1] & hp <= input$horsepower[2])
        # draw the histogram with the specified number of bins
        ggplot(newdata, aes(x=wt, y=mpg)) + geom_point() + ggtitle("Plot of Miles/ gallon by Weight") +
            xlab("Weight (1000 lbs)") + ylab("Miles/(US) gallon")
    })
    # Pull in description of Dataset
    output$desc <- renderText({
        "The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models)."
    })

})
