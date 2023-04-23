# Load libraries
library(ggplot2)
library(tidyverse)
library(readxl)

data <- read_xlsx(path = "data.xlsx", sheet = "2018")

# Reshape data to long format
long_data <- data %>% gather(key = "Year", value = "Value", -Country)

# Plot the line chart
ggplot(long_data, aes(x = Country, y = Value, group = Year, color = Year)) +
    geom_line() +
    geom_point() +
    theme_minimal() +
    labs(title = "Line Chart", x = "Country", y = "Value") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
