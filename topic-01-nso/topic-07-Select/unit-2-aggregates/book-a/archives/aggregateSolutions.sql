-- SQL Aggregate functions Lab
-- Exercise solutions

-- -------------------------------------------------------------------

use gym;

-- -------------------------------------------------------------------

-- Aggregate Functions Exercises

-- Exercise 1
-- Return the number of members from Waterford.

select count(memberId) as "Number of Members from Waterford"
from gymmember
where county = "Waterford";


-- Exercise 2
-- Return the number of equipment items that contain the term Yoga in the description

select count(serialNumber) as "Number of Yoga Equipment Items"
from equipment
where equipDescription like "%Yoga%";


-- Exercise 3
-- Return the minimum Trainer salary

select min(salary) as "Smallest Salary"
from trainer;


-- Exercise 4
-- Return the number of different counties that members come from

select count(distinct(county)) as "Number of Member Counties"
from gymmember;


-- -------------------------------------------------------------------

-- Rounding and Formatting

-- Exercise 1
-- Return the highest salary rounded to 2 decimal places.

select format( max(salary), 2 ) AS 'Highest Salary' 
from Trainer;


-- -------------------------------------------------------------------

-- Group By

-- Exercise 1
-- Return the number of pieces of equipment for each Make

select make as "Make", count(make) as "Number of Equipment items"
from equipment 
group by make;


-- Exercise 2
-- Return the sum of payments made by each member from the Payment table

select memberId as "Member", sum(amount) as "Total Paid"
from payment
group by memberId;


-- -------------------------------------------------------------------

-- HAVING

-- Exercise 1
-- Using the solution to the previous exercise on the number of pieces of equipment for each Make; return records for Makes that have 3 or more pieces of equipment

select make as "Make", count(make) as "Number of Equipment items"
from equipment 
group by make
having count(make) >=3;
