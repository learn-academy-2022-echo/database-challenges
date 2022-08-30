-- Challenges
-- Save your queries in a file if you want to keep them for posterity.

-- WHERE
-- What is the population of the US? (HINT: 278357000)✅
-- Select name, population
-- FROM Country 
-- WHERE name = 'United States'
-- What is the area of the US? (HINT: 9.36352e+06)✅
Select name, surfacearea
FROM Country 
WHERE name = 'United States'
-- Which countries gained their independence before 1963?✅
Select name, indepyear

FROM  Country
WHERE indepyear < 1963
-- List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? (HINT: 37 entries)✅
Select name, population, lifeexpectancy
FROM  Country
WHERE continent = 'Africa'
AND population < 30000000 
AND lifeexpectancy> 45
-- Which countries are something like a republic? (HINT: Are there 122 or 143?)✅
Select name, governmentform
FROM  Country
WHERE governmentform 
LIKE  '%epublic%'
 
-- Which countries are some kind of republic and achieved independence after 1945? (HINT: 92 entries)✅
Select name, governmentform
FROM  Country
WHERE governmentform 
LIKE  '%epublic%'
AND indepyear > 1945
-- Which countries achieved independence after 1945 and are not some kind of republic? (HINT: 27 entries)✅
Select name, governmentform
FROM  Country
WHERE governmentform 
NOT LIKE '%epublic%'
AND indepyear > 1945

-- ORDER BY
-- Which fifteen countries have the lowest life expectancy? (HINT: starts with Zambia, ends with Sierra Leonne)✅
SELECT name, lifeexpectancy
FROM Country
ORDER BY lifeexpectancy ASC
LIMIT 15
-- Which fifteen countries have the highest life expectancy? (HINT: starts with Andorra, ends with Spain)✅
SELECT name, lifeexpectancy
FROM Country
WHERE lifeexpectancy IS NOT NULL
ORDER BY lifeexpectancy DESC
LIMIT 15
-- Which five countries have the lowest population density (density = population / surfacearea)? (HINT: starts with Greenland)✅
SELECT name, 
population/surfacearea AS population_density
FROM Country
WHERE population > 0
ORDER BY population_density ASC
LIMIT 5
-- Which countries have the highest population density?(HINT: starts with Macao)✅
SELECT name, 
population/surfacearea AS population_density
FROM Country
ORDER BY population_density DESC
LIMIT 10
-- Which is the smallest country by area? (HINT: .4)✅
SELECT name, surfacearea
FROM Country
ORDER BY surfacearea
LIMIT 1
-- Which is the smallest country by population? (HINT: 50)?✅
SELECT name, population
FROM Country
WHERE population > 0
ORDER BY population
LIMIT 1
-- Which is the biggest country by area? (HINT: 1.70754e+07)✅
SELECT *
FROM Country
ORDER BY surfacearea DESC
LIMIT 1
-- Which is the biggest country by population? (HINT: 1277558000)✅
SELECT *
FROM Country
ORDER BY population DESC
LIMIT 1
-- Who is the most influential head of state measured by population? (HINT: Jiang Zemin)✅
-- Subqueries: WITH
WITH biggest_countries AS (
	SELECT name, population, headofstate, gnp
	FROM Country
	WHERE population > 0
	AND gnp > 0
)
SELECT name, headofstate, gnp, population
FROM biggest_countries
ORDER BY population DESC
LIMIT 10
-- Of the countries with the top 10 gnp, which has the smallest population? (HINT: Canada)✅
WITH top_gnp AS (
	SELECT *
	FROM Country
	ORDER BY gnp DESC
	LIMIT 10
)
SELECT *
FROM top_gnp
ORDER BY population ASC
LIMIT 1
-- Of the 10 least populated countries with permament residents (a non-zero population), which has the largest surfacearea? (HINT: Svalbard and Jan Mayen)
WITH least_pop AS (
	SELECT *
	FROM Country
	WHERE population > 0
	ORDER BY population
	LIMIT 10
)
SELECT *
FROM least_pop
ORDER BY surfacearea DESC
LIMIT 1
-- Aggregate Functions: GROUP BY
-- Which region has the highest average gnp? (HINT: North America)
-- Who is the most influential head of state measured by surface area? (HINT: Elisabeth II)
-- What is the average life expectancy for all continents?
-- What are the most common forms of government? (HINT: use count(*))
-- How many countries are in North America?
-- What is the total population of all continents?
-- Stretch Challenges
-- Which countries have the letter ‘z’ in the name? How many?
-- Of the smallest 10 countries by area, which has the biggest gnp? (HINT: Macao)
-- Of the smallest 10 countries by population, which has the biggest per capita gnp?
-- Of the biggest 10 countries by area, which has the biggest gnp?
-- Of the biggest 10 countries by population, which has the biggest per capita gnp?
-- What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?
-- What year is this country database from? Cross reference various pieces of information to determine the age of this database.