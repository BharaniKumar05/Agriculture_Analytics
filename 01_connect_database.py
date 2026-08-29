import sqlite3

# Connect to the database
conn = sqlite3.connect("database/agriculture.db")

# Create a cursor
cursor = conn.cursor()

# Create crop_production table
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

# Save changes
conn.commit()

print("Table Created Successfully!")

# Close connection
conn.close()