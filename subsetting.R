## a function to check the sparsity of the data
check_sparse <- function(x)
{
  a <- dim(x)
  x <- (x != 0)
  sum(x)/(a[1]*a[2]) 
}

## loading the data
load("movie.RData")
n_user <- 50 # a user must have watched 20 movies
n_movies <- 30 # a movie must have watched by 10 users
t <- (data_5 != 0)
sparse_before <- check_sparse(t)
# subnetting rows
r <- (rowSums(t) >= n_user)
t <- t[r,]
c <- (colSums(t) >= n_movies)
t <- t[,c]
sparse_later <- check_sparse(t)

data_1 <- data_1[r,c]
data_2 <- data_2[r,c]
data_3 <- data_3[r,c]
data_4 <- data_4[r,c]
data_5 <- data_5[r,c]

# writing data back so that our algorithms can use it.
write.table(data_1,file = "data1.txt",row.names = FALSE , col.names = FALSE)
write.table(data_2,file = "data2.txt",row.names = FALSE , col.names = FALSE)
write.table(data_3,file = "data3.txt",row.names = FALSE , col.names = FALSE)
write.table(data_4,file = "data4.txt",row.names = FALSE , col.names = FALSE)
write.table(data_5,file = "data5.txt",row.names = FALSE , col.names = FALSE)


