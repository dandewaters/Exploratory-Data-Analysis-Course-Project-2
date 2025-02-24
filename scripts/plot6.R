## ======================================================================
# Filename: plot6.R
# Author: Daniel DeWaters
# Date Created: 9/20/2019
# Description: Plot the total motor vehicle emissons in Baltimore and Los
#              Angeles from 1999 to 2008
# ***Run getData.R before any of the plotting scripts***
## ======================================================================


# Get SCC codes that correspond to motor vehicle emissions
SCC_motor <- SCC$SCC[grep("Motor", SCC$Short.Name)]

# Get Baltimore motor vehicle observations
baltimore_LA_NEI <- NEI[NEI$fips=="24510" | NEI$fips=="06037",]
motor_NEI <- baltimore_LA_NEI[baltimore_LA_NEI$SCC %in% SCC_motor,]

# Group motor vehicle emissions by year and area
motor_groups <-
  motor_NEI %>%
  group_by(year, fips) %>%
  summarise(total_emissions=sum(Emissions), mean_emissions=mean(Emissions))

# Make PNG file
png("./plots/plot6.png", width=720, height=480)

# Makes plot frames
with(motor_groups,
     plot(total_emissions~year, type="n", xlab="Year", ylab="Total Emissions", col=motor_groups$fips))

# Add main title
title(main="\nTotal Motor Vehicle Emissions in Baltimore and Los Angeles from 1999 to 2008", outer=TRUE)

# Add data to plot
lines(motor_groups$year[motor_groups$fips=="24510"], motor_groups$total_emissions[motor_groups$fips=="24510"])
lines(motor_groups$year[motor_groups$fips=="06037"], motor_groups$total_emissions[motor_groups$fips=="06037"])

# Close png file
dev.off()