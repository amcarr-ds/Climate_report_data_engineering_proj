USE 507_final_proj;

DROP TABLE IF EXISTS country_map;

/*__________________________*/
CREATE TABLE country_map
(country_error VARCHAR(100),
iso3 CHAR(3),
CONSTRAINT pk_country_error PRIMARY KEY (country_error)
);
DESC country_map;

INSERT INTO country_map (country_error, iso3)
VALUES
("C?te d'Ivoire", "CIV"),
("R?union", "REU");

SELECT * FROM country_map;