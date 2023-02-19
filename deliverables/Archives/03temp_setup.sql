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