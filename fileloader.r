fileloader <- function() {
        if (file.exists("./Source_Classification_Code.rds") || file.exists("./summarySCC_PM25.rds")) {
                print("Files Exist ... Running Cleanup")
        } else {
                print("Files Do Not Exist ... Extracting Only") 
        }
        unzip("./exdata-data-NEI_data.zip")
        return (TRUE)
}