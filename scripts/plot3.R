library(tidyr)
library(dplyr)
library(ggplot2)

# Total emission levels for each type for each year
baltimore_types <-
  NEI %>%
  filter(fips == 24510) %>%
  group_by(year, type) %>%
  summarise(totalEmissions = sum(Emissions))

# Make PNG file
png("./plots/plot3.png", width=720, height=720)

# Make titles/labels
mtitle="Total Emissions in Baltimore by Type from 1999 to 2008"
xl="Year"
yl="Total Emissions"
# Make plot
qplot(x=year, y=totalEmissions, data=baltimore_types,
      main=mtitle, xlab=xl, ylab=yl, facets=.~type)

# Close PNG file
dev.off()