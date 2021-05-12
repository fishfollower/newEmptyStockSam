library(stockassessment)
load("run/model.RData")
## Default values:
## nYears = 100, calculate equilibrium yield/spawners-per-recruit using 100 years
## Fsequence = seq(0,4, len = 200), calculate equilibrium values for F at 200 points in the range 0-4
## aveYears = max(fit$data$years)+(-9:0), use the last 10 years to calculate weights, maturity, etc.
## selYears = max(fit$data$years), use selectivity in the final year
## SPRpercent = c(0.35), use 35% for F[x%] reference point
## catchType = "catch", use catch to calculate yield
ymax <- max(fit$data$years)
ymin <- pmax(fit$data$years, ymax - 14)
RP <- referencepoints(fit,                     
                      Fsequence = seq(0, 2, len = 200), 
                      aveYears = ymin:ymax,
                      selYears = ymin:ymax,
                      catchType = "landing")
save(RP, file="run/referencepoint.RData")
