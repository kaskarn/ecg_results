library(shiny)
shinyUI(fluidPage(
  navbarPage(title="ECG Results",
    tabPanel("By Study",
      htmlOutput("Studies")
    ),
    tabPanel("aSPU",
      tags$img(src="./graphs/aspu/man_aspu_tall.png", width = "100%"),
      tags$img(src="./graphs/aspu/qq_aspu.png")
    )
  )
))
