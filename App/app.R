#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(readtext)

documents <- readtext("*.pdf") #Loads all pdf documents in the current working directory. Creates a dataframe containing two collumns: doc_id and text. 

# Define UI for application 
ui <- fluidPage(

    # Application title
    titlePanel("App: Multiple word search in PDF's"),
    
    
        mainPanel(

            
          
          h4("In this app you can search for multiple words in pdf documents. All your pdf documents need to be in the same folder as the app. Please insert your search word or space if you don't need all search options. For each search word you will see in which documents it appears. At the bottom of the page you will see in which documents all your search words appear at the same time. Have fun."),
          tabsetPanel(          
          
          tabPanel("Word search",
            #textinput defines the type of input as text. 
            #input1, input2 etc. is the name of the input. I call them in my server. 
            sidebarPanel(textInput("input1", label="Search word 1", placeholder="Please enter search word 1 or space"), tableOutput("output1"), width=10),#filters documents without case sensitivity, selects column of the remaining table. Rendertable converts to table readable by webapplication. The table is saved as an output. this i repeated for all 5 search words 
            sidebarPanel(textInput("input2", label="Search word 2", placeholder="Please enter search word 2 or space"), tableOutput("output2"), width=10),
            sidebarPanel(textInput("input3", label="Search word 3", placeholder="Please enter search word 3 or space"), tableOutput("output3"), width=10), 
            sidebarPanel(textInput("input4", label="Search word 4", placeholder="Please enter search word 4 or space"), tableOutput("output4"), width=10), 
            sidebarPanel(textInput("input5", label="Search word 5", placeholder="Please enter search word 5 or space"), tableOutput("output5"), width=10), 
            ),
          tabPanel("Documents",
                   strong("Documents in folder:"),
                   tableOutput("output7")), 
          tabPanel("Result from multiple word search",
          
            sidebarPanel(strong("Documents where all search words appear"), tableOutput("output6"), width = 10)))
        )
)

# Define server logic required to search for specific words in pdf documents. 
server <- function(input, output) {
    
    #renderTable makes the dataframe useable for the web application.
    #str_detect searches in the text-collumn in the dataframe for input1, input2 etc. 
    #the input is not case sensitive. 
    #using the command select(1), I select the first collumn, doc_id, in the dataframe. 
    #I save the output as output1, output2 etc. 
    #regex: 
  
    renderTable({documents %>% filter(str_detect(text, regex(input$input1, ignore_case=TRUE))) %>% select(1)}) -> output$output1  
    renderTable({documents %>% filter(str_detect(text, regex(input$input2, ignore_case=TRUE))) %>% select(1)}) -> output$output2
    renderTable({documents %>% filter(str_detect(text, regex(input$input3, ignore_case=TRUE))) %>% select(1)}) -> output$output3
    renderTable({documents %>% filter(str_detect(text, regex(input$input4, ignore_case=TRUE))) %>% select(1)}) -> output$output4
    renderTable({documents %>% filter(str_detect(text, regex(input$input5, ignore_case=TRUE))) %>% select(1)}) -> output$output5
    
    renderTable({documents %>% filter(str_detect(text, regex(input$input1, ignore_case=TRUE))) %>% 
        filter(str_detect(text, regex(input$input2, ignore_case=TRUE))) %>% 
        filter(str_detect(text, regex(input$input3, ignore_case=TRUE))) %>% 
        filter(str_detect(text, regex(input$input4, ignore_case=TRUE))) %>% 
        filter(str_detect(text, regex(input$input5, ignore_case=TRUE))) %>% 
        select(1)}) -> output$output6
    
    output$output7 <- renderTable({documents %>% select(1)})
    
    }

# Run the application 
shinyApp(ui = ui, server = server)
