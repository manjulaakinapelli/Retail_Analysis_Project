import pandas as pd 
#Load RFM
rfm = pd.read_csv("D:\\Manjula\\Retail_Analysis_git\\Retail_Analysis_Project\\Week2 Python\\rfm_output.csv")
print(rfm.head())

#RFM Scoring
#rfm['R'] = pd.qcut(rfm['Recency'], 5, labels=[5,4,3,2,1], duplicates='drop')
#rfm['F'] = pd.qcut(rfm['Frequency'], 5, labels=[1,2,3,4,5], duplicates='drop')
#rfm['M'] = pd.qcut(rfm['Monetary'], 5, labels=[1,2,3,4,5], duplicates='drop')

rfm['R'] = pd.qcut(rfm['Recency'].rank(method='first'), 5)
rfm['F'] = pd.qcut(rfm['Frequency'].rank(method='first'), 5)
rfm['M'] = pd.qcut(rfm['Monetary'].rank(method='first'), 5)

rfm['R'] = rfm['R'].cat.codes + 1
rfm['F'] = rfm['F'].cat.codes + 1
rfm['M'] = rfm['M'].cat.codes + 1
# Segments
def Segments(row) : 
    if row['R'] == 5 and row['F'] == 5:
        return 'Champions'
    elif row['R'] >=4 and row['F'] >= 3:
        return 'Loyal Customers'
    elif row['R'] <=2:
        return 'At Risk'
    else:
        return 'Others'
    
rfm['Segment'] = rfm.apply(Segments, axis=1)

# Save final output
rfm.to_csv("D:\\Manjula\\Retail_Analysis_git\\Retail_Analysis_Project\\Week2 Python\\rfm_output1.csv", index=False)
print("Segmentation Done \n")