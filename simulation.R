# Title: Monte Carlo Simulation of Tech Giants
# Version: v0.1
# Author: Yves Beutler
# API-Key: D4RKFBBRDT9OYJ0B

# my implementation of monte carlo
calcMonteCarlo = function(inputData) {
  
  # define periodical daily return (r)
  # r2 = log(day2/day1)
}

# removes each unused row on the data frame
removeAdditionalRows <- function(df) {
  df$open <- NULL
  df$high <- NULL
  df$low <- NULL
  df$volume <- NULL
  return (df)
}
# add periodical daily returns
pdr <- function(df) {
  pdrColumn <- c()

  for (i in 1:nrow(df)-1) {
    todayValue = df[i, 2]
    prevValue = df[i+1, 2]
    pdr = log(todayValue/prevValue)
    pdrColumn[i] = pdr
  }
  
  # set last pdr to zero
  pdrColumn[nrow(df)] <- 0
  
  plot(pdrColumn)
  
  df$pdr <- pdrColumn
  
  return (df)
}

# import historical stock data from csv
input_AMAZON = read.csv("stock-data/AMZN.csv")
input_GOOGLE = read.csv("stock-data/GOOG.csv")
input_MICROSOFT = read.csv("stock-data/MSFT.csv")

# remove all unused rows
df_AMAZON = removeAdditionalRows(input_AMAZON)
df_GOOGLE = removeAdditionalRows(input_GOOGLE)
df_MICROSOFT = removeAdditionalRows(input_MICROSOFT)

# calculate periodical daily return
pdr(df_AMAZON)
pdr(df_GOOGLE)
pdr(df_MICROSOFT)
