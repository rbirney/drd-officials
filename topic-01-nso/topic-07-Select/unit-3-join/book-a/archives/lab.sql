USE GYM;


SELECT CONCAT(firstName, " ", lastName) AS Name, membership As Membership
FROM Gymmember JOIN Membershiptype
ON Gymmember.memberType = Membershiptype.membertype
ORDER BY lastname, firstname;

SELECT CONCAT(firstName, " ", lastName) AS Name, membership As Membership
FROM Gymmember JOIN Membershiptype USING (memberType)
ORDER BY lastname, firstname;

SELECT CONCAT(firstName, " ", lastName) AS Name, CONCAT(street, ", ", town) AS Address, membership As Membership
FROM Gymmember JOIN Membershiptype
ON Gymmember.memberType = Membershiptype.membertype
WHERE county = "Waterford"
ORDER BY lastname, firstname;

SELECT CONCAT(firstName, " ", lastName) AS Name, CONCAT(street, ", ", town) AS Address, membership As Membership
FROM Gymmember JOIN Membershiptype USING (memberType)
WHERE county = "Waterford"
ORDER BY lastname, firstname;

SELECT classDescription, CONCAT(firstname, " ", lastName) AS Name
FROM fitnessclass JOIN trainer USING (PPS)
ORDER BY classDescription;

SELECT CONCAT(firstname, " ", lastName) AS Name, paymentDate AS "Payment Date", amount AS "Amount Paid"
FROM gymmember JOIN payment USING (memberId)
ORDER BY lastname, firstname;

SELECT membership AS Membership, COUNT(memberid) AS "Number of Members"
FROM Gymmember JOIN Membershiptype
ON Gymmember.memberType = Membershiptype.membertype
GROUP BY membership
ORDER BY membership;

SELECT membership AS Membership, COUNT(memberid) AS "Number of Members"
FROM Gymmember JOIN Membershiptype USING (memberType)
GROUP BY membership
ORDER BY membership;

SELECT  membership As Membership, CONCAT(firstName, " ", lastName) AS Name
FROM Gymmember JOIN Membershiptype
ON Gymmember.memberType = Membershiptype.membertype
ORDER BY membership;

SELECT  membership AS Membership, GROUP_CONCAT(CONCAT(firstName, " ", lastName)) AS Name
FROM Gymmember JOIN Membershiptype
ON Gymmember.memberType = Membershiptype.membertype
GROUP BY membership
ORDER BY membership;

SELECT CONCAT(firstName, ' ', lastName) AS Name, 
CASE 
  WHEN COUNT(paymentId) = 1 THEN 'One'
  WHEN COUNT(paymentId) = 2 THEN 'Two'
  ELSE 'Three or more'
END AS 'Number of Payments'
FROM Gymmember JOIN Payment USING (memberId)
GROUP BY lastName, firstName
ORDER BY lastName, firstName;



SELECT CONCAT(firstName, ' ', lastName) AS Name,
CASE 
  WHEN balance = 0 THEN 'Owes no money'
  WHEN balance > 0 AND balance < 100 THEN 'Owes less than 100'
  WHEN balance >= 100 AND balance < 200 THEN 'Owes less than 200'
  ELSE 'Owes 200 or more'
END AS "Money Owing"
FROM Gymmember
ORDER BY lastName, firstName;

-- >2 tables

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
FROM fitnessClass JOIN memberClass 
ON fitnessClass.classId = memberClass.classId
RIGHT JOIN gymmember
ON gymmember.memberId = memberClass.memberId
ORDER BY lastname, firstname;

SELECT CONCAT(firstname, " ", lastName) AS Member, classDescription Class, joinDate AS "Start Class Date"
FROM gymmember JOIN memberClass 
ON gymmember.memberId = memberClass.memberId
JOIN fitnessClass 
ON fitnessClass.classId = memberClass.classId
ORDER BY lastname, firstname;

SELECT CONCAT(firstname, " ", lastName) AS Member, classDescription Class, joinDate AS "Start Class Date"
FROM gymmember JOIN memberClass USING (memberId)
JOIN fitnessClass USING (classId)
ORDER BY lastname, firstname;

SELECT CONCAT(g.firstname, " ", g.lastName) AS Member, classDescription Class, CONCAT(t.firstname, " ", t.lastName) AS Trainer
FROM gymmember g JOIN memberClass 
ON g.memberId = memberClass.memberId
JOIN fitnessClass 
ON fitnessClass.classId = memberClass.classId
JOIN trainer t
ON t.PPS = fitnessClass.PPS
ORDER BY g.lastname, g.firstname;

