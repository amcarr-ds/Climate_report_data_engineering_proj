USE 507_final_proj;

DROP TABLE IF EXISTS country_map;
DROP TABLE IF EXISTS iso_tempy;
DROP TABLE IF EXISTS iso;
DROP TABLE IF EXISTS temperature_tempy;
DROP TABLE IF EXISTS temperature;
DROP TABLE IF EXISTS population_trans;
DROP TABLE IF EXISTS population_tempy;
DROP TABLE IF EXISTS population;
DROP TABLE IF EXISTS emissions_tempy;
DROP TABLE IF EXISTS emissions_gross;

/*Create table based on columns available in the 'GCB2022v27_MtCO2_flat.csv' source file*/
CREATE TABLE emissions_gross
(eg_id SMALLINT UNSIGNED AUTO_INCREMENT,
country VARCHAR(100),
iso3 VARCHAR(30),
record_year VARCHAR(30),
total VARCHAR(30),
coal VARCHAR(30),
oil VARCHAR(30),
gas VARCHAR(30),
cement VARCHAR(30),
flaring VARCHAR(30),
other VARCHAR(30),
per_capita VARCHAR(30),
country_code VARCHAR(30),
CONSTRAINT pk_eg_id PRIMARY KEY (eg_id)
);
DESC emissions_gross;


/*Create table based on columns available in the 'GCB2022v27_MtCO2_flat.csv' source file*/
CREATE TABLE emissions_tempy
(country VARCHAR(100),
iso3 VARCHAR(30),
record_year VARCHAR(30),
total VARCHAR(30),
coal VARCHAR(30),
oil VARCHAR(30),
gas VARCHAR(30),
cement VARCHAR(30),
flaring VARCHAR(30),
other VARCHAR(30),
per_capita VARCHAR(30));
DESC emissions_tempy;


/*Create table based on columns available in the 'world_population.csv' source file*/
CREATE TABLE population
(pop_id SMALLINT UNSIGNED AUTO_INCREMENT,
pop_rank VARCHAR(30),
iso3 VARCHAR(30),
country VARCHAR(100),
capital VARCHAR(100),
continent VARCHAR(100),
pop_2022 VARCHAR(100),
pop_2020 VARCHAR(100),
pop_2015 VARCHAR(100),
pop_2010 VARCHAR(100),
pop_2000 VARCHAR(100),
pop_1990 VARCHAR(100),
pop_1980 VARCHAR(100),
pop_1970 VARCHAR(100),
area VARCHAR(30),
density VARCHAR(30),
grow_rate VARCHAR(30),
pop_perc VARCHAR(30),
CONSTRAINT pk_pop_id PRIMARY KEY (pop_id)
);
DESC population;


/*Create table based on columns available in the 'world_population.csv' source file*/
CREATE TABLE population_tempy
(pop_rank VARCHAR(30),
iso3 VARCHAR(30),
country VARCHAR(100),
capital VARCHAR(100),
continent VARCHAR(100),
pop_2022 VARCHAR(100),
pop_2020 VARCHAR(100),
pop_2015 VARCHAR(100),
pop_2010 VARCHAR(100),
pop_2000 VARCHAR(100),
pop_1990 VARCHAR(100),
pop_1980 VARCHAR(100),
pop_1970 VARCHAR(100),
area VARCHAR(30),
density VARCHAR(30),
grow_rate VARCHAR(30),
pop_perc VARCHAR(30)
);
DESC population_tempy;


/*Create table based on columns available in the 'world_population.csv' source file*/
CREATE TABLE population_trans
(pop_trans_id SMALLINT UNSIGNED AUTO_INCREMENT,
pop_rank VARCHAR(30),
iso3 VARCHAR(30),
country VARCHAR(100),
capital VARCHAR(100),
continent VARCHAR(100),
area VARCHAR(30),
density VARCHAR(30),
grow_rate VARCHAR(30),
pop_perc VARCHAR(30),
year VARCHAR(30),
population VARCHAR(30),
country_code VARCHAR(30),
CONSTRAINT pk_pop_trans_id PRIMARY KEY (pop_trans_id)
);
DESC population_trans;


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
flag_desc VARCHAR(100),
country_code VARCHAR(30)
);
DESC temperature;


/*Create table based on columns available in the 'FAOSTAT_data_1-10-2022.csv' source file*/
CREATE TABLE temperature_tempy
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
DESC temperature_tempy;


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

/*Create table based on columns available in the 'FAOSTAT_data_11-24-2020.csv' source file*/
CREATE TABLE iso_tempy
(country_code VARCHAR(30),
country VARCHAR(100),
m49_code VARCHAR(30),
iso2 VARCHAR(30),
iso3 VARCHAR(30),
year_start VARCHAR(30),
year_end VARCHAR(30)
);
DESC iso_tempy;


/*__________________________*/
CREATE TABLE country_map
(country_error VARCHAR(100),
country_code VARCHAR(30),
CONSTRAINT pk_country_error PRIMARY KEY (country_error)
);
DESC country_map;

/*Insert mapping values for incorrectly recorded country names*/
INSERT INTO country_map (country_error, country_code)
VALUES
("C?te d'Ivoire", "107"),
("R?union", "182");

/*Perform initial review 