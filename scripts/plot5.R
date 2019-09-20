# Get SCC codes that correspond to motor vehicle emissions
SCC_motor <- SCC$SCC[grep("Motor", SCC$Short.Name)]

# Get Baltimore motor vehicle observations
baltimore_NEI <- NEI[NEI$fips == "24510",]
baltimore_motor_NEI <- baltimore_NEI[baltimore_NEI$SCC %in% SCC_motor,]

# Group baltimore motor vehicle emissions by year
baltimore_motor_groups <-
  baltimore_motor_NEI %>%
  group_by(year) %>%
  summarise(total_emissions = sum(Emissions))

# Make PNG file
png("./plots/plot5.png", width=480, height=480)


# Makes plot frame
with(baltimore_motor_groups,
     plot(total_emissions ~ year,
          type="n",
          xlab="Year", ylab="Total Emissions"))

# Add main title
title(main="Total Motor Vehicle Emissions in Baltimore from 1999 to 2008")

# Add data to plot
lines(baltimore_motor_groups$year, baltimore_motor_groups$total_emissions)

# Close png file
dev.off()