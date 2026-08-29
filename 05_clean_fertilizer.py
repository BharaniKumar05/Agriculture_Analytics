import pandas as pd

# Read Fertilizer Dataset
df = pd.read_csv("data/raw/fertilizer_prediction.csv")

# Display dataset information
print("Original Shape:", df.shape)

print("\nMissing Values:")
print(df.isnull().sum())

print("\nDuplicate Rows:")
print(df.duplicated().sum())

# Standardize column names
df.columns = (
    df.columns
    .str.strip()
    .str.lower()
    .str.replace(" ", "_")
)

# Correct spelling mistakes
df.rename(columns={
    "temparature": "temperature",
    "phosphorous": "phosphorus",
    "fertilizer_name": "fertilizer_name"
}, inplace=True)

# Remove duplicate rows
df = df.drop_duplicates()

# Reset index
df.reset_index(drop=True, inplace=True)

# Save cleaned dataset
df.to_csv(
    "data/cleaned/fertilizer_cleaned.csv",
    index=False
)

print("\nFertilizer Dataset Cleaned Successfully!")
print("Cleaned Shape:", df.shape)

print("\nFinal Columns:")
print(df.columns.tolist())