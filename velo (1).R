install.packages(c("httr","jsonlite"))
library(httr)
library(jsonlite)

base <- 'https://api.jcdecaux.com/vls/v1/stations?contract=Lyon&apiKey=5de52836beec2f43de942c79725c1d693e8818bc'

raw_data <- GET(base)

df_base <- fromJSON(rawToChar(raw_data$content), flatten = TRUE)

install.packages("RMySQL")

library(RMySQL)

con <- dbConnect(MySQL(),
                 user = "sql11646681",
                 password = "8f4mGIdyLh",
                 host = "sql11.freesqldatabase.com",
                 dbname = "sql11646681")

dbWriteTable(con, "iris", iris)