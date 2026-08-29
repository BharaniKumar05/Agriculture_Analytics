

-- ==========================================================
-- FERTILIZER SQL QUERIES
-- Database : PostgreSQL
-- Project  : Agriculture Analytics Platform
-- ==========================================================

-- Query 1 : View All Records
SELECT * FROM fertilizer;

-- Query 2 : First 10 Records
SELECT * FROM fertilizer
LIMIT 10;

-- Query 3 : Total Records
SELECT COUNT(*) AS total_records
FROM fertilizer;

-- Query 4 : Total Soil Types
SELECT COUNT(DISTINCT soil_type) AS total_soil_types
FROM fertilizer;

-- Query 5 : Total Crop Types
SELECT COUNT(DISTINCT crop_type) AS total_crop_types
FROM fertilizer;

-- Query 6 : Total Fertilizers
SELECT COUNT(DISTINCT fertilizer_name) AS total_fertilizers
FROM fertilizer;

-- Query 7 : Average Temperature
SELECT ROUND(CAST(AVG(temperature) AS NUMERIC),2) AS average_temperature
FROM fertilizer;

-- Query 8 : Average Humidity
SELECT ROUND(CAST(AVG(humidity) AS NUMERIC),2) AS average_humidity
FROM fertilizer;

-- Query 9 : Average Moisture
SELECT ROUND(CAST(AVG(moisture) AS NUMERIC),2) AS average_moisture
FROM fertilizer;

-- Query 10 : Average Nitrogen
SELECT ROUND(CAST(AVG(nitrogen) AS NUMERIC),2) AS average_nitrogen
FROM fertilizer;

-- Query 11 : Average Potassium
SELECT ROUND(CAST(AVG(potassium) AS NUMERIC),2) AS average_potassium
FROM fertilizer;

-- Query 12 : Average Phosphorus
SELECT ROUND(CAST(AVG(phosphorus) AS NUMERIC),2) AS average_phosphorus
FROM fertilizer;

-- Query 13 : Fertilizer Distribution
SELECT
    fertilizer_name,
    COUNT(*) AS total_records
FROM fertilizer
GROUP BY fertilizer_name
ORDER BY total_records DESC;

-- Query 14 : Soil Type Distribution
SELECT
    soil_type,
    COUNT(*) AS total_records
FROM fertilizer
GROUP BY soil_type
ORDER BY total_records DESC;

-- Query 15 : Crop Type Distribution
SELECT
    crop_type,
    COUNT(*) AS total_records
FROM fertilizer
GROUP BY crop_type
ORDER BY total_records DESC;

-- Query 16 : Average Nitrogen by Crop
SELECT
    crop_type,
    ROUND(CAST(AVG(nitrogen) AS NUMERIC),2) AS avg_nitrogen
FROM fertilizer
GROUP BY crop_type
ORDER BY avg_nitrogen DESC;

-- Query 17 : Average Potassium by Crop
SELECT
    crop_type,
    ROUND(CAST(AVG(potassium) AS NUMERIC),2) AS avg_potassium
FROM fertilizer
GROUP BY crop_type
ORDER BY avg_potassium DESC;

-- Query 18 : Average Phosphorus by Crop
SELECT
    crop_type,
    ROUND(CAST(AVG(phosphorus) AS NUMERIC),2) AS avg_phosphorus
FROM fertilizer
GROUP BY crop_type
ORDER BY avg_phosphorus DESC;

-- Query 19 : Average Temperature by Soil Type
SELECT
    soil_type,
    ROUND(CAST(AVG(temperature) AS NUMERIC),2) AS avg_temperature
FROM fertilizer
GROUP BY soil_type
ORDER BY avg_temperature DESC;

-- Query 20 : Average Humidity by Soil Type
SELECT
    soil_type,
    ROUND(CAST(AVG(humidity) AS NUMERIC),2) AS avg_humidity
FROM fertilizer
GROUP BY soil_type
ORDER BY avg_humidity DESC;

-- Query 21 : Average Moisture by Soil Type
SELECT
    soil_type,
    ROUND(CAST(AVG(moisture) AS NUMERIC),2) AS avg_moisture
FROM fertilizer
GROUP BY soil_type
ORDER BY avg_moisture DESC;

-- Query 22 : High Nitrogen Records
SELECT *
FROM fertilizer
WHERE nitrogen > 50;

-- Query 23 : High Potassium Records
SELECT *
FROM fertilizer
WHERE potassium > 50;

-- Query 24 : High Phosphorus Records
SELECT *
FROM fertilizer
WHERE phosphorus > 50;

-- Query 25 : Sandy Soil Records
SELECT *
FROM fertilizer
WHERE soil_type = 'Sandy';

-- Query 26 : Clayey Soil Records
SELECT *
FROM fertilizer
WHERE soil_type = 'Clayey';

-- Query 27 : Black Soil Records
SELECT *
FROM fertilizer
WHERE soil_type = 'Black';

-- Query 28 : Wheat Crop Records
SELECT *
FROM fertilizer
WHERE crop_type = 'Wheat';

-- Query 29 : Rice Crop Records
SELECT *
FROM fertilizer
WHERE crop_type = 'Rice';

-- Query 30 : Fertilizer Recommendation Count
SELECT
    fertilizer_name,
    COUNT(*) AS recommendation_count
FROM fertilizer
GROUP BY fertilizer_name
ORDER BY recommendation_count DESC;