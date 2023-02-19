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

SELECT * FROM iso;