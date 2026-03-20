-- Drop the 'GYM' database/schema

DROP SCHEMA IF EXISTS GYM;

-- Create 'GYM' database/schema and use this database

CREATE SCHEMA IF NOT EXISTS GYM;

USE GYM;

-- MembershipType Table
CREATE TABLE MembershipType (
    memberType INT AUTO_INCREMENT PRIMARY KEY,
    membership ENUM('Standard', 'Discount Standard', 'Premium'),
    typeDescription VARCHAR(100),
    price DECIMAL(6,2) NOT NULL
);

-- Member Table
CREATE TABLE GymMember (
    memberId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    street VARCHAR(30),
    town VARCHAR(20),
    county VARCHAR(20),
    phoneNumber VARCHAR(15),
    emailAddress VARCHAR(50),
    dateOfBirth DATE,
    renewalDate DATE,
    balance DECIMAL(6,2),
    memberType INT,
    CONSTRAINT FK_Membership FOREIGN KEY (memberType) REFERENCES MembershipType(memberType) 
    ON UPDATE CASCADE 
    ON DELETE SET NULL
);

ALTER TABLE GymMember AUTO_INCREMENT = 100;

-- Payment Table
CREATE TABLE Payment (
    paymentId INT AUTO_INCREMENT PRIMARY KEY,
    paymentDate DATE,
    amount DECIMAL(6,2),
    memberId INT,
    CONSTRAINT FK_MemberPayment FOREIGN KEY (memberId) REFERENCES GymMember(memberId) 
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);

-- Trainer Table
CREATE TABLE Trainer (
    PPS VARCHAR(10) PRIMARY KEY,
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    street VARCHAR(50),
    town VARCHAR(20),
    county VARCHAR(20),
    phoneNumber VARCHAR(15),
    emailAddress VARCHAR(50),
    dateOfBirth DATE,
    salary DECIMAL(8,2),
    qualification VARCHAR(100),
    specialty VARCHAR(60)
);

-- FitnessClass Table
CREATE TABLE FitnessClass (
    classId INT AUTO_INCREMENT PRIMARY KEY,
    classDescription VARCHAR(100),
    classDay VARCHAR(10),
    classTime TIME,
    duration INT,
    PPS VARCHAR(10),
    CONSTRAINT FK_FitnessTrainer FOREIGN KEY (PPS) REFERENCES Trainer(PPS) 
    ON UPDATE CASCADE 
    ON DELETE SET NULL
);

ALTER TABLE FitnessClass AUTO_INCREMENT = 1000;


-- Equipment Table
CREATE TABLE Equipment (
    serialNumber VARCHAR(20) PRIMARY KEY,
    equipDescription VARCHAR(100),
    datePurchased DATE,
    make VARCHAR(30),
    model VARCHAR(50)
);

-- MemberClass 
CREATE TABLE MemberClass (
    memberId INT,
    classId INT,
    joinDate DATE,
    PRIMARY KEY (memberId, classId),
    CONSTRAINT FK_ClassMember FOREIGN KEY (memberId) REFERENCES GymMember(memberId) 
    ON UPDATE CASCADE 
    ON DELETE CASCADE,
    CONSTRAINT FK_Class FOREIGN KEY (classId) REFERENCES FitnessClass(classId) 
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);

-- ClassEquipment 
CREATE TABLE ClassEquipment (
    classId INT,
    serialNumber VARCHAR(30),
    PRIMARY KEY (classId, serialNumber),
    CONSTRAINT FK_EquipmentClass FOREIGN KEY (classId) REFERENCES FitnessClass(classId) 
    ON UPDATE CASCADE 
    ON DELETE CASCADE,
    CONSTRAINT FK_Equipement FOREIGN KEY (serialNumber) REFERENCES Equipment(serialNumber) 
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);

DELIMITER $$

CREATE TRIGGER set_feeOwed_before_member_insert
BEFORE INSERT ON GymMember
FOR EACH ROW
BEGIN
    DECLARE mPrice DECIMAL(6,2);
    
    SELECT price INTO mPrice
    FROM MembershipType
    WHERE membertype = NEW.membertype;
    
    SET NEW.balance = mPrice;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER update_feeOwed_after_payment
AFTER INSERT ON Payment
FOR EACH ROW
BEGIN
    UPDATE GymMember
    SET balance = GREATEST(balance - NEW.amount, 0)
    WHERE memberId = NEW.memberId;
END$$

DELIMITER ;

DELIMITER $$

DELIMITER $$

CREATE TRIGGER limit_class_members
BEFORE INSERT ON MemberClass
FOR EACH ROW
BEGIN
    DECLARE member_count INT;

    -- Count how many members are already in the class
    SELECT COUNT(*)
    INTO member_count
    FROM MemberClass
    WHERE classId = NEW.classId;

    -- Check if adding a new member would exceed the limit
    IF member_count >= 20 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot add member: class already has 20 members';
    END IF;
END $$

DELIMITER ;

COMMIT;

DESC MembershipType;

DESC GymMember;