library(tidyr)
library(dplyr)

data_file_name <- "./data/exdata_data_NEI_data.zip"

# Download data (if necessary)
if(!file.exists(data_file_name)){
  data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(data_url, destfile=data_file_name, method="curl")
  unzip(data_file_name, exdir="./data", overwrite=TRUE)
}

# Read in data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Clean up some data types
NEI <-
  NEI %>%
  mutate(fips = as.factor(fips)) %>%
  mutate(Pollutant = as.factor(Pollutant)) %>%
  mutate(type = as.factor(type))