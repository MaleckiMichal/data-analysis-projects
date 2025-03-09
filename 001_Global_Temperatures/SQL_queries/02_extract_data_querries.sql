-- Average annual temperature uncertainty (to specify dates range with reliable and accurate results)

SELECT
  EXTRACT(YEAR FROM date) AS year, 
  AVG(average_temp)::numeric(8, 2) AS avg_year_temp,
  AVG(average_temp_uncertainty)::numeric(8, 2) AS avg_year_temp_uncertainty
FROM global_temperatures.global_land_temperatures_by_country
WHERE average_temp IS NOT NULL
GROUP BY year
ORDER BY year;


/* 
During the visual inspection of the data, some repetitions were identified.
Few countries has standard name e.g. Denmark and there is also second version e.g. Denmark (Europe)
The problem is related to countries with dependent or external territory.
*/

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


/* 
Average temperatures for countires from year 1900
	- average uncertainty is below 0.5 from 1934 but for years 1900 - 1934 it is still low 
	- an additional condition is set to eliminate unreliable single measurements 
*/

SELECT 
  EXTRACT(YEAR FROM date) AS year, 
  AVG(average_temp)::numeric(8, 2) AS avg_year_temp, 
  country
FROM global_temperatures.global_land_temperatures_by_country
WHERE average_temp IS NOT NULL  
  AND EXTRACT(YEAR FROM date) >= 1900 
  AND average_temp_uncertainty < 0.5
  AND country NOT IN ('Denmark', 'United Kingdom', 'Netherlands', 'France')
  AND country NOT IN ('Asia', 'Africa', 'Europe', 'North America', 'South America', 'Oceania')
GROUP BY year, country
ORDER BY year;


-- Average annual temperatures for continents

SELECT 
  EXTRACT(YEAR FROM date) AS year, 
  AVG(average_temp)::numeric(8, 2) AS avg_year_temp, 
  country
FROM global_temperatures.global_land_temperatures_by_country
WHERE average_temp IS NOT NULL  
  AND EXTRACT(YEAR FROM date) >= 1900 
  AND average_temp_uncertainty < 0.5
  AND country IN ('Asia', 'Africa', 'Europe', 'North America', 'South America', 'Oceania')
GROUP BY year, country
ORDER BY year;



/* ----------------------------------------------------------------------- */



-- General overview of the table with average global temperatures (land and ocean)

SELECT * FROM global_temperatures.global_average_temperatures


-- Check how many rows are with land and ocean average temp uncertainty data

SELECT
  land_and_ocean_average_temp_uncertainty
FROM global_temperatures.global_average_temperatures
WHERE 
  land_and_ocean_average_temp_uncertainty IS NOT NULL
-- 1992 rows
  

-- Test how many rows are selected with land and ocean average temp uncertainty below 0.5

SELECT
  land_and_ocean_average_temp_uncertainty
FROM global_temperatures.global_average_temperatures
WHERE 
  land_and_ocean_average_temp_uncertainty < 0.5
-- 1992 (100% of all measurements)
  

-- Test how many rows are selected with land and ocean average temp uncertainty below 0.3

SELECT
  land_and_ocean_average_temp_uncertainty
FROM global_temperatures.global_average_temperatures
WHERE 
  land_and_ocean_average_temp_uncertainty < 0.3
-- 1919 (more than 96% of all measurements)


/*
Land and ocean average temperature has been measured since 1850 
and for all measurements uncertainty is quite low.
*/

-- Average annual land and ocean temperatures since 1850:

SELECT
  EXTRACT(YEAR FROM date) AS year,
  AVG(land_and_ocean_average_temp)::NUMERIC(8, 2)
FROM global_temperatures.global_average_temperatures
WHERE 
  date > '1849-12-01'
GROUP BY year
ORDER BY year




