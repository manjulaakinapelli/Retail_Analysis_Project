# Import pandas
import pandas as pd
# Load the CSV file into a DataFrame
df = pd.read_csv("D:\\Manjula\\Retail_Analysis_git\\Retail_Analysis_Project\\Week2 Python\\Clean_data.csv")
print(df)
# Display the first 5 rows and info
print(df.head())
print(df.info())

# ----------------------------------
# Market Basket Preparation
# ----------------------------------

# Group data by InvoiceNo and ProductName
# Then sum the Quantity for each product in each invoice
Basket = df.groupby(['InvoiceNo', 'ProductName'])['Quantity'] \
           .sum().unstack().fillna(0)

# This creates a matrix:
# Rows → Invoice numbers
# Columns → Product names
# Values → Quantity of each product

# ----------------------------------
# Convert Quantity to Binary (0/1)
# ----------------------------------

# If quantity > 0 → 1 (product purchased)
# If quantity = 0 → 0 (product not purchased)
#Basket = Basket.applymap(lambda x: 1 if x>0 else 0)
Basket = (Basket > 0).astype(int)
#Save
Basket.to_csv("D:\\Manjula\\Retail_Analysis_git\\Retail_Analysis_Project\\Week2 Python\\Basket_data.csv")
print("Market Basket Ready \n")
