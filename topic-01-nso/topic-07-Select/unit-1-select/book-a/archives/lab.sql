USE gym;

SELECT * 
FROM GymMember; 

SELECT * 
FROM payment; 
SELECT * FROM memberclass;


SELECT firstName, lastName 
FROM GymMember;

SELECT firstName, lastName 
FROM GymMember
WHERE county = "Waterford";

SHOW TABLES;
SELECT *
FROM fitnessClass;
SELECT classDescription, classDay, classTime 
FROM FitnessClass;

SELECT classDescription, classDay, classTime 
FROM FitnessClass
WHERE duration <= 50; 



SELECT firstName, lastName, street, town, county
FROM Trainer;

SELECT firstName, lastName,  county
FROM Trainer
WHERE county <> "Waterford";

SELECT firstName AS "First Name", lastName AS "Last Name", street AS Street, town AS Town, county AS County
FROM Trainer; 

SELECT firstName "First Name", lastName "Last Name", street Street, town Town, county County
FROM Trainer; 

SELECT * FROM trainer;

SELECT make Make
FROM Equipment;

SELECT DISTINCT make Make
FROM Equipment;

SELECT DISTINCT county AS "Member County"
FROM GymMember; 

SELECT CONCAT(firstName, " ", lastName) AS "Member Name"
FROM GymMember;

SELECT CONCAT(firstName, " ", lastName) AS "Member Name"
FROM GymMember
WHERE county = "Waterford";

SELECT model AS Model, equipDescription AS Description
FROM Equipment
WHERE make = "NordicTrack";

SELECT classDescription AS Description 
FROM FitnessClass 
WHERE classDescription LIKE '%Yoga%';

SELECT CONCAT(firstName, " ", lastName) AS "Trainer Name"	
FROM Trainer
WHERE specialty LIKE '%Yoga%';

SELECT CONCAT(firstName, " ", lastName) AS "Member Name"
FROM GymMember
WHERE lastName LIKE 'Mc%' OR 
	  lastName LIKE 'Mac%';

SELECT classDescription Class
FROM FitnessClass 
WHERE duration BETWEEN 30 AND 50;

SELECT * 
FROM FitnessClass 
WHERE duration NOT BETWEEN 30 AND 50;

SELECT CONCAT(firstName, " ", lastName) AS "Trainer Name"
FROM Trainer
WHERE salary BETWEEN 25000 AND 35000;

SELECT CONCAT(firstName, " ", lastName) AS Name, town AS Town, county AS County
FROM GymMember
WHERE county IN('Kilkenny',  'Wexford');

SELECT CONCAT(firstName, " ", lastName) AS Name, dateOfBirth AS "Date of Birth"
FROM GymMember
WHERE county = 'Waterford' AND dateOfBirth LIKE '2005%';

SELECT * 
FROM FitnessClass
WHERE PPS IS NULL;

SELECT make AS Make, model AS Model, equipdescription AS Description 
FROM Equipment 
ORDER BY make;

SELECT make AS Make, model AS Model, equipdescription AS Description 
FROM Equipment 
ORDER BY make DESC;

SELECT make AS Make, model AS Model, equipdescription AS Description 
FROM Equipment 
ORDER BY make, model;

SELECT CONCAT(firstName, " ", lastName) AS Name
FROM GymMember
ORDER BY lastName, firstName;

SELECT CONCAT(firstName, " ", lastName) AS Name, town AS Town, county AS County
FROM GymMember
ORDER BY county, town, lastName, firstName;


SELECT CONCAT(firstName, " ", lastName) AS Name,  county AS County, salary AS Salary
FROM Trainer
ORDER BY county, salary DESC, lastName, firstName;
