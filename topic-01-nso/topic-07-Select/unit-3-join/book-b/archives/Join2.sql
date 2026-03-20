USE GYM;

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

select concat(classDescription, '-', classDay) as Class, concat(firstname, ' ', lastname) as Member
from fitnessClass left join memberclass using (classId)
left join gymmember using (memberid)
order by classDescription, classDay;

select concat(classDescription, '-', classDay) as Class, group_concat(concat(firstname, ' ', lastname)) as Member
from fitnessClass left join memberclass using (classId)
left join gymmember using (memberid)
group by classDescription, classDay
order by classDescription, classDay;

select classDescription Class, classDay  Day, equipDescription Equipment
from fitnessClass left join classequipment using (classId)
left join equipment using (serialNumber)
order by classDescription, classDay, equipDescription;

select concat(classDescription, '-', classDay) as Class, concat(firstname, ' ', lastname) as Member
from fitnessClass left join memberclass using (classId)
left join gymmember using (memberid)
order by classDescription, classDay;

select concat(classDescription, '-', classDay) as Class, group_concat(concat(firstname, ' ', lastname)) as Member
from fitnessClass left join memberclass using (classId)
left join gymmember using (memberid)
group by classDescription, classDay
order by classDescription, classDay;
