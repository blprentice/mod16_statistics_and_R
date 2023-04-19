# Import dplyr
library(dplyr)

# Import and read in csv
mecha_car_tbl <- read.csv(file='MechaCar_mpg.csv',check.names=FALSE)

# Perform linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance +
     AWD, data=mecha_car_tbl)

# Use summary() function to determine p-value and r-squared value
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
             ground_clearance + AWD, data=mecha_car_tbl))
