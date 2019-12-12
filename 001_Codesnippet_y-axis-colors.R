# setting up the data
library(ggplot2)
library(data.table)

months_name <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                 "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

UKDriverDeaths_data <- data.table(
  MONTH = factor(months_name, levels = months_name),
  YEAR = rep(1969:1984, each = 12),
  DEATHS = as.numeric(UKDriverDeaths))

# criterio for the axis colors
UKDriverDeaths_data[, LOW := mean(DEATHS) < 1500, by = MONTH]
color.labels <- ifelse(UKDriverDeaths_data[, sort(unique(MONTH),
                                                  decreasing = FALSE,
                                                  na.last = TRUE)] %in% 
                         UKDriverDeaths_data[LOW == TRUE, MONTH],
                       'red', 'black')

# making the plot
ggplot(data = UKDriverDeaths_data,
       aes(x = YEAR, y = MONTH, fill = DEATHS)) +
  geom_tile() +
  ggtitle(label = "Number of UK driver deaths",
          subtitle = "red: monthly mean under 1500") +
  theme_minimal() +
  theme(axis.text.y = element_text(color = color.labels))