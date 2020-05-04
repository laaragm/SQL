USE HR;

-- Importing .csv files (remember to put them in the directory where the database is)
LOAD DATA INFILE 'Departments.csv' 
INTO TABLE DEPARTMENTS
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- SELECT * FROM DEPARTMENTS;

LOAD DATA INFILE 'Employees.csv'
INTO TABLE EMPLOYEES
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- SELECT * FROM EMPLOYEES;

LOAD DATA INFILE 'JobsHistory.csv'
INTO TABLE JOB_HISTORY
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- SELECT * FROM JOB_HISTORY;

LOAD DATA INFILE 'Jobs.csv'
INTO TABLE JOBS
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- SELECT * FROM JOBS;

LOAD DATA INFILE 'Locations.csv'
INTO TABLE LOCATIONS
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- SELECT * FROM LOCATIONS;



