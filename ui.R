library(shiny)
shinyUI(fluidPage(
  navbarPage(title="ECG Results",
    tabPanel("By Study",
      htmlOutput("Studies")
    ),
    tabPanel("aSPU",
      tags$img(src="./graphs/aspu/qq_aspu.png"),
      tags$img(src="./graphs/aspu/man_aspu_tall.png")
    )
  )
))
