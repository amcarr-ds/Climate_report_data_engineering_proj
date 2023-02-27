# Project to Establish a Data Engineering Pipeline
ADS-507 Final Project using SQL

#### -- Programming Languages: Python, MySQL
#### -- Project Status: [Completed]

## Overview
The project is intended to bring in three datasets in relation to human population and climate related factors (emissions and temperature). To that aim the project team are working as if they have been tasked by the 28th UN Conference of Parties (COP28) organizing committee to collect data from publicly available source systems with the goal of establishing a database system and pipeline that can be used for climate change impact analyses to inform recommendations for changes in global climate action policies.

## Objectives
* Develop a data extract, tranform, load (ETL) pipeline that could be used as part of a tracking system for countries' temperature, emissions, and population change data.
* Automatically update data as it becomes available in the source systems.
* Automate transformations to mesh source data and the internal relational database management system (RDBMS) schema.
* Setup storage system for ready access to transformed data.

### Team Members
* Aaron Carr
* Annie Chan
* Kyle Esteban Dalope

### Methods Used
* Pipeline conceptulization
* API connectors
* Schema development and implementation
* Using Python to load/update MySQL tables from CSV formatted files
* Data transformations

## Getting Started
1. Clone this repo (for help see this [tutorial](https://help.github.com/articles/cloning-a-repository/)).
2. Raw Data is being kept [here](data) within this repo.
3. Data processing/transformation scripts are being kept [here](deliverables)

## Deploying and Monitoring the Pipeline
1. Review the Design Doc for process details.
2. Run the file "01tables_setup.sql" using MySQL, either via Workbench or CLI, to create the schema and tables.
3. Setup a task scheduler (Windows) or cron job (Mac) to run the file "ADS507_Team2_Pipeline_Final_v2.ipynb" on a monthly basis. Doing so will automatically update the data via Kaggle API, load it into the MySQL schema, perform specific mapping and review transformations, output query details and performance metrics to file "pymysql.log", then finally close the connection for storage of the MySQL schema in GH.
4. Access the final schema via MySQL directly or a Python-MySQL connection to query the database for use in analytics.

## References
* Banerjee, S. (2022, October 20). World population dataset. *Kaggle*. Retrieved February 13, 2023, from https://www.kaggle.com/datasets/iamsouravbanerjee/world-population-dataset
* Sy, S. (2022, January 10). Temperature change. *Kaggle*. Retrieved February 13, 2023, from https://www.kaggle.com/datasets/sevgisarac/temperature-change
* The Devastator. (2023, January 23). Emissions by country. *Kaggle*. Retrieved February 13, 2023, from https://www.kaggle.com/datasets/thedevastator/global-fossil-co2-emissions-by-country-2002-2022