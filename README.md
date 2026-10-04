# MAT2007 project - Breast cancer dataset analysis 

## Project's topic
This study investigates whether selected characteristics of breast tumors (area, symmetry, texture and concavity) differ between two groups of tumors, malignant and benign. These four traits were examined and compared between the two groups using statistical methods. The mean, standard deviation were calculated for each characteristic, followed by a t-test with the objective of determining if the observed differences are statistically significant. 

The motivation behind this analysis is to investigate whether measurable differences in tumour traits are associated with malignancy. A statistically significant difference between benign and malignant tumours would indicate that the characteristic is associated with the tumour classification found in the dataset analysed. However, I would like to highlight that statistical significance alone is a not a tool to establish that a trait can be used as a diagnostic, rather with this project I wanted to provide an initial assessment and see if their analysis could provide future investigation as potential markers to distinguish between benign and malignant tumours, all the traits included in the dataset should be considered for a more extensive project.


## Research question and hypothesis 
Research question: are the selected characteristics of breast tumors significantly associated with benign or malignant tumor classification?

Hypothesis: malignant tumors have a larger area , are more asymmetric, with rougher texture and more concave compared to benign tumors
 


## Data set
Source: [Breast cancer dataset] (https://www.kaggle.com/datasets/yasserh/breast-cancer-dataset/data) 

File used: `breast-cancer.csv`

## What the script does 
1.- Reads the dataset with the breast tumour values

2.- Calculates different statistical parameters for the two group of tumours in different traits chosen

    2.1 The mean for benign and malignant tumours independently 
    
    2.1 The mean difference for every trait subtracting mean_malignant - mean_benign
    
    2.2 The standard deviation (sd) for every trait for the two groups 
    
    2.3 The standard error of the mean difference  was calculated following the pattern shown below

    Area = (malignant SD + benign SD) --> combined into 1 standard error
    
    Symmetry  = (malignant SD + benign SD) --> combined into 1 standard error
    etc
    
    2.4 A test was finally performed to obtain the p value and determine statistical significance 

    SE_diff = sqrt(s^2malignant/n_malignant +s^2benign/n_benign) 

    


## Ouput 
The script generates 2 figures and 1 table constructed from the measurements obtained 
- `Figure_1_MATproject.png`
- `Figure_2_MATproject.png`
- Table analysis statistical significance showing t-scores and p-value 


## How to run the code?
R interactive - `code-project-2.0.R`

Visuals were done with python- run the code reading the csv file with the data previously done in R - `code_projectvisualisation.py`





