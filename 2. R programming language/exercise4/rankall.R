## Ranking hospitals in all states
## Write a function called rankall that takes two arguments: 
## an outcome name (outcome) and a hospital rank- ing (num). 
## The function reads the outcome-of-care-measures.csv file and 
## returns a 2-column data frame containing the hospital in each 
## state that has the ranking specified in num. 
rankall <- function(outcome, num = "best") {
    
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
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
    
    ## For each state, find the hospital of the given rank
    stateNames <- unique(data$State)
    result <- data.frame()
    result.names <- c("hospital", "state")
    for(state in stateNames){
        ## Return hospital name in that state with the given rank
        hospital <- data$Hospital.Name[data$State==state]
        deathrate <- as.double(data[rate][data$State==state,])
        ord <-order(deathrate,hospital)
        orderHospital <- hospital[ord]
        orderDeath <- deathrate[ord]
        
        
        if(num=="best"){
            temp <- orderHospital[1]
        }else{
            if(num=="worst"){
                orderHospital <- orderHospital[!is.na(orderDeath)]
                temp <- orderHospital[length(orderHospital)]
            }else{
                if(num <= length(orderHospital)){
                    temp <- orderHospital[num]
                }else{
                    temp <- NA
                }
            }
        }
        
        row <- data.frame(temp, state)
        names(row) <- c("hospital", "state")
        result <- rbind(result, row)
    }
    result
}
