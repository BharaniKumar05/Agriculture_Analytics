



-- ==========================================================
-- RAINFALL SQL QUERIES
-- Database : PostgreSQL
-- Project  : Agriculture Analytics Platform
-- ==========================================================

-- Query 1 : View All Records
SELECT * FROM rainfall;

-- Query 2 : First 10 Records
SELECT * FROM rainfall
LIMIT 10;

-- Query 3 : Total Districts
SELECT COUNT(*) AS total_districts
FROM rainfall;

-- Query 4 : Average Annual Rainfall
SELECT ROUND(CAST(AVG(annual) AS NUMERIC),2) AS average_annual_rainfall
FROM rainfall;

-- Query 5 : Maximum Annual Rainfall
SELECT MAX(annual) AS maximum_annual_rainfall
FROM rainfall;

-- Query 6 : Minimum Annual Rainfall
SELECT MIN(annual) AS minimum_annual_rainfall
FROM rainfall;

-- Query 7 : Total Annual Rainfall
SELECT ROUND(CAST(SUM(annual) AS NUMERIC),2) AS total_annual_rainfall
FROM rainfall;

-- Query 8 : Top 10 Districts by Annual Rainfall
SELECT
    district,
    annual
FROM rainfall
ORDER BY annual DESC
LIMIT 10;

-- Query 9 : Bottom 10 Districts by Annual Rainfall
SELECT
    district,
    annual
FROM rainfall
ORDER BY annual ASC
LIMIT 10;

-- Query 10 : Average January Rainfall
SELECT ROUND(CAST(AVG(jan) AS NUMERIC),2) AS avg_january
FROM rainfall;

-- Query 11 : Average February Rainfall
SELECT ROUND(CAST(AVG(feb) AS NUMERIC),2) AS avg_february
FROM rainfall;

-- Query 12 : Average March Rainfall
SELECT ROUND(CAST(AVG(mar) AS NUMERIC),2) AS avg_march
FROM rainfall;

-- Query 13 : Average April Rainfall
SELECT ROUND(CAST(AVG(apr) AS NUMERIC),2) AS avg_april
FROM rainfall;

-- Query 14 : Average May Rainfall
SELECT ROUND(CAST(AVG(may) AS NUMERIC),2) AS avg_may
FROM rainfall;

-- Query 15 : Average June Rainfall
SELECT ROUND(CAST(AVG(jun) AS NUMERIC),2) AS avg_june
FROM rainfall;

-- Query 16 : Average July Rainfall
SELECT ROUND(CAST(AVG(jul) AS NUMERIC),2) AS avg_july
FROM rainfall;

-- Query 17 : Average August Rainfall
SELECT ROUND(CAST(AVG(aug) AS NUMERIC),2) AS avg_august
FROM rainfall;

-- Query 18 : Average September Rainfall
SELECT ROUND(CAST(AVG(sep) AS NUMERIC),2) AS avg_september
FROM rainfall;

-- Query 19 : Average October Rainfall
SELECT ROUND(CAST(AVG(oct) AS NUMERIC),2) AS avg_october
FROM rainfall;

-- Query 20 : Average November Rainfall
SELECT ROUND(CAST(AVG(nov) AS NUMERIC),2) AS avg_november
FROM rainfall;

-- Query 21 : Average December Rainfall
SELECT ROUND(CAST(AVG(dec) AS NUMERIC),2) AS avg_december
FROM rainfall;

-- Query 22 : Districts with Annual Rainfall > 2000 mm
SELECT *
FROM rainfall
WHERE annual > 2000;

-- Query 23 : Districts with Annual Rainfall < 1000 mm
SELECT *
FROM rainfall
WHERE annual < 1000;

-- Query 24 : Highest Rainfall Month (per district)
SELECT
    district,
    GREATEST(jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec) AS highest_monthly_rainfall
FROM rainfall;

-- Query 25 : Lowest Rainfall Month (per district)
SELECT
    district,
    LEAST(jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec) AS lowest_monthly_rainfall
FROM rainfall;

-- Query 26 : Top 10 January Rainfall Districts
SELECT
    district,
    jan
FROM rainfall
ORDER BY jan DESC
LIMIT 10;

-- Query 27 : Top 10 July Rainfall Districts
SELECT
    district,
    jul
FROM rainfall
ORDER BY jul DESC
LIMIT 10;

-- Query 28 : Top 10 December Rainfall Districts
SELECT
    district,
    dec
FROM rainfall
ORDER BY dec DESC
LIMIT 10;

-- Query 29 : Monthly Rainfall Summary
SELECT
    ROUND(CAST(AVG(jan) AS NUMERIC),2) AS january,
    ROUND(CAST(AVG(feb) AS NUMERIC),2) AS february,
    ROUND(CAST(AVG(mar) AS NUMERIC),2) AS march,
    ROUND(CAST(AVG(apr) AS NUMERIC),2) AS april,
    ROUND(CAST(AVG(may) AS NUMERIC),2) AS may,
    ROUND(CAST(AVG(jun) AS NUMERIC),2) AS june,
    ROUND(CAST(AVG(jul) AS NUMERIC),2) AS july,
    ROUND(CAST(AVG(aug) AS NUMERIC),2) AS august,
    ROUND(CAST(AVG(sep) AS NUMERIC),2) AS september,
    ROUND(CAST(AVG(oct) AS NUMERIC),2) AS october,
    ROUND(CAST(AVG(nov) AS NUMERIC),2) AS november,
    ROUND(CAST(AVG(dec) AS NUMERIC),2) AS december
FROM rainfall;

-- Query 30 : Districts Ordered by Annual Rainfall
SELECT
    district,
    annual
FROM rainfall
ORDER BY annual DESC;