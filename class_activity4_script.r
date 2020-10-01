#use built in iris dataset
#take a look at it 
head(iris)
#load in some tidyverse packages
library(dplyr)
library(ggplot2)

#####################################
##### Part 1: for loops         #####
#####################################

#Using only data for iris versicolor
#write a for loop
#that produces a regression table
#for each of the following relationships
#1. iris  sepal length x width
#2. iris  petal length x width
#3. iris sepal length x petal length
versic <- iris[iris$Species == "versicolor",]
regs <- vector("list", 3)
x <- c("Sepal.Length","Petal.Length","Sepal.Length")
y <- c("Sepal.Width","Petal.Width","Petal.Length")
for (i in 1:3){
  fit <- lm(versic[,x[i]] ~ versic[,y[i]])
  regs[[i]] <- fit
  print(summary(fit))
}

#####################################
##### Part 2: data in dplyr     #####
#####################################

#use dplyr to join data of maximum height
#to a new iris data frame
height <- data.frame(Species = c("virginica","setosa","versicolor"),
					Height.cm = c(60,100,11.8))
iris2 <- iris %>% 
            mutate(max.height = ifelse(Species == "virginica", 
                                    height[height[1] == "virginica"][2], 
                                    ifelse(Species == "setosa",
                                    height[height[1] == "setosa"][2],
                                    height[height[1] == "versicolor"][2])))
head(iris2)

#####################################
##### Part 3: plots in ggplot2  #####
#####################################
#look at base R scatter plot
plot(iris$Sepal.Length,iris$Sepal.Width)

#3a. now make the same plot in ggplot
p1 <- ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point(size = 2, shape = 1)
p1

#3b. make a scatter plot with ggplot and get rid of  busy grid lines
p2 <- ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point(size = 2, shape = 1) + 
  theme(axis.text.y = element_text(size=10),
        axis.text.x = element_text(size=10),
        axis.title.y = element_text(size=12),
        axis.title.x = element_text(size=12),
        panel.background = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA, size=1)
  )
p2

#3c.make a scatter plot with ggplot and get rid of grid lines,
#show species by color, and increase the point size
p3 <- ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point(shape = 1, size = 3, aes(color = Species)) + 
  theme(axis.text.y = element_text(size=10),
        axis.text.x = element_text(size=10),
        axis.title.y = element_text(size=12),
        axis.title.x = element_text(size=12),
        panel.background = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA, size=1)
  )
p3

#####################################
##### Question: how did         #####
##### arguments differ between  #####
##### plot and ggplot?          #####
#####################################		