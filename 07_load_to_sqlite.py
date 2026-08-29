import sqlite3
import pandas as pd

# Connect to SQLite database
conn = sqlite3.connect("database/agriculture.db")

print("Connected to Database!")

# ----------------------------
# Load Crop Production
# ----------------------------
crop_df = pd.read_csv("data/cleaned/crop_cleaned.csv")

crop_df.to_sql(
    "crop_production",
    conn,
    if_exists="replace",
    index=False
)

print("Crop Production Loaded Successfully!")

# ----------------------------
# Load Rainfall
# ----------------------------
rain_df = pd.read_csv("data/cleaned/rainfall_cleaned.csv")

rain_df.to_sql(
    "rainfall",
    conn,
    if_exists="replace",
    index=False
)

print("Rainfall Loaded Successfully!")

# ----------------------------
# Load Fertilizer
# ----------------------------
fert_df = pd.read_csv("data/cleaned/fertilizer_cleaned.csv")

fert_df.to_sql(
    "fertilizer",
    conn,
    if_exists="replace",
    index=False
)

print("Fertilizer Loaded Successfully!")

# Close database
conn.close()

print("All Data Loaded Successfully!")