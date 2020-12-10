#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(pdftools)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Word search"),

    # Creates field for search word input
    sidebarLayout(
        textInput("input1","Search word 1"),
        verbatimTextOutput("word1")
        ), 
    sidebarLayout(
        textInput("input2","Search word 2"),
        verbatimTextOutput("word2")
        ),

    mainPanel(verbatimTextOutput("view")
        ), 
    )


# Define server logic required to draw a histogram
server <- function(input, output) {
    
  pdf_files <- list.files(pattern="pdf$") #finds all pdf documents in working directory
  files_string <- lapply(pdf_files,pdf_text) #converts all text on a page to a large string for all pdf documents
  
  
    output$word1 <- renderPrint({
      grep(input$input1,files_string,ignore.case = TRUE)})
    
    output$word2 <- renderPrint({
      grep(input$input2,files_string,ignore.case = TRUE)
    })
    output$view <- renderPrint({
      intersect(grep(input$input1,files_string,ignore.case = TRUE),grep(input$input2,files_string,ignore.case = TRUE))
      })
}

# Run the application 
shinyApp(ui = ui, server = server)

