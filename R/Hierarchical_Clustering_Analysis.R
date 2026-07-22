# Ntasios Loukas

####################################
# Hierarchical Clustering Analysis #
####################################

# Inspect the dataset, set the row names according to the values of the corresponding 
#fruit name column, and then, remove this column. Proceed to scale the data and then 
#fill in the requested information in the following table

#import data
fruits <- read.csv2("c:\\Users\\Loukas\\Desktop\\DAMA\\DAMA 51\\Quiz4\\fruits.csv")

#inspect data
str(fruits)

#set the row names according to the values of the corresponding 
#fruit name column 
rownames(fruits) <- fruits$Name

#remove this column
fruits <- fruits[, -1]

#scale the data
scale_fruits <- scale(fruits)
scale_fruits <- data.frame(scale_fruits)

#find median value of Sugar_S
media_Sugar_s <- median(scale_fruits$Sugars_g)
print(media_Sugar_s, 3)

#find max value of Energy_kcal
max_energy <- max(scale_fruits$Energy_kcal)
print(max_energy, 3)

#find min og water_g
min_water <- min(scale_fruits$Water_g)
print(min_water, 3)

#  Calculate the dissimilarity distance matrices of the dataset using the Euclidean
#distance method. Then, fill in the following tables with the requested distances. 
#Considering again the Euclidean distance, identify the fruit that is closest to Pear

#calculate the euclidian distance matrix
distance_matrix <- dist(scale_fruits, method = "euclidean")
print(distance_matrix)

#find euclidian distance orange to apple
orange_index <- which(rownames(scale_fruits) == "Orange")
apple_index <- which(rownames(scale_fruits) == "Apple")

#scale data
orange_row <- scale_fruits[orange_index, ]
apple_row <- scale_fruits[apple_index, ]

#find euclidean distance
euclidean_distance <- sqrt(sum((orange_row - apple_row)^2))
print(euclidean_distance, 3)

#find euclidian distance peach to banana
peache_index <- which(rownames(scale_fruits) == "Peach")
banana_index <- which(rownames(scale_fruits) == "Banana")

#scale data
peache_row <- scale_fruits[peache_index, ]
banana_row <- scale_fruits[banana_index, ]

#find euclidean distance peache - banana
euclidean_distance <- sqrt(sum((peache_row - banana_row)^2))
print(euclidean_distance, 3)

#find euclidian distance mango to lemon
mango_index <- which(rownames(scale_fruits) == "Mango")
lemon_index <- which(rownames(scale_fruits) == "Lemon")

#scale data
mango_row <- scale_fruits[mango_index, ]
lemon_row <- scale_fruits[lemon_index, ]

#find euclidean distance mango - lemon
euclidean_distance <- sqrt(sum((mango_row - lemon_row)^2))
print(euclidean_distance, 3)

#tranform distance matrix a normal matrix
dist_to_other_fruits <- as.matrix(distance_matrix)

#find row number of pear
pear_index <- which(rownames(dist_to_other_fruits) == "Pear")

#find the distances from pear to other fruits
pear_distances <- dist_to_other_fruits[pear_index, ]

#exclude non zero values
non_zero_distances <- pear_distances[pear_distances != 0]

#find min distance
smallest_distance <- min(non_zero_distances)
print(smallest_distance)

#identify the fruit closest to pear
closest_fruit <- names(pear_distances)[pear_distances == smallest_distance]
print(closest_fruit)

# Perform agglomerative hierarchical clustering using the Euclidean dissimilarity 
#distance matrix, for both complete and single linkage. Provide the dendrograms of both cases

# Perform hierarchical clustering with complete linkage
complete_clustering <- hclust(distance_matrix, method = "complete")

# Perform hierarchical clustering with single linkage
single_clustering <- hclust(distance_matrix, method = "single")

# Plot dendrograms

plot(complete_clustering, main = "Complete Linkage Dendrogram", xlab = "", ylab = "Height")
plot(single_clustering, main = "Single Linkage Dendrogram", xlab = "", ylab = "Height")

#  Assume that Orange, Grapefruit, Nectarine, Lemon, and Mandarin all belong to the family of Citrus fruits
# Is this also validated by your complete linkage clustering using 5 clusters, i.e. is there a cluster that 
#includes all of these fruits? Provide the names of the fruits that have been assigned to the same cluster as Orange.

#cut the results to 5 clusters
clusters_5 <- cutree(complete_clustering, k = 5)
print(clusters_5)

#list of fruits
fruits <- c("Orange", "Grapefruit", "Nectarine", "Lemon", "Mandarin")

# Identify the cluster containing Orange
orange_cluster <- clusters_5["Orange"]
print(orange_cluster)

# Identify the fruits in the same cluster as Orange
fruits_in_orange_cluster <- names(clusters_5[clusters_5 == orange_cluster])

# Print the fruits in the same cluster as Orange
print(fruits_in_orange_cluster)

# Using single linkage clustering, identify the maximum number of clusters for which all of the Citrus 
#fruits (Orange, Grapefruit, Nectarine, Lemon, and Mandarin) belong to the same cluster. 
#Also, identify the minimum height at which the dendrogram needs to be cut, in order for all the Citrus fruits 
#to be clustered together. Finally, plot the dendrogram depicting with a horizontal 
#line this minimum height at which the dendrogram needs to be cut.

# Function to check if all Citrus fruits belong to the same cluster
check_citrus_cluster <- function(clusters, citrus_fruits) {
  citrus_cluster <- clusters[citrus_fruits[1]]
  all(citrus_cluster == clusters[citrus_fruits])
}

# Maximum number of clusters for which all Citrus fruits belong to the same cluster
max_clusters <- 1
min_height <- NULL
for (k in 2:length(fruits)) {
  clusters <- cutree(single_clustering, k = k)
  if (check_citrus_cluster(clusters, fruits)) {
    max_clusters <- k
    min_height <- single_clustering$height[which.max(clusters)]
  } else {
    break
  }
}

#Print max clusters
print(max_clusters)

#Print min height
print(min_height, 3)

# Plot the dendrogram
plot(single_clustering, hang = -1, main = "Single Linkage Clustering Dendrogram")
abline(h = min_height, col = "red", lty = 2)
text(x = min_height, y = 0, labels = paste("Height =", round(min_height, 2)), pos = 4)
