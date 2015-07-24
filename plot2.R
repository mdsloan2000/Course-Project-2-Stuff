#       plotbase is the prototype function on which all the Course Project 2 plots are based.
#       It loads the data file and prepares it for use.
#
#


plot2 <- function() {
#       Sources fileloader.r and refreshes data.
        source("fileloader.r")
        fileloader()

# Read the rds files "./Source_Classification_Code.rds" and "./summarySCC_PM25.rds" into local variables.
        SCC <- readRDS("./Source_Classification_Code.rds")
        NEI <- readRDS("./summarySCC_PM25.rds")
        NEI <- subset(NEI, fips == "24510")

# plot commands go here.
        barplot((tapply(NEI$Emissions, NEI$year, FUN=sum)),main="Total Annual Emmissions for Baltimore City")
        png(file = "./plot2.png")
        barplot((tapply(NEI$Emissions, NEI$year, FUN=sum)),main="Total Annual Emmissions for Baltimore City")
        dev.off()
        
# clean up files
        cleanup()
        
}