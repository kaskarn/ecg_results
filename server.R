library(shiny)
shinyServer(function(input, output) {
  lapply(studies, function(i){
    lapply(substudies[[i]], function(j){
      lapply(traits, function(k){
        output[[paste("graphout",i,j,k,"man",sep="_")]] <- renderUI({
          anno <- paste0("anno",names(annolist)[[as.numeric(input[[paste("anno",i,j,sep="_")]])]])
          sig <- ifelse(input[[paste("sugg",i,j,sep="_")]],"1e6","5e8")
          if(length(substudies[[i]]) == 1){ 
            path <- paste0("./graphs/",i,"/",anno,"_",i,".man_",k,"_",sig,"knowns.png")
          }else path <- paste0("./graphs/",i,"/",anno,"_",j,".man_",k,"_",sig,"knowns.png")
          tags$img(src = path, width = "100%")
        })
        output[[paste("graphout",i,j,k,"qq",sep="_")]] <- renderUI({
          if(length(substudies[[i]]) == 1){ 
            path <- paste0("./graphs_old/",i,"/",anno,"_",i,".qq_",k,"_",sig,"knowns.png")
          }else path <- paste0("./graphs_old/",i,"/",anno,"_",j,".man_",k,"_",sig,"knowns.png")
          tags$img(src = path, width = "50%")
        })
})})})})
