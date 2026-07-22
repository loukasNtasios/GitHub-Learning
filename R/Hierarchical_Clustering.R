#Ntasios Loukas

###########################
# Hierarchical Clustering # 
###########################

data("USArrests")
library(cluster)

us <- data.frame(scale(USArrests))
original_summary <- sapply(USArrests, function(x) c(mean = mean(x), sd = sd(x)))
scaled_summary <- sapply(us, function(x) c(mean = mean(x), sd = sd(x)))
print(original_summary)
print(scaled_summary)



# define a function that takes a method x and computes the agglomerative coefficient 

# by the agnes function on the scaled data 

agglom_coef <- function(x){ 
  agnes(USArrests, method = x)$ac
} 

# define an array of the methods to be tested 
linkage_methods <- c("average", "single", "complete")

#apply the agglom_coef function to the methods defined earlier 

round(result <- sapply(linkage_methods, agglom_coef), 3)

# calculate the Euclidean distance matrix 

d_eucl <- dist(us, method = "euclidean")

# use the hclust method for calculating the agglomerative clustering 

clust_complete <- hclust(d_eucl, method = "complete")

plot(clust_complete, main = "Hierarchical Clustering Dendrogram", xlab = "Data Points", sub = NULL)

ind <- cutree(clust_complete, k = 5)

data_5_clusters <- cbind(USArrests, ind)

means_per_cluster <- aggregate(. ~ ind, data_5_clusters, mean)

round(means_per_cluster, 3)
