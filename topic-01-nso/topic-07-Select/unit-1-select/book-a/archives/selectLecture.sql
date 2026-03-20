SELECT CONCAT(firstName, " ", lastName) AS "Member Name", dateOfBirth
FROM GymMember
WHERE lastName LIKE 'Mc%' OR 
	  lastName LIKE 'Mac%';
      
      
SELECT CONCAT(firstName, " ", lastName) AS "Member Name"
FROM GymMember
WHERE lastName LIKE 'Kell_';
      
      
SELECT classDescription Class, duration
FROM FitnessClass 
WHERE duration BETWEEN 30 AND 50;

SELECT * 
FROM FitnessClass 
WHERE duration NOT BETWEEN 30 AND 50;

SELECT CONCAT(firstName, " ", lastName) AS Name, town AS Town, county AS County
FROM GymMember
WHERE county NOT IN('Kilkenny',  'Wexford');

SELECT * 
FROM FitnessClass
WHERE PPS IS not NULL;

SELECT CONCAT(firstName, " ", lastName) AS Name
FROM GymMember
ORDER BY lastName DESC, firstName;

SELECT CURDATE() AS "Today's Date";



SELECT NOW() AS "Today's Date and Time";

SELECT DATE_FORMAT(CURDATE(),'%d %b %y') AS "Today's Date";

SELECT DATE_FORMAT(CURDATE(),'%W %M %D, %Y') AS "Today's Date";

SELECT DATE_FORMAT(NOW(),'%l:%i %p, %a %d %b') AS "Timestamp";

SELECT DATEDIFF('2026-12-31', CURDATE()) AS "Number of days left this year";


SELECT CONCAT(firstname, " ",  lastname) AS Member, TIMESTAMPDIFF(YEAR, dateOfBirth, CURDATE()) AS Age 
FROM gymmember
ORDER BY lastname, firstname;


SELECT CONCAT(firstname, ' ',  lastname) AS Member, DATE_ADD(renewalDate, INTERVAL 1 YEAR) AS "Renewal Date" 
FROM gymmember
ORDER BY lastname, firstname;

SELECT CONCAT(firstname, ' ',  lastname) AS Member, 
	   TIMESTAMPDIFF(MONTH, CURDATE(), DATE_ADD(renewalDate, INTERVAL 1 YEAR)) AS "Months until Renewal" 
FROM gymmember
ORDER BY lastname, firstname;