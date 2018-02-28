library(readr)
crime_data <- read_csv("C:/Users/SRIRAMA/Desktop/Data Science/Assignments and stuff/Clustering/crime_data.csv")
View(crime_data)

#scaling 
scaledata <- scale(crime_data[,2:5])
#lets find distance between the data points
d <- dist(scaledata,method = "euclidean")

#hierarchical clustering
clust <- hclust(d,method = "complete")
plot(clust)
plot(clust,hang= -1)

#clustering is done so lets group the clusters
groups <- cutree(clust,k=5)
rect.hclust(clust,border = "blue",k=5)

membership <- as.matrix(groups)
endmodel <- data.frame(crime_data,membership)
final.model <- endmodel[,c(ncol(endmodel),1:(ncol(endmodel)-1))]
write.xlsx(final.model,file="newcrime.data.xlsx")
getwd()
