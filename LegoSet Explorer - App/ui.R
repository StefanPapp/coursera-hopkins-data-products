##### 
# Author: Stefan Papp
#####

# The user-interface definition of the Shiny web app.
require(data.table)
library(dplyr)
require(markdown)
library(rCharts)
library(shiny)
library(rCharts)
library(shiny)
library(BH)
library(DT)

# Shiny App
shinyUI(
    navbarPage("LEGO Set Explorer", 

    # multi-page user-interface with navigation bar.
        tabPanel("Data Exploration",
             sidebarPanel(
                sliderInput("timeline", 
                            "Timeline:", 
                            min = 1950,
                            max = 2016,
                            value = c(2000, 2016)
                            ),
                
                sliderInput("pieces", 
                            "Contains Number of Pieces:",
                            min = -1,
                            max = 5922,
                            value = c(250, 666)  
                            ),
                
                actionButton(inputId = "selectAll", 
                             label = "Select All",
                             icon = icon("check-square-o")),
                             
                actionButton(inputId = "clearAll", 
                             label = "Clear Selection", 
                             icon = icon("square-o")),
                
                uiOutput("themesControl")
             ),
             
             mainPanel(
                 tabsetPanel(
           
                   tabPanel(p(icon("table"), "Dataset"),
                            dataTableOutput(outputId="dTable")
                   ), 
                   
                   tabPanel(p(icon("line-chart"), "Data Visualization"),
                            h4('Number of Sets by Year', align = "center"),
                            h5('Hover over each point for Year and Total Number of Sets.', align ="center"),
                            showOutput("setsByYear", "nvd3"),
                            h4('Number of Themes by Year', align = "center"),
                            h5('Hover over each bar for Year and Total Number of Themes.', align ="center"),
                            showOutput("themesByYear", "nvd3"),
                            h4('Number of Pieces by Year', align = "center"),
                            h5('Hover over each point for Set Name, ID and Theme.', align ="center"),
                            showOutput("piecesByYear", "nvd3"),
                            h4('Number of Average Pieces by Year', align = "center"),
                            showOutput("piecesByYearAvg", "nvd3"),
                            h4('Number of Average Pieces by Theme', align = "center"),
                            showOutput("piecesByThemeAvg", "nvd3")
                   )
                 )
            )     
        ), 
    
    tabPanel("Help",
             mainPanel(
               includeMarkdown("help.md")
             )
    ),
        tabPanel("About",
                 mainPanel(
                   includeMarkdown("about.md")
                 )
        )
    )  
)
