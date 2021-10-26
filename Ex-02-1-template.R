
# load the ggplot2 package
library(ggplot2)
theme_set(theme_bw()) # set the global theme (i.e. the look) of all plots

### PREPARATION: Set the working directory to the folder with the data
# Using a command of the following form:
# setwd("C:/path/to/my/folder")
# Note: On Windows, when copying the folder path from the Explorer, you have 
# to reverse the backslashes ("\") to slashes ("\")
### INSERT YOUR SOLUTION:
setwd("...")
# Note: You may also create a project in the RStudio GUI, the wd is then set automatically



# data preparation --------------------------------------------------------
# read in data
age_per_country_data <- read.csv("Ex02-1-age-per-country.csv")

# check if the variable formats are correct
str(age_per_country_data)




# a) Measures of central tendency -----------------------------------------

### i) Arithmetic mean
# for country A
mean(age_per_country_data$Age[age_per_country_data$Country == "A"])
### INSERT YOUR SOLUTION for countries B and C
mean(...)
mean(...)


### ii) Median
# for country A
median(age_per_country_data$Age[age_per_country_data$Country == "A"])
### INSERT YOUR SOLUTION for countries B and C
median(...)
median(...)




# b) Measures of variability ----------------------------------------------

### i) Range
### INSERT YOUR SOLUTION for countries A, B, C using the range() function
range(...)
range(...)
range(...)


### ii) 1st and 3rd quartile
# for country A
quantile(age_per_country_data$Age[age_per_country_data$Country == "A"], probs = c(0.25,0.75))
### INSERT YOUR SOLUTION for countries B and C
quantile(...)
quantile(...)


### iii) Interquartile range (IQR)
# for country A
qA <- quantile(age_per_country_data$Age[age_per_country_data$Country == "A"], probs = c(0.25,0.75))
unname(diff(qA))
### INSERT YOUR SOLUTION for countries B and C
qB <- ...
qC <- ...


### iv) Sample variance
# for country A
var(age_per_country_data$Age[age_per_country_data$Country == "A"])
### INSERT YOUR SOLUTION for countries B and C
var(...)
var(...)


### v) Coefficient of variation
# for country A
sdA <- sd(age_per_country_data$Age[age_per_country_data$Country == "A"])
meanA <- mean(age_per_country_data$Age[age_per_country_data$Country == "A"])
sdA / meanA
### INSERT YOUR SOLUTION for countries B and C
sdB <- ...
meanB <- ...
sdB / meanB
sdC <- ...
meanC <- ...
sdC / meanC




# c) Graphical representation ---------------------------------------------
# Boxplots
### EXERCISE: Insert the variables in the right places of the following function call
### INSERT YOUR SOLUTION:
ggplot(age_per_country_data, aes(x = ..., y = ...)) + geom_boxplot() + ylim(c(0,100))

# Histograms
# for country A
dat_A <- age_per_country_data[age_per_country_data$Country == "A",]
ggplot(dat_A, aes(x = Age)) + geom_histogram()
### INSERT YOUR SOLUTION for countries B and C
dat_B <- ...
ggplot(...) + geom_histogram()
dat_C <- ...
ggplot(...) + geom_histogram()
