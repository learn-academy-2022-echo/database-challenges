WHERE
What is the population of the US? (HINT: 278357000)
    SELECT name, population
    FROM country
    WHERE region='North America'

What is the area of the US? (HINT: 9.36352e+06)
    SELECT name, surfacearea
    FROM country
    WHERE name = 'United States'
Which countries gained their independence before 1963?
    SELECT name, indepyear
    FROM country
    WHERE indepyear < 1963

List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? (HINT: 37 entries)
    SELECT name, continent, population, lifeexpectancy
    FROM country
    WHERE population < 3e+7
    AND continent = 'Africa'
    AND lifeexpectancy > 45
Which countries are something like a republic? (HINT: Are there 122 or 143?)
    SELECT name, governmentform
    FROM country
    WHERE governmentform 
    like ('Republic%')
Which countries are some kind of republic and achieved independence after 1945? (HINT: 92 entries)
    Select name, governmentform, indepyear
    FROM country
    WHERE governmentform 
    like ('%Republic%')
    and indepyear > 1945

Which countries achieved independence after 1945 and are not some kind of republic? (HINT: 27 entries)
    Select name, governmentform, indepyear
    FROM country
    WHERE governmentform 
    Not Like('%Republic%')
    and indepyear > 1945

ORDER BY
Which fifteen countries have the lowest life expectancy? (HINT: starts with Zambia, ends with Sierra Leonne)
    Select name, lifeexpectancy
    FROM country
    Order by lifeexpectancy
    limit 15

Which fifteen countries have the highest life expectancy? (HINT: starts with Andorra, ends with Spain)
    Select name, lifeexpectancy
    FROM country
    Where lifeexpectancy > 0
    Order by lifeexpectancy DESC
    limit 15
Which five countries have the lowest population density (density = population / surfacearea)? (HINT: starts with Greenland)
    Select name, population, surfacearea,
    population / surfacearea as density
    FROM country
    Where population > 0
    order by density
    limit 5
            "Greenland"
            "Svalbard and Jan Mayen"
            "Falkland Islands"
            "Pitcairn"
            "Western Sahara"

Which countries have the highest population density?(HINT: starts with Macao)
    Select name, population, surfacearea,
    population / surfacearea as density
    FROM country
    Where population > 0
    order by density desc
    limit 5
            "Macao"
            "Monaco"
            "Hong Kong"
            "Singapore"
            "Gibraltar"

Which is the smallest country by area? (HINT: .4)
    Select name, surfacearea
    FROM country
    order by surfacearea 
    limit 1

Which is the smallest country by population? (HINT: 50)?
        Select name, population
        FROM country
        Where population > 0
        order by population
        limit 1
Which is the biggest country by area? (HINT: 1.70754e+07)
    Select name, surfacearea
    FROM country
    order by surfacearea desc
    limit 1
Which is the biggest country by population? (HINT: 1277558000)
    Select name, population
        FROM country
        Where population > 0
        order by population desc
        limit 1
Who is the most influential head of state measured by population? (HINT: Jiang Zemin)
    Select name, headofstate, population
        FROM country
        Where population > 0
		order by population desc

Subqueries: WITH
Of the countries with the top 10 gnp, which has the smallest population? (HINT: Canada)
    With populated AS (
	Select name, gnp, population
        FROM country
        Where population > 0
		order by gnp desc
		limit 10
            )
            Select name, gnp, population
                    FROM populated        
                    order by population

Of the 10 least populated countries with permament residents (a non-zero population), which has the largest surfacearea? (HINT: Svalbard and Jan Mayen)
With populated AS (
	Select name, surfacearea, population
        FROM country
        Where population > 0
		order by population 
		limit 10
    )
    Select name,  population, surfacearea
            FROM populated 
            order by surfacearea desc


Aggregate Functions: GROUP BY
Which region has the highest average gnp? (HINT: North America)
    SELECT region, AVG(gnp)
    FROM country
    GROUP BY region
    order by avg desc

Who is the most influential head of state measured by surface area? (HINT: Elisabeth II)
    SELECT headofstate, sum(surfacearea)
    from country
    group by headofstate
    order by sum desc

What is the average life expectancy for all continents?
    SELECT continent, avg(lifeexpectancy)
    from country
    group by continent
    order by avg desc

What are the most common forms of government? (HINT: use count(*))
        SELECT governmentform, count(governmentform)
        from country
        group by governmentform
        order by count
How many countries are in North America?
    SELECT continent, count(name)
    from country
    group by continent
    order by count
What is the total population of all continents?
    SELECT SUM(population)
    from country
    -7 for iss

Stretch Challenges
Which countries have the letter ‘z’ in the name? How many?
    select name
    from country 
    where name
    like (%z%)
Of the smallest 10 countries by area, which has the biggest gnp? (HINT: Macao)
    WITH gnp_lowest_pop AS
    (SELECT name, surfacearea, population
    FROM Country
    WHERE population > 0
    ORDER BY population
    LIMIT 10)
    SELECT name, population, surfacearea
    FROM gnp_lowest_pop
    ORDER BY surfacearea DESC
Of the smallest 10 countries by population, which has the biggest per capita gnp?
Of the biggest 10 countries by area, which has the biggest gnp?
Of the biggest 10 countries by population, which has the biggest per capita gnp?
What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?
What year is this country database from? Cross reference various pieces of information to determine the age of this database.