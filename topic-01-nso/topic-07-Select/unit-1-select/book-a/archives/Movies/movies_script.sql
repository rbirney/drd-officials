DROP SCHEMA IF EXISTS movies;

CREATE SCHEMA IF NOT EXISTS movies;

USE movies;
drop table if exists Film;
drop table if exists Reviewer;
drop table if exists Rating;

/* Create the schema for our tables */
create table Film(
fID int primary key auto_increment, 
title varchar(80),
releaseYear smallint(4), 
dirFirstName varchar(20),
dirLastName varchar(20),
length tinyint unsigned
);

ALTER TABLE Film AUTO_INCREMENT = 101;

create table Reviewer(
rID int primary key auto_increment, 
revFirstName varchar(20),
revLastName varchar(20)
);

ALTER TABLE Reviewer AUTO_INCREMENT = 1001;

create table Rating(
ratingId int primary key auto_increment,
rID int not null, 
fID int not null, 
stars tinyint, 
ratingDate date,
foreign key (rID) references Reviewer(rID) on update cascade on delete cascade,
foreign key (fID) references Film(fID) on update cascade on delete cascade
);

ALTER TABLE Rating AUTO_INCREMENT = 2001;

/* Populate the tables with our data */

-- Insert Films
INSERT INTO Film (title, releaseYear, dirfirstName, dirlastName, length) VALUES
('The Shawshank Redemption', 1994, 'Frank', 'Darabont', 142),
('The Godfather', 1972, 'Francis', 'Coppola', 175),
('Titanic', 1997, 'James', 'Cameron', 194),
('Inception', 2010, 'Christopher', 'Nolan', 148),
('Pulp Fiction', 1994, 'Quentin', 'Tarantino', 154),
('The Dark Knight', 2008, 'Christopher', 'Nolan', 152),
('Fight Club', 1999, 'David', 'Fincher', 139),
('Apocalypse Now', 1979, 'Francis', 'Coppola', 182),
('Forrest Gump', 1994, 'Robert', 'Zemeckis', 142), 
('The Matrix', 1999, 'Lana', 'Wachowski', 136),
('Interstellar', 2014, 'Christopher', 'Nolan', 169),
('Parasite', 2019, 'Bong', 'Joon-ho', 132);    

-- Insert Reviewers
INSERT INTO Reviewer (revfirstName, revlastName) VALUES
('Alice', 'Johnson'),
('Bob', 'Smith'),
('Charlie', 'Brown'),
('Diana', 'Miller'),
('Ethan', 'Davis'),
('Fiona', 'Clark'),
('George', 'Wilson'),
('Hannah', 'Martinez');


-- Insert Ratings
INSERT INTO Rating (rID, fID, stars, ratingDate) VALUES
(1001, 101, 5, '2020-05-10'),
(1002, 101, 4, '2020-06-15'),
(1003, 102, 5, '2021-01-20'),
(1004, 103, 4, '2021-02-25'),
(1005, 103, 5, NULL),
(1006, 104, 3, '2021-04-18'),
(1007, 105, 5, '2021-05-22'),
(1008, 106, 4, '2021-06-10'),
(1001, 108, 4, '2021-08-01'),
(1002, 109, 5, NULL),
(1003, 109, 4, '2021-09-20'),
(1004, 102, 5, '2021-12-09'),
(1005, 106, 3, '2022-01-15'),
(1003, 103, 5, NULL),
(1005, 111, 3, '2023-12-02'),
(1006, 112, 4, '2024-02-21');


commit;
