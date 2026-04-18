# ============================================
# File: Segmentation.py
# Description: This script segments customers
# based on RFM scores into different categories
# like Champions, Loyal Customers, At Risk, etc.
# ============================================
# Import pandas
import pandas as pd 
# Load RFM output data
rfm = pd.read_csv("D:\\Manjula\\Retail_Analysis_git\\Retail_Analysis_Project\\Week2 Python\\rfm_output.csv")

# Preview data
print(rfm.head())

# Create RFM Scoring using quantiles(1 to 5)

rfm['R'] = pd.qcut(rfm['Recency'].rank(method='first'), 5)
rfm['F'] = pd.qcut(rfm['Frequency'].rank(method='first'), 5)
rfm['M'] = pd.qcut(rfm['Monetary'].rank(method='first'), 5)

rfm['R'] = rfm['R'].cat.codes + 1
rfm['F'] = rfm['F'].cat.codes + 1
rfm['M'] = rfm['M'].cat.codes + 1
# Define Segments based on RFM scores
def Segments(row) : 
    if row['R'] == 5 and row['F'] == 5:
        return 'Champions'
    elif row['R'] >=4 and row['F'] >= 3:
        return 'Loyal Customers'
    elif row['R'] <=2:
        return 'At Risk'
    else:
        return 'Others'
# Apply sefgmentation function    
rfm['Segment'] = rfm.apply(Segments, axis=1)

# Save final output
rfm.to_csv("D:\\Manjula\\Retail_Analysis_git\\Retail_Analysis_Project\\Week2 Python\\rfm_output1.csv", index=False)
print("Segmentation Done \n")
