import sqlite3
import pandas as pd

conn=sqlite3.connect("database/agriculture.db")

def run_query(title,query):
    print("\n"+"="*70)
    print(title)
    print("="*70)
    try:
        print(pd.read_sql_query(query,conn))
    except Exception as e:
        print("Error:",e)

queries=[
("Query 1 : View All Data","SELECT * FROM crop_production LIMIT 20;"),
("Query 2 : First 10 Records","SELECT * FROM crop_production LIMIT 10;"),
("Query 3 : Total Records","SELECT COUNT(*) AS Total_Records FROM crop_production;"),
("Query 4 : Total States","SELECT COUNT(DISTINCT state_name) AS Total_States FROM crop_production;"),
("Query 5 : Total Districts","SELECT COUNT(DISTINCT district_name) AS Total_Districts FROM crop_production;"),
("Query 6 : Total Crops","SELECT COUNT(DISTINCT crop) AS Total_Crops FROM crop_production;"),
("Query 7 : Total Seasons","SELECT COUNT(DISTINCT season) AS Total_Seasons FROM crop_production;"),
("Query 8 : List States","SELECT DISTINCT state_name FROM crop_production ORDER BY state_name;"),
("Query 9 : List Crops","SELECT DISTINCT crop FROM crop_production ORDER BY crop;"),
("Query 10 : List Seasons","SELECT DISTINCT season FROM crop_production;"),
("Query 11 : Total Production","SELECT ROUND(SUM(production),2) AS Total_Production FROM crop_production;"),
("Query 12 : Total Area","SELECT ROUND(SUM(area),2) AS Total_Area FROM crop_production;"),
("Query 13 : Average Production","SELECT ROUND(AVG(production),2) AS Avg_Production FROM crop_production;"),
("Query 14 : Maximum Production","SELECT MAX(production) AS Max_Production FROM crop_production;"),
("Query 15 : Minimum Production","SELECT MIN(production) AS Min_Production FROM crop_production;"),
("Query 16 : Production by State","SELECT state_name,ROUND(SUM(production),2) Total_Production FROM crop_production GROUP BY state_name ORDER BY Total_Production DESC;"),
("Query 17 : Production by Crop","SELECT crop,ROUND(SUM(production),2) Total_Production FROM crop_production GROUP BY crop ORDER BY Total_Production DESC;"),
("Query 18 : Production by Season","SELECT season,ROUND(SUM(production),2) Production FROM crop_production GROUP BY season ORDER BY Production DESC;"),
("Query 19 : Production by Year","SELECT crop_year,ROUND(SUM(production),2) Production FROM crop_production GROUP BY crop_year ORDER BY crop_year;"),
("Query 20 : Area by State","SELECT state_name,ROUND(SUM(area),2) Total_Area FROM crop_production GROUP BY state_name ORDER BY Total_Area DESC;"),
("Query 21 : Top 10 States","SELECT state_name,ROUND(SUM(production),2) Production FROM crop_production GROUP BY state_name ORDER BY Production DESC LIMIT 10;"),
("Query 22 : Top 10 Crops","SELECT crop,ROUND(SUM(production),2) Production FROM crop_production GROUP BY crop ORDER BY Production DESC LIMIT 10;"),
("Query 23 : Top 10 Districts","SELECT district_name,ROUND(SUM(production),2) Production FROM crop_production GROUP BY district_name ORDER BY Production DESC LIMIT 10;"),
("Query 24 : Top 5 Years","SELECT crop_year,ROUND(SUM(production),2) Production FROM crop_production GROUP BY crop_year ORDER BY Production DESC LIMIT 5;"),
("Query 25 : Top Seasons","SELECT season,ROUND(SUM(production),2) Production FROM crop_production GROUP BY season ORDER BY Production DESC;"),
("Query 26 : Rice Production","SELECT * FROM crop_production WHERE crop='Rice';"),
("Query 27 : Tamil Nadu Records","SELECT * FROM crop_production WHERE state_name='Tamil Nadu';"),
("Query 28 : High Production","SELECT * FROM crop_production WHERE production>1000000;"),
("Query 29 : Years 2010-2015","SELECT * FROM crop_production WHERE crop_year BETWEEN 2010 AND 2015;"),
("Query 30 : Kharif","SELECT * FROM crop_production WHERE season='Kharif';"),
("Query 31 : State Avg","SELECT state_name,ROUND(AVG(production),2) Avg_Production FROM crop_production GROUP BY state_name;"),
("Query 32 : Crop Avg Area","SELECT crop,ROUND(AVG(area),2) Avg_Area FROM crop_production GROUP BY crop;"),
("Query 33 : Yield","SELECT crop,ROUND(SUM(production)/SUM(area),2) Yield FROM crop_production GROUP BY crop;"),
("Query 34 : Rice by Year","SELECT crop_year,ROUND(SUM(production),2) Production FROM crop_production WHERE crop='Rice' GROUP BY crop_year;"),
("Query 35 : District Count","SELECT state_name,COUNT(DISTINCT district_name) Districts FROM crop_production GROUP BY state_name;"),
("Query 36 : Highest Rainfall","SELECT district,annual FROM rainfall ORDER BY annual DESC LIMIT 10;"),
("Query 37 : Avg Rainfall","SELECT ROUND(AVG(annual),2) Avg_Rainfall FROM rainfall;"),
("Query 38 : Fertilizer Count","SELECT fertilizer_name,COUNT(*) Total FROM fertilizer GROUP BY fertilizer_name;"),
("Query 39 : Fertilizer by Soil","SELECT soil_type,fertilizer_name FROM fertilizer;"),
("Query 40 : Join","SELECT c.state_name,c.district_name,c.crop,c.production,r.annual FROM crop_production c JOIN rainfall r ON c.district_name=r.district;")
]

for t,q in queries:
    run_query(t,q)

conn.close()
print("\nDone.")
