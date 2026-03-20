USE GYM;

#Page 2 Exercise (Describing Data)
DESC MembershipType;
DESC GymMember;
DESC Payment;
DESC Trainer;
DESC FitnessClass;
DESC Equipment;
DESC MemberClass;
DESC ClassEquipment;

#Page 4 Exercises (Simple Select examples)
SELECT firstName, lastName, street, town, county
FROM Trainer;

SELECT firstName, lastName,  county
FROM Trainer
WHERE county <> "Waterford";

#Page 5 Exercises (More on Select)
SELECT DISTINCT county AS "Member County"
FROM GymMember; 

SELECT CONCAT(firstName, " ", lastName) AS "Member Name"
FROM GymMember
WHERE county = "Waterford";

SELECT model AS Model, equipDescription AS Description
FROM Equipment
WHERE make = "NordicTrack";

#Page 6 Exercises (Pattern Matching)
SELECT CONCAT(firstName, " ", lastName) AS "Trainer Name"	
FROM Trainer
WHERE specialty LIKE '%Yoga%';

SELECT CONCAT(firstName, " ", lastName) AS "Member Name"
FROM GymMember
WHERE lastName LIKE 'O%';

#Page 7 Exercise (BETWEEN ... AND)
SELECT CONCAT(firstName, " ", lastName) AS "Trainer Name"
FROM Trainer
WHERE salary BETWEEN 25000 AND 35000; 

#Page 8 Exercise (IN)
SELECT CONCAT(firstName, " ", lastName) AS Name, town AS Town, county AS County
FROM GymMember
WHERE county IN('Kilkenny',  'Wexford');

#Page 9 Exercises (AND/OR)
SELECT CONCAT(firstName, " ", lastName) AS Name, dateOfBirth AS "Date of Birth"
FROM GymMember
WHERE county = 'Waterford' AND dateOfBirth LIKE '2005%';

#Page 11 Exercises (ORDER BY)
SELECT CONCAT(firstName, " ", lastName) AS Name
FROM GymMember
ORDER BY lastName, firstName;

SELECT CONCAT(firstName, " ", lastName) AS Name, town AS Town, county AS County
FROM GymMember
ORDER BY county, town, lastName, firstName;


SELECT CONCAT(firstName, " ", lastName) AS Name,  county AS County, salary AS Salary
FROM Trainer
ORDER BY county, salary DESC, lastName, firstName;
