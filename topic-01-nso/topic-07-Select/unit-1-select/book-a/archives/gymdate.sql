use gym;

SELECT DATEDIFF('2026-01-01', CURDATE()) AS "Number of days until 2026";



SELECT CONCAT(firstname, " ",  lastname) AS Member, TIMESTAMPDIFF(YEAR, dateOfBirth, CURDATE()) AS Age 
FROM gymmember
ORDER BY lastname, firstname;

select * from gymmember;

SELECT CONCAT(firstname, ' ',  lastname) AS Member, DATE_ADD(renewalDate, INTERVAL 1 YEAR) AS "Renewal Date" 
FROM gymmember
ORDER BY lastname, firstname;

SELECT CONCAT(firstname, ' ',  lastname) AS Member,  renewalDate, 
	   DATE_ADD(renewalDate, INTERVAL 1 YEAR) AS nextPaymentDue,
       CURDATE() >= DATE_ADD(renewalDate, INTERVAL 1 YEAR) AS isDue
FROM gymMember
ORDER BY lastname, firstname;


SELECT CONCAT(firstname, ' ',  lastname) AS Member, 
	   TIMESTAMPDIFF(MONTH, CURDATE(), DATE_ADD(renewalDate, INTERVAL 1 YEAR)) AS "Months until Renewal" 
FROM gymmember
ORDER BY lastname, firstname;