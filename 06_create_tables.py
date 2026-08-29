import sqlite3

# Connect to SQLite database
conn = sqlite3.connect("database/agriculture.db")

cursor = conn.cursor()

# -------------------------
# Crop Production Table
# -------------------------
cursor.execute("""
CREATE TABLE IF NOT EXISTS crop_production (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    state_name TEXT,
    district_name TEXT,
    crop_year INTEGER,
    season TEXT,
    crop TEXT,
    area REAL,
    production REAL
)
""")

# -------------------------
# Rainfall Table
# -------------------------
cursor.execute("""
CREATE TABLE IF NOT EXISTS rainfall (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    state_ut_name TEXT,
    district TEXT,
    jan REAL,
    feb REAL,
    mar REAL,
    apr REAL,
    may REAL,
    jun REAL,
    jul REAL,
    aug REAL,
    sep REAL,
    oct REAL,
    nov REAL,
    dec REAL,
    annual REAL,
    jan_feb REAL,
    mar_may REAL,
    jun_sep REAL,
    oct_dec REAL
)
""")

# -------------------------
# Fertilizer Table
# -------------------------
cursor.execute("""
CREATE TABLE IF NOT EXISTS fertilizer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    temperature INTEGER,
    humidity INTEGER,
    moisture INTEGER,
    soil_type TEXT,
    crop_type TEXT,
    nitrogen INTEGER,
    potassium INTEGER,
    phosphorus INTEGER,
    fertilizer_name TEXT
)
""")

conn.commit()

print("All Tables Created Successfully!")

conn.close()