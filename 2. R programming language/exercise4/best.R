## Finding the best hospital in a state
## -----------------------------------------
## Write a function called best that take two arguments:
## the 2-character abbreviated name of a state and an outcome name. 
## The function reads the outcome-of-care-measures.csv file 
## and returns a character vector with the name of the hospital 
## that has the best (i.e. lowest) 30-day mortality for the specified outcome in that state. 
##The hospital name is the name provided in the Hospital.Name variable. 
## The outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”. 
## Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals 
## when deciding the rankings.
## Handling ties. 
## If there is a tie for the best hospital for a given outcome, 
## then the hospital names should be sorted in alphabetical order and 
## the first hospital in that set should be chosen 
## (i.e. if hospitals “b”, “c”, and “f” are tied for best, then hospital “b” should be returned).
best <- function(state, outcome) {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    if(length(data$State[data$State==state])==0){
        stop("invalid state")
    }
    if(outcome == "heart attack"){
        rate <- 11
    }else{
        if(outcome == "heart failure"){
            rate <- 17
        }
        else{
            if(outcome == "pneumonia"){
                rate <- 23
            }else{
                stop("invalid outcome")
            }
        }
    }
    
    ## Return hospital name in that state with lowest 30-day death rate
    hospital <- data$Hospital.Name[data$State==state]
    deathrate <- as.double(data[rate][data$State==state,])
    ord <-order(deathrate,hospital)
    orderHospital <- hospital[ord]
    orderDeath <- deathrate[ord]
    
    if(is.na(orderDeath[1])){NA}
       else{
           minValue <- orderDeath[1]
           hospital <- orderHospital[orderDeath==minValue]
           hospital <- hospital[!is.na(hospital)]
           hospital
       }
}
