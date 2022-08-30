WHERE

What is the population of the US? (HINT: 278357000)
```sql

SELECT name, population
FROM Country
WHERE name = 'United States'

```

What is the area of the US? (HINT: 9.36352e+06)
```sql

SELECT name, surfacearea
FROM Country
WHERE name = 'United States'

```

Which countries gained their independence before 1963?
```sql

SELECT name, indepyear
FROM Country
WHERE indepyear < 1963

```

List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy 
of more than 45? (HINT: 37 entries)
```sql

SELECT continent, population, lifeexpectancy
FROM Country
WHERE population < 30000000
AND lifeexpectancy > 45
AND continent = 'Africa'

```
Which countries are something like a republic? (HINT: Are there 122 or 143?)
```sql

SELECT name, governmentform
FROM Country
WHERE governmentform = 'Republic'


SELECT name, governmentform
FROM Country
WHERE governmentform 
LIKE '%public'

```


Which countries are some kind of republic and achieved independence after 1945? (HINT: 92 entries)
```sql
SELECT name, governmentform
FROM Country
WHERE governmentform 
LIKE '%public'
AND indepyear > 1945

```
Which countries achieved independence after 1945 and are not some kind of republic? (HINT: 27 entries)
```sql

SELECT name, governmentform
FROM Country
WHERE governmentform NOT LIKE '%epublic'
AND
indepyear > 1945

```

ORDER BY
Which fifteen countries have the lowest life expectancy? (HINT: starts with Zambia, ends with Sierra Leonne)
```sql

SELECT name, lifeexpectancy
FROM Country
ORDER BY lifeexpectancy
LIMIT 15

```
Which fifteen countries have the highest life expectancy? (HINT: starts with Andorra, ends with Spain)
```sql

SELECT name, lifeexpectancy
FROM Country
WHERE lifeexpectancy > 0
ORDER BY lifeexpectancy DESC
LIMIT 15

```


Which five countries have the lowest population density (density = population / surfacearea)? (HINT: starts with Greenland)
```sql
SELECT name, population, surfacearea,
population/surfacearea AS population_density
FROM Country
WHERE population > 0
ORDER BY population_density
LIMIT 5

```
Which countries have the highest population density?(HINT: starts with Macao)
```sql

SELECT name, population, surfacearea,
population/surfacearea AS population_density
FROM Country
WHERE population > 0
ORDER BY population_density DESC
LIMIT 5

```
Which is the smallest country by area? (HINT: .4)
```sql

SELECT name, population, surfacearea
FROM Country
WHERE surfacearea > 0
ORDER BY surfacearea
LIMIT 5

```
Which is the smallest country by population? (HINT: 50)?
```sql

ELECT name, population, surfacearea
FROM Country
WHERE population > 0
ORDER BY population
LIMIT 5

```
Which is the biggest country by area? (HINT: 1.70754e+07)
```sql

SELECT name, population, surfacearea
FROM Country
WHERE surfacearea > 0
ORDER BY surfacearea DESC
LIMIT 5

```
Which is the biggest country by population? (HINT: 1277558000)
```sql

SELECT name, population, surfacearea
FROM Country
WHERE population > 0
ORDER BY population DESC
LIMIT 5

```
Who is the most influential head of state measured by population? (HINT: Jiang Zemin)
```sql

SELECT name, headofstate
FROM Country
WHERE population > 0
ORDER BY population DESC
LIMIT 5


```

Subqueries: WITH
Of the countries with the top 10 gnp, which has the smallest population? (HINT: Canada)
```sql

WITH gnp_lowest_pop AS 
(SELECT name, gnp, population
FROM Country
WHERE population > 0
ORDER BY gnp DESC
LIMIT 10)

SELECT name, population, gnp
FROM gnp_lowest_pop
ORDER BY population

```
Of the 10 least populated countries with permament residents (a non-zero population), which has the largest surfacearea? (HINT: Svalbard and Jan Mayen)
```sql

WITH gnp_lowest_pop AS 
(SELECT name, surfacearea, population
FROM Country
WHERE population > 0
ORDER BY population 
LIMIT 10)

SELECT name, population, surfacearea
FROM gnp_lowest_pop
ORDER BY surfacearea DESC

```

Aggregate Functions: GROUP BY
Which region has the highest average gnp? (HINT: North America)
```sql

SELECT region, AVG(gnp)
FROM Country
GROUP BY region
ORDER BY avg DESC

```
Who is the most influential head of state measured by surface area? (HINT: Elisabeth II)
```sql

SELECT headofstate, SUM(surfacearea)
FROM Country
GROUP BY headofstate
ORDER BY SUM DESC

```
What is the average life expectancy for all continents?
```sql

SELECT continent, AVG(lifeexpectancy)
FROM Country
GROUP BY continent
ORDER BY AVG DESC

```
What are the most common forms of government? (HINT: use count(*))
```sql

SELECT governmentform, COUNT(governmentform)
FROM Country
GROUP BY governmentform
ORDER BY COUNT DESC

```
How many countries are in North America?
```sql

SELECT continent, COUNT(name)
FROM Country
GROUP BY continent
ORDER BY COUNT DESC

North America = 37

```
What is the total population of all continents?
```sql

SELECT SUM(population)
FROM Country

```

Stretch Challenges
Which countries have the letter ‘z’ in the name? How many?
```sql

SELECT name
FROM Country
WHERE name
LIKE '%z%

```
Of the smallest 10 countries by area, which has the biggest gnp? (HINT: Macao)
```sql



```
Of the smallest 10 countries by population, which has the biggest per capita gnp?
Of the biggest 10 countries by area, which has the biggest gnp?
Of the biggest 10 countries by population, which has the biggest per capita gnp?
What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?
What year is this country database from? Cross reference various pieces of information to determine the age of this database.
