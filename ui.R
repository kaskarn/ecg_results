library(shiny)
shinyUI(fluidPage(
  navbarPage(title="ECG Results",
    tabPanel("By Study",
      htmlOutput("Studies")
    ),
    tabPanel("aSPU"
    )
  )
))
