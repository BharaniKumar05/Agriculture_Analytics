


-- ==========================================================
-- CROP PRODUCTION SQL QUERIES
-- PostgreSQL Compatible
-- ==========================================================

-- Query 1 : View All Records
SELECT * FROM crop_production;

-- Query 2 : First 10 Records
SELECT * FROM crop_production
LIMIT 10;

-- Query 3 : Total Records
SELECT COUNT(*) AS total_records
FROM crop_production;

-- Query 4 : Total States
SELECT COUNT(DISTINCT state_name) AS total_states
FROM crop_production;

-- Query 5 : Total Districts
SELECT COUNT(DISTINCT district_name) AS total_districts
FROM crop_production;

-- Query 6 : Total Crops
SELECT COUNT(DISTINCT crop) AS total_crops
FROM crop_production;

-- Query 7 : Total Seasons
SELECT COUNT(DISTINCT season) AS total_seasons
FROM crop_production;

-- Query 8 : Total Production
SELECT ROUND(CAST(SUM(production) AS NUMERIC),2) AS total_production
FROM crop_production;

-- Query 9 : Total Area
SELECT ROUND(CAST(SUM(area) AS NUMERIC),2) AS total_area
FROM crop_production;

-- Query 10 : Average Production
SELECT ROUND(CAST(AVG(production) AS NUMERIC),2) AS average_production
FROM crop_production;

-- Query 11 : Maximum Production
SELECT MAX(production) AS maximum_production
FROM crop_production;

-- Query 12 : Minimum Production
SELECT MIN(production) AS minimum_production
FROM crop_production;

-- Query 13 : Production by State
SELECT
    state_name,
    ROUND(CAST(SUM(production) AS NUMERIC),2) AS total_production
FROM crop_production
GROUP BY state_name
ORDER BY total_production DESC;

-- Query 14 : Area by State
SELECT
    state_name,
    ROUND(CAST(SUM(area) AS NUMERIC),2) AS total_area
FROM crop_production
GROUP BY state_name
ORDER BY total_area DESC;

-- Query 15 : Production by Crop
SELECT
    crop,
    ROUND(CAST(SUM(production) AS NUMERIC),2) AS total_production
FROM crop_production
GROUP BY crop
ORDER BY total_production DESC;

-- Query 16 : Area by Crop
SELECT
    crop,
    ROUND(CAST(SUM(area) AS NUMERIC),2) AS total_area
FROM crop_production
GROUP BY crop
ORDER BY total_area DESC;

-- Query 17 : Production by Season
SELECT
    season,
    ROUND(CAST(SUM(production) AS NUMERIC),2) AS total_production
FROM crop_production
GROUP BY season
ORDER BY total_production DESC;

-- Query 18 : Area by Season
SELECT
    season,
    ROUND(CAST(SUM(area) AS NUMERIC),2) AS total_area
FROM crop_production
GROUP BY season
ORDER BY total_area DESC;

-- Query 19 : Production by Year
SELECT
    crop_year,
    ROUND(CAST(SUM(production) AS NUMERIC),2) AS total_production
FROM crop_production
GROUP BY crop_year
ORDER BY crop_year;

-- Query 20 : Top 10 States
SELECT
    state_name,
    ROUND(CAST(SUM(production) AS NUMERIC),2) AS production
FROM crop_production
GROUP BY state_name
ORDER BY production DESC
LIMIT 10;

-- Query 21 : Top 10 Districts
SELECT
    district_name,
    ROUND(CAST(SUM(production) AS NUMERIC),2) AS production
FROM crop_production
GROUP BY district_name
ORDER BY production DESC
LIMIT 10;

-- Query 22 : Top 10 Crops
SELECT
    crop,
    ROUND(CAST(SUM(production) AS NUMERIC),2) AS production
FROM crop_production
GROUP BY crop
ORDER BY production DESC
LIMIT 10;

-- Query 23 : Average Area by Crop
SELECT
    crop,
    ROUND(CAST(AVG(area) AS NUMERIC),2) AS average_area
FROM crop_production
GROUP BY crop
ORDER BY average_area DESC;

-- Query 24 : Rice Production
SELECT *
FROM crop_production
WHERE crop = 'Rice';

-- Query 25 : Wheat Production
SELECT *
FROM crop_production
WHERE crop = 'Wheat';

-- Query 26 : Tamil Nadu Production
SELECT *
FROM crop_production
WHERE state_name = 'Tamil Nadu';

-- Query 27 : Kharif Season
SELECT *
FROM crop_production
WHERE season = 'Kharif';

-- Query 28 : Rabi Season
SELECT *
FROM crop_production
WHERE season = 'Rabi';

-- Query 29 : Production Greater Than 1,000,000
SELECT *
FROM crop_production
WHERE production > 1000000;

-- Query 30 : Year-wise Rice Production
SELECT
    crop_year,
    ROUND(CAST(SUM(production) AS NUMERIC),2) AS production
FROM crop_production
WHERE crop = 'Rice'
GROUP BY crop_year
ORDER BY crop_year;