SELECT CONCAT(firstName, " ", lastName) AS Name, membership As Membership
FROM Gymmember JOIN Membershiptype
ON Gymmember.memberType = Membershiptype.membertype
ORDER BY lastname, firstname;

SELECT CONCAT(firstName, " ", lastName) AS Name, membership As Membership
FROM Gymmember JOIN Membershiptype USING (memberType)
ORDER BY lastname, firstname;

SELECT  membership AS Membership, GROUP_CONCAT(CONCAT(firstName, " ", lastName)) AS Name
FROM Gymmember JOIN Membershiptype
ON Gymmember.memberType = Membershiptype.membertype
GROUP BY membership
ORDER BY membership;

SELECT CONCAT(firstname, " ", lastName) AS Member, classDescription Class
FROM gymmember JOIN memberClass 
ON gymmember.memberId = memberClass.memberId
JOIN fitnessClass 
ON fitnessClass.classId = memberClass.classId
ORDER BY lastname, firstname;

SELECT CONCAT(firstname, " ", lastName) AS Member, classDescription Class
FROM gymmember LEFT JOIN memberClass 
ON gymmember.memberId = memberClass.memberId
LEFT JOIN fitnessClass 
ON fitnessClass.classId = memberClass.classId
ORDER BY lastname, firstname;

SELECT CONCAT(firstname, " ", lastName) AS Member, classDescription Class
FROM gymmember RIGHT JOIN memberClass 
ON gymmember.memberId = memberClass.memberId
LEFT JOIN fitnessClass 
ON fitnessClass.classId = memberClass.classId
ORDER BY lastname, firstname;

SELECT CONCAT(firstname, " ", lastName) AS Member, classDescription Class
FROM fitnessClass 
JOIN memberClass ON fitnessClass.classId = memberClass.classId
RIGHT JOIN gymmember 
ON gymmember.memberId = memberClass.memberId
ORDER BY lastname, firstname;

select classDescription Class, classDay Day, equipDescription Equipment
from fitnessClass 
right join classequipment using (classId)
right join equipment using (serialNumber)
order by classDescription, classDay, equipDescription;