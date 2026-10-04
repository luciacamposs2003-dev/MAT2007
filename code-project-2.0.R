
# MAT2007 project

#Research question -> Are the selected characteristics of breast tumors significantly associated with benign or malignant tumor classification?
## Hypothesis -> malignant tumors have a larger area , are more asymmetric, with rougher texture and more concave compared to benign tumors
 

breast_cancer <- read.csv("breast-cancer.csv") #to read the dataset file
head(breast_cancer) #used to show the first few lines of every column

#to define the variable traits
traits <- c("area_mean", "symmetry_mean", "texture_mean", "concavity_mean")

# Put the results into a table
results <- data.frame(
    trait = traits,
    mean_benign = 0,
    mean_malignant = 0,
    SD_benign = 0,
    SD_malignant = 0,
    difference_mean = 0,
    SE_diff = 0,
    t_score = 0,
    p_value = 0
)

#Loop used to calculate the mean of the traits displayed on the terminal
for (i in 1:length(traits)) {
    trait <- traits[i]
    benign <- breast_cancer[breast_cancer$diagnosis == "B", trait]
    malignant <- breast_cancer[breast_cancer$diagnosis == "M", trait]
# sample sizes
n_b <- length(benign)
n_m <- length(malignant)

## calculation of the means for both groups, mean and malignant breast tumors 
    results$mean_benign[i] <- sum(benign) / n_b
    results$mean_malignant[i] <- sum(malignant) / n_m
#in this line we calculate the difference of the means for each trait
results$difference_mean[i] <- results$mean_malignant[i] - results$mean_benign[i]
#calculate the standard deviation around the mean from each trait
results$SD_benign[i] <- sqrt(sum((benign - results$mean_benign[i])^2) / (n_b - 1)) 
results$SD_malignant[i] <- sqrt(sum((malignant - results$mean_malignant[i])^2) / (n_m - 1))
#calculate the standard error (SE) of the difference mean
results$SE_diff[i] <- sqrt ((results$SD_benign[i]^2 / n_b) + (results$SD_malignant[i]^2 / n_m))
#t-test
ttest <- t.test(malignant, benign, var.equal = FALSE)
##p-value
results$p_value[i] <- ttest$p.value
## t-score 
results$t_score[i] <- ttest$statistic 
}
print(results)

## combining the R calculations into a data frame
## the following information will be stored into a file that will be read by python in order to make the graphs
results <- data.frame(
    traits = c("area", "symmetry", "texture", "concavity"),
    mean_malignant = c(978.3764151, 0.1929090, 21.6049057, 0.1607747),
    mean_benign = c(462.79019608, 0.17418599, 17.91476190, 0.04605762),
    SD_benign = c(134.28711815, 0.02480676, 3.99512459, 0.04344215),
    SD_malignant = c(367.93797761, 0.02763809, 3.77946992, 0.07501933),
    difference_mean =  c(515.58621902, 0.01872297, 3.69014376, 0.11471710),
    SE_diff = c(26.250520705, 0.002308002, 0.334795389, 0.005642077),
    t_score = c(19.640990, 8.112198, 11.022087, 20.332425),
    p_value = c(3.284366e-52, 5.957651e-15, 3.019055e-25, 3.742121e-58)
)

## export to working repository
write.csv(results, "tumor_analysis_results.csv", row.names = FALSE)


## visualisation of the results - code can be found on python file code-projectvisualisation.py







  
