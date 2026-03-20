-- SQL Join 1 Lab
-- Exercise solutions

-- -------------------------------------------------------------------

use gym;

-- -------------------------------------------------------------------

-- Join Exercises

-- Exercise 1
-- Retrieve the description, day, time, and trainer by name for all fitness classes. Sort the results in alphabetical order of description.

SELECT classDescription AS Class, classDay as Day, classTime as Time, CONCAT(firstname, " ", lastName) AS Name
FROM Fitnessclass JOIN Trainer USING (PPS)
ORDER BY classDescription;


-- Exercise 2
-- List the member name (combined fname and lname), payment date and payment amount for all payments. Sort in alphabetical order of LastName, firstName.

SELECT CONCAT(firstname, " ", lastName) AS Name, paymentDate AS "Payment Date", amount AS "Amount Paid"
FROM Gymmember JOIN Payment USING (memberId)
ORDER BY lastname, firstname;


-- Exercise 3
-- Retrieve the description, time, and trainer name for all fitness classes that take place on Friday. Sort the results in alphabetical order of description.

SELECT classDescription AS Class, classTime as Time, CONCAT(firstname, " ", lastName) AS Name
FROM Fitnessclass  JOIN Trainer USING (PPS)
WHERE classDay = "Friday"
ORDER BY classDescription;


-- -------------------------------------------------------------------

-- More Join Exercises

-- Exercise 1
-- Return the number of classes by each Trainer (identified by name). Output the count with the label Number of Classes and identify each Trainer by name (combined firstName and lastName). Note: Use the combined firstName and lastName in the Group By clause (i.e. GROUP BY lastname, firstname). Sort in alphabetical order by Last Name and then First Name.

SELECT CONCAT(firstName, " ", lastName) AS Name, COUNT(classId) AS "Number of Classes"
FROM Fitnessclass  JOIN Trainer USING (PPS)
GROUP BY lastName, firstName
ORDER BY lastName, firstName;


-- Exercise 2
-- Return the number of classes given by Trainer (Liam Walsh).

select COUNT(classId) AS "Number of Classes by Liam Walsh"
FROM Fitnessclass  JOIN Trainer USING (PPS)
where lastname = "Walsh" and firstname = "Liam";


-- Exercise 3
-- Return the number of payments per member (identified by name). Output the count with the label Number of Payments and identify each member by name (combined firstName and lastName). Note: Use both lastName and firstName in the Group By clause. Sort in alphabetical order by Last Name and then First Name.

SELECT CONCAT(firstname, " ", lastName) AS Name, COUNT(paymentId) AS "Number of Payments"
FROM Gymmember  JOIN Payment USING (memberId)
GROUP BY lastname, firstname
ORDER BY lastname, firstname;


-- -------------------------------------------------------------------

-- CASE

-- Exercise 
-- Use the CASE operator to output an instructor type. It should read “Single-class instructor” for instructors with 1 class, “Multiple-class instructor” for those with multiple classes, and “Not an instructor” if they have no classes.

SELECT CONCAT(firstname, " ", lastName) AS Name, 
CASE 
  WHEN COUNT(classId) = 1 THEN 'Single-class instructor'
  WHEN COUNT(classId) >= 2 THEN 'Multiple-class instructor'
  ELSE 'Not an instructor'
END AS 'Instructor Type'
FROM Fitnessclass  JOIN Trainer USING (PPS)
GROUP BY lastname, firstname
ORDER BY lastname, firstname;
