library(tidyr)
library(dplyr)

# Total emission levels from all sources for each year
baltimore_totals <-
  NEI %>%
  filter(fips == 24510) %>%
  group_by(year) %>%
  summarise(totalEmissions = sum(Emissions))

# Make PNG file
png("./plots/plot2.png", width=480, height=480)

# Makes plot frame
with(baltimore_totals,
     plot(totalEmissions ~ year,
          type="n",
          xlab="Year", ylab="Total Emissions"))

# Add main title
title(main="Total Emissions in Baltimore from 1999 to 2008")

# Add data to plot
lines(baltimore_totals$year, baltimore_totals$totalEmissions)

# Close PNG file
dev.off()