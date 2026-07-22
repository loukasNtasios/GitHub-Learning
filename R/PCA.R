
### Ntasios Loukas  ###


# Read the data in R using read.csv function into a data frame. Use the name 
#wine_data for this data frame. Report in the table below the type of magnesium and 
#flavonoids attributes. Then, print the first five rows of the dataset and fill in the 
#corresponding table only the missing values of the selected attributes for the first two 
#rows

#read data
wine_data <- read.csv("C:/Users/ntasi/Desktop/DAMA/DAMA/DAMA 51/Quiz 2/wine.csv", sep=";")
View(wine_data)

#print result for magnisium type
print(typeof(wine_data$magnesium))

#print result for flavonoids type
print(typeof(wine_data$flavonoids))

#print the first 5 rows
head(wine_data, 5)

### Exclude the target column from your data, using R, calculate the mean and 
#standard deviation of all attributes. Report in the Table below the missing values for 
#the mean and standard deviation only for the given attributes.

#exclude the target column
wine_data2 <- subset(wine_data, select = -c(target))



#find the mean values
mean(wine_data2$alcohol)
mean(wine_data2$total_phenols)
mean(wine_data2$color_intensity)
mean(wine_data2$proline)

#find the standard deviation
sd(wine_data2$alcohol)
sd(wine_data2$total_phenols)
sd(wine_data2$color_intensity)
sd(wine_data2$proline)

# Standardize the data and use a PCA technique to extract the principal components
#Using R, calculate the variance explained by each principal component and report in the Table 
#provided the percentage of variance explained by each of the first five principal components

#standarize the dataser
standardized_dataset <- scale(wine_data2)

#calculate the PCA
pca_result <- prcomp(standardized_dataset, center = TRUE, scale. = TRUE)

#calculate the Varinace explaiend
variance_explained <- pca_result$sdev^2 / sum(pca_result$sdev^2) * 100

#calculate variance explained for each principal component
variance_table <- data.frame(   Principal_Component = paste("PC", 1:5),   Variance_Explained = variance_explained[1:5] )
View(variance_table)

#  By using R create a scree plot

install.packages("ggplot2")
library(ggplot2)

qplot(c(1:13), variance_explained) +
       geom_line() +  
       xlab("Principal Component")  +
       ylab("Variance Explained") +
       ggtitle("Scree Plot") +
       ylim(0, 100)