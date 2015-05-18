
library(plotly)

py <- plotly()
data <- list(
  list(
    x = x, 
    type = "histogram"
  )
)
response <- py$plotly(data, kwargs=list(filename="basic-histogram", fileopt="overwrite"))

