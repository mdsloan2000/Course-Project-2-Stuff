#       plotbase is the prototype function on which all the Course Project 2 plots are based.
#       It loads the data file and prepares it for use.
#
#


plot1 <- function() {
#       Sources fileloader.r and refreshes data.
        source("fileloader.r")
        fileloader()

# Read the rds files "./Source_Classification_Code.rds" and "./summarySCC_PM25.rds" into local variables.
        SCC <- readRDS("./Source_Classification_Code.rds")
        NEI <- readRDS("./summarySCC_PM25.rds")

# plot commands go here.
        barplot((tapply(NEI$Emissions, NEI$year, FUN=sum)/1000),main="Total Annual Emmissions - in 1000's")
        png(file = "./plot1.png")
        barplot((tapply(NEI$Emissions, NEI$year, FUN=sum)/1000),main="Total Annual Emmissions - in 1000's")
        dev.off()
        
# clean up files
        cleanup()
        
}