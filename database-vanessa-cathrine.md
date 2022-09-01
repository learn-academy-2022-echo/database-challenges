<!-- WHERE
What is the population of the US? (HINT: 278357000)

select name, population
from country
where name = 'United States'

returns 278357000

What is the area of the US? (HINT: 9.36352e+06)

select surfacearea
from country
where name = 'United States'

returns 9.36352e+06

Which countries gained their independence before 1963?

select name, indepyear
from country
where indepyear <1963

List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? (HINT: 37 entries)

select name
from country
where population <30000000
and lifeexpectancy >45
and continent
like 'Africa'

returns 37

Which countries are something like a republic? (HINT: Are there 122 or 143?)

select name, governmentform
from country
where governmentform
like 'Republi%'

returns 122

Which countries are some kind of republic and achieved independence after 1945? (HINT: 92 entries)

select name, governmentform, indepyear
from country
where governmentform
like 'Republi%'
and indepyear >1945

returns 82, should be 92, needs to include federal republics and republics

select name, governmentform, indepyear
from country
where governmentform
like '%Republic'
and indepyear >1945

returns 92!

Which countries achieved independence after 1945 and are not some kind of republic? (HINT: 27 entries)

select name, governmentform, indepyear
from country
where governmentform
not like '%Republic'
and indepyear >1945

returns 27

ORDER BY
Which fifteen countries have the lowest life expectancy? (HINT: starts with Zambia, ends with Sierra Leonne)

SELECT name, lifeexpectancy
FROM country
ORDER BY lifeexpectancy
LIMIT 15

Which fifteen countries have the highest life expectancy? (HINT: starts with Andorra, ends with Spain)

SELECT name, lifeexpectancy
FROM country
WHERE lifeexpectancy IS NOT null
ORDER BY lifeexpectancy DESC
LIMIT 15

Which five countries have the lowest population density (density = population / surfacearea)? (HINT: starts with Greenland)

SELECT name, population, surfacearea,
population / surfacearea AS density
FROM country
WHERE population != 0
ORDER BY density
LIMIT 5

Which countries have the highest population density?(HINT: starts with Macao)

SELECT name, population, surfacearea,
population / surfacearea AS density
FROM country
WHERE population != 0
ORDER BY density DESC
LIMIT 5

Which is the smallest country by area? (HINT: .4)

SELECT name, surfacearea
FROM country
ORDER BY surfacearea

Which is the smallest country by population? (HINT: 50)?

SELECT name, population
FROM country
WHERE population != 0
ORDER BY population

Which is the biggest country by area? (HINT: 1.70754e+07)

SELECT name, surfacearea
FROM country
ORDER BY surfacearea DESC

Which is the biggest country by population? (HINT: 1277558000)

SELECT name, population
FROM country
ORDER BY population DESC

Who is the most influential head of state measured by population? (HINT: Jiang Zemin)

SELECT name, population, headofstate
FROM country
ORDER BY population DESC

Subqueries: WITH
Of the countries with the top 10 gnp, which has the smallest population? (HINT: Canada)
Of the 10 least populated countries with permament residents (a non-zero population), which has the largest surfacearea? (HINT: Svalbard and Jan Mayen)
Aggregate Functions: GROUP BY
Which region has the highest average gnp? (HINT: North America)
Who is the most influential head of state measured by surface area? (HINT: Elisabeth II)
What is the average life expectancy for all continents?
What are the most common forms of government? (HINT: use count(*))
How many countries are in North America?
What is the total population of all continents?
Stretch Challenges
Which countries have the letter ‘z’ in the name? How many?
Of the smallest 10 countries by area, which has the biggest gnp? (HINT: Macao)
Of the smallest 10 countries by population, which has the biggest per capita gnp?
Of the biggest 10 countries by area, which has the biggest gnp?
Of the biggest 10 countries by population, which has the biggest per capita gnp?
What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?
What year is this country database from? Cross reference various pieces of information to determine the age of this database. -->