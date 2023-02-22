USE 507_final_proj;

SELECT * FROM temperature;
SELECT * FROM iso;

DROP VIEW IF EXISTS temp_core1;
DROP VIEW IF EXISTS temp_core2;

CREATE VIEW temp_core1
(country, iso3, month_name, record_year, unit, temp, flag)
AS
SELECT
	tmp.country,
    iso.iso3,
    tmp.month_name,
    tmp.record_year,
    tmp.unit,
    tmp.temp,
    tmp.flag
FROM temperature AS tmp
LEFT OUTER JOIN iso
	ON tmp.country = iso.country;

SELECT * FROM temp_core1
LIMIT 1000000;