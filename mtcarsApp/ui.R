library(shiny)
data(mtcars)
shinyUI(fluidPage(

    # Application title
    titlePanel("Motor Trend Car Road Tests"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("cylinders", "Choose Number of cylinders:", 
                        choices=(unique(sort(mtcars$cyl)))),
        hr(),
        sliderInput("horsepower",
                    "Horsepower Range:",
                    min = 50,  max = 350, value = c(50,350)),
        strong("Please change number of cylinders and horsepower to acquire output.")
        ),

    # Show a plot
    mainPanel(
        plotOutput("distPlot"),
        textOutput(outputId = "desc")
        )
    )
    ))
