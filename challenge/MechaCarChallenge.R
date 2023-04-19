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

# Create total summary table
total_summary <- susp_coil_tbl %>% summarize(mean=mean(PSI), median=median(PSI), 
                                             variance=var(PSI), SD=sd(PSI))
# Create summary tables for each lot
lot_summary <- susp_coil_tbl %>% group_by(Manufacturing_Lot) %>% 
  summarize(mean=mean(PSI), median=median(PSI), variance=var(PSI), SD=sd(PSI))

# Create population table for t-test
population_table <- read.csv('Suspension_Coil.csv',check.names = FALSE)

# Create sample table for t-test
sample_table <- population_table %>% sample_n(25)

# Conduct t-test
t.test(sample_table$PSI, mu=mean(population_table$PSI))

# Subset the lots
sub1 <- subset(sample_table, Manufacturing_Lot=="Lot1")
sub2 <- subset(sample_table, Manufacturing_Lot=="Lot2")
sub3 <- subset(sample_table, Manufacturing_Lot=="Lot3")

# Run t-tests for each lot
t.test(log10(sub1$PSI), mu=mean(population_table$PSI))
t.test(log10(sub2$PSI), mu=mean(population_table$PSI))
t.test(log10(sub3$PSI), mu=mean(population_table$PSI))
