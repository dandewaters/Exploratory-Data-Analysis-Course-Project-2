# Get SCC codes corresponding to coal
SCC_coal <- SCC$SCC[grep("Anthracite Coal|Bituminous/Subbituminous Coal|Lignite", SCC$SCC.Level.Three)]

# Get emission observations that are coal combustion-related
NEI_coal <- NEI[NEI$SCC %in% SCC_coal,]

NEI_coal_groups <-
  NEI_coal %>%
  group_by(year) %>%
  summarise(total_emissions=sum(Emissions))

# Make PNG file
png("./plots/plot4.png", width=720, height=480)


# Makes plot frame
with(NEI_coal_groups,
     plot(total_emissions ~ year,
          type="n",
          xlab="Year", ylab="Total Emissions"))

# Add main title
title(main="Total Coal Combustion-Related Emissions from 1999 to 2008")

# Add data to plot
lines(NEI_coal_groups$year, NEI_coal_groups$total_emissions)

# Close png file
dev.off()