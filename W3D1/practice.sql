# SQL Bolt Practice


# Find the title of each film
SELECT title FROM movies;

# Find the director of each film
SELECT director FROM movies;

# Find the title and director of each film
SELECT title, director FROM movies;

# Find the title and year of each film
SELECT title, year FROM movies;

# Find all the information about each film
SELECT * FROM movies;


######################################################
# Find the movies released in the years between 2000 and 2010
SELECT * FROM movies
WHERE id == 6;

# Find the movies released in the years between 2000 and 2010
SELECT * FROM movies
WHERE year > 1999 AND year < 2011;

# Find the movies not released in the years between 2000 and 2010
SELECT * FROM movies
WHERE year < 2000 AND year > 2010;

# Find the first 5 Pixar movies and their release year
SELECT * FROM movies LIMIT 5


######################################################
# Find all the Toy Story movies 
SELECT * FROM movies
WHERE title LIKE "%TOY%";

# Find all the movies directed by John Lasseter
SELECT * FROM movies
WHERE director = "John Lasseter";

# Find all the movies (and director) not directed by John Lasseter
SELECT * FROM movies
WHERE director != "John Lasseter";

# Find all the WALL-* movies
SELECT * FROM movies
WHERE title LIKE '%WALL%';


######################################################
# List all directors of Pixar movies (alphabetically), 
# without duplicates
SELECT DISTINCT director FROM movies
ORDER BY director;

# List the last four Pixar movies released 
# (ordered from most recent to least)
SELECT * FROM movies
ORDER BY year DESC
LIMIT 4;

# List the first five Pixar movies sorted alphabetically
SELECT * FROM movies
ORDER BY title
LIMIT 5;

# List the next five Pixar movies sorted alphabetically
SELECT * FROM movies
ORDER BY title
LIMIT 5 OFFSET 5;


######################################################
# List all the Canadian cities and their populations
SELECT * FROM north_american_cities
WHERE country = 'Canada';

# Order all the cities in the United States by their latitude 
# from north to south
SELECT * FROM north_american_cities
WHERE country = 'United States'
ORDER BY latitude DESC;

# List all the cities west of Chicago, ordered from west to east
SELECT * FROM north_american_cities
WHERE longitude < (
    SELECT longitude FROM north_american_cities
    WHERE city = 'Chicago'
    )
ORDER BY longitude

# List the two largest cities in Mexico (by population)
SELECT * FROM north_american_cities
WHERE country = 'Mexico'
ORDER BY population DESC
LIMIT 2;

# List the third and fourth largest cities (by population) 
# in the United States and their population
SELECT * FROM north_american_cities
WHERE country = 'United States'
ORDER BY population DESC
LIMIT 2 OFFSET 2;


######################################################
# Find the domestic and international sales for each movie
SELECT * FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

# Show the sales numbers for each movie that 
# did better internationally rather than domestically
SELECT * FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id
WHERE international_sales > domestic_sales;

# List all the movies by their ratings in descending order
SELECT * FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id
ORDER BY rating DESC;


######################################################
# inner joins = join on data that both tables share
# left join = include rows from A regardless of data in B
# right join = include rows from B regardless of data in A
# full join = all rows from both tables are kept

# Find the list of all buildings that have employees
SELECT DISTINCT building FROM employees;

# Find the list of all buildings and their capacity
SELECT * FROM buildings;

# List all buildings and the distinct employee roles 
# in each building (including empty buildings)
SELECT DISTINCT building_name, role FROM buildings
LEFT JOIN employees
    ON employees.building = buildings.building_name;


######################################################
# Find the name and role of all employees 
# who have not been assigned to a building
SELECT * FROM employees
WHERE building IS NULL;

# Find the names of the buildings that hold no employees
SELECT * FROM buildings
LEFT JOIN employees 
    ON building_name = building
WHERE name IS NULL;


######################################################
# List all movies and their combined sales in millions of dollars 
SELECT title, (domestic_sales + international_sales) / 1000000
FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

# List all movies and their ratings in percent
SELECT title, rating * 10 AS 'percent'
FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

# List all movies that were released on even number years
SELECT * FROM movies
WHERE year % 2 = 0;


######################################################
# Find the longest time that an employee has been at the studio
SELECT MAX(years_employed) FROM employees;

# For each role, find the average number of years
# employed by employees in that role
SELECT role, AVG(years_employed) FROM employees
GROUP BY role;

# Find the total number of employee years worked in each building
SELECT building, SUM(years_employed) FROM employees
GROUP BY building;


######################################################
# Find the number of Artists in the studio (without a HAVING clause) 
SELECT COUNT(*) FROM employees
WHERE role = 'Artist';

# Find the number of Employees of each role in the studio
SELECT role, COUNT(*) FROM employees
GROUP BY role;

# Find the total number of years employed by all Engineers 
SELECT role, SUM(years_employed) FROM employees
WHERE role = 'Engineer';


######################################################
# Find the number of movies each director has directed
SELECT director, COUNT(*) FROM movies
GROUP BY director;

# Find the total domestic and international sales that can be attributed to each director
SELECT director, SUM(domestic_sales + international_sales) AS total_sales
FROM movies
    INNER JOIN boxoffice ON movies.id = boxoffice.movie_id
GROUP BY director;