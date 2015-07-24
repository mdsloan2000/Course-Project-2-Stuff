#       plotbase is the prototype function on which all the Course Project 2 plots are based.
#       It loads the data file and prepares it for use.
#
#


plot3 <- function() {
#       Sources fileloader.r and refreshes data.
        source("fileloader.r")
        fileloader()
        
# attach the ggplot2 library
        library("plyr", lib.loc="~/R/win-library/3.2")
        library("ggplot2", lib.loc="~/R/win-library/3.2")

# Read the rds files "./Source_Classification_Code.rds" and "./summarySCC_PM25.rds" into local variables.
        SCC <- readRDS("./Source_Classification_Code.rds")
        NEI <- readRDS("./summarySCC_PM25.rds")
        
# Ready the data        
        NEI <- subset(NEI, fips == "24510")  #Subsets the Baltimore Data
        foo2 <- ddply(NEI, .(type, year), summarize, sum = round(sum(Emissions), 2))
        
# plot commands go here.
        qplot(as.character(year), sum, data=foo2, facets = .~type ) + geom_bar(stat = "Identity")
        png(file = "./plot3.png")
        qplot(as.character(year), sum, data=foo2, facets = .~type ) + geom_bar(stat = "Identity")
        dev.off()

# clean up files
        cleanup()
        
}