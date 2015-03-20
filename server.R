money <- function(r_N,inflation,n,deposit,Y){
    # Calculate the real interest rate, taking into account inflation
    r <- (1 + r_N)/(1 + inflation) - 1
    # Calculate the present value of a regular deposit n times per year over Y years
    PV <- deposit * (1 - 1/(1 + r/n)^(n*Y)) / (r/n)
    # Calculate the future value of the savings
    FV <- PV * (1 + r/n)^(n*Y)
    list(round(r,2),round(PV,2),round(FV,2))
}
    
shinyServer(
    function(input, output) {
        output$r <- renderText({money(input$r_N,input$inflation,
                                   input$periods,input$deposi,input$Y)[[1]]})
        output$PV <- renderText({money(input$r_N,input$inflation,
                                   input$periods,input$deposit,input$Y)[[2]]})
        output$FV <- renderText({money(input$r_N,input$inflation,
                                     input$periods,input$deposit,input$Y)[[3]]})
    }
)