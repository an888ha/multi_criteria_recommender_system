# A function to implement gradient Descent 
theta_using_gradient <- function()
{
  load("modified_criterias.RData")
  a <- dim(data_1)
  nuser <- a[1]
  nmovies <- a[2]
  theta <- matrix(data = NA , nrow = nuser, ncol = 4)
  for(i in 1:nuser)
  {
     indexes <-  ( data_1[i,] != 0 )
     temp <- sum(indexes)
     theta[i,] <- c(NA,NA,NA,NA)
     if(temp >= 40) # a limit to number of observations
     {
     X <- data.frame(x1 = data_1[i,indexes],x2 = data_2[i,indexes],x3 = data_3[i,indexes],x4 = data_4[i,indexes],y = data_5[i,indexes])
     linear_model <- lm(y ~ x1 + x2 + x3 + x4 -1 , data = X)
     theta[i,] <- linear_model$coefficients
     }
  }
  theta
}
