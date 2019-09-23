## ======================================================================
# Filename: plot1.R
# Author: Daniel DeWaters
# Date Created: 9/18/2019
# Description: plot the total PM2.5 emissions in the US from 1999 to 2008
# ***Run getData.R before any of the plotting scripts***
## ======================================================================
library(tidyr)
library(dplyr)

# Total emission levels from all sources for each year
NEI_totals <-
  NEI %>%
  group_by(year) %>%
  summarise(totalEmissions = sum(Emissions))

# Make PNG file
png("./plots/plot1.png", width=480, height=480)

# Makes plot frame
with(NEI_totals,
      plot(totalEmissions ~ year,
           type="n",
           xlab="Year", ylab="Total Emissions"))

# Add main title
title(main="Total PM2.5 Emissions in US from 1999 to 2008")

# Add data to plot
lines(NEI_totals$year, NEI_totals$totalEmissions)

# Close PNG file
dev.off()