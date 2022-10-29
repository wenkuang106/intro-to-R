# 1.1 Introduction to R and RStudio 

getwd()

# Intro to R Lesson
# Oct 25, 2022 

# Interacting with R

## I am adding 3 and 5. R is fun!
3+5

x <- 3

y <- 5

y

x + y

number <- x + y

# Exercise 
x <- 5 # number stayed the same 
y <- 10 # to change number with new variable need to rerun the line number <- x + y

# 1.2 R Syntax and Data Structures

# Create a numeric vector and store the vector as a variable called 'glengths'
glengths <- c(4.6, 3000, 50000)
glengths

# Create a character vector and store the vector as a variable called 'species'
species <- c("ecoli", "human", "corn")
species

# Forget to put quotes around corn
species <- c("ecoli", "human", corn)

# Create a character vector and store the vector as a variable called 'species'
species <- c("ecoli", "human", "corn")

# Create a character vector and store the vector as a variable called 'expression'
expression <- c("low", "high", "medium", "high", "low", "medium", "high")

# Turn 'expression' vector into a factor
expression <- factor(expression)

# Create a data frame and store it as a variable called 'df'
df <- data.frame(species, glengths)

df

list1 <- list(species, df, number)
list1


# Exercise
combined <- c(glengths, species)
samplegroup <- c("CTL", "CTL", "CTL", "KO", "KO", "KO", "OE", "OE", "OE")
samplegroup <- factor(samplegroup)
titles <- c("Catch-22", "Pride and Prejudice", "Nineteen Eighty Four")
pages <- c(453, 432, 328)
favorite_books <- data.frame(titles, pages)
list2 <- list(species,glengths,number)

# 1.3 Functions and Arguements 
# function_name(input)

getwd()

glengths <- c(glengths, 90) # adding at the end	
glengths <- c(30, glengths) # adding at the beginning

sqrt(81)

sqrt(glengths)

round(3.14159)

?round

args(round)

example("round")

round(3.14159, digits=2)

"name_of_function <- function(argument1, argument2) {
  statements or code that does something
  return(something)
}"

square_it <- function(x) {
  square <- x * x
  return(square)
}

square_it(5)


# Exercise 
mean(glengths)
sort(glengths, decreasing = TRUE)
multiply_it <- function(x,y) {
  product <- x * y
  return(product)}

# 1.4 Reading in and Inspecting Data
?read.csv

metadata <- read.csv(file="data/mouse_exp_design.csv")

# OR 
# metadata <- read.csv(file="data/mouse_exp_design.txt")

metdata

head(metadata)

# Exercise 
proj_summary <- read.table(file = "data/project-summary.txt", header = TRUE, row.names = 1)
class(glengths)
class(metadata)
summary(proj_summary)
length(samplegroup)
dim(proj_summary)
str(rownames(metadata))
length(colnames(proj_summary))

# 2.1 Data Wrangling: Subsetting Vectors and Factors
age <- c(15, 22, 45, 52, 73, 81)

age[5]

age[-5]

age[c(3,5,6)]   ## nested

# OR

## create a vector first then select
idx <- c(3,5,6) # create vector of the elements of interest
age[idx]

age[1:4]

age 

age > 50

age > 50 | age < 18

age

age[age > 50 | age < 18]  ## nested

# OR

## create a vector first then select
idx <- age > 50 | age < 18
age[idx]

which(age > 50 | age < 18)

age[which(age > 50 | age < 18)]  ## nested

# OR

## create a vector first then select
idx_num <- which(age > 50 | age < 18)
age[idx_num]

expression[expression == "high"]    ## This will only return those elements in the factor equal to "high"

expression

str(expression)

expression <- factor(expression, levels=c("low", "medium", "high"))     # you can re-factor a factor 

str(expression)

# Exercise 
idx <- samplegroup != "KO"
samplegroup[idx]
factor(samplegroup, levels = c("KO", "CTL", "OE"))

# 2.2 Packages and libraries
sessionInfo() #Print version information about R, the OS and attached or loaded packages

# OR

search() #Gives a list of attached packages

install.packages("ggplot2")

library(ggplot2)

sessionInfo()

# Exercise 
install.packages("tidyverse")
library(tidyverse)
sessionInfo()

# 2.3 Data Wrangling: data frames, matrices and lists
# Extract value 'Wt'
metadata[1, 1]

# Extract value '1'
metadata[1, 3] 

# Extract third row
metadata[3, ] 

# Extract third column
metadata[ , 3]

# Extract third column as a data frame
metadata[ , 3, drop = FALSE] 

# Dataframe containing first two columns
metadata[ , 1:2] 

# Data frame containing first, third and sixth rows
metadata[c(1,3,6), ] 

# Extract the celltype column for the first three samples
metadata[c("sample1", "sample2", "sample3") , "celltype"] 

# Check column names of metadata data frame
colnames(metadata)

# Check row names of metadata data frame
rownames(metadata)

# Extract the genotype column
metadata$genotype 

# Extract the first five values/elements of the genotype column
metadata$genotype[1:5]

metadata$celltype == "typeA"

logical_idx <- metadata$celltype == "typeA"

metadata[logical_idx, ]

which(metadata$celltype == "typeA")

idx <- which(metadata$celltype == "typeA")

metadata[idx, ]

which(metadata$replicate > 1)

idx <- which(metadata$replicate > 1)

metadata[idx, ]

metadata[which(metadata$replicate > 1), ]

sub_meta <- metadata[which(metadata$replicate > 1), ]

list1[[2]]

comp2 <- list1[[2]]
class(comp2)

list1[[1]]

list1[[1]][1]

names(list1) 

# Name components of the list
names(list1) <- c("species", "df", "number")

names(list1)

# Extract 'df' component
list1$df

# Exercise 
metadata[c("sample2", "sample8"), c("genotype", "replicate")] # or
metadata[c(2,8), c(1,3)]
metadata$replicate[c(4,9)] # or
metadata[c(4, 9), "replicate"]
metadata[, "replicate", drop = FALSE]
idx <- which(metadata$genotype=="KO")
metadata[idx, ]
random <- list(metadata, age, list1, samplegroup, number)
random[[4]]
names(random) <- c("metadata", "age", "list1", "samplegroup", "number")
random$age