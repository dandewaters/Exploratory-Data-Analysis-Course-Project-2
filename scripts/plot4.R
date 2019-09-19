# Get SCC codes corresponding to coal
SCC_coal <- SCC$SCC[grep("Anthracite Coal|Bituminous/Subbituminous Coal|Lignite", SCC$SCC.Level.Three)]

# Get emission observations that are coal combustion-related
NEI_coal <- NEI[NEI$SCC %in% SCC_coal,]

# Make PNG file
png("./plots/plot3.png", width=480, height=480)

with(NEI_coal, 
     plot(Emissions ~ year)
)

# close PNG file
dev.close()