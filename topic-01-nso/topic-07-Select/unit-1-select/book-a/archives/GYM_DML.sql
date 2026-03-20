


USE GYM;

-- ================================
-- MembershipType
-- ================================
INSERT INTO MembershipType (membership, typeDescription, price) VALUES
('Standard', 'Unlimited access to the gym, including classes, during opening hours', 380.00),
('Discount Standard','Discounted rate for Students and Seniors', 300.00),
('Premium', 'ccess 24 hours', 500.00);

-- ================================
-- Member
-- ================================
INSERT INTO GymMember (firstName, lastName, street, town, county, phoneNumber, emailAddress, dateOfBirth, renewalDate, memberType) VALUES
('Sean', 'O\'Brien', '12 Main Street', 'Tramore', 'Waterford', '0851234567', 'sean.obrien@example.ie', '2005-04-12', '2025-07-01', 1),
('Aoife', 'Murphy', '5 Oak Avenue', 'Tramore', 'Waterford', '0867654321', 'aoife.murphy@example.ie', '2006-09-30', '2025-08-01', 2),
('Patrick', 'Kelly', '22 Green Road', 'Waterford', 'Waterford', '0839876543', 'patrick.kelly@example.ie', '1985-01-15', '2025-01-01', 3),
('Bridget', 'Doyle', '45 Sea View', 'Dunmore East', 'Waterford', '0876543210', 'bridget.doyle@example.ie', '1990-05-20', '2025-07-01', 1),
('Eoin', 'Byrne', '7 Riverbank Close', 'Waterford', 'Waterford', '0879876543', 'eoin.byrne@example.ie', '2003-03-05', '2025-08-01', 2),
('Ciara', 'O\'Connor', '14 Church Lane', 'Ferrybank', 'Kilkenny', '0857654321', 'ciara.oconnor@example.ie', '1978-12-12', '2025-05-01', 3),
('Conor', 'McGrath', '20 Hillcrest', 'Ferrybank', 'Kilkenny', '0834567890', 'conor.mcgrath@example.ie', '2007-08-23', '2025-01-01', 1),
('Conor', 'Kelly', 'The Maudlins', 'New Ross', 'Wexford', '0879458877', 'conor.kelly@example.ie', '1960-02-23', '2025-01-01', 2),
('Melissa', 'Reddy', '1 RiverWalk', 'Waterford', 'Waterford', '0871138755', 'melissa.reddy@example.ie', '1975-08-23', '2025-01-10', 1),
('Mary', 'Fitzgerald', '33 Meadow View', 'Tramore', 'Waterford', '0861122334', 'mary.fitzgerald@example.ie', '1999-02-14', '2025-03-01', 1);

-- ================================
-- Payment
-- ================================
INSERT INTO Payment (paymentDate, amount, memberId) VALUES
('2025-07-02', 50.00, 100),
('2025-08-02', 100.00, 101),
('2025-01-07', 200.00, 102),
('2025-07-03', 250.00, 103),
('2025-08-03', 175.00, 104),
('2025-05-02', 150.00, 105),
('2025-01-06', 80.00, 106),
('2025-01-02', 50.00, 107),
('2025-01-09', 100.00, 107),
('2025-01-15', 100.00, 107),
('2025-01-22', 50.00, 107),
('2025-02-07', 100.00, 102),
('2025-01-12', 60.00, 108),
('2025-03-02', 60.00, 109),
('2025-03-22', 60.00, 109);

-- ================================
-- Trainer
-- ================================
INSERT INTO Trainer (PPS, firstName, lastName, street, town, county, phoneNumber, emailAddress, dateOfBirth, salary, qualification, specialty) VALUES
('1234567AA', 'Liam', 'Walsh', '10 River Walk', 'Dunmore East', 'Waterford', '0871234567', 'liam.walsh@example.ie', '1990-06-10', 35000.00, 'BSc Sports Science', 'Strength Training'),
('7654321BB', 'Niamh', 'Ryan', '8 Hill Road', 'Cork', 'Cork', '0862345678', 'niamh.ryan@example.ie', '1988-11-25', 38000.00, 'MSc Fitness & Health', 'Yoga & Pilates'),
('9876543CC', 'Orla', 'Ní Bhraonáin', '2 Abbey Street', 'Thomastown', 'Kilkenny', '0859988776', 'orla.ni@example.ie', '1992-07-18', 34000.00, 'Dip Personal Training', 'HIIT'),
('4567890DD', 'Cathal', 'O\'Shea', '15 Lakeside', 'Dungarvan', 'Waterford', '0877788990', 'cathal.oshea@example.ie', '1980-05-03', 40000.00, 'BSc Physiotherapy', 'Rehabilitation');

-- ================================
-- FitnessClass
-- ================================
INSERT INTO FitnessClass (classDescription, classDay, classTime, duration, PPS) VALUES
('Morning Strength Training', 'Monday', '08:00:00', 60, '1234567AA'),
('Evening Yoga', 'Wednesday', '18:00:00', 60, '7654321BB'),
('HIIT Blast', 'Friday', '07:00:00', 45, '9876543CC'),
('Rehab and Stretch', 'Saturday', '10:00:00', 50, '4567890DD');

-- ================================
-- Equipment
-- ================================
INSERT INTO Equipment (serialNumber, equipDescription, datePurchased, make, model) VALUES
('EQ1001', 'Treadmill', '2023-03-01', 'NordicTrack', 'Commercial 1750'),
('EQ1002', 'Yoga Mats', '2024-01-15', 'Liforme', 'Travel Mat'),
('EQ1003', 'Dumbbell Set', '2023-06-20', 'Bowflex', 'SelectTech 552'),
('EQ1004', 'Rowing Machine', '2024-05-10', 'Concept2', 'Model D'),
('EQ1005', 'Resistance Bands', '2025-02-20', 'TheraBand', 'Set Pro');

-- ================================
-- MemberClass
-- ================================
INSERT INTO MemberClass (memberId, classId, joinDate) VALUES
(100, 1000, '2025-07-02'),
(101, 1001, '2025-08-10'),
(102, 1000, '2025-01-21'),
(104, 1002, '2025-07-09'),
(105, 1003, '2025-05-02'),
(106, 1002, '2025-01-03'),
(107, 1001, '2025-03-02'),
(108, 1000, '2025-07-02'),
(108, 1003, '2025-07-02'),
(109, 1000, '2025-07-02'),
(104, 1003, '2025-07-02'),
(105, 1001, '2025-07-02'),
(100, 1003, '2025-07-02');

-- ================================
-- ClassEquipment
-- ================================
INSERT INTO ClassEquipment (classId, serialNumber) VALUES
(1000, 'EQ1001'),
(1000, 'EQ1003'),
(1001, 'EQ1002'),
(1002, 'EQ1004'),
(1002, 'EQ1003'),
(1003, 'EQ1002'),
(1003, 'EQ1005');


COMMIT;


SELECT * FROM MembershipType;
SELECT * FROM GymMember;
SELECT * FROM Payment;
SELECT * FROM Trainer;
SELECT * FROM FitnessClass;
SELECT * FROM Equipment;
SELECT * FROM MemberClass;
SELECT * FROM ClassEquipment;