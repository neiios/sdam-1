install.packages("readxl")
install.packages("ggpubr")
library("readxl") #excelio skaitymui
library("ggpubr") #ggqqplot grafikui ir pan

#Perskaitomas excel failas ir pakeičiamas į data frame (kad būtų patogiau brėžti grafikus)
#kolega ta pati padare su path= bet man errora meta tai padariau taip
data <- read_excel("C:\\Users\\matas\\OneDrive\\Stalinis kompiuteris\\R\\Laboratorinis\\[8] ET_2020.xlsx", sheet = "2018")
data <- data.frame(data)


#-----qqplot

#Define a function to make QQ-plots
draw_qqplot <- function(data, title) {
  qqplot(qnorm(ppoints(data)), data, main = title)
}

#Create a 2 x 3 layout for the plots
par(mfrow = c(2, 3))

# Make QQ-plots for each variable
draw_qqplot(data$Y1, "Early leavers from education and training by country")
draw_qqplot(data$Y2, "Tertiary education attainment by country")
draw_qqplot(data$Y3, "Early childhood education and care by country")
draw_qqplot(data$Y4, "Employment rates of recent graduates by country")
draw_qqplot(data$Y5, "Adult participation in learning by country")
draw_qqplot(data$Y6, "Underachievement in mathematics, reading and science by country")


dev.off()


#-----qqnorm and qqline graphs
#* qqnorm - dots (that represents the quantiles of this data)
#* qqline - lines (represents theoretical normal distribution)

#Define a function to make QQ-plots
make_qqplot <- function(data, title) {
  qq <- qqnorm(data, main = title)
  qqline(data)
  labels <- round(data, digits = 2)
}

#Create a 2 x 3 layout for the plots Make QQ-plots for each variable
par(mfrow = c(2, 3))

make_qqplot(data$Y1, "Early leavers from education and training by country")
make_qqplot(data$Y2, "Tertiary education attainment by country")
make_qqplot(data$Y3, "Early childhood education and care by country")
make_qqplot(data$Y4, "Employment rates of recent graduates by country")
make_qqplot(data$Y5, "Adult participation in learning by country")
make_qqplot(data$Y6, "Underachievement in mathematics, reading and science by country")

#*lines represents theoretical normal distribution while dots represent the quantiles of this data.
#*"Adult participation in learning by country" is closest to normal distribution since all dots are 
#* closest to a line (that represents theoretical normal distribution)
#* Others have several dots that are distanced from a line that indicates that dot as an extreme value.

dev.off()


#-----ggqqplots()
#I suggest using ggqqplot() from ggpubr library to see distribution more clearly:
#Everything should fall into grey zone

par(mfrow = c(2, 3)) #doesn't work idk why
ggqqplot(data$Y1)
ggqqplot(data$Y2)
ggqqplot(data$Y3)
ggqqplot(data$Y4)
ggqqplot(data$Y5)
ggqqplot(data$Y6)

dev.off()


#------stripplot()
stipplot <- function(data, main = "") {
  stripchart(data, method = "stack", pch = 20, col = "gray", main = main)
}

#change method into "jitter" if you need to

par(mfrow = c(2, 3))
stipplot(data$Y1, main = "Stipplot of Y1")
stipplot(data$Y2, main = "Stipplot of Y2")
stipplot(data$Y3, main = "Stipplot of Y3")
stipplot(data$Y4, main = "Stipplot of Y4")
stipplot(data$Y5, main = "Stipplot of Y5")
stipplot(data$Y6, main = "Stipplot of Y6")
dev.off()


