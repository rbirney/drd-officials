-- SQL Join 2 Lab
-- Exercise solutions

-- -------------------------------------------------------------------

use gym;

-- -------------------------------------------------------------------

-- Multi-table Join Exercises

-- Exercise 1
-- List the classes (description and day) and the corresponding equipment used. Label the columns as in the screenshot. Sort in alphabetical order by classDescription, then classDay, then equipDescription.

select classDescription Class, classDay Day, equipDescription Equipment
from fitnessClass 
join classequipment using (classId)
join equipment using (serialNumber)
order by classDescription, classDay, equipDescription;


-- Exercise 2
-- List the members (name) and the payments they have made (date and amount) for all Premium members. Label the columns as in the screenshot. Sort in alphabetical order by member name (lastname and firstname).

SELECT CONCAT(firstname, " ", lastName) AS Name, paymentDate AS "Payment Date", amount AS "Amount Paid"
FROM gymmember JOIN payment USING (memberId)
JOIN Membershiptype USING (membertype)
WHERE membership = 'Premium'
ORDER BY lastname, firstname;


-- Exercise 3
-- For each type of membership, list the members (name), the classes they take (description and day), and the Trainer (name) who takes the class. Label the columns as in the screenshot. Sort in alphabetical order by membership, then member name (lastname and firstname).

SELECT membership Membership, CONCAT(g.firstname, " ", g.lastName) AS Member, classDescription Class, classDay as Day, CONCAT(t.firstname, " ", t.lastName) AS Trainer
FROM membershiptype 
JOIN gymmember g
ON membershiptype.membertype = g.membertype
JOIN memberClass 
ON g.memberId = memberClass.memberId
JOIN fitnessClass 
ON fitnessClass.classId = memberClass.classId
JOIN trainer t
ON t.PPS = fitnessClass.PPS
ORDER BY membership, g.lastname, g.firstname;



-- -------------------------------------------------------------------

-- Outer Join Exercises

-- Exercise 1
-- Return the classes (description and day) and the corresponding equipment used (if any). Label the columns as in the screenshot. Sort in alphabetical order by classDescription, then classDay, then equipDescription.

select classDescription Class, classDay Day, equipDescription Equipment
from fitnessClass 
left join classequipment using (classId)
left join equipment using (serialNumber)
order by classDescription, classDay, equipDescription;


-- Exercise 2
-- Return the classes (description and day) of all classes taken by members (if any). Label the columns as in the screenshot. Sort in alphabetical order by classDescription, classDay.

select concat(classDescription, '-', classDay) as Class, concat(firstname, ' ', lastname) as Member
from fitnessClass 
left join memberclass using (classId)
left join gymmember using (memberid)
order by classDescription, classDay;


-- Exercise 3
-- Now, do the same query again but use GROUP_CONCAT() to combine the members into a single list for each class.

select concat(classDescription, '-', classDay) as Class, group_concat(concat(firstname, ' ', lastname)) as Member
from fitnessClass left join memberclass using (classId)
left join gymmember using (memberid)
group by classDescription, classDay
order by classDescription, classDay;
