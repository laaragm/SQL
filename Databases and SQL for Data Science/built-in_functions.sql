USE SALE;

SELECT * FROM Product;

SELECT SUM(sale_price) FROM Product;

SELECT SUM(sale_price) AS sum_of_saleprice FROM Product;

SELECT MAX(quantity) FROM Product;

SELECT AVG(sale_price) FROM Product;

SELECT AVG(sale_price/quantity) FROM Product WHERE product = 'Printer';

SELECT ROUND(sale_price) FROM Product;

SELECT LENGTH(product) from Product;

SELECT UCASE(product) FROM Product;

SELECT DISTINCT(UCASE(product)) FROM Product;

SELECT * FROM Product WHERE LCASE(product) = 'keyboard';

SELECT DAY(sale_date) FROM Product WHERE product = 'SSD';

SELECT *,COUNT(*) FROM Product WHERE MONTH(sale_date)='05';