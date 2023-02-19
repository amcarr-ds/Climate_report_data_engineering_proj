USE 507_final_proj;

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
CONSTRAINT pk_eg_id PRIMARY KEY (eg_id)
);
DESC emissions_gross;