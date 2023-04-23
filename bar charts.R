library("readxl")
data <- read_excel("data.xlsx", sheet = "2018")
View(data)

library(forcats)
library(ggplot2)
library(tidyverse)

data %>%
  mutate(name = fct_reorder(data$Country, data$Y1)) %>%
  ggplot(aes(x = reorder(data$Country, data$Y1), y = data$Y1)) +
  geom_bar(stat = "identity", fill = "red", alpha = .6, width = .4) +
  coord_flip() +
  xlab("Country") +
  ylab("Percentage of the population") +
  theme_bw() +
  ggtitle("Early leavers from education and training") +
  ylim(0, 25)

data %>%
  mutate(name = fct_reorder(data$Country, data$Y2)) %>%
  ggplot(aes(x = reorder(data$Country, data$Y2), y = data$Y2)) +
  geom_bar(stat = "identity", fill = "orange", alpha = .6, width = .4) +
  coord_flip() +
  xlab("Country") +
  ylab("Share of population") +
  ggtitle("Tertiary educational attainment") +
  theme_bw()

data %>%
  mutate(name = fct_reorder(data$Country, data$Y3)) %>%
  ggplot(aes(x = reorder(data$Country, data$Y3), y = data$Y3)) +
  geom_bar(stat = "identity", fill = "purple", alpha = .6, width = .4) +
  coord_flip() +
  xlab("Country") +
  ylab("Share of population") +
  ggtitle("Early childhood education and care") +
  theme_bw()

data %>%
  mutate(name = fct_reorder(data$Country, data$Y4)) %>%
  ggplot(aes(x = reorder(data$Country, data$Y4), y = data$Y4)) +
  geom_bar(stat = "identity", fill = "blue", alpha = .6, width = .4) +
  coord_flip() +
  xlab("Country") +
  ylab("Share of employed graduates") +
  ggtitle("Employment rates of recent graduates") +
  theme_bw() +
  ylim(0, 100)

data %>%
  mutate(name = fct_reorder(data$Country, data$Y5)) %>%
  ggplot(aes(x = reorder(data$Country, data$Y5), y = data$Y5)) +
  geom_bar(stat = "identity", fill = "cyan", alpha = .6, width = .4) +
  coord_flip() +
  xlab("Country") +
  ylab("Participation rate") +
  ggtitle("Adult participation in learning") +
  theme_bw()

data %>%
  mutate(name = fct_reorder(data$Country, data$Y6)) %>%
  ggplot(aes(x = reorder(data$Country, data$Y6), y = data$Y6)) +
  geom_bar(stat = "identity", fill = "green", alpha = .6, width = .4) +
  coord_flip() +
  xlab("Country") +
  ylab("Average percentage of low achievers") +
  ggtitle("Underachievement in reading, mathematics and science") +
  theme_bw() +
  ylim(0, 50)