SELECT CONCAT(g.firstname, " ", g.lastName) AS Member, classDescription Class, CONCAT(t.firstname, " ", t.lastName) AS Trainer
FROM gymmember g JOIN memberClass USING (memberId)
JOIN fitnessClass USING (classId)
JOIN trainer t USING (PPS)
ORDER BY g.lastname, g.firstname;

-- Exercises

select classDescription Class, classDay  Day, equipDescription Equipment
from fitnessClass join classequipment using (classId)
join equipment using (serialNumber)
order by classDescription, classDay, equipDescription;

SELECT CONCAT(firstname, " ", lastName) AS Name, paymentDate AS "Payment Date", amount AS "Amount Paid"
FROM gymmember JOIN payment USING (memberId)
JOIN Membershiptype USING (membertype)
WHERE membership = 'Premium'
ORDER BY lastname, firstname;

SELECT membership Membership, CONCAT(g.firstname, " ", g.lastName) AS Member, classDescription Class, classDay as Day, CONCAT(t.firstname, " ", t.lastName) AS Trainer
FROM membershiptype JOIN gymmember g
ON membershiptype.membertype = g.membertype
JOIN memberClass 
ON g.memberId = memberClass.memberId
JOIN fitnessClass 
ON fitnessClass.classId = memberClass.classId
JOIN trainer t
ON t.PPS = fitnessClass.PPS
ORDER BY membership, g.lastname, g.firstname;

select * from classequipment;

select * from FitnessClass;

select * from Gymmember;

select * from memberclass;

SELECT CONCAT(firstname, " ", lastName) AS Member, classId AS Class
FROM gymmember JOIN memberclass
ON gymmember.memberId = memberclass.memberId
ORDER BY lastName, firstName;


SELECT CONCAT(firstname, " ", lastName) AS Member, classId AS Class
FROM gymmember LEFT JOIN memberclass
ON gymmember.memberId = memberclass.memberId
ORDER BY lastName, firstName;

SELECT CONCAT(firstname, " ", lastName) AS Member, classId AS Class
FROM  memberclass RIGHT JOIN  gymmember
ON gymmember.memberId = memberclass.memberId
ORDER BY lastName, firstName;


SELECT CONCAT(g.firstname, " ", g.lastName) AS Member, classDescription Class, CONCAT(t.firstname, " ", t.lastName) AS Trainer
FROM gymmember g LEFT JOIN memberClass 
ON g.memberId = memberclass.memberId
LEFT JOIN fitnessClass 
ON memberclass.classId = fitnessClass.classId
LEFT JOIN trainer t 
ON fitnessClass.PPS = t.PPS
ORDER BY g.lastname, g.firstname;

SELECT CONCAT(g.firstname, " ", g.lastName) AS Member, classDescription Class, CONCAT(t.firstname, " ", t.lastName) AS Trainer
FROM gymmember g LEFT JOIN memberClass USING (memberId)
LEFT JOIN fitnessClass USING (classId)
LEFT JOIN trainer t USING (PPS)
ORDER BY g.lastname, g.firstname;

SELECT CONCAT(g.firstname, " ", g.lastName) AS Member, classDescription Class, CONCAT(t.firstname, " ", t.lastName) AS Trainer
FROM fitnessClass  
JOIN  memberClass
ON fitnessClass.classId = memberclass.classId
JOIN trainer t 
ON fitnessClass.PPS = t.PPS
RIGHT JOIN gymmember g
ON g.memberId = memberClass.memberId
ORDER BY g.lastname, g.firstname;


-- Exercise
select classDescription Class, classDay  Day, equipDescription Equipment
from fitnessClass left join classequipment using (classId)
left join equipment using (serialNumber)
order by classDescription, classDay, equipDescription;

SELECT  distinct CONCAT(firstname, " ", lastName) AS Trainer,  classDescription Class
FROM fitnessClass 
JOIN memberClass USING (classId) 
RIGHT JOIN trainer USING (PPS);




SELECT CONCAT(t.firstname, " ", t.lastName) AS Trainer, classDescription Class, classDay as Day
FROM fitnessClass 
JOIN memberClass USING (classId) 
RIGHT JOIN trainer t USING (PPS)
ORDER BY t.lastname, t.firstname;
