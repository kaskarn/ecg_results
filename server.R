library(shiny)
studies = c("ARIC", "WHI_Whites", "mega", "metal")
substudies = list(ARIC = c("b", "w"), WHI_Whites = c("GARNET", "GECCO", "HIPFX", "MOPMAP", "WHIMS"), 
                  mega = "SOL + Share", metal = "Meta-Analysis")
traits = c("pwav", "pr_seg", "qrs", "st", "twav", "tp")
prefix = list(ARIC="ARIC_", WHI_Whites = "", mega = "mega_", metal = "")

printgraphs <- function(type, stud, trait, sub){
  addon <- ""
  if(type == "man") addon <- "_tall"
  if(length(substudies[[stud]]) == 1){ path <- paste0("./graphs/",stud,"/",prefix[[stud]],type,"_",trait,addon,".png")
  }else path <- paste0("./graphs/",stud,"/",prefix[[stud]],type,"_",trait,"_",sub,addon,".png")
  tags$img(src = path, width = ifelse(type == "man", "100%", "45%"))
}
graphinputs <- function(type){
  if(type != "man") return(NULL)
  renderUI(inputPanel(radioButtons("mantype", label = "Manhattan height",
                          choices = list("tiny"=1, "medium"=2, "tall"=3),
                          inline = TRUE, selected = 3)))
}
make_graphs <- function(studies, substudies, prefix, traits, type){
  lapply(studies, function(i) {
    do.call(tabPanel, 
            list(i, 
                 do.call(tabsetPanel, lapply(substudies[[i]], function (k) {
                   do.call(tabPanel, 
                           list(k,
                                graphinputs(type),
                                fluidPage(lapply(traits, function (j) printgraphs(type,i,j,k))
  )))}))))})
}
shinyServer(function(input, output) {
  output[["Studies"]] <- renderUI({
      do.call(tabsetPanel, 
              list(tabPanel("Manhattan", do.call(tabsetPanel, make_graphs(studies, substudies, prefix, traits, "man"))),
                   tabPanel("QQ", do.call(tabsetPanel, make_graphs(studies, substudies, prefix, traits, "qq")))
))})})
