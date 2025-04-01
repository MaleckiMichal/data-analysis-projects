-- Mostly choosen ads 

SELECT 
  ad_name, 
  count(*), 
  ROUND((count(*) * 100) / SUM(count(*)) OVER (), 2) || '%' AS percentage
FROM holista_form_ad.holista_form_ad_2025q1
GROUP BY 1
ORDER BY 2 DESC

-- Percentage share of platforms

SELECT 
  platform, 
  count(*), 
  ROUND((count(*) * 100) / SUM(count(*)) OVER (), 2) || '%' AS percentage
FROM holista_form_ad.holista_form_ad_2025q1
GROUP BY 1
ORDER BY 2 DESC

-- Percentage share of animals

SELECT 
  animal, 
  count(*), 
  ROUND((count(*) * 100) / SUM(count(*)) OVER (), 2) || '%' AS percentage
FROM holista_form_ad.holista_form_ad_2025q1
GROUP BY 1
ORDER BY 2 DESC

-- Percentage share of diet

SELECT 
  diet, 
  count(*), 
  ROUND((count(*) * 100) / SUM(count(*)) OVER (), 2) || '%' AS percentage
FROM holista_form_ad.holista_form_ad_2025q1
GROUP BY 1
ORDER BY 2 DESC

-- Percentage share of diet by animal

SELECT 
  animal,
  diet,
  count(*), 
  ROUND((count(*) * 100) / SUM(count(*)) OVER (), 2) || '%' AS percentage
FROM holista_form_ad.holista_form_ad_2025q1
WHERE LOWER(animal) = 'kot'
GROUP BY 2, 1
ORDER BY 3 DESC

SELECT 
  animal,
  diet,
  count(*), 
  ROUND((count(*) * 100) / SUM(count(*)) OVER (), 2) || '%' AS percentage
FROM holista_form_ad.holista_form_ad_2025q1
WHERE LOWER(animal) = 'pies'
GROUP BY 2, 1
ORDER BY 3 DESC

-- form completion time

SELECT 
  EXTRACT(HOUR from created_time) AS hour, 
  count(*)
FROM holista_form_ad.holista_form_ad_2025q1
GROUP BY 1
ORDER BY 2 DESC

