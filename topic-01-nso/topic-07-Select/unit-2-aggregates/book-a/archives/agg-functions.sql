USE GYM;

# Page 2 Exercises

SELECT COUNT(memberId) AS "Number of Members from Waterford"
FROM Gymmember
WHERE county = "Waterford";

SELECT COUNT(serialNumber) AS "Number of Yoga Equipment items"
FROM Equipment
WHERE equipDescription LIKE "%Yoga%";

SELECT MAX(salary) AS 'Largest Salary' 
FROM Trainer;

SELECT MIN(salary) AS 'Smallest Salary' 
FROM Trainer;

SELECT COUNT(DISTINCT county) AS "Number of Member Counties"
FROM GymMember; 


# Page 3 Exercise

SELECT ROUND(AVG(salary), 2) AS 'Average Salary' 
FROM Trainer;

SELECT FORMAT(AVG(salary), 2) AS 'Average Salary' 
FROM Trainer;

# Page 4 Exercises

SELECT  make AS Make, COUNT(serialNumber) AS "Number of Equipment items"
FROM equipment
GROUP BY make;

SELECT memberId AS Member, SUM(amount) AS "Total Paid"
FROM payment
GROUP BY memberid;

# Page 5 Exercise

SELECT  make AS Make, COUNT(serialNumber) AS "Number of Equipment items"
FROM equipment
GROUP BY make
HAVING COUNT(serialNumber) >= 3;

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
#We have not covered this but we can split elements as well as concatenate them
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
