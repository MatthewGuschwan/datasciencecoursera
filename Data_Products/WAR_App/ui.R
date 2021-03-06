
###  Data_Products/WAR_App iu.R

library(shiny)

# Define the overall UI
shinyUI(
      
      # Use a fluid Bootstrap layout
      fluidPage(    
            
            # Give the page a title
            titlePanel("Wins Against Replacement"),
            
            # Generate a row with a sidebar
            sidebarLayout(      
                  
                  # Define the sidebar with one input
                  sidebarPanel(
                        selectInput("player", "Select Player:", 
                                choices=colnames(WARs)),
                                                   hr(),
                        selectInput("Optim", "Are you an optimist?", choices=c('Yes', 'No')),
                        hr(),
                        helpText("List of 10 baseball players with highest Wins Against Replacement (WAR)
                                 according to Baseball Reference.com.  For WAR explanation, see:
                                 www.baseball-reference.com/
                                 about/war_explained.shtml")
                  ),
                              
                  # Create a spot for the barplot 
                  mainPanel(
                        plotOutput("WARPlot"),
                        hr(),
                        tags$p("2016 Prediction:"),
                        verbatimTextOutput("WARPred")
                  )
                  
            )
      )
)

