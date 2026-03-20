USE GYM;

SELECT COUNT(PPS) AS "Number of Trainers"
FROM Trainer;

SELECT SUM(salary) AS "Total Salary"
FROM Trainer;

SELECT MAX(salary) AS "Highest Salary"
FROM Trainer;

SELECT MAX(dateOfBirth) AS "Youngest Member's birthday"
FROM gymmember;

SELECT MAX(lastName)
FROM gymmember;

SELECT MIN(salary) AS "Lowest Salary"
FROM Trainer;

SELECT AVG(salary) AS "Average Salary"
FROM Trainer;

SELECT ROUND(AVG(salary), 2) AS 'Average Salary' 
FROM Trainer;

SELECT FORMAT(AVG(salary), 2) AS 'Average Salary' 
FROM Trainer;



SELECT county, COUNT(memberId) AS "Number of Members"
FROM Gymmember 
GROUP BY county;

SELECT membertype, SUM(balance) AS "Total owed by membership type"
FROM Gymmember
Group by membertype
having membertype in (1, 2);


SELECT county County, COUNT(memberId) AS "Number of Members"
FROM Gymmember
GROUP BY county
HAVING COUNT(memberId) >=2
ORDER BY county;