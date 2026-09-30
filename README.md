# MAT2007 project - Breast cancer dataset analysis 

## Project's topic
The objective of this project is to conduct data analysis through different traits across two groups of breast tumours, benign and malignant in order to determine which traits are associated to each group. 

The traits chosen were; area, asymmetry, texture and concavity


This was conducted using statistical measurements such as the mean, mean difference, statistical uncertainty, statistical error and finally a t test to obtain the p value and determine if the values are statistically significant and being able to draw conclusions from the biological perspective.  


## Research question and hypothesis 
How do tumor characteristics differ between benign and malignant breast tumors, and what is the statistical uncertainty associated with these differences?

Hypothesis: malignant tumors have a larger area , are more asymmetric, with rougher texture and more concave compared to benign tumors
 


## Data set
Source: [Breast cancer dataset] (https://www.kaggle.com/datasets/yasserh/breast-cancer-dataset/data) 

File used: breast-cancer.cvs

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
    
    2.4 A test was finally performed to obtain the p value

    SE_diff = sqrt(s^2malignant/n_malignant +s^2benign/n_benign) 

    


## Ouput 
The script generates 2 figures and 1 table constructed from the measurements obtained 
- `Figure_1_MATproject.png`
- `Figure_2_MATproject.png`
- Table analysis statistical uncertainty through p value 


## How to run the code?
R interactive - code-project-2.0.R

Visuals were done with python- run the code reading the csv file with the data previously done in R - codevisualisation.py

code-projectvisuals.py



