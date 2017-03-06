library(shiny)
source("definitions.R")

graphinputs <- function(stud, sub, type){
  if(type != "man") return(NULL)
  inputPanel(radioButtons(paste("anno",stud,sub,sep="_"), label = "Which trait should be used for annotations?",
                          choices = annolist,
                          inline = TRUE, selected = 1),
             checkboxInput(paste("sugg",stud,sub,sep="_"),"Annotate suggestive results",value = FALSE))
}
make_graphs <- function(studies, substudies, traits, type){
  lapply(studies, function (i) {
    do.call(tabPanel, 
      list(toupper(i), 
        do.call(tabsetPanel, lapply(substudies[[i]], function (j) {
          tabPanel(ifelse(is.null(fixt[[i]]),j,fixt[[i]]),
            graphinputs(i,j,type),
            fluidRow(align="center", 
                     lapply(traits, function (k) htmlOutput(paste("graphout",i,j,k,type,sep="_"))
  )))}))))})
}
shinyUI(fluidPage(
  navbarPage(title="ECG Results",
    tabPanel("By study",
      do.call(tabsetPanel, 
        list(tabPanel("Manhattan", do.call(tabsetPanel, 
                      make_graphs(studies, substudies, traits, "man"))),
          tabPanel("QQ", do.call(tabsetPanel, 
                      make_graphs(studies, substudies, traits, "qq")))
    ))),
    tabPanel("aSPU",
      tags$img(src="./graphs/aspu/man_aspu_tall.png", width = "100%"),
      tags$img(src="./graphs/aspu/qq_aspu.png")
    )
  )
))
