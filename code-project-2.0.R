
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
## export to working repository
write.csv(results, "tumor_analysis_results.csv", row.names = FALSE)


## visualisation of the results - code can be found on python file code-projectvisualisation.py







  
