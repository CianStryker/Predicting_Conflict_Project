#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(bslib)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(theme = bs_theme(bootswatch = "litera"),
                
                navbarPage(
                    title = "Predicting Conflict",
                    
                    tabPanel(
                        
                        title = "Abstract",
                        
                        fluidRow(
                            
                            column(width = 2),
                            
                            column(width = 8,
                                   
                                   tags$h1("Predicting Intrastate Conflict Using Machine Learning",  align="center"),
                                   
                                   tags$br(),
                                   
                                   tags$h4("By: Liz Masten and Cian Stryker", align = "center"), 
                                   
                                   tags$br(),
                                   
                                   imageOutput(outputId = "Picture", width = "100%", height = "100%")
                                   
                            ),
                                   
                            column(width = 2)
                            
                            )
                        ),
                    

                    tabPanel(
                        
                        title = "Research Paper",
                        
         
                    ),
                    
                    tabPanel(
                        
                        title = "Appendix",
                        
                        
                    ),
                    
                    tabPanel(
                        
                        title = "About",
                        
                        fluidRow(
                            
                            column(width = 3),
                            
                            column(width = 6,
                                   
                                   tags$h1("About the Authors"),
                                   
                                   tags$br(),
                                   
                                   tags$h3("Cian Stryker"), 
                                   
                                   tags$p("My name is Cian Stryker and I am a graduate student at Harvard University. I am pursuing a Master’s in Russian, Eastern European, and Central Asian studies with a focus on the Digital Silk Road, or the technological aspects of the Belt and Road Initiative. I am especially interested in the digital expansion of Chinese technology and data management systems in Central Asia. "), 
                                   
                                   tags$p("Here is the link to my personal Github page:", a(href = "https://github.com/CianStryker", "https://github.com/CianStryker")),
                                   
                                   tags$br(),
                                   
                                   tags$h3("Liz Masten"), 
                                   
                                   tags$p(), 
                                   
                                   tags$br(),

                                   tags$h1("Note"),
                                   
                                   tags$p("If you would life to download this report as a pdf, please use this link:", downloadLink("downloadPDF", "Download Link"))
                            ),
                            
                            column(width = 3)
                        )
                    ), 
                    
                    tabPanel("Desktop Reader",
                             
                             
                             uiOutput("myPaper")
                    )
                
                )
)



# Define server logic required to draw a histogram
server <- function(input, output) {

    output$downloadPDF <- downloadHandler(
        filename = "API_222_Predicting_Conflict.pdf",
        content = function(file) {
            file.copy("www/API_222_Predicting_Conflict.pdf", file)
        }
    )
    
    output$myPaper <- renderUI({
        PDFfile="API_222_Predicting_Conflict.pdf"
        tags$iframe(
            src="API_222_Predicting_Conflict.pdf",
            width="100%",
            height="1000px")
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
