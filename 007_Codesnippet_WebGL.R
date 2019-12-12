library(plotly)

set.seed(60323) # Maybe the ZIP code of your future office ;-) 

plot_ly(x = rnorm(1250000), # Draw over a million random data points
        y = rnorm(1250000),
        type = 'scatter', # Set it to Scatter Plot
        mode = 'markers',
        marker = list(
          color = '#013848', # Set Color of Points
          line = list(
            width = 1,
            color = 'DarkSlateGrey') # Set Color of Line around the Points
        )) %>% 
  layout(title = 'Scatter Plot with WebGL') %>% # Set title
  toWebGL() # Use WebGL instead of normal SVG