# Import dplyr
library(dplyr)

# Import and read MechaCar MPG data
mecha_car_tbl <- read.csv(file='MechaCar_mpg.csv',check.names=FALSE)

# Perform linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance +
     AWD, data=mecha_car_tbl)

# Use summary() function to determine p-value and r-squared value
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
             ground_clearance + AWD, data=mecha_car_tbl))

# Import and read MechaCar suspension coil data
susp_coil_tbl <- read.csv(file='Suspension_Coil.csv',check.names=FALSE)

total_summary <- susp_coil_tbl %>% summarize(mean=mean(PSI), median=median(PSI), 
                                             variance=var(PSI), SD=sd(PSI))

lot_summary <- susp_coil_tbl %>% group_by(Manufacturing_Lot) %>% 
  summarize(mean=mean(PSI), median=median(PSI), variance=var(PSI), SD=sd(PSI))
