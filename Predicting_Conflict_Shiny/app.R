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
                        
                        title = "Abstract & Description",
                        
                        fluidRow(
                            
                            column(width = 4),
                            
                            column(width = 4,
                                   
                                   tags$h1("Predicting Intrastate Conflict Using Machine Learning",  align="center"),
                                   
                                   tags$br(),
                                   
                                   tags$h5("By: Liz Masten and Cian Stryker", align = "center"), 
                                   
                                   tags$br(),
                                   
                                   tags$br(),
                                   
                                   tags$br(),
                                   
                                   tags$h4("Abstract", align="center", style="text-decoration: underline"), 
                                   
                                   tags$br(), 
                                   
                                   tags$p("Compared to causal modeling, using Machine Learning techniques to predict violent civil conflict is nascent within the broader conflict literature. In this paper, we run three Machine Learning models – OLS Regression, Ridge Regression, and Random Forest – on a dataset of our own making to predict instances of violent intrastate conflict. We find our Random Forest model to be the most accurate, but at the expense of high false negative occurrences, to which we assign greater weight considering their ramifications. Both our OLS and Ridge models outperform Random Forest in false negatives, and we assess our Ridge model to be an optimal compromise of high accuracy and low false negative scores. We conclude this paper with caveats to our models and remarks about the limitations and analytical trappings of Machine Learning applications to conflict prediction."), 
                                   
                                   tags$br(),
                                   
                                   tags$hr(),
                                   
                                   tags$br(),
                                   
                                   tags$h4("About our Paper", align="center", style="text-decoration: underline"), 
                                   
                                   tags$br(),
                                   
                                   tags$p("Liz Masten and I wrote this paper for our course at the Harvard Kennedy School, API 222A: Machine Learning and Big Data Analytics. I later decided to create a shinyapp to showcase our work. By using the tabs at the top of this site you can read out paper and find an about section on us. If you are viewing this site on a Desktop, you can read the original pdf version of our paper under the Desktop Reader tab.If you are on a mobile device you can view our paper by clicking on the Mobile Reader tab. Our original dataset and all of our work can be found in our", a(href = "https://github.com/CianStryker/Predicting_Conflict_Project", "Github Repository."))
                                   

                                   
                                   
                            ),
                                   
                            column(width = 4)
                            
                            )
                        ),
                    

                    tabPanel(title=HTML("<li>Desktop Reader"),
                             
                             
                             uiOutput("myPaper")
                    ),
                    
                    tabPanel(title=HTML("<li><a href='API_222_Predicting_Conflict.pdf'target='_blank'>Mobile Reader")),
                    
                    
                    
                    tabPanel(title=HTML("<li>About the Authors"),
                        
                        fluidRow(
                            
                            column(width = 4),
                            
                            column(width = 4,
                                   
                                   tags$h1("About the Authors", align="center"),
                                   
                                   tags$br(),
                                   
                                   tags$h3("Cian Stryker", align="center"), 
                                   
                                   tags$br(),
                                   
                                   tags$p("My name is Cian Stryker and I graduated with a Master’s in Russian, Eastern European, and Central Asian studies from the Davis Center at Harvard University in May 2021. My research focus is on the Digital Silk Road, or the technological aspects of the Belt and Road Initiative. I am especially interested in the digital expansion of Chinese technology and data management systems in Central Asia."), 
                                   
                                   tags$p("Here is the link to my personal Github page:", a(href = "https://github.com/CianStryker", "https://github.com/CianStryker")),
                                   
                                   tags$br(),
                                   
                                   tags$h3("Liz Masten", align="center"), 
                                   
                                   tags$br(),
                                   
                                   tags$p("I graduated in May 2021 with a master’s in Middle Eastern Studies from Harvard University after working in US immigration law. While at Harvard, I focused on proxy conflicts and irregular migration in the Arabian Gulf and East Africa. You can check out my quantitative projects on my GitHub:", a(href = "https://github.com/LizMas", "https://github.com/LizMas")) 
                                   
                                   
                            ),
                            
                            column(width = 4)
                        )
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
