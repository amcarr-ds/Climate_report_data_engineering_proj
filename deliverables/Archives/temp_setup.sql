USE 507_final_proj;

DROP TABLE IF EXISTS temperature;

/*Create table based on columns available in the 'FAOSTAT_data_1-10-2022.csv' source file*/
CREATE TABLE temperature
(domain_code VARCHAR(100),
domain VARCHAR(100),
area_code VARCHAR(100),
country VARCHAR(100),
element_code VARCHAR(100),
element VARCHAR(100),
month_code VARCHAR(100),
month_name VARCHAR(100),
year_code VARCHAR(100),
record_year VARCHAR(100),
unit VARCHAR(100),
temp VARCHAR(100),
flag VARCHAR(100),
flag_desc VARCHAR(100)
);
DESC temperature;

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