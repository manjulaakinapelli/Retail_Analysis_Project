# Import pandas
import pandas as pd
# Load Data
df = pd.read_csv("D:\\Manjula\\Retail_Analysis_git\\Retail_Analysis_Project\\Week2 Python\\Clean_data.csv")
print(df)
print(df.head())
print(df.info())

# Basket
Basket = df.groupby(['InvoiceNo', 'ProductName'])['Quantity'] \
           .sum().unstack().fillna(0)

# Convert to 0/1
#Basket = Basket.applymap(lambda x: 1 if x>0 else 0)
Basket = (Basket > 0).astype(int)
#Save
Basket.to_csv("D:\\Manjula\\Retail_Analysis_git\\Retail_Analysis_Project\\Week2 Python\\Basket_data.csv")
print("Market Basket Ready \n")
