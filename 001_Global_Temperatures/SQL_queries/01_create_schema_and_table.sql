CREATE SCHEMA global_temperatures;

CREATE TABLE global_temperatures.global_land_temperatures_by_country
(
    date DATE,
    averate_temp NUMERIC(10,3),
    average_temp_uncertainty NUMERIC(10,3),
    country VARCHAR
);

ALTER TABLE global_temperatures.global_land_temperatures_by_country
RENAME COLUMN averate_temp TO average_temp;



CREATE TABLE global_temperatures.global_average_temperatures
(
    date DATE,
    land_average_temp NUMERIC(10,3),
    land_average_temp_uncertainty NUMERIC(10,3),
	land_max_temp NUMERIC(10,3),
	land_max_temp_uncertainty NUMERIC(10,3),
	land_min_temp NUMERIC(10,3),
	land_min_temp_uncertainty NUMERIC(10,3),
	land_and_ocean_average_temp NUMERIC(10,3),
	land_and_ocean_average_temp_uncertainty NUMERIC(10,3)
);