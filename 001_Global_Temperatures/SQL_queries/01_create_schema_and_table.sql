CREATE SCHEMA global_temperatures;

CREATE TABLE global_temperatures.global_land_temperatures_by_country
(
    date DATE,
    averate_temp NUMERIC(10,3),
    average_temp_uncertainty NUMERIC(10,3),
    country VARCHAR
);