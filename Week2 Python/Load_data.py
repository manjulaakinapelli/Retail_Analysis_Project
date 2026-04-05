import pandas as pd
# Load data
df= pd.read_csv("D:\\Manjula\\Zalima\\Retail Analytics\\Week2 Python\\Fact_sales_cleaned.csv")
print(df)
print(df.head())
print(df.info())
# Convert Date
df['InvoiceDate'] = pd.to_datetime(df["InvoiceDate"])
print(df.info())
# Save cleaned file
df.to_csv("D:\\Manjula\\Zalima\\Retail Analytics\\Week2 Python\\Clean_data.csv", index=False)
