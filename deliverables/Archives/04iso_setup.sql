USE 507_final_proj;

DROP TABLE IF EXISTS iso;

/*Create table based on columns available in the 'FAOSTAT_data_11-24-2020.csv' source file*/
CREATE TABLE iso
(iso_id SMALLINT UNSIGNED AUTO_INCREMENT,
country_code VARCHAR(30),
country VARCHAR(100),
m49_code VARCHAR(30),
iso2 VARCHAR(30),
iso3 VARCHAR(30),
year_start VARCHAR(30),
year_end VARCHAR(30),
CONSTRAINT pk_iso_id PRIMARY KEY (iso_id)
);
DESC iso;