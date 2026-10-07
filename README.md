# MAT2007 project - Breast cancer dataset analysis 

## Project's topic
This study investigates whether selected characteristics of breast tumors (area, symmetry, texture and concavity) differ between two groups of tumors, malignant and benign. These four traits were examined and compared between the two groups using statistical methods. 

The motivation behind this analysis is to investigate whether measurable differences in tumour traits are associated with malignancy. A statistically significant difference between benign and malignant tumours would indicate that the characteristic is associated with the tumour classification found in the dataset analysed. However, I would like to highlight that statistical significance alone is a not a tool to establish that a trait can be used as a diagnostic, rather with this project I wanted to provide an initial assessment and see if their analysis could provide future investigation as potential markers to distinguish between benign and malignant tumours, all the traits included in the dataset should be considered for a more extensive project.


## Research question and hypothesis 
Research question: are the selected traits of breast tumors significantly associated with benign or malignant tumor classification?

Hypothesis: malignant tumors have a larger area , are more asymmetric, with rougher texture and more concave compared to benign tumors
 


## Data set
Source: [Breast cancer dataset] (https://www.kaggle.com/datasets/yasserh/breast-cancer-dataset/data) 

File used: `breast-cancer.csv`

The dataset consists of around 17k datapoints, and it is composed of tumor ID, diagnosis (whether is B or M) and trai. Each row in the file represents a different tumor and each datapoint is the mean value for that specific trait and tumor, therefore it is not an absolute value. 
For this project around 2k datapoints were used.

It is important to take into account that the datapoints in this set are already the mean value for each trait and tumor when analysing it. 

## What the script does 
1.- Reads the dataset with the breast tumour values

2.- Calculates different statistical parameters for the two group of tumours in different traits chosen

n_benign, n_malignant is the sample number 

    2.1 The mean for benign and malignant tumours independently. Formula: sum(benign) / n_benign or sum(malignant) / n_malignan 
    
    2.1 The mean difference for every trait subtracting. Formula: mean_malignant - mean_benign
    
    2.2 The standard deviation (sd) for every trait for the two groups. Formula: sqrt(sum((benign - mean_benign^2) / n_benign - 1)  
    
    2.3 The standard error of the mean difference  was calculated following the pattern shown below. Formula:  SE_diff = sqrt(sd^2malignant/n_malignant +sd^2benign/n_benign)  

    2.4 A test was finally performed to obtain the p value and determine statistical significance 

  
## Ouput 
The R script generates different numerical values; we obtained 4 mean values gathering the datapoints for each group (benign and malignant) independently which was then used to calculate the mean difference. We also obtained the standard deviation in order to see how spread the values are around their mean. The standard error over the mean difference and finally a t test was conducted to measure statistical significance. 
These results are displayed on the R terminal once you run the code. 

- `code-project-2.0.R`

The pyhton script generates 2 figures and 1 table constructed from the measurements obtained 
- `Figure_1_MATproject.png`
- `Figure_2_MATproject.png`
- Table analysis statistical significance showing t-scores and p-value 


## How to run the code?
R interactive - `code-project-2.0.R`

Visuals were done with python- run the code reading the csv file with the data previously done in R - `code_projectvisualisation.py`





