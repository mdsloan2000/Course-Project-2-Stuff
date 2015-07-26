#       plotbase is the prototype function on which all the Course Project 2 plots are based.
#       It loads the data file and prepares it for use.
#
#


plot4 <- function() {

# attach the ggplot2 library
        library("plyr", lib.loc="~/R/win-library/3.2")
        library("ggplot2", lib.loc="~/R/win-library/3.2")
        
        
# Read the rds files "./Source_Classification_Code.rds" and "./summarySCC_PM25.rds" into local variables.
        SCC <- readRDS("./Source_Classification_Code.rds")
        NEI <- readRDS("./summarySCC_PM25.rds")
        

# Build the Data Set
        SCC_codes <- as.character(SCC$SCC[grep ("Coal", as.character(SCC$EI.Sector))]) # builds list of valid coal codes.
        NEI <- NEI[NEI$SCC %in% SCC_codes,] #subsets the data based on the Coal List.
        NEI <- ddply(NEI, .(year), summarize, Coal_Emissions = (sum(Emissions))/1000)

# plot commands go here.
        p <- qplot(as.character(year), Coal_Emissions, data=NEI) + geom_bar(stat = "Identity") 
        p <- p + ylab("Coal Emissions in 1000s") + xlab ("Total Coal Emissions per Year")
        print(p)
        png(file = "./plot3.png", width = 585, height = 529, pointsize = 9)
        print(p)
        dev.off()
        
}