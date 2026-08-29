import pandas as pd

# Read the dataset
df = pd.read_csv("data/raw/crop_production.csv")

# Display original information
print("Original Shape:", df.shape)
print("\nMissing Values:")
print(df.isnull().sum())
print("\nDuplicate Rows:", df.duplicated().sum())

# Standardize column names
df.columns = df.columns.str.strip().str.lower()

# Remove duplicate rows
df = df.drop_duplicates()

# Remove rows where production is missing
df = df.dropna(subset=["production"])

# Reset index
df.reset_index(drop=True, inplace=True)

# Save cleaned dataset
df.to_csv("data/cleaned/crop_cleaned.csv", index=False)

print("\nCleaning Completed Successfully!")
print("Cleaned Shape:", df.shape)