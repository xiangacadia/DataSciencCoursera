# @Author: Xiang Jiang
# @Time  : Apr 22 2014

# This function takes a directory of data files and a threshold for complete cases 
# and calculates the correlation between sulfate and nitrate for monitor locations 
# where the number of completely observed cases (on all variables) is greater than the threshold. 
# The function should return a vector of correlations for the monitors that meet the threshold requirement. 
# If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. 

corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    # get the number for complete records for each file
    cmp <- complete("specdata")
    
    mid <- c()
    
    # get the files that are greater than the threshold
    for(i in 1:332){
        if(cmp[i,]$nobs > threshold){
            mid <- append(mid, cmp[i,]$id)
        }
    }
    
    correlation <- c()
    
    # calculate the correlations for the files
    for (i in mid){
        dir <- file.path(directory, paste0(sprintf( "%03d", i),".csv"))
        table <- read.csv(dir, header = TRUE)
        
        corr <- cor(table$sulfate, table$nitrate, use = "complete")
        correlation <- append(correlation, corr)
    }
    
    ## Return a numeric vector of correlations
    correlation
}
