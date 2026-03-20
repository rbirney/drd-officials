USE library;

#Page 4 Exercises (Multi-table Join Exercises)
SELECT title AS 'Books currently on loan' 
FROM book JOIN bookCopy 
ON book.ISBN = bookCopy.ISBN 
JOIN loan 
ON bookCopy.copyId = loan.copyId 
WHERE dateback IS NULL
ORDER BY book.title;

SELECT title AS 'Books currently on loan' , CONCAT(fname, ' ', lname) AS 'Student Name', dateOut, dateDue 
FROM book JOIN bookCopy 
ON book.ISBN = bookCopy.ISBN 
JOIN loan ON bookCopy.copyId = loan.copyId 
JOIN student ON loan.studentId = student.studentId 
WHERE dateback IS NULL
ORDER BY title;

SELECT title, COUNT(*) AS 'Number of Loans' 
FROM book JOIN bookCopy 
ON book.ISBN = bookCopy.ISBN 
JOIN loan 
ON bookCopy.copyId = loan.copyId 
GROUP BY title
ORDER BY title;

#Movies Database Exercise 1
USE movies;

#1
SELECT name AS 'Reviewer Name', title AS 'Film title', stars AS 'Number of Stars', ratingDate AS 'Date of Rating'  
FROM reviewer  JOIN rating
ON reviewer.rid = rating.rid
JOIN  film 
ON film.fid = rating.fid
ORDER BY name, title;

#2
SELECT title AS 'Films Reviewed by Chris Jackson' 
FROM reviewer  JOIN rating
ON reviewer.rid = rating.rid
JOIN  film 
ON film.fid = rating.fid
WHERE name = 'Chris Jackson'
ORDER BY title;

#Movies Database Exercise 2
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
