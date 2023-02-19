USE 507_final_proj;

DELETE FROM emissions_gross;
SELECT * FROM emissions_gross;
DELETE FROM population;
SELECT * FROM population;
DELETE FROM temperature;
SELECT * FROM temperature;
DELETE FROM iso;
SELECT * FROM iso;
DELETE FROM country_map;
SELECT * FROM country_map;

SHOW INDEX FROM emissions_gross;

SHOW INDEX FROM emissions_gross;

SET FOREIGN_KEY_CHECKS=0;

/*__________________________*/
/*Insert data from CSV*/
/*Load data directly from a CSV file using the secure-file-priveleges folder path*/
SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/GCB2022v27_MtCO2_flat.csv'
	INTO TABLE emissions_gross
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(country,
iso3,
record_year,
total,
coal,
oil,
gas,
cement,
flaring,
other,
per_capita)
;

/*Load data directly from a CSV file using the secure-file-priveleges folder path*/
SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/world_population.csv'
	INTO TABLE population
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(pop_rank,
iso3,
country,
capital,
continent,
pop_2022,
pop_2020,
pop_2015,
pop_2010,
pop_2000,
pop_1990,
pop_1980,
pop_1970,
area,
density,
grow_rate,
pop_perc)
;

/*Load data directly from a CSV file using the secure-file-priveleges folder path*/
SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/test.csv'
	INTO TABLE temperature
CHARACTER SET UTF8MB4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
(domain_code,
domain,
area_code,
country,
element_code,
element,
month_code,
month_name,
year_code,
record_year,
unit,
temp,
flag,
flag_desc)
;

/*Load data directly from a CSV file using the secure-file-priveleges folder path*/
SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/FAOSTAT_data_11-24-2020.csv'
	INTO TABLE iso
CHARACTER SET UTF8MB4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(country_code,
country,
m49_code,
iso2,
iso3,
year_start,
year_end)
;

SET FOREIGN_KEY_CHECKS=1;

SELECT * FROM iso;

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

SELECT * FROM iso;

ALTER TABLE iso
ADD INDEX idx_iso3 (iso3);

SHOW INDEX FROM iso;

SELECT eg.country, eg.iso3, count(*) FROM emissions_gross AS eg
LEFT JOIN iso AS iss
	ON eg.country = iss.country
WHERE iss.country IS NULL
GROUP BY eg.country
LIMIT 100000;

SELECT eg.country, eg.iso3, count(*) FROM emissions_gross AS eg
LEFT JOIN iso AS iss
	ON eg.iso3 = iss.iso3
WHERE iss.iso3 IS NULL
GROUP BY eg.country
LIMIT 100000;

INSERT INTO iso (country, iso3)
SELECT eg.country, eg.iso3 FROM emissions_gross AS eg
LEFT JOIN iso AS iss
	ON eg.iso3 = iss.iso3
WHERE iss.iso3 IS NULL
GROUP BY eg.country;

SELECT * FROM iso;

ALTER TABLE emissions_gross
ADD CONSTRAINT fk_egXiso_iso3 FOREIGN KEY (iso3)
REFERENCES iso (iso3);