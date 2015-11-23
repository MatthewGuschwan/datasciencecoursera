

library(shiny)

# Rely on Wins Against Replacement (WAR) data that I culled from www.baseball-reference.com 
# on the top 10 players of 2015 according to their WAR, which is a statistic used to 
# measure the overall effectiveness of a player in comparison to an average replacement.
#  see baseballreference.com for a more thorough explanation.

# Define a server for the Shiny app
shinyServer(function(input, output) {

      
      # Fill in the spot we created for a plot
      output$WARPlot <- renderPlot({
            
            # Render a barplot
           
                  barplot( WARs[  ,  (grep(input$player,colnames(WARs))) ],  # grep returns the col. # of player
                        main=input$player,
                        names.arg = c('2013','2014', '2015', '3 Yr Avg.'),
                        col = c("lightblue", "cornsilk", "blue",
                          "red"),
                        ylab="W.A.R.",
                        xlab="WAR over three Years")
      })

      dataInput <- reactive({
            getSymbols(input$symb, src = "yahoo", 
                       from = input$dates[1],
                       to = input$dates[2],
                       auto.assign = FALSE)
      })
      
      #OPR  <- reactive({
       #     OPR  <- ifelse((input$Optim=='Yes'), 1.1111, 9.99999)
      #})
      
      output$WARPred  <- renderText({
           Avg  <-  WARs[ 4 ,  grep(input$player,colnames(WARs)) ]
        OPR  <- ifelse((input$Optim=='Yes'), Avg + .15*Avg , Avg - .15*Avg)          
      })
      
})

