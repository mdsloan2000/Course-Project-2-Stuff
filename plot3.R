#       plotbase is the prototype function on which all the Course Project 2 plots are based.
#       It loads the data file and prepares it for use.
#
#


plot3 <- function() {

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
        p <- qplot(as.character(year), sum, data=foo2, facets = .~type) + geom_bar(stat = "Identity")
        p <- p + xlab("Year") + ylab("Total Annual Emissions")
        print(p)
        png(file = "./plot3.png", width = 585, height = 529, pointsize = 9)
        print(p)
        dev.off()


} 

                                                          