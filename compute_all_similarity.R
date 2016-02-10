load("modified_criterias.RData")



#calculating all similarity matrices
data_1[data_1 == 0] <- NA
data_2[data_2 == 0] <- NA
data_3[data_3 == 0] <- NA
data_4[data_4 == 0] <- NA


sim1 <- cor(t(data_1),use = "pairwise.complete.obs" , method = "pearson")
sim2 <- cor(t(data_2),use = "pairwise.complete.obs" , method = "pearson")
sim3 <- cor(t(data_3),use = "pairwise.complete.obs" , method = "pearson")
sim4 <- cor(t(data_4),use = "pairwise.complete.obs" , method = "pearson")


#saving all similarity matrices for future use
save(sim1,sim2,sim3,sim4,file = 'similiraity_matrices.RData')