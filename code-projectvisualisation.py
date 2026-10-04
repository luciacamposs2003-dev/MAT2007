## Visualisation of the results (MAT2007 project)

# 1.- Error bar plot with uncertainties comparing the four different traits 
import matplotlib.pyplot as plt
import pandas as pd 

##  load the data calculated in R
df = pd.read_csv("tumor_analysis_results.csv")

# Clean up any accidental hidden spaces in the text columns
df['traits'] = df['traits'].astype(str).str.strip()

#  Setup a 2x2 grid layout figure
fig, axes = plt.subplots(2, 2, figsize=(12, 10))
axes = axes.flatten()  # Flatten the 2D grid into a 1D list to loop easily

colors = ['#4C72B0', '#C44E52']  # Blue for Benign, Red for Malignant
categories = ['Benign', 'Malignant']

# Loop through your rows and plot each one in its own grid box
for i, (index, row) in enumerate(df.iterrows()):
    if i >= 4:  # Safety check to not break if you have more than 4 rows
        break
        
    trait_name = row['traits']
    means = [row['mean_benign'], row['mean_malignant']]
    sds = [row['SD_benign'], row['SD_malignant']]
    
    # Target the specific grid box using axes[i]
    axes[i].bar(
        x=categories, 
        height=means, 
        yerr=sds, 
        capsize=6, 
        color=colors, 
        edgecolor='black',
        alpha=0.85,
        width=0.5
    )
    
    # Customizing each sub-graph
    axes[i].set_title(f'Mean {trait_name.capitalize()} (±1 SD)', fontsize=12, fontweight='bold', pad=10)
    axes[i].set_ylabel('Value', fontsize=10)
    axes[i].grid(axis='y', linestyle='--', alpha=0.5)

# Overall layout improvements
plt.suptitle('Comparison of Tumor Traits and Uncertainties', fontsize=15, fontweight='bold', y=0.98)
plt.tight_layout()

#  Save the full combined matrix so you can view it directly as an image file
plt.savefig("all_tumor_traits_comparison.png", dpi=300)
plt.show()


# Figure 2- to represent t test results 
## the objective is to plot a 2x2 grid of dot plots showing the Welch's t-test results (Mean_diff vs SE) for tumot traits

import matplotlib.pyplot as plt 
data = {
    'Area':      {'diff': 515.586, 'se': 26.2505, 'p': '< 0.001'},
    'Symmetry':  {'diff': 0.0187,  'se': 0.002308, 'p': '< 0.001'},
    'Texture':   {'diff': 3.6901,   'se': 0.334795,  'p': '< 0.001'},
    'Concavity': {'diff': 0.1147,  'se': 0.00564, 'p': '< 0.001'}
}


# Initialize a 2x2 grid of subplots (one for each trait)
fig, axes = plt.subplots(2, 2, figsize=(11, 8))
axes_flat = axes.flatten()
## first line creates a figure containing 4 separate plot areas 
## the second line converts the 2D matrix of subplots into a simple 1D list so it can be looped easily

# Loop through each trait and build its individual plot panel
for ax, (trait, stats) in zip(axes_flat, data.items()):
    ## pairs each trait with one of the fours subplots
    # Plot the Mean Difference point and its Standard Error bar
    ax.errorbar(x=stats['diff'], y=[trait], xerr=stats['se'], 
                fmt='o', color='#d95f02', ecolor='#2b2b2b', 
                elinewidth=2.5, capsize=6, markersize=9, 
                label='Mean Diff ± SE')
    
    # Add a vertical reference line at 0 (representing the Null Hypothesis)
    ax.axvline(x=0, color='gray', linestyle='--', linewidth=1.2, alpha=0.8)
    
    # Text annotation for the p-value
    # Adjust position dynamically based on the error bar span
    text_x = stats['diff'] + stats['se'] + (abs(stats['diff']) * 0.1)
    ax.text(text_x, 0, f"p = {stats['p']}", va='center', ha='left', 
            fontsize=11, fontweight='bold', color='#1f78b4')
    
    #  layouts and borders
    ax.set_title(f'{trait} Comparison', fontsize=12, fontweight='bold', pad=8)
    ax.set_xlabel('Mean Difference (Malignant - Benign)', fontsize=10)
    ax.grid(axis='x', linestyle=':', alpha=0.5)
    
    # Clean up the Y-axis since there is only one trait line per box
    ax.tick_params(axis='y', left=False)
    
    # Expand X limits slightly to ensure the p-value text does not get cut off at the edge of the frame 
    xlims = ax.get_xlim()
    ax.set_xlim(min(xlims[0], -stats['se']), xlims[1] + (abs(stats['diff']) * 0.4))

# General figure styling
plt.suptitle('t-Test Results: Mean Differences & Standard Errors Across Tumor Traits', 
             fontsize=14, fontweight='bold', y=0.98)  ##adds the main overall title centered at the top
plt.tight_layout() ## adjusts the spacing on the plot so titles and substitles do not overlap

# display the plot
plt.show()






