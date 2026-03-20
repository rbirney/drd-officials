USE library;

#Page 2 Exercises (Aggregate Functions Exercises)
SELECT COUNT(studentId) AS 'Number of Waterford Students' 
FROM student 
WHERE county = 'Waterford';

SELECT COUNT(ISBN) AS 'Number of Database books' 
FROM book 
WHERE title LIKE '%Database%';

SELECT MAX(price) AS 'Most expensive book price' 
FROM book;

SELECT MIN(price) AS 'Least expensive book price' 
FROM book;

SELECT AVG(price) AS 'Average book price' 
FROM book;

SELECT COUNT(DISTINCT county) AS 'Number of student counties' 
FROM student;

#Page 3 Exercise (Rounding)
SELECT ROUND(AVG(price),2) AS 'Average book price' 
FROM book;

#Page 4 Exercises (Group By)
SELECT COUNT(copyId) AS 'Number of book copies' 
FROM bookcopy;

SELECT ISBN, COUNT(copyId) AS 'Number of Copies of each Book' 
FROM bookcopy 
GROUP BY isbn;

SELECT Category, COUNT(ISBN) AS 'Number of books per Category' 
FROM book 
GROUP BY category;

SELECT Publisher, MAX(price) AS 'Most expensive book price', 
       MIN(price) AS 'Least expensive book price' 
FROM book
GROUP BY publisher;

#Page 5 Exercises (Having)
SELECT Category, COUNT(ISBN) AS 'Number of books per Category' 
FROM book 
GROUP BY category 
HAVING COUNT(ISBN) >=3;

SELECT Publisher, MAX(price) AS 'Most expensive book price', 
       MIN(price) AS 'Least expensive book price' 
FROM book
GROUP BY publisher 
HAVING MAX(price) >=60;

#Movies Exercise

USE movies;

#1.
DESC film;
DESC reviewer;
DESC rating;

#2.
SELECT title 
FROM film 
WHERE director = 'Steven Spielberg';

#3.
SELECT title, releaseYear  
FROM film 
WHERE releaseYear BETWEEN 1940 AND 1990 
ORDER BY title;

#4.
SELECT title, length  
FROM film 
WHERE length >=110 
ORDER BY title;

#5.
SELECT title, director 
FROM film 
WHERE director 
LIKE '% C%';

#alternative solution 
#We have not covered this but we can split elements as well as join them
SELECT title, SUBSTRING_INDEX(director,' ',1) AS "First Name",
       SUBSTRING_INDEX(director,' ',-1) AS "Last Name"
FROM film
WHERE SUBSTRING_INDEX(director,' ',-1) LIKE "C%";

#6.
SELECT fID AS 'Film Id', stars, ratingdate
FROM rating
WHERE stars IN(4,5)
ORDER BY stars DESC, fid;

#7.
SELECT rId 
FROM rating
WHERE ratingdate IS NULL;

#8.
SELECT COUNT(fID) AS 'Number of Movies' 
FROM film;

#9.
SELECT COUNT(rID) AS 'Number of Reviewers' 
FROM reviewer;

#10.
SELECT COUNT(ratingId) AS 'Number of Ratings Provided' 
FROM rating;

#11.
SELECT director, COUNT(fID) AS 'Number of Films' 
FROM film 
GROUP BY director;

#12.
SELECT rID, COUNT(ratingId) AS 'Number of Reviews (Reviewer)' 
FROM rating 
GROUP BY rId;

#13.
SELECT director, ROUND(AVG(length)) AS 'Average Number of Minutes per Film' 
FROM film 
GROUP BY director;
