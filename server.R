library(shiny)
shinyServer(function(input, output) {
  lapply(studies, function(i){
    dirpath <- paste0("./graphs/",i,"/easystrata/")
    lapply(substudies[[i]], function(j){
      lapply(traits, function(k){
        output[[paste("graphout",i,j,k,"man",sep="_")]] <- renderUI({
          anno <- paste0("anno",names(annolist)[as.numeric(input[[paste("anno",i,j,sep="_")]])])
          sig <- ifelse(input[[paste("sugg",i,j,sep="_")]],"1e6","5e8")
          if(length(substudies[[i]]) == 1){ 
            path <- paste0(dirpath,anno,"_",i,".man_",k,"_",sig,"knowns.png")
          }else path <- paste0(dirpath,anno,"_",j,".man_",k,"_",sig,"knowns.png")
          tags$div(class = "header", tags$h3(traitslab[[k]]), tags$img(src = path, width = "100%"), tags$hr())
        })
        output[[paste("graphout",i,j,k,"qq",sep="_")]] <- renderUI({
          if(length(substudies[[i]]) == 1){ 
            path <- paste0(dirpath,i,".qq_",k,".png")
          }else path <- paste0(dirpath,j,".qq_",k,".png")
          tags$div(class = "header", tags$h3(k), tags$img(src = path, width = "50%"))
        })
  })})})
  output[["graphout_aspu_known"]] <- renderUI({
    anno <- names(annolist)[as.numeric(input[["anno_aspu_"]])]
    sig <- ifelse(input[["sugg_aspu_"]],"1e6","5e8")
    path <- paste0("./graphs/aspu/all/easystrata/annoknown",anno,"_aspu.man_alltraits_",sig,"ann.png")
    tags$img(src = path, width = "100%")
  })
  output[["graphout_aspu_found"]] <- renderUI({
    anno <- c("multicolor", "minp", traits)[as.numeric(input$annofound)]
    sig <- ifelse(input[["sugg_found"]],"1e6","5e8")
    path <- paste0("./graphs/aspu/all/easystrata/annofound",anno,"_aspu.man_alltraits_",sig,"ann.png")
    tags$img(src = path, width = "100%")             
  })
  output[["graphout_aspu_known_nost"]] <- renderUI({
    anno <- names(annolist)[as.numeric(input[["anno_aspu_nost"]])]
    sig <- ifelse(input[["sugg_aspu_nost"]],"1e6","5e8")
    path <- paste0("./graphs/aspu/nost/easystrata/annoknown",anno,"_aspu.man_alltraits_",sig,"ann.png")
    tags$img(src = path, width = "100%")
  })
  output[["graphout_aspu_found_nost"]] <- renderUI({
    anno <- c("multicolor", "minp", traits)[as.numeric(input$annofound_nost)]
    sig <- ifelse(input[["sugg_found_nost"]],"1e6","5e8")
    path <- paste0("./graphs/aspu/nost/easystrata/annofound",anno,"_aspu.man_alltraits_",sig,"ann.png")
    tags$img(src = path, width = "100%")
    
  })
})