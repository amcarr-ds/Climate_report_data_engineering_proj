USE 507_final_proj;

DROP TABLE IF EXISTS population;

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