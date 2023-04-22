install.packages("readxl")
library(readxl)

bank_df <- read_xlsx(path = "data.xlsx", sheet = "2018")
