## module to create 5 user * movies matrix for our program
data <- read.csv("data_movies.txt",header = FALSE ,sep = "")
colnames(data) <- c("user_id","criteria1","criteria2","criteria3","criteria4","overall","movie_id","inc_num")

data_1 <- matrix(data = integer(1),nrow = 6078,ncol = 976)
data_2 <- data_1
data_3 <- data_2
data_4 <- data_3
data_5 <- data_4
for(i in 1:nrow(data))
{
    data_1[data$user_id[i],data$movie_id[i]] <- data$criteria1[i]
    data_2[data$user_id[i],data$movie_id[i]] <- data$criteria2[i]
    data_3[data$user_id[i],data$movie_id[i]] <- data$criteria3[i]
    data_4[data$user_id[i],data$movie_id[i]] <- data$criteria4[i]
    data_5[data$user_id[i],data$movie_id[i]] <- data$overall[i]
}
save(data_1,data_2,data_3,data_4,data_5,file = 'movie.RData')
