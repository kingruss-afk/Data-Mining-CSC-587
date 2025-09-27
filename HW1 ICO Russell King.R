#######HW 1 Question 1
#a)
su <- read.delim("C:/Users/Russell/Documents/CSC 587/Su_raw_matrix.txt")    # Reads File and Changes .txt to data frame

#b)
mean(su$Liver_2.CEL) # Finds mean of Liver_2.CEL

sd(su$Liver_2.CEL) # Finds standard deviation of Liver_2.CEL

#c)
colMeans(su) #Finds mean of all columns

colSums(su) #Finds sum of all columns


##Question 2

#a)
x1 <- rnorm(10000, mean = 0, sd = 0.2) #rnorm function to create numbers
hist(x1, breaks = 50, main = "Histogram (mean=0, sd=0.2)", xlab = "", xlim = c(-5, 5)) #plots points on a histogram

#b)
x2 <- rnorm(10000, mean = 0, sd = 0.5) #rnorm function to create numbers
hist(x2, breaks = 50, main = "Histogram (mean=0, sd=0.5)", xlab = "", xlim = c(-5, 5)) #plots points on a histogram


##Question 3

#read data
dat <- data.frame(cond = factor(rep(c("A","B"), each=200)),
                  rating = c(rnorm(200),rnorm(200, mean=.8)))
# b) Overlaid histograms
library (ggplot2)
ggplot(dat, aes(x=rating, fill=cond)) +
  geom_histogram(binwidth=.5, alpha=.5, position="identity")

# c) Interleaved histograms
ggplot(dat, aes(x=rating, fill=cond)) + geom_histogram(binwidth=.5, position="dodge")

# d) Density plots
ggplot(dat, aes(x=rating, colour=cond)) + geom_density()

# e) Density plots with semitransparent fill
ggplot(dat, aes(x=rating, fill=cond)) + geom_density(alpha=.3)

#f) 
##a) Read the data
library (ggplot2)
diabetes <- read.csv("C:/Users/Russell/Documents/CSC 587/diabetes_train.csv") #creates diabetes dataframe

##b): Overlaid histograms
ggplot(diabetes, aes(x=rating, fill=cond)) +
  geom_histogram(binwidth=.5, alpha=.5, position="identity")

##c): Interleaved histograms
ggplot(diabetes, aes(x = mass, fill = class)) +
  geom_histogram(binwidth = .5, position = "dodge")

##d): Density plots
ggplot(diabetes, aes(x = mass, colour = class)) +
  geom_density()

##e): Density plots with semi-transparent fill
ggplot(diabetes, aes(x = mass, fill = class)) +
  geom_density(alpha = .3)

##Question 4
#install.packages("tidyverse")      # intalls tidyverse
library(tidyverse)                 # Loads tidyverse commands
passengers <- read_csv("C:/Users/Russell/Documents/CSC 587/titanic.csv") #creates variable passengers with titanic info

#a) 
passengers %>% drop_na() %>% summary() #drop_na() removes any rows with missing values. #summary() gives statistics for each column in the resulting data.

#b)
passengers %>% filter(Sex == "male") #filters rows where sex is male

#c) 
passengers %>% arrange(desc(Fare)) #arranges passenger fare in descending order

#d)
passengers %>% mutate(FamSize = Parch + SibSp) #creates new column by adding Parch and SibSp to reflect family size

#e) groups by sex and finds the mean fare and number of males and females, ignores missing data in calculations
passengers %>% group_by(Sex) %>% 
  summarise(meanFare = mean(Fare, na.rm = TRUE), numSurv = sum(Survived, na.rm = TRUE))

##Question 5

#read diabeties file and create data frame
diabetes <- read.csv("C:/Users/Russell/Documents/CSC 587/diabetes_train.csv")

#identifies column skin and sets quantile paramaters addiotionally ignoring empty values
quantile(diabetes$skin, probs = c(0.10, 0.30, 0.50, 0.60), na.rm = TRUE)
