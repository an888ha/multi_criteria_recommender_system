# A function to implement Resnick Formula
predict <- function(user_id,movie_id,criteria,k)
{
    if(criteria == 1)
    {
      data <- data_1
      sim <- sim1
    }
    if(criteria == 2)
    {
        data <- data_2
        sim <- sim2
    }
    if(criteria == 3)
    {
        data <- data_3
        sim <- sim3
    }
    if(criteria == 4)
    {
        data <- data_4
        sim <- sim4
    }
    data[data == 0] <- NA
    avg <- rowMeans(data,na.rm = TRUE);
    new_frame <- cbind(data[,movie_id] - avg ,sim[,user_id])
    new_frame <- new_frame[complete.cases(new_frame),]
    
    a <- dim(new_frame)
    res <- NA
    if(length(new_frame) > 3)
    {
    new_frame <- new_frame[order(new_frame[,2],decreasing = TRUE),]
    if(k <= a[1])
    {
        new_frame <- new_frame[1:k,]  
        denom <- sum(abs(new_frame[,2]))
        temp <- sum(new_frame[,1] * new_frame[,2])/denom
        res <- avg[user_id] + temp
    }
    }
    res
}

coverage <- function(x)
{
    sum(!is.na(x))/length(x)
}

MAE <- function(act_result,exp_result)
{
   temp <- cbind(act_result,exp_result)
   temp <- temp[complete.cases(temp),]
   a <- dim(temp)
   sum(abs(temp[,1]-temp[,2]))/a[1]
}

load("similiraity_matrices.RData")
load("modified_criterias.RData")
load("test_data.RData")
theta1 <- read.table("theta_1.txt",header = FALSE,sep = ",")
theta2 <- read.table("theta_2.txt",header = FALSE,sep = ",")

# finalizing the result in a data frame
final_result <- data.frame();
k_values <- seq(5,30,by = 5)

for(iter in 1:6)
{
  k <- k_values[iter]
  a <- dim(test_data)
  result <- matrix(integer(0) , nrow = a[1] , ncol = 7)
  
  for(i in 1:a[1])
  {
    user_id <- test_data[i,1]
    movie_id <- test_data[i,2]
    for(j in 1:4)
    {
      result[i,j] <- predict(user_id,movie_id,j,k)
    }
  }
  # Average based approach
  result[,5] <- rowMeans(result[,1:4])
  
  # Gradient_Descent
  for(i in 1:a[1])
  {
    user_id <- test_data[i,1]
    result[i,6] <- sum(theta1[user_id,] * c(1,result[i,1:4]))
  }
  
  for(i in 1:a[1])
  {
    user_id <- test_data[i,1]
    result[i,7] <- sum(theta2[user_id,] * c(1,result[i,1:4]))
  }
  m1 <- MAE(test_data[,3],result[,1])
  m2 <- MAE(test_data[,4],result[,2])
  m3 <- MAE(test_data[,5],result[,3])
  m4 <- MAE(test_data[,6],result[,4])
  m5 <- MAE(test_data[,7],result[,5])
  m6 <- MAE(test_data[,7],result[,6])
  m7 <- MAE(test_data[,7],result[,7])
  c1 <- coverage(result[,1])
  c2 <- coverage(result[,2])
  c3 <- coverage(result[,3])
  c4 <- coverage(result[,4])
  c5 <- coverage(result[,5])
  c6 <- coverage(result[,6])
  c7 <- coverage(result[,7])
  temp <- c(k,m1,c1,m2,c2,m3,c3,m4,c4,m5,c5,m6,c6,m7,c7)
  final_result <- rbind(final_result,temp)
}

temp_final_result <- final_result

colnames(final_result) <- c("k","mae1","c1","mae2","c2","mae3","c3","mae4","c4","mae_avg"
                            ,"c_avg","mae_grad","c_grad","mae_ga","c_ga")

library(xlsx)
write.xlsx(final_result,"project_result_1.xlsx","sheet1",row.names = FALSE)







