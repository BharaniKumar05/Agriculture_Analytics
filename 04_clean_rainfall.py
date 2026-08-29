import pandas as pd

# Read rainfall dataset
df = pd.read_csv("data/raw/district_rainfall.csv")

# Display original information
print("Original Shape:", df.shape)

print("\nMissing Values:")
print(df.isnull().sum())

print("\nDuplicate Rows:")
print(df.duplicated().sum())

# Rename columns
df.columns = (
    df.columns
      .str.strip()
      .str.lower()
      .str.replace(" ", "_")
      .str.replace("-", "_")
)

# Remove duplicate rows
df = df.drop_duplicates()

# Reset index
df.reset_index(drop=True, inplace=True)

# Save cleaned dataset
df.to_csv("data/cleaned/rainfall_cleaned.csv", index=False)

print("\nRainfall Dataset Cleaned Successfully!")
print("Cleaned Shape:", df.shape)