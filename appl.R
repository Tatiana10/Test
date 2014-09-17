
palette(c("aquamarine", "yellow", "chartreuse", "cornflowerblue",
          "darkslateblue", "deeppink", "gold", "lawngreen", "navy"))


        
        # Combine the selected variables into a new data frame
        selectedData <- reactive({
                swiss[, c(input$xcol, input$ycol)]
        })
        
        clusters <- reactive({
                kmeans(selectedData(), input$clusters)
        })
        
        output$plot1 <- renderPlot({
                par(mar = c(5.1, 4.1, 0, 1))
                plot(selectedData(),
                     col = clusters()$cluster,
                     pch = 20, cex = 3)
                points(clusters()$centers, pch = 8, cex = 2, lwd = 3)
        })
        
