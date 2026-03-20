use gym;

-- Subquery with equality exercise
-- Return the list of classes run by Liam Walsh

SELECT classId, classDescription, classDay, classTime, duration 
FROM fitnessclass 
WHERE PPS = 
  (
	SELECT PPS 
	FROM trainer 
	WHERE firstName = 'Liam'
	AND lastName = 'Walsh'
   );


-- Subquery with aggregate functions: Exercise 1
-- Return the first name, last name, and salary of all trainers who are paid a higher-than-average salary

SELECT firstName, lastName, salary 
FROM trainer 
WHERE salary >= 
  (SELECT AVG(salary) 
   FROM trainer);
   
-- Subquery with aggregate functions: Exercise 2
-- Find the name and location of the youngest gym member

SELECT firstName, lastName, county, dateOfBirth
FROM gymmember 
WHERE dateOfBirth = 
  (SELECT MAX(dateOfBirth) 
   FROM gymmember);


-- Subquery with IN
-- Using a subquery, return the details of any class that does not have people signed up for it 

SELECT * 
FROM fitnessclass
WHERE classID NOT IN (
	SELECT classID
	FROM memberclass 
	GROUP BY classId
);


-- USING ANY AND ALL
-- Using a subquery, select all the membership types that have a price higher than the discounted student price. 

SELECT *
FROM membershiptype 
WHERE price > ALL(
	SELECT price 
    FROM membershiptype
    WHERE membership LIKE '%Discount%'
);
