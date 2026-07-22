# Ntasios Loukas

############
# K-means  #
############

install.packages("readxl")
library(readxl)

#read the data from excel
SOIL_DATA_GR <- read_excel("c:/Users/Loukas/Desktop/DAMA/DAMA 51/Quiz4/SOIL DATA GR.xlsx")

# Prepare the data by performing the following steps: i) Remove the 1st column. ii) Count 
#the number of records with NA values in the data. iii) Omit the records with NA values 
#from the data by using the function na.omit(). iv) Scale the data. Then, fill in the 
#requested information below.

#i)  Remove the 1st column

new_SOIL_DATA_GR <-SOIL_DATA_GR[, -1]

# ii) Count the number of records with NA values in the data
count_na_values <- sum(is.na(new_SOIL_DATA_GR))
print(count_na_values)

#iii) Omit the records with NA values #from the data by using the function na.omit(
omit_SOIL_DATA_GR <- na.omit(new_SOIL_DATA_GR)

#iv) Scale the data
scale_SOIL_DATA_GR <- scale(omit_SOIL_DATA_GR)
scale_SOIL_DATA_GR <- data.frame(scale_SOIL_DATA_GR)
#Find the Number of omitted rows in the cleaned data
count_rows <- nrow(scale_SOIL_DATA_GR)
print(count_rows)

#The maximum value of the pH attribute in the scaled data 
ph_max <- max(scale_SOIL_DATA_GR$pH)
print(ph_max, 3)

#The Minimum value of the Sand % attribute in the scaled data
sand_min <- min(scale_SOIL_DATA_GR$Sand)
print(sand_min, 3)

#The median value of the Clay % attribute in the scaled data 
clay_median <- median(scale_SOIL_DATA_GR$Clay)
print(clay_median, 3)

install.packages("cluster")
library(cluster)

# Run the k-means algorithm for different values of the k parameter (from 1 to 6) and 
#create a scree plot of the within-cluster sum of squares in relation to k

# Create a vector to store the within-cluster sum of squares
wss <- vector()

set.seed(123)

# Run k-means algorithm
for(k in 1:6){
  wss[k] <- sum(kmeans(scale_SOIL_DATA_GR, centers = k)$withinss)
} 
print(wss)
#plot results
plot(1:6, wss, type="b", xlab = "number of clusters", ylab = "Number of squares")


# Repeat the process to create a scree plot of the average silhouette score in relation to 
#k (you will need to install the cluster R-package first). Which value of k is indicated as 
#the optimal number of clusters?


install.packages("cluster")
library(cluster)
set.seed(123)

silhouette_score <- function(k){
  km <- kmeans(scale_SOIL_DATA_GR, centers = k, nstart=25)
  ss <- silhouette(km$cluster, dist(scale_SOIL_DATA_GR))
  mean(ss[, 3])
}
k <- 2:10
avg_sil <- sapply(k, silhouette_score)
plot(k, type='b', avg_sil, xlab='Number of clusters', ylab='Average Silhouette Scores', frame=FALSE)



# Using the function fviz_cluster() of the factoextra R-package ,
#visualize the k-means clusters for k=3. Moreover, fill in the requested 
#information in the following table. 

install.packages("factoextra")
install.packages("cluster")
library(cluster)
library(factoextra)
install.packages("ggplot2")

#rum kmens for 3 centers
result <- kmeans(scale_SOIL_DATA_GR, 3)
print(result)

#visualization 
fviz_cluster(result, data = scale_SOIL_DATA_GR, geom = "point")

#find the cluster centers
cluster_centers <- result$centers
print(cluster_centers)

#What is the number of the Cluster that the data instance of row 100 has been assigned to? 
cluster_assignment_100 <- result$cluster[100]
print(cluster_assignment_100)

#What is the number of the Cluster that the data instance of row 101 has been assigned to? 
cluster_assignment_101 <- result$cluster[101]
print(cluster_assignment_101)


# Modify the scaled dataset so that it includes only the following 4 columns:
#Sand %, Clay %, Silt %, and pH. Using the function fviz_cluster() of the factoextra R package
#(make sure that have it installed first), visualize the k-means clusters for k=3. Compared with 
#the results of question d, which clustering seems to be better?

#remove the extra columns

new_scaled_data <- scale_SOIL_DATA_GR[, 1:4]

set.seed(123)
#run new kmeans for k=3
result_2 <- kmeans(new_scaled_data, 3)

#visualization 
fviz_cluster(result_2, data = new_scaled_data, geom = "point")
