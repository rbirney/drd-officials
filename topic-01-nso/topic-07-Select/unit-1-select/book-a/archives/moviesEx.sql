use movies;

SELECT title as "1994 Films"
FROM film 
WHERE releaseYear = 1994
order by title;

SELECT title as "Christoher Nolan Films"
FROM film 
WHERE dirfirstName = "Christopher" and dirlastname = "Nolan"
order by title;

SELECT releaseYear  As "Release Year", title Title  
FROM film 
WHERE releaseYear BETWEEN 1990 AND 2000
ORDER BY releaseYear, title;

SELECT length  Length, title Title
FROM film 
WHERE length >=140 
ORDER BY length desc, title;

SELECT concat(dirfirstName, " ", dirlastName) as Director, title Title
FROM film 
WHERE dirlastName like "C%"
order by dirlastName, dirfirstName, title;

SELECT concat(dirfirstName, " ", dirlastName) as Director, title Title
FROM film 
WHERE dirlastName in('Tarantino', 'Darabont', 'Nolan')
order by dirlastName, dirfirstName, title;


SELECT rId as "Reviewer Id"
FROM rating
WHERE ratingdate IS NULL
order by rId;