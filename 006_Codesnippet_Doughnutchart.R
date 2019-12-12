library(dplyr)
library(plotly)

getPalette <- colorRampPalette(
  # Insert your CI Colorcodes
  c("#013848", "#09557f", "#0085af", "#00a378")
)

starwars %>% # Dataset included in the dplyr package
  group_by(eye_color) %>% 
  summarize(count = n()) %>% # Prepare Data for Plotly
  plot_ly(
    labels = ~ eye_color, # Set your grouping variable
    values = ~ count, # Set the value per group
    hoverinfo = 'label+value', # Set the informations shown on hover
    marker = list(
      colors = getPalette(15), # Insert your own palette
      line = list(color = '#FFFFFF', width = 1)
    ),
    showlegend = FALSE # Turn off the legend
  ) %>%
  add_pie(hole = 0.4) %>% # Turn your plot into a Doughnutchart
  layout(
    title = "Share of Eyecolor", # Set your title
    showlegend = F,
    xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
    yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)
  )