USE world;
DESCRIBE city;
DESCRIBE countrylanguage;

-- 1. Using COUNT, get the number of cities in the USA.
SELECT COUNT(name) FROM city WHERE CountryCode='USA';

-- 2. Find out what the population and life expectancy for people in Argentina (ARG) is
SELECT Population, LifeExpectancy FROM country WHERE name='Argentina';

-- 3. Using IS NOT NULL, ORDER BY, LIMIT, what country has the lowest life expectancy? 
SELECT name, LifeExpectancy FROM country WHERE LifeExpectancy IS NOT NULL ORDER BY LifeExpectancy ASC LIMIT 1;

-- 4.	Using JOIN … ON, what is the capital of Spain (ESP)?
SELECT co.name AS CountryName, ci.name AS CityName
FROM country AS co
JOIN city AS ci 
ON co.Capital=ci.ID WHERE co.name='Spain';

-- 5.	Using JOIN … ON, list all the languages spoken in the 'Southeast Asia' region.
SELECT co.Region, cl.Language -- I'm naming the result columns, co and cl reference the tables below
FROM country AS co -- I'm renaming one table and I have to use co in the line above
JOIN countrylanguage AS cl -- I'm renaming the other table and I have to use cl two lines above
ON  co.Code=cl.CountryCode WHERE co.Region='Southeast Asia'; -- I need to find the common key between the tables and specify the Region

-- 6.	Select 25 cities around the world that start with the letter 'F' in a single SQL query.
SELECT name FROM city WHERE name LIKE 'F%' LIMIT 25;

-- 7.	Using COUNT, get the number of cities in China.
SELECT COUNT(name) FROM city WHERE CountryCode='CHN';

-- 8.	Using IS NOT NULL, ORDER BY, & LIMIT, what country has the lowest population?
SELECT name, Population FROM country WHERE Population IS NOT NULL AND Population >1 ORDER BY Population ASC LIMIT 1;

-- 9.	Using aggregation, return the number of countries in the database.
SELECT COUNT(name) FROM country;

-- 10.	What are the top ten largest countries by population?
SELECT name, Population FROM country ORDER BY population DESC LIMIT 10;

-- 11.	List the top five largest cities in Japan.
SELECT ci.name, co.Population
FROM country AS co
JOIN city AS ci
ON  co.Code=ci.CountryCode WHERE co.name = 'Japan'
ORDER BY ci.Population DESC LIMIT 5;

-- 12.	List the names and country codes of every country which has Elisabeth II as its Head of State.
SELECT Name, Code, HeadOfState FROM country WHERE HeadOfState="Elisabeth II";

-- 13.	List the top ten countries which have the smallest population-to-area ratio.
SELECT name, Population/SurfaceArea AS Density FROM country WHERE Population > 0 ORDER BY Density ASC LIMIT 10;

-- 14.	List every unique world language, according to the World database.
SELECT DISTINCT(Language) FROM countrylanguage;
SELECT COUNT(DISTINCT(Language)) FROM countrylanguage;

-- 15.	What are the top 10 richest countries by GNP?
SELECT Name, GNP FROM country ORDER BY GNP DESC LIMIT 10;

-- 16.	What are the top 10 largest countries by surface area?
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 10;

-- 17.	List every country where over 50% of its population can speak French.
SELECT co.name
FROM country AS co
JOIN countrylanguage AS cl
ON co.Code=cl.CountryCode WHERE cl.Language = 'French' AND cl.Percentage > 50;

-- 18.	Which country has the worst life expectancy?
SELECT name, LifeExpectancy FROM country WHERE LifeExpectancy > 0 ORDER BY LifeExpectancy ASC;

-- 19.	What is the most common government form?
SELECT GovernmentForm, COUNT(GovernmentForm) AS Number FROM country GROUP BY GovernmentForm ORDER BY Number DESC;

-- 20.	How many countries have gained independence since records began?
SELECT Name, IndepYear FROM country WHERE IndepYear IS NOT NULL;

