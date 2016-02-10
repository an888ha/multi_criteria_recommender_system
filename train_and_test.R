# dividing and saving training and testing data
load("various_criterias.RData")
temp <- data_1
test_data <- data.frame(row.names = NULL);
temp <- data_1
for (i in 1:nrow(temp))
{
    row_curr <- temp[i,]
    t <- (row_curr > 0)
    t1 <- 1:ncol(temp)
    indexes <- t1[t]
    size <- round((length(indexes) * 20 )/100)
    indexes <- sample(indexes,size , replace = FALSE)
    for(j1 in 1:length(indexes))
    {
        j <- indexes[j1]
        h <- data.frame(i,j,data_1[i,j],data_2[i,j],data_3[i,j],data_4[i,j],data_5[i,j])
        data_1[i,j] = 0
        data_2[i,j] = 0
        data_3[i,j] = 0
        data_4[i,j] = 0
        data_5[i,j] = 0
        test_data <- rbind(test_data,h)
    }
}
test_data <- as.matrix(test_data)

save(test_data,file = "test_data.RData")

write.table(data_1,file = "data1.txt",row.names = FALSE , col.names = FALSE)
write.table(data_2,file = "data2.txt",row.names = FALSE , col.names = FALSE)
write.table(data_3,file = "data3.txt",row.names = FALSE , col.names = FALSE)
write.table(data_4,file = "data4.txt",row.names = FALSE , col.names = FALSE)
write.table(data_5,file = "data5.txt",row.names = FALSE , col.names = FALSE)

save(data_1,data_2,data_3,data_4,data_5,file = 'modified_criterias.RData')

