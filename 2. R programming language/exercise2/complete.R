# @Author: Xiang Jiang
# @Time  : Apr 22 2014

# This function reads a directory full of files and reports the number of completely observed cases in each data file. 
# The function should return a data frame where the first column is the name of the file and 
# the second column is the number of complete cases.
# Here complete means there is no NA is the record.

complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    # initialize number of complete cases
    nobs <- c()
    
    # iterate all the files
    for (i in id){
        
        dir <- file.path(directory, paste0(sprintf( "%03d", i),".csv"))
        table <- read.csv(dir, header = TRUE)
        counter <- 0
        
        # detect whether records are complete
        for(row in 1:nrow(table)){
            if(!is.na(table$sulfate[row]) && !is.na(table$nitrate[row])){
                counter <- counter + 1 
            }
        }
        
        nobs <- append(nobs, counter)
    }
    
    result <- data.frame(id, nobs)
    result
}
