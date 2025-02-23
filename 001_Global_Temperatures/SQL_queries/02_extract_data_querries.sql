-- Average year temperature uncertainty (to specify dates range with reliable and accurate results)

SELECT
  EXTRACT(YEAR FROM date) AS year, 
  AVG(average_temp)::numeric(8, 2) AS avg_year_temp,
  AVG(average_temp_uncertainty)::numeric(8, 2) AS avg_year_temp_uncertainty
FROM global_temperatures.global_land_temperatures_by_country
WHERE average_temp IS NOT NULL
GROUP BY year
ORDER BY year;


-- During the visual inspection of the data, some repetitions were identified
-- Few countries has standard name e.g. Denmark and there is also second version e.g. Denmark (Europe)
-- The problem is related to countries with dependent or external territory
-- 
-- Finding duplicated countires

SELECT 
  country
FROM global_temperatures.global_land_temperatures_by_country
WHERE LOWER(country) LIKE '%europe%'
GROUP BY country


-- Test to show if no other country from another continent is duplicated

SELECT 
  country
FROM global_temperatures.global_land_temperatures_by_country
WHERE country LIKE '%(%'
GROUP BY country


-- Avg temperatures for countires from year 1900
-- avg uncertainty is below 0.5 from 1934 but for years 1900 - 1934 it is still low 
-- An additional condition is set to eliminate unreliable single measurements 

SELECT 
  EXTRACT(YEAR FROM date) AS year, 
  AVG(average_temp)::numeric(8, 2) AS avg_year_temp, 
  country
FROM global_temperatures.global_land_temperatures_by_country
WHERE average_temp IS NOT NULL  
  AND EXTRACT(YEAR FROM date) > 1900 
  AND average_temp_uncertainty < 0.5
  AND country NOT IN ('Denmark', 'United Kingdom', 'Netherlands', 'France')
  AND country NOT IN ('Asia', 'Africa', 'Europe', 'North America', 'South America', 'Oceania')
GROUP BY year, country
ORDER BY year;


-- Avg year temperatures for continents

SELECT 
  EXTRACT(YEAR FROM date) AS year, 
  AVG(average_temp)::numeric(8, 2) AS avg_year_temp, 
  country
FROM global_temperatures.global_land_temperatures_by_country
WHERE average_temp IS NOT NULL  
  AND EXTRACT(YEAR FROM date) > 1900 
  AND average_temp_uncertainty < 0.5
  AND country IN ('Asia', 'Africa', 'Europe', 'North America', 'South America', 'Oceania')
GROUP BY year, country
ORDER BY year;

