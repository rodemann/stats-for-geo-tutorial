### Statistics for Geosciences ###
### Tutorial 1 ###################
### Introduction to R ############
### Julian Rodemann ##############


# a)
# check/set working directory
getwd()
#setwd()

# b)+c)
# Rstudio; Bonus answer: The title is not seperated by "-" and the meaning of wdi 
# is unclear

# d)
# Read in data table
dat <- read.csv("wdi_data.csv")
# Check if all columns/variables have the correct class
str(dat)
# -> looks fine!


# d) (tbc.) some analyses -----------------------------------------------------------
# Frequency distribution of countries
table(dat$country)
# -> Every country appears equally often

# In which regions do the countries lie?
table(dat$country, dat$region)

# What is the mean CO2emission per year over all countries?
mean(dat$CO2emission, na.rm = TRUE) # Note: The argument 'na.rm = TRUE' removes missing (called 'NA's) values from the calculation

# Install the ggplot2 package for creating visualizations/plots
#install.packages("ggplot2") # the installation is necessary only once on your computer
library(ggplot2) # necessary everytime you restart R / RStudio
theme_set(theme_bw()) # set the global theme (i.e. the look) of all plots

# Plot the frequency distribution of regions
ggplot(dat, aes(x = region)) + geom_bar()
# With color
ggplot(dat, aes(x = region, fill = region)) + geom_bar()

# Plot the CO2emission over the years
ggplot(dat, aes(x = year, y = CO2emission)) + geom_point()
# More advanced: Look at the development in some specific countries
dat_short <- dat[dat$country %in% c("Austria","Germany","Spain"),]
ggplot(dat_short, aes(x = year, y = CO2emission, color = country)) + geom_line()


# e) add column with co2-emission p.c.
dat$CO2emissionPerInhabitant <- dat$CO2emission / dat$Population
# Just out of curiosity: What is the mean 'CO2emission per inhabitant' per year over all countries?
mean(dat$CO2emissionPerInhabitant, na.rm = TRUE)
# for germany
mean(dat$CO2emissionPerInhabitant[which(dat$country=="Germany")], na.rm = TRUE)
# (9.3 tons)
# compare with France
mean(dat$CO2emissionPerInhabitant[which(dat$country=="France")], na.rm = TRUE)
# (5.7 tons)


# f) save modified data frame as csv
save(dat, file = "co2-emissions-data-2005-to-2011.csv")



