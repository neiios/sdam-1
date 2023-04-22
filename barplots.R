install.packages(c("readxl", "ggplot2"))

library(readxl)
library(ggplot2)

data <- read_xlsx(path = "data.xlsx", sheet = "2018")

make_barplot <- function(data, names, title) {
    table <- data.frame(Data = data, Countries = names)
    sorted_data <- table[order(table$Data), ]
    bp <- barplot(
        height = sorted_data$Data,
        names = sorted_data$Countries,
        main = title,
        xlab = "Percentage",
        col = "#69b3a2",
        cex.names = 0.6,
        horiz = TRUE,
        las = 2,
        xlim = c(0, max(data) + 10)
    )

    # Add height labels to the bars
    text(
        x = sorted_data$Data,
        y = bp,
        labels = sorted_data$Data,
        cex = 0.8,
        pos = 4
    )
}

# par(mfrow=c(1, 1))
par(mfrow = c(2, 3)) # Six figures on the same plot. Doesn't look nice.

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

temp <- data
temp$Country <- NULL
plot(temp) # How can you even interpret this one?
