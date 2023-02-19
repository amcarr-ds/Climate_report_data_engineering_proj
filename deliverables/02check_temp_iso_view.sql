USE 507_final_proj;

SELECT * FROM temperature;
SELECT * FROM iso;

DROP VIEW IF EXISTS temp_core1;
DROP VIEW IF EXISTS temp_core2;

CREATE VIEW temp_core1
(country, iso3, month_name, record_year, unit, temp, flag, iso3_map)
AS
SELECT
	tmp.country,
    iso.iso3,
    tmp.month_name,
    tmp.record_year,
    tmp.unit,
    tmp.temp,
    tmp.flag,
    cc.iso3
FROM temperature AS tmp
LEFT OUTER JOIN iso
	ON tmp.country = iso.country
LEFT OUTER JOIN country_map AS cc
	ON tmp.country = cc.country_error
;

SELECT * FROM temp_core1
LIMIT 1000000;

SELECT country, iso3_map, count(*) AS country_error_count FROM temp_core1 AS tc
WHERE iso3 IS NULL
GROUP BY country WITH ROLLUP
LIMIT 1000000;

CREATE VIEW temp_core2
(country, iso3, month_name, record_year, temp)
AS
SELECT
	country,
	CASE WHEN iso3 IS NULL THEN iso3_map ELSE iso3 END iso3,
    month_name,
    record_year,
    temp
FROM temp_core1;

SELECT * FROM temp_core2
WHERE country LIKE "r%n" OR country LIKE "c%ire"
LIMIT 1000000;

SELECT * FROM temp_core2
LIMIT 1000000;

SELECT country, iso3, count(*) AS remapped_count FROM temp_core2 AS tc
WHERE iso3 IS NULL
GROUP BY country WITH ROLLUP
LIMIT 1000000;