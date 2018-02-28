install.packages("xlsx") #for importing xlsx files (java version should be the latest one and 64 bit)
library(xlsx)

EastWestAirlines <- read.xlsx("C:/Users/SRIRAMA/Desktop/Data Science/Assignments and stuff/Clustering/EastWestAirlines.xlsx",sheet = "data")

normalized.data <- scale(EastWestAirlines[,2:12])

d <- dist(normalized.data,method = "euclidean")

fit <- hclust(d,method = "complete")

plot(fit)

plot(fit,hang = -1 )

groups <- cutree(fit,k=10)

rect.hclust(fit,k=10,border = "blue")

membership <- as.matrix(groups)

final <- data.frame(EastWestAirlines,membership)

final1 <- final[,c(ncol(final),1:(ncol(final)-1))]

write.xlsx(final1, file="final1.xlsx")

getwd()