USE GYM;

SELECT COUNT(PPS) AS "Number of Trainers"
FROM Trainer;

SELECT SUM(salary) AS "Total Salary"
FROM Trainer;

SELECT MAX(salary) AS "Highest Salary"
FROM Trainer;

SELECT MIN(salary) AS "Lowest Salary"
FROM Trainer;

SELECT AVG(salary) AS "Average Salary"
FROM Trainer;

SELECT COUNT(memberId) AS "Number of Members"
FROM Gymmember;

SELECT county County, COUNT(memberId) AS "Number of Members"
FROM Gymmember
GROUP BY county
ORDER BY county;

SELECT county County, COUNT(memberId) AS "Number of Members"
FROM Gymmember
GROUP BY county
HAVING COUNT(memberId) >=2
ORDER BY county;

SELECT COUNT(serialNumber) AS "Number of Equipment items"
FROM Equipment;

select * from payment;

select * from equipment;

SELECT COUNT(paymentId) AS "Number of Payments by Member 104"
FROM payment
WHERE memberId = 107;

SELECT SUM(amount) AS "Total Payments by Member 104"
FROM payment
WHERE memberId = 107;

SELECT AVG(salary) AS 'Average Salary' 
FROM Trainer;

SELECT Round(AVG(salary), 2) AS 'Average Salary' 
FROM Trainer;

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

SELECT county, COUNT(memberId) AS "Number of Members"
FROM Gymmember 
GROUP BY county;

select * from equipment;

select * from payment;

select memberId, sum(amount)
from payment
group by memberid;


select * from gymmember;

select * from fitnessclass;

SELECT county, COUNT(memberId) AS "Number of Members"
FROM Gymmember 
GROUP BY county
HAVING COUNT(memberId) > 5;