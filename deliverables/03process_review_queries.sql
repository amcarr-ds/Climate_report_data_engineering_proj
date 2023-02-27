use 507_final_proj;

/*_______________________________________*/
SELECT * FROM emissions_gross;

SELECT country, iso3, count(*) FROM emissions_gross
WHERE country_code IS NULL
GROUP BY country, iso3
ORDER BY country;

SELECT t1.country, t2.country, t1.iso3, count(*) FROM emissions_gross AS t1
INNER JOIN iso AS t2
	ON t1.iso3 = t2.iso3
WHERE t1.country <> t2.country AND t1.iso3 <> ''
GROUP BY t1.country, t2.country
LIMIT 1000000;

SELECT t1.country, t1.iso3, count(*) FROM emissions_gross AS t1
INNER JOIN iso AS t2
	ON t1.iso3 = t2.iso3
WHERE t1.country <> t2.country AND t1.iso3 = ''
GROUP BY t1.country
LIMIT 1000000;

/*_______________________________________*/
SELECT * FROM iso
ORDER BY country;

SELECT * FROM iso
WHERE country LIKE "%ko%"
ORDER BY country;

SELECT *, count(*) FROM iso
WHERE country_code IS NULL
GROUP BY country
ORDER BY country;

/*_______________________________________*/
SELECT * FROM population;

SELECT * FROM population_trans
LIMIT 1000000;

SELECT *, count(*) FROM population_trans
WHERE country_code IS NULL
GROUP BY country;

SELECT t1.country, t2.country, t1.iso3, count(*) FROM population_trans AS t1
INNER JOIN iso AS t2
	ON t1.iso3 = t2.iso3
WHERE t1.country <> t2.country AND t1.iso3 <> ''
GROUP BY t1.country, t2.country
LIMIT 1000000;

SELECT t1.country, t1.iso3, count(*) FROM population_trans AS t1
INNER JOIN iso AS t2
	ON t1.iso3 = t2.iso3
WHERE t1.country <> t2.country AND t1.iso3 = ''
GROUP BY t1.country
LIMIT 1000000;

/*_______________________________________*/
SELECT * FROM temperature;

SELECT country, count(*) FROM temperature
WHERE country_code IS NULL
GROUP BY country;

/*_______________________________________*/
SELECT * FROM country_map;

SELECT * FROM country_map as t1
JOIN (SELECT country, count(*) FROM temperature
WHERE country_code IS NULL
GROUP BY country) AS t2
	ON t1.country_error = t2.country
INNER JOIN iso as t3
	ON t1.country_code = t3.country_code;

SELECT t1.country, t3.country FROM temperature as t1
INNER JOIN country_map AS t2
	ON t1.country = t2.country_error
INNER JOIN iso AS t3
	ON t2.country_code = t3.country_code
GROUP BY t1.country, t3.country
LIMIT 1000000;

/*_______________________________________*/
SELECT * FROM iso
LIMIT 1000000;
SELECT * FROM emissions_gross
LIMIT 1000000;
SELECT * FROM population
LIMIT 1000000;
SELECT * FROM temperature
LIMIT 1000000;
SELECT * FROM country_map
LIMIT 1000000;
