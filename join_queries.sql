

-- ==========================================================
-- JOIN QUERY 1 : Crop + Rainfall
-- ==========================================================
SELECT
    c.state_name,
    c.district_name,
    c.crop,
    c.production,
    r.annual
FROM crop_production c
INNER JOIN rainfall r
ON c.district_name = r.district;
-- ==========================================================
-- JOIN QUERY 2 : Crop + Fertilizer
-- ==========================================================
SELECT
    c.crop,
    f.fertilizer_name,
    f.soil_type,
    f.temperature,
    f.humidity
FROM crop_production c
INNER JOIN fertilizer f
ON c.crop = f.crop_type;
-- ==========================================================
-- JOIN QUERY 3 : Production with Rainfall
-- ==========================================================
SELECT
    c.crop,
    ROUND(CAST(SUM(c.production) AS NUMERIC),2) AS total_production,
    ROUND(CAST(AVG(r.annual) AS NUMERIC),2) AS avg_rainfall
FROM crop_production c
JOIN rainfall r
ON c.district_name = r.district
GROUP BY c.crop
ORDER BY total_production DESC;
-- ==========================================================
-- JOIN QUERY 4 : Production by Soil Type
-- ==========================================================
SELECT
    f.soil_type,
    ROUND(CAST(SUM(c.production) AS NUMERIC),2) AS production
FROM crop_production c
JOIN fertilizer f
ON c.crop = f.crop_type
GROUP BY f.soil_type
ORDER BY production DESC;
-- ==========================================================
-- JOIN QUERY 5 : Fertilizer Usage
-- ==========================================================
SELECT
    f.fertilizer_name,
    COUNT(*) AS total_usage
FROM crop_production c
JOIN fertilizer f
ON c.crop = f.crop_type
GROUP BY f.fertilizer_name
ORDER BY total_usage DESC;
-- ==========================================================
-- JOIN QUERY 6 : State-wise Rainfall
-- ==========================================================
SELECT
    c.state_name,
    ROUND(CAST(AVG(r.annual) AS NUMERIC),2) AS avg_rainfall
FROM crop_production c
JOIN rainfall r
ON c.district_name = r.district
GROUP BY c.state_name
ORDER BY avg_rainfall DESC;
-- ==========================================================
-- JOIN QUERY 7 : Average NPK by Crop
-- ==========================================================
SELECT
    c.crop,
    ROUND(CAST(AVG(f.nitrogen) AS NUMERIC),2) AS nitrogen,
    ROUND(CAST(AVG(f.phosphorus) AS NUMERIC),2) AS phosphorus,
    ROUND(CAST(AVG(f.potassium) AS NUMERIC),2) AS potassium
FROM crop_production c
JOIN fertilizer f
ON c.crop = f.crop_type
GROUP BY c.crop
ORDER BY c.crop;
-- ==========================================================
-- JOIN QUERY 8 : Top 10 Districts
-- ==========================================================
SELECT
    c.district_name,
    ROUND(CAST(SUM(c.production) AS NUMERIC),2) AS production,
    ROUND(CAST(AVG(r.annual) AS NUMERIC),2) AS rainfall
FROM crop_production c
JOIN rainfall r
ON c.district_name = r.district
GROUP BY c.district_name
ORDER BY production DESC
LIMIT 10;
-- ==========================================================
-- JOIN QUERY 9 : Crop + Soil
-- ==========================================================
SELECT
    c.crop,
    f.soil_type,
    ROUND(CAST(SUM(c.production) AS NUMERIC),2) AS production
FROM crop_production c
JOIN fertilizer f
ON c.crop = f.crop_type
GROUP BY c.crop, f.soil_type
ORDER BY production DESC;
-- ==========================================================
-- JOIN QUERY 10 : Agriculture Summary
-- ==========================================================
SELECT
    c.crop,
    ROUND(CAST(SUM(c.production) AS NUMERIC),2) AS total_production,
    ROUND(CAST(AVG(r.annual) AS NUMERIC),2) AS average_rainfall,
    COUNT(DISTINCT f.fertilizer_name) AS fertilizer_count
FROM crop_production c
JOIN rainfall r
ON c.district_name = r.district
JOIN fertilizer f
ON c.crop = f.crop_type
GROUP BY c.crop
ORDER BY total_production DESC;