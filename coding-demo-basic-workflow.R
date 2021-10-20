### Statistics for Geosciences ###
### Tutorial 1 ###################
### Introduction to R ############
### Julian Rodemann ##############





# Getting started with R 

# Code that is written in the R script (not the console below) can be saved and reused later!
# To run your code, highlight the relevant line(s) and press 'Run' or use the shortcut Ctrl + Enter (Strg + Enter) on your keyboard.

# -------------------------------------------------------------------------

# Using R as calculator 
1+2+3 # with the cursor in this line, press Ctrl + Enter to see the result in the console below 
999/11
1+2*3 # make sure that mathematical rules are applied by adding brackets:
(1+2)*3
# vectors
vector_a <- c(1,2,3)
# matrices 
matrix_a <- matrix(c(1,2,3,4,5,6), nrow = 2, byrow = TRUE)
t(matrix_a)
# matrix multiplication
matrix_a %*% t(matrix_a)



# -------------------------------------------------------------------------

# Define objects (e.g. variables, vectors, lists, dataframes) to store the 
# associated information in the global environment (upper right window) 
# There are different data types, e.g.
variable_1 <- 1      # numeric
variable_2 <- "one"  # character
variable_3 <- TRUE   # logic

class(variable_1)  # get class of the object
typeof(variable_1) # get type of the object 

# Now we can use the variables for further calculations: 
2*variable_1
variable_1 + variable_2 # this results in an error (different data types!)
variable_1 + variable_3 # this technically works since R interprets TRUE as 1 and FALSE as 0 

# Define vectors (all elements have to be of the same data type)
vector_1 <- c(1,2,3)
vector_2 <- c("one", "two", "three")

# -------------------------------------------------------------------------

# Working with pre-loaded data in R packages

# Install & load packages 
install.packages("datasets") # only for first usage on your machine 
library(datasets) # attach package to make its functionalities available to this script 

# Attach the 'iris' dataset
data(faithful)

# check doc
help("faithful")
# Waiting time between eruptions and the duration of the eruption 
# for the Old Faithful geyser in Yellowstone National Park, Wyoming, USA.


# Inspect the shape and content of the dataset

head(faithful) # print first 6 observations to console
tail(faithful) # print last 6 observations to console
str(faithful)  # print a list of all variables, their data types & first observations' values
summary(faithful) # print information on each variable's distribution (counts per level for categorical variables) 


# -------------------------------------------------------------------------

# Help: R Documentation on functions
?head() 
?str()
?summary() 


# Basic workflow ----------------------------------------------------------------
## your turn

# Upload you own data 

# Step 1: Save the csv-file '.csv'

# Step 2: Copy the path & file name & paste it here (Windows: '/', linux/mac: '\')
my_file_location <- "S:/Statistics for Geosciences/construction-components.csv"

# Step 3: Assign a name to your dataframe (df <-) and read the file
df <- read.csv(my_file_location)

# Step 4: Inspect the data
head(df) # something went wrong here: values are not comma-separated!

# Try again with specification of the separator 
df <- read.csv(my_file_location, sep=";")

# Step 4 (again): Inspect the data
head(df) # now it looks better (each variable has its own column)
str(df)
summary(df)

# More specific inspection (some examples)
df$load       # use $ to look at specific variables 
df$load[1:5]  # restrict print-out to first 5 observations
mean(df$load) # calculate the mean of a specific variable
sd(df$load)   # calculate the standard deviation of a specific variable


# Step 5: data manipulation
# Define a new variable (will be added as new column to df)
df$load_100 <- df$load + 100 # 100 added elementwise
df

# Change the values of an existing variable
df$load_100 <- df$load / 100

# Save manipulated dataframe as csv-file
my_new_file_location <- "S:/Statistics for Geosciences/construction-components-manipulated.csv"
write.csv(df, my_new_file_location)

# Manipulation does not affect the original data: 
df_orig <- read.csv(my_file_location, sep=";")
df_orig
