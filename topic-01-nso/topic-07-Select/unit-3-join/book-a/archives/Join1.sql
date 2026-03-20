USE GYM;

select * from Gymmember;

SELECT CONCAT(firstName, " ", lastName) AS Name, membership As Membership
FROM Gymmember JOIN Membershiptype
ON Gymmember.memberType = Membershiptype.membertype
ORDER BY lastname, firstname;

SELECT CONCAT(firstName, " ", lastName) AS Name, membership As Membership
FROM Gymmember JOIN Membershiptype USING (memberType)
ORDER BY lastname, firstname;

SELECT CONCAT(firstName, " ", lastName) AS Name, membership As Membership
FROM Gymmember NATURAL JOIN Membershiptype
ORDER BY lastname, firstname;


SELECT membership AS Membership, COUNT(memberid) AS "Number of Members"
FROM Gymmember JOIN Membershiptype
ON Gymmember.memberType = Membershiptype.membertype
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

SELECT  membership AS Membership, GROUP_CONCAT(CONCAT(firstName, " ", lastName)) AS Name
FROM Gymmember JOIN Membershiptype USING (memberType)
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

SELECT membership AS Membership, COUNT(memberid) AS "Number of Members"
FROM Gymmember JOIN Membershiptype USING (memberType)
GROUP BY membership
ORDER BY membership;

# Page 4 Exercises

SELECT classDescription AS Class, classDay as Day, classTime as Time, CONCAT(firstname, " ", lastName) AS Name
FROM Fitnessclass JOIN Trainer USING (PPS)
ORDER BY classDescription;

SELECT CONCAT(firstname, " ", lastName) AS Name, paymentDate AS "Payment Date", amount AS "Amount Paid"
FROM Gymmember JOIN Payment USING (memberId)
ORDER BY lastname, firstname;

SELECT classDescription AS Class, classTime as Time, CONCAT(firstname, " ", lastName) AS Name
FROM Fitnessclass  JOIN Trainer USING (PPS)
WHERE classDay = "Friday"
ORDER BY classDescription;

SELECT CONCAT(firstname, " ", lastName) AS Name, COUNT(classId) AS "Number of Classes"
FROM Fitnessclass  JOIN Trainer USING (PPS)
GROUP BY lastname, firstname
ORDER BY lastname, firstname;

select COUNT(classId) AS "Number of Classes by Liam Walsh"
FROM Fitnessclass  JOIN Trainer USING (PPS)
where lastname = "Walsh" and firstname = "Liam";

SELECT CONCAT(firstname, " ", lastName) AS Name, COUNT(paymentId) AS "Number of Payments"
FROM Gymmember  JOIN Payment USING (memberId)
GROUP BY lastname, firstname
ORDER BY lastname, firstname;

SELECT CONCAT(firstname, " ", lastName) AS Name, 
CASE 
  WHEN COUNT(classId) = 1 THEN 'Single-class instructor'
  WHEN COUNT(classId) = 2 THEN 'Multiple-class instructor'
  ELSE 'Not an instructor'
END AS 'Instructor Type'
FROM Fitnessclass  JOIN Trainer USING (PPS)
GROUP BY lastname, firstname
ORDER BY lastname, firstname;

select * from gymmember 
natural join memberclass
natural join fitnessclass;