library(shiny)
shinyServer(function(input, output) {
  lapply(studies, function(i){
    lapply(substudies[[i]], function(j){
      lapply(traits, function(k){
        lapply(c("man", "qq"), function(z){
          output[[paste("graphout",i,j,k,z,sep="_")]] <- renderUI({
            mantype <- c("_tiny", "", "_tall")[as.numeric(input[[paste("mantype",i,j,sep="_")]])]
            addon <- ifelse(z == "man", mantype,"")
            kno <- input[[paste("knowns",i,j,sep="_")]]
            known <- ifelse(kno,"_wknowns","")
            if(length(substudies[[i]]) == 1){ 
              path <- paste0("./graphs/",i,"/",prefix[[i]],z,"_",k,addon,known,".png")
            }else path <- paste0("./graphs/",i,"/",prefix[[i]],z,"_",k,"_",j,addon,known,".png")
            tags$img(src = path, width = ifelse(z == "man", "100%", "50%"))
})})})})})})
