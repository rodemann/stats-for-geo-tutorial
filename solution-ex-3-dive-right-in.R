### Statistics for Geosciences ###
### Tutorial 1 ###################
### Introduction to R ############
### Julian Rodemann ##############


# a)
# check/set working directory
getwd()
#setwd()

# b)+c)
# Rstudio; Bonus answer: The title is not seperated by "-" and the meaning of wdi is unclear

# d)
# Read in data table
co2_emissions_data <- read.csv("wdi_data.csv")
# Check if all columns/variables have the correct class
str(co2_emissions_data)
# -> looks fine!


# d) (tbc.) some analyses -----------------------------------------------------------
# Frequency distribution of countries
table(co2_emissions_data$country)
# -> Every country appears equally often

# In which regions do the countries lie?
table(co2_emissions_data$country, co2_emissions_data$region)

# What is the mean CO2emission per year over all countries?
mean(co2_emissions_data$CO2emission, na.rm = TRUE) # Note: The argument 'na.rm = TRUE' removes missing (called 'NA's) values from the calculation

# Install the ggplot2 package for creating visualizations/plots
#install.packages("ggplot2") # the installation is necessary only once on your computer
library(ggplot2) # necessary everytime you restart R / RStudio
theme_set(theme_bw()) # set the global theme (i.e. the look) of all plots

# Plot the frequency distribution of regions
ggplot(co2_emissions_data, aes(x = region)) + geom_bar()
# With color
ggplot(co2_emissions_data, aes(x = region, fill = region)) + geom_bar()

# Plot the CO2emission over the years
ggplot(co2_emissions_data, aes(x = year, y = CO2emission)) + geom_point()
# More advanced: Look at the development in some specific countries
co2_emissions_data_shortened <- co2_emissions_data[co2_emissions_data$country %in% c("Austria","Germany","Spain"),]
ggplot(co2_emissions_data_shortened, aes(x = year, y = CO2emission, color = country)) + geom_line()
# All countries:
ggplot(co2_emissions_data, aes(x = year, y = CO2emission, color = country)) + geom_line()


# e) add column with co2-emission p.c.
co2_emissions_data$CO2emissionPerInhabitant <- co2_emissions_data$CO2emission / co2_emissions_data$Population
# Just out of curiosity: What is the mean 'CO2emission per inhabitant' per year over all countries?
mean(co2_emissions_data$CO2emissionPerInhabitant, na.rm = TRUE)
# for germany
mean(co2_emissions_data$CO2emissionPerInhabitant[which(co2_emissions_data$country=="Germany")], na.rm = TRUE)
# (9.3 tons)
# compare with France
mean(co2_emissions_data$CO2emissionPerInhabitant[which(co2_emissions_data$country=="France")], na.rm = TRUE)
# (5.7 tons)




# f) save modified data frame as csv in the working diretory
save(co2_emissions_data, file = "co2_emissions_data-2005-to-2011.csv")



