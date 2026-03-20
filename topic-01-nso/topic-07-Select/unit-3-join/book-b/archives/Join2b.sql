#Movies Exercise
USE movies;

INSERT INTO reviewer VALUES(209, 'Liam Collins');

#1
SELECT title AS 'Film Title', name AS 'Reviewer Name', stars AS 'Number of Stars' 
FROM reviewer  JOIN rating
ON reviewer.rid = rating.rid
RIGHT JOIN film 
ON film.fid = rating.fid;

#2
SELECT name AS 'Reviewer Name', title AS 'Film Title', stars AS 'Number of Stars' 
FROM film  JOIN rating
ON film.fid = rating.fid
RIGHT JOIN reviewer 
ON reviewer.rid = rating.rid;