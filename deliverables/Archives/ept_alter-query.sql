USE 507_final_proj;

/*__________________________*/
/*>>>>>Review and/or alter emissions_gross table<<<<<*/

/*Perform initial review of data via SELECT() queries*/
SELECT * FROM emissions_gross
LIMIT 100000;

SELECT * FROM emissions_gross
WHERE iso3 = ''
LIMIT 100000;

/*Update ISO3 column blank values to NULL*/
UPDATE emissions_gross
SET iso3 = NULL
WHERE iso3 = '';

SELECT DISTINCT country FROM emissions_gross
ORDER BY country
LIMIT 100000;

SELECT * FROM emissions_gross
WHERE country IN ("Côte d'Ivoire", "Réunion");

SELECT country, COUNT(country) AS missing_iso_count FROM emissions_gross
WHERE iso3 IS NULL
GROUP BY country
LIMIT 100000;

SELECT * FROM emissions_gross
WHERE total = ''
LIMIT 100000;

/*Update "numerical" columns blank values to NULL*/
UPDATE emissions_gross
SET total = NULL
WHERE total = '';

UPDATE emissions_gross
SET coal = NULL
WHERE coal = '';

UPDATE emissions_gross
SET oil = NULL
WHERE oil = '';

UPDATE emissions_gross
SET gas = NULL
WHERE gas = '';

UPDATE emissions_gross
SET cement = NULL
WHERE cement = '';

UPDATE emissions_gross
SET flaring = NULL
WHERE flaring = '';

UPDATE emissions_gross
SET other = NULL
WHERE other = '';

UPDATE emissions_gross
SET per_capita = NULL
WHERE per_capita = '';

/*Perform addtional review queries*/
SELECT * FROM emissions_gross
WHERE country IS NULL
LIMIT 100000;

SELECT country, iso3, COUNT(iso3) FROM emissions_gross
GROUP BY country, iso3
LIMIT 100000;

SELECT * FROM emissions_gross
WHERE iso3 = 'AFG' AND record_year BETWEEN 1970 AND 1979;

SELECT * FROM emissions_gross
LIMIT 100000;

/*__________________________*/
/*>>>>>Review and/or alter populaton table<<<<<*/

/*Perform initial review of data via SELECT() queries*/
SELECT * FROM population
LIMIT 100000;

SELECT * FROM population
WHERE iso3 = ''
LIMIT 100000;

/*Update ISO3 column blank values to NULL*/
UPDATE population
SET iso3 = NULL
WHERE iso3 = '';

/*Perform addtional review queries*/
SELECT *, COUNT(country) FROM population
WHERE iso3 IS NULL
GROUP BY country
LIMIT 100000;

SELECT * FROM population
WHERE country IS NULL
LIMIT 100000;

SELECT country, iso3, COUNT(iso3) FROM population
GROUP BY country, iso3
LIMIT 100000;

SELECT * FROM population
LIMIT 100000;

/*__________________________*/
/*>>>>>Review and/or alter temperature table<<<<<*/

/*Perform initial review of data via SELECT() queries*/
SELECT * FROM temperature
LIMIT 100000;

/*__________________________*/
/*>>>>>Review and/or alter iso table<<<<<*/

/*Perform initial review of data via SELECT() queries*/
SELECT * FROM iso
LIMIT 100000;


/*__________________________*/
/*>>>>>Review and/or alter country_clean table<<<<<*/

/*Insert mapping values for incorrectly recorded country names*/
INSERT INTO country_map (country_error, iso3)
VALUES
("C?te d'Ivoire", "CIV"),
("R?union", "REU");

/*Perform initial review of data via SELECT() queries*/
SELECT * FROM country_map;