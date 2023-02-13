USE 507_final_proj;

DROP TABLE IF EXISTS emissions_gross;
DROP TABLE IF EXISTS emissions;
DROP TABLE IF EXISTS mh;
DROP TABLE IF EXISTS temp;

/*__________________________*/
CREATE TABLE emissions_gross
(eg_id SMALLINT UNSIGNED AUTO_INCREMENT,
country VARCHAR(100),
iso_3166_1_a3 VARCHAR(30),
record_year VARCHAR(30),
total VARCHAR(30),
coal VARCHAR(30),
oil VARCHAR(30),
gas VARCHAR(30),
cement VARCHAR(30),
flaring VARCHAR(30),
other VARCHAR(30),
per_capita VARCHAR(30),
CONSTRAINT pk_eg_id PRIMARY KEY (eg_id)
);
DESC emissions_gross;

/*__________________________*/
SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/GCB2022v27_MtCO2_flat.csv'
	INTO TABLE emissions_gross
FIELDS TERMINATED BY ','
optionally enclosed by '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(country, iso_3166_1_a3, record_year, total, coal, oil, gas, cement, flaring, other, per_capita)
;

SELECT * FROM emissions_gross
LIMIT 100000;

SELECT * FROM emissions_gross
WHERE iso_3166_1_a3 = ''
LIMIT 100000;

UPDATE emissions_gross
SET iso_3166_1_a3 = NULL
WHERE iso_3166_1_a3 = '';

SELECT *, COUNT(country) FROM emissions_gross
WHERE iso_3166_1_a3 IS NULL
GROUP BY country
LIMIT 100000;

SELECT * FROM emissions_gross
WHERE total = ''
LIMIT 100000;

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

SELECT * FROM emissions_gross
WHERE country IS NULL
LIMIT 100000;

SELECT country, iso_3166_1_a3, COUNT(iso_3166_1_a3) FROM emissions_gross
GROUP BY country, iso_3166_1_a3
LIMIT 100000;

SELECT * FROM emissions_gross
WHERE iso_3166_1_a3 = 'AFG' AND e_year BETWEEN 1970 AND 1979;

SELECT * FROM emissions_gross
LIMIT 100000;
