import pandas as pd
import datetime as dt
# Load cleaned data
df= pd.read_csv("D:\\Manjula\\Zalima\\Retail Analytics\\Week2 Pyrthon\\Clean_data.csv")
print(df)
print(df.head())
print(df.info())
df['InvoiceDate'] = pd.to_datetime(df["InvoiceDate"])
print(df.info())
# Today's date
Today_dt = df['InvoiceDate'].max() 
# RFM
rfm = df.groupby('CustomerID').agg({'InvoiceDate': lambda X:(Today_dt - X.max()).days,'InvoiceNo' : 'count', 'Revenue' : 'sum'})
rfm.columns = ['Recency', 'Frequency', 'Monetary']
print(rfm.head())
# Save RFM data
rfm.to_csv("D:\\Manjula\\Zalima\\Retail Analytics\\Week2 Pyrthon\\rfm_output.csv")