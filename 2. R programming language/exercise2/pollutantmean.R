# @Author: Xiang Jiang
# @Time  : Apr 22 2014

# Function 'pollutantmean' calculates the mean of a pollutant (sulfate or nitrate) 
# across a specified list of monitors. 
# The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data 
# from the directory specified in the 'directory' argument and returns the mean of the pollutant
# across all of the monitors, ignoring any missing values coded as NA.

pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    # all_data stores all the data of the specified field
    all_data = c()
    
    # iterate all the files in id
    for (i in id){
        
        # construct path to the file
        # fixed width format for the file names
        dir <- file.path(directory, paste0(sprintf( "%03d", i),".csv"))
        
        # read csv file with header enabled
        table <- read.csv(dir, header = TRUE)
        
        # append the result from this file to the result of all the files
        all_data <- append(all_data, table[[pollutant]])
    }
    
    # calculate mean with removing NA
    result <- mean(all_data, na.rm=TRUE) 
    
    # return value
    result
}
