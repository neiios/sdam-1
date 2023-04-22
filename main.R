install.packages(c("readxl", "ggplot2"))

library(readxl)
library(ggplot2)

data <- read_xlsx(path = "data.xlsx", sheet = "2018")

make_barplot <- function(data, names, title) {
    table <- data.frame(Data = data, Countries = names)
    sorted_data <- table[order(table$Data), ]
    barplot(
        height = sorted_data$Data,
        names = sorted_data$Countries,
        main = title,
        xlab = "Percentage",
        col = "#69b3a2",
        cex.names = 0.6,
        horiz = TRUE,
        las = 2
    )
}

make_barplot(
    data = data$Y1,
    names = data$Country,
    title = "Early leavers from education and training by country"
)
make_barplot(
    data = data$Y2,
    names = data$Country,
    title = "Tertiary education attainment by country"
)
make_barplot(
    data = data$Y3,
    names = data$Country,
    title = "Early childhood education and care by country"
)
make_barplot(
    data = data$Y4,
    names = data$Country,
    title = "Employment rates of recent graduates by country"
)
make_barplot(
    data = data$Y5,
    names = data$Country,
    title = "Adult participation in learning by country"
)
make_barplot(
    data = data$Y6,
    names = data$Country,
    title = "Underachievement in mathematics, reading and science by country"
)
