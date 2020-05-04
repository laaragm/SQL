CREATE DATABASE SALE;

USE SALE;

-- Drop the table in case it already exists
DROP TABLE Product;

-- Create table
CREATE TABLE Product(
	id INTEGER PRIMARY KEY NOT NULL,
	product VARCHAR(20),
    quantity INTEGER,
    sale_price DECIMAL(6,2),
    sale_date DATE    
);

-- Insert sample data into the table
INSERT INTO Product VALUES
	(1,'CPU',9,450.09,'2018-05-29'),
	(2,'Notebook',3,666.66,'2018-06-01'),
	(3,'SSD',1,100.00,'2018-06-04'),
	(4,'Mousepad',2,50.00,'2018-06-04'),
	(5,'Keyboard',1,75.75,'2018-06-10'),
	(6,'SSD',6,60.60,'2018-06-11'),
	(7,'Printer',1,44.44,'2018-06-11'),
	(8,'Printer',24,48.48,'2018-06-14'),
	(9,'CPU',2,222.22,'2018-06-15');
    
SELECT * FROM Product;


