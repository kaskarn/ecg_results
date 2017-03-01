library(shiny)
Sys.setlocale(locale="en_US.UTF-8")
studies = c("ARIC", "WHI_Whites", "mega", "metal")
substudies = list(ARIC = c("b", "w"), WHI_Whites = c("GARNET", "GECCO", "HIPFX", "MOPMAP", "WHIMS"), mega = "", metal = "")
traits = c("pwav", "pr_seg", "qrs", "st", "twav", "tp")
prefix = list(ARIC="ARIC_", WHI_Whites = "", mega = "mega_", metal = "")
# Define server logic required to draw a histogram

printqqsubgraph <- function(stud, trait, sub){
  if(sub == "") return(paste0("./graphs/",stud,"/",prefix[[stud]],"qq_",trait,"_2.png"))
  paste0("./graphs/",stud,"/",prefix[[stud]],"qq_",trait,"_",sub,"_2.png")
}
printmansubgraph <- function(stud, trait, sub){
  if(sub == "") return(paste0("./graphs/",stud,"/",prefix[[stud]],"man_",trait,"_tall.png"))
  paste0("./graphs/",stud,"/",prefix[[stud]],"man_",trait,"_",sub,"_tall.png")
}

make_qq <- lapply(studies, function(i) {
  do.call(tabPanel, 
          list(i, 
               do.call(tabsetPanel, lapply(substudies[[i]], function (k) {
                 do.call(tabPanel, 
                         list(k,
                              fluidRow(
                                lapply(traits, function (j) tags$img(src = printqqsubgraph(i,j,k)))
)))}))))})

make_man <- lapply(studies, function(i) {
  do.call(tabPanel, 
          list(i, 
               do.call(tabsetPanel, lapply(substudies[[i]], function (k) {
                 do.call(tabPanel, 
                         list(k,
                              fluidRow(
                                lapply(traits, function (j) tags$img(src = printmansubgraph(i,j,k)))
)))}))))})

shinyServer(function(input, output) {
  output[["Studies"]] <- renderUI({
      do.call(tabsetPanel, 
              list(tabPanel("Manhattan", do.call(tabsetPanel, make_man)),
                   tabPanel("QQ", do.call(tabsetPanel, make_qq))
))})})
