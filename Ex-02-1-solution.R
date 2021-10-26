
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
mean(age_per_country_data$Age[age_per_country_data$Country == "A"])
mean(age_per_country_data$Age[age_per_country_data$Country == "B"])
mean(age_per_country_data$Age[age_per_country_data$Country == "C"])
# -> Country A has by far the lowest mean age with just 21.3 years. Country B
#    has a mean age of 45.0 and country C has the highest mean age with 54.5 years


### ii) Median
median(age_per_country_data$Age[age_per_country_data$Country == "A"])
median(age_per_country_data$Age[age_per_country_data$Country == "B"])
median(age_per_country_data$Age[age_per_country_data$Country == "C"])
# -> Comparison between the countries is equivalent to (i).

# Answer to the additional question:
# Country A: The median (15.5) is clearly lower than the arithmetic mean (21.3).
#            Thus, the distribution is positively skewed.
# Country B: The median (45) is quasi equal to the arithmetic mean (44.95).
#            Thus, the distribution is symmetric.
# Country C: The median (59.5) is clearly higher than the arithmetic mean (54.5).
#            Thus, the distribution is negatively skewed.




# b) Measures of variability ----------------------------------------------

### i) Range
range(age_per_country_data$Age[age_per_country_data$Country == "A"])
range(age_per_country_data$Age[age_per_country_data$Country == "B"])
range(age_per_country_data$Age[age_per_country_data$Country == "C"])
# -> Countries A and C nearly cover the same range of ages (0-84/87). Instead,
#    in country B the observed age range is more limited to mean ages (24-63).

### ii) 1st and 3rd quartile
quantile(age_per_country_data$Age[age_per_country_data$Country == "A"], probs = c(0.25,0.75))
quantile(age_per_country_data$Age[age_per_country_data$Country == "B"], probs = c(0.25,0.75))
quantile(age_per_country_data$Age[age_per_country_data$Country == "C"], probs = c(0.25,0.75))
# -> The 1st quartiles of countries B and C are very similar (39.75 / 40.75).
#    In contrast, country A has a first quartile of 8.
#    Thus, in country A a quarter of the people have an age <= 8, in country B
#    and C a quarter of the people have an age of around <= 40.
# -> The 3rd quartiles are very different between all countries.
#    In country A, a quarter of the people have an age >= 31.
#    In country B, a quarter of the people have an age >= 50.
#    In country C, a quarter of the people have an age >= 68.
# -> Another possible interpretation of the quartiles is the following:
#    In country A, half of the people have an age in the interval [8,31].
#    In country B, half of the people have an age in the interval [39.75,50].
#    In country C, half of the people have an age in the interval [40.75,68].


### iii) Interquartile range (IQR)
qA <- quantile(age_per_country_data$Age[age_per_country_data$Country == "A"], probs = c(0.25,0.75))
unname(diff(qA))
qB <- quantile(age_per_country_data$Age[age_per_country_data$Country == "B"], probs = c(0.25,0.75))
unname(diff(qB))
qC <- quantile(age_per_country_data$Age[age_per_country_data$Country == "C"], probs = c(0.25,0.75))
unname(diff(qC))
# -> Country B has by far the lowest IQR with about 10. In contrast, countries
#    A and C have more similar IQRs with 23 and 27.25, respectively.
#    Thus, 50% of the people from country B spread over an age interval of just 10 years.
#    In country A and C this interval is more broad.


### iv) Sample variance
var(age_per_country_data$Age[age_per_country_data$Country == "A"])
var(age_per_country_data$Age[age_per_country_data$Country == "B"])
var(age_per_country_data$Age[age_per_country_data$Country == "C"])
# -> As was already hinted by the range and the IQR, the ages in country B vary
#    less than in the other countries. The variance in countries A and C is
#    quite similar.


### v) Coefficient of variation
sdA <- sd(age_per_country_data$Age[age_per_country_data$Country == "A"])
meanA <- mean(age_per_country_data$Age[age_per_country_data$Country == "A"])
sdA / meanA
sdB <- sd(age_per_country_data$Age[age_per_country_data$Country == "B"])
meanB <- mean(age_per_country_data$Age[age_per_country_data$Country == "B"])
sdB / meanB
sdC <- sd(age_per_country_data$Age[age_per_country_data$Country == "C"])
meanC <- mean(age_per_country_data$Age[age_per_country_data$Country == "C"])
sdC / meanC
# -> The coefficients of variation do vary between the countries.
#    It can e.g. be seen that - compared to the mean ages - the ages in country A
#    vary much more than in country C. Both have a similar variance, but as
#    the arithmetic means are different, so are the coefficients of variation,
#    and thus country A has a higher 'relative variance' than country C.




# c) Graphical representation ---------------------------------------------
# Boxplots
ggplot(age_per_country_data, aes(x = Country, y = Age)) + geom_boxplot() + ylim(c(0,100))

# -> Country A has a positively skewed distribution, country B a symmetric one and
#    country C a negatively skewed distribution

# Histograms
dat_A <- age_per_country_data[age_per_country_data$Country == "A",]
ggplot(dat_A, aes(x = Age)) + geom_histogram()
dat_B <- age_per_country_data[age_per_country_data$Country == "B",]
ggplot(dat_B, aes(x = Age)) + geom_histogram()
dat_C <- age_per_country_data[age_per_country_data$Country == "C",]
ggplot(dat_C, aes(x = Age)) + geom_histogram()
