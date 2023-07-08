--Challenge Sample Scenario Complete SQL Queries --

--Master Data Sheet--
SELECT * FROM commission;

--1 Write a query to return the average number of years worked across all employees--
SELECT AVG(YearsWorked) AS AVGNumbYrsWorked
FROM commission;

--2 Write a query to return the highest value of total commission--
SELECT MAX(TotalCommission) 
FROM commission 
WHERE TotalCommission;

--3 Write a query to determine the number of records that have a total commission value of 12000 or more--
--Potential corrupt file/Output should be 5 not 6 TBD--

SELECT COUNT(TotalCommission)
FROM commission 
WHERE TotalCommission >=12000;

--4 Write a query to return the lowest value of total commission--
SELECT MIN(TotalCommission) 
FROM commission;

--5 Write a query to return the average of employee commission--
SELECT AVG(totalcommission) 
FROM commission;

--6 Write a query to return the total of years worked across all employee records--
SELECT SUM(yearsworked) 
FROM commission;

--THE END--
