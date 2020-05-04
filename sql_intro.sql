-- Creating a database 
CREATE DATABASE RecordCompany; 
-- Telling SQL this is the db we are going to use
USE RecordCompany;

-- Creating a table
-- Tables have columns inside of them that represent the different properties of the object that it's representing,
-- so when we create our table we need to tell it what columns we want to create with.
CREATE TABLE test (
	test_column INT     
);

-- The ALTER TABLE command will allow us to change properties of our table after we create it
-- VARCHAR will represent a string with maximum length of 255 characters
-- SQL doesn't care about line breaks in the statement; 
ALTER TABLE test
ADD another_column VARCHAR(255); 

-- Deleting a table
DROP TABLE test;

-- Our table is going to have the name of the band (we are using 'name' as the column name) and the id which 
-- will be auto incremented when we add content to the table
-- NOT NULL is just to make sure that our name column will ALWAYS have a name different than NULL 
-- Since 'id' will be our identifier, it'g going to be what's called a Primary key (we need to tell this to SQL),
-- which means that it's the primary identifier of the table and what you use to say that it is unique and it's 
-- going to be what identifies an individual record inside of a table. 
CREATE TABLE bands (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- Our album table is going to have different albums for our different bands inside of our db
-- We don't care if release_year is NULL because maybe we just don't know that information 
-- In order to be able to connect an album to a band we will use what's called a FOREIGN KEY
-- which references a table other than itself
-- The band_id is referencing the bands' table which is referred to as a FOREIGN KEY which is basically
-- a reference to a table other than itself
-- To summarize, band_id is linked to the bands' table id through a FOREIGN KEY
CREATE TABLE albums (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    release_year INT,
    band_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES bands(id)
);

-- Adding data to our tables
INSERT INTO bands (name) 
VALUES ('Twenty One Pilots');

-- Another way to insert data into our db
INSERT INTO bands (name)
VALUES ('Imagine Dragons'), ('Panic! At The Disco'), ('One Direction');

-- Querying data from our table; * is used to select everything
-- You can see that the ids are automatically generated and incremented
SELECT * FROM bands;
-- This is going to give us the first two bands
SELECT * FROM bands LIMIT 2;
-- Only the name column is returned 
SELECT name FROM bands;

-- Renaming the columns
SELECT id AS 'ID', name AS 'Band Name'
FROM bands;

-- Ordering data by the name column (alphabetical order)
SELECT * FROM bands ORDER BY name;
-- Ordering data by the name column (reverse alphabetical order)
SELECT * FROM bands ORDER BY name DESC;

-- Adding some albums to our albums' table
INSERT INTO albums (name, release_year, band_id)
VALUES  ('Blurryface', 2015, 1), ('Vessel', 2013, 1), ('Smoke + Mirrors', 2015, 2),
        ('Pray for the Wicked', 2018, 3), ('Four', 2014, 4), ('Test Album', NULL, 4);

SELECT * FROM albums;
SELECT name FROM albums;

-- Selecting unique data from our table
SELECT DISTINCT release_year FROM albums;

-- The COUNT() function returns the number of rows that matches a specified criteria
SELECT release_year, COUNT(release_year) 
FROM albums GROUP BY release_year;

-- Deleting data from our albums' table based on a condition
DELETE FROM albums WHERE id = 4;

-- If you want to change something from a table
-- WHERE is used to filter data using a condition
UPDATE albums
SET release_year = 2020
WHERE id = 6;

SELECT * FROM albums
WHERE release_year < 2015;

-- The letters 'sel' appear somewhere in order in the end of the string 
SELECT * FROM albums
WHERE name LIKE '%sel';

-- The letters 'sel' appear somewhere in order inside of the string 
SELECT * FROM albums
WHERE name LIKE '%ess%';

SELECT * FROM albums
WHERE name LIKE 'ves%' OR band_id = 1;

-- The IN operator allows you to specify multiple values in a WHERE clause; it's a shorthand for multiple OR conditions.
SELECT * FROM albums 
WHERE release_year IN (2015,2013);

SELECT * FROM albums
WHERE release_year < 2016 AND band_id = 1;

SELECT * FROM albums
WHERE release_year BETWEEN 2013 AND 2015;

DELETE FROM albums WHERE id = 6;

-- The JOIN statement allows us to join two different tables together on different properties
-- It allows us to create relations between our data inside of our database
-- A JOIN clause is used to combine rows from two or more tables, based on a related column between them
SELECT * FROM bands
JOIN albums ON bands.id = albums.band_id;

-- INNER JOIN: Returns records that have matching values in both tables
-- LEFT JOIN: Returns all records from the left table, and the matched records from the right table
-- RIGHT JOIN: Returns all records from the right table, and the matched records from the left table
-- FULL JOIN: Returns all records when there is a match in either left or right table
-- The table on the left is whatever table you write first
SELECT * FROM bands
LEFT JOIN albums ON bands.id = albums.band_id;

SELECT * FROM albums
RIGHT JOIN bands ON bands.id = albums.band_id;

-- AGGREGATE function is a function where the values of multiple rows are grouped together as input on 
-- certain criteria to form a single value of more significant meaning
SELECT AVG(release_year) FROM albums;

-- GROUP BY takes all the records and groups them by a single column inside of the table
-- The query below is basically counting the number of albums from each band
SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;

-- The query below is basically counting the number of albums from each band
-- The difference between the query below and the query above is that the one below  shows us the band name
SELECT bands.name, COUNT(albums.id) FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
GROUP BY bands.id;

-- The query below does the same thing as the one above
-- SELECT b.name AS band_name, COUNT(a.id) AS num_albums
-- FROM bands AS b
-- LEFT JOIN albums AS a ON b.id = a.band_id
-- GROUP BY b.id;

-- HAVING is the same as WHERE but it happens after the GROUP BY 
-- The query below returns the bands that have exactly 1 album
-- SQL aliases are used to give a table, or a column in a table, a temporary name
-- Aliases (AS) are often used to make column names more readable and it only exists for the duration of the query
SELECT bands.name, COUNT(albums.id) AS num_albums FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
GROUP BY bands.id
HAVING num_albums = 1;

SELECT bands.name, COUNT(albums.id) AS num_albums FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
WHERE bands.name = 'Imagine Dragons'
GROUP BY bands.id
HAVING num_albums = 1;







