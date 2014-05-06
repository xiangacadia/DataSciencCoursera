## Ranking hospitals by outcome in a state
## Write a function called rankhospital that takes three arguments: 
## the 2-character abbreviated name of a state (state), an outcome (outcome), 
## and the ranking of a hospital in that state for that outcome (num).
rankhospital <- function(state, outcome, num = "best") {
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
    
    ## Return hospital name in that state with the given rank
    hospital <- data$Hospital.Name[data$State==state]
    deathrate <- as.double(data[rate][data$State==state,])
    ord <-order(deathrate,hospital)
    orderHospital <- hospital[ord]
    orderDeath <- deathrate[ord]
    
   
    if(num=="best"){
        orderHospital[1]
    }else{
        if(num=="worst"){
            orderHospital <- orderHospital[!is.na(orderDeath)]
            orderHospital[length(orderHospital)]
        }else{
            if(num <= length(orderHospital)){
                orderHospital[num]
            }else{
                NA
            }
        }
    }
}
