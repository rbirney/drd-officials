-- SQL Select statement 2 Lab
-- Exercise solutions

-- -------------------------------------------------------------------

use gym;

-- -------------------------------------------------------------------

-- BETWEEN... AND
-- Exercise 1
-- Retrieve the names (first and last) of all trainers who earn 25000 - 35000

select concat(firstName, " ",  lastName) AS "Trainer Name"
from trainer
where salary between 25000 and 35000;

-- -------------------------------------------------------------------

-- IN
-- Exercise 1
-- Retrieve the names, towns, and county of all members from Kilkenny or Wexford

select concat(firstName, " ",  lastName) as "Name", town as "Town", county as "County"
from gymmember
where county in ('Kilkenny', 'Wexford');

-- -------------------------------------------------------------------

-- AND/OR
-- Exercise 1
-- Retrieve the name and date of birth of all members from Waterford who were born in 2005

select concat(firstName, " ",  lastName) as "Name", dateOfBirth as "Date of Birth"
from gymmember
where county = "Waterford" and dateOfBirth like "2005%";

-- -------------------------------------------------------------------

-- ORDER BY
-- Exercise 1
-- Retrieve the names of all members. Sort the name in alphabetical order (firstName within lastName)

select concat(firstName, " ",  lastName) as "Name"
from gymmember
order by lastname, firstname;


-- ORDER BY
-- Exercise 2
-- Retrieve the names, towns, and county of all members

select concat(firstName, " ",  lastName) as "Name", town as "Town", county as "County"
from gymmember
order by county, lastname, firstname;


-- ORDER BY
-- Exercise 3
-- Retrieve the names, county, and salary of all trainer. Sort and output the returned records as follows

select concat(firstName, " ",  lastName) AS "Trainer Name", county as "County", salary as "Salary"
from trainer
order by county, lastname, firstname;

-- -------------------------------------------------------------------

-- Returning the Current Date
-- Exercises

-- Output '2025-12-25' as follows:
-- December 25th, 2025

SELECT DATE_FORMAT('2025-12-25', "%M %D, %Y")
AS "Christmas Day";

-- Thu 25th December 2025

SELECT DATE_FORMAT('2025-12-25', "%a %M %D %Y")
AS "Christmas Day";

-- Thursday 25th December 2025

SELECT DATE_FORMAT('2025-12-25', "%W %D %M %Y")
AS "Christmas Day";