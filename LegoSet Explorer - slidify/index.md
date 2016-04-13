---
title       : Lego Dataset Explorer  
subtitle    : Coursera - DDP Project
author      : Stefan papp
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Logo Set Explorer

With this The Lego Set Explorer, we visualize LEGO Sets. The LEGO Set consists of Lego pieces until 2016.

The dataset is from [Rebrickable.com](http://rebrickable.com/). It contains the basic information of each set (set id, year, number of pieces, theme, set name). There are more files on that web page, such as details on the pieces of the sets or colors. For this demo, we used only the sets.  

Data Source: http://rebrickable.com/downloads 

--- .class #id 

## Solution
We have used 
* a data table to display all lego set items
* a filtering pane
* five plots to the datasets

The app can be seen on [shinyapp](https://stefanpapp.shinyapps.io/LegoSet_Explorer_-_App/)

--- .class #id 
## UI 

The heart of the UI is a display of the data set and the plot display. We used


```r
                   tabPanel(p(icon("table"), "Dataset"),
                            dataTableOutput(outputId="dTable")
                   ), 
                   
                   tabPanel(p(icon("line-chart"), "Data Visualization"),
                            h4('Number of Sets by Year', align = "center"),
                            h5('Hover over each point for Year and Total Number of Sets.', align ="center"),
                            showOutput("setsByYear", "nvd3"),
                            h4('Number of Themes by Year', align = "center"),
                            h5('Hover over each bar for Year and Total Number of Themes.', align ="center"),
                   )
                 )
```

--- .class #id 
## Future consideration
We can extend the whole explorer set with additional information such as information on
* pieces
* colors
* etc.

We can also add some data engineering such as that we download and extract new files from the server if a new files exists.

We can also explorer faster csv loading routines for the sake of functionality.
