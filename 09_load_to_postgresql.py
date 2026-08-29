import pandas as pd
from sqlalchemy import create_engine

# ================================
# PostgreSQL Connection
# ================================

username = "postgres"
password = ""
host = "localhost"
port = "5432"
database = "agriculture"

engine = create_engine(
    f"postgresql+psycopg2://{username}:{password}@{host}:{port}/{database}"
)

print("Connected to PostgreSQL")

# ================================
# Load CSV Files
# ================================

crop_df = pd.read_csv("data/cleaned/crop_cleaned.csv")
rain_df = pd.read_csv("data/cleaned/rainfall_cleaned.csv")
fert_df = pd.read_csv("data/cleaned/fertilizer_cleaned.csv")

# ================================
# Upload Tables
# ================================

crop_df.to_sql(
    "crop_production",
    engine,
    if_exists="replace",
    index=False
)

print("Crop Production Uploaded")

rain_df.to_sql(
    "rainfall",
    engine,
    if_exists="replace",
    index=False
)

print("Rainfall Uploaded")

fert_df.to_sql(
    "fertilizer",
    engine,
    if_exists="replace",
    index=False
)

print("Fertilizer Uploaded")

print("\nAll Tables Uploaded Successfully!")