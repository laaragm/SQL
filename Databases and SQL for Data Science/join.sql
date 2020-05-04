-- In a practical relational database, each relation schema must have a primary key. The value of the Primary
-- Key must be unique for each instance of the entity.
-- A FOREIGN KEY is a key used to link two tables together. It's a field (or collection of fields)
-- in one table that refers to the PRIMARY KEY in another table.
-- Parent table: a table containing a Primary Key that is related to at least one Foreign Key
-- Dependent table(Child table): a table containing one or more Foreign Keys

-- MySQL doesn't support FULL OUTER JOIN

USE HR;

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM JOB_HISTORY;
SELECT * FROM JOBS;
SELECT * FROM LOCATIONS;

-- Query 1A: Select the names and job start dates of all employees who work for the department number 5
SELECT EMPLOYEES.F_NAME, EMPLOYEES.L_NAME, JOB_HISTORY.START_DATE
FROM EMPLOYEES
INNER JOIN JOB_HISTORY ON EMPLOYEES.EMP_ID = JOB_HISTORY.EMPL_ID
WHERE EMPLOYEES.DEP_ID = 5;

-- Query 1B: Select the names, job start dates, and job titles of all employees who work for the department number 5
SELECT E.F_NAME, E.L_NAME, JH.START_DATE, J.JOB_TITLE
FROM EMPLOYEES AS E
INNER JOIN JOB_HISTORY AS JH ON E.EMP_ID = JH.EMPL_ID
INNER JOIN JOBS AS J ON E.JOB_ID = J.JOB_IDENT
WHERE E.DEP_ID = 5;

-- Query 2A: Perform a Left Outer Join on the EMPLOYEES and DEPARTMENT tables and select employee id, last name and
-- department id for all employees
SELECT E.EMP_ID, E.L_NAME, E.DEP_ID FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID = D.DEPT_ID_DEP;

-- Query 2B: Re-write the query for 2A to limit the result set to include only the rows for employees born before 1980
SELECT E.EMP_ID, E.L_NAME, E.DEP_ID FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID = D.DEPT_ID_DEP
WHERE YEAR(E.B_DATE) < 1980;
