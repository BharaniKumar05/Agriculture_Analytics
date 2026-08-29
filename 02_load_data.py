
import pandas as pd

# Read dataset only once
df = pd.read_csv("data/raw/crop_production.csv")

# View first 5 rows
print(df.head())

# Shape
print(df.shape)

# Column names
print(df.columns)

# Data types
print(df.info())

# Missing values
print(df.isnull().sum())

# Duplicate rows
print(df.duplicated().sum())

# Rename columns
df.columns = (
    df.columns
    .str.strip()
    .str.lower()
)

# Remove duplicates
df = df.drop_duplicates()

# Save cleaned dataset
df.to_csv("data/cleaned/crop_cleaned.csv", index=False)

print("Cleaning completed!")