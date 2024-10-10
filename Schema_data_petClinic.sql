
-- DDL 
DROP SCHEMA IF EXISTS PetClinic;
CREATE SCHEMA PetClinic;
use PetClinic;


CREATE TABLE vet(
vet_id INT NOT NULL,
vet_name VARCHAR(50) NOT NULL,
vet_tele INT(10) NOT NULL,
vet_address VARCHAR(50) NOT NULL,
CONSTRAINT vetPK PRIMARY KEY(vet_id)
);


CREATE TABLE room (
room_name VARCHAR(5) NOT NULL,
CONSTRAINT roomPK PRIMARY KEY(room_name)
);


CREATE TABLE timeslot (
timeslot_id VARCHAR(5) NOT NULL,
start_time TIME,
end_time TIME,	
CONSTRAINT timeslotPK PRIMARY KEY (timeslot_id)
);


CREATE TABLE specie (
specie_id INT NOT NULL,
specie_name VARCHAR(120) NOT NULL,
CONSTRAINT specie PRIMARY KEY(specie_id)
);


CREATE TABLE vet_specialization(
id INT NOT NULL,
vet_id INT NOT NULL,
specie_id INT NOT NULL,
CONSTRAINT vet_specializationPK PRIMARY KEY (id),
CONSTRAINT specieVets_IdFk FOREIGN KEY(vet_id) REFERENCES vet(vet_id),
CONSTRAINT specie_IdFk FOREIGN KEY(specie_id) REFERENCES specie(specie_id)
);


CREATE TABLE treatment(
treatment_id INT NOT NULL,
treatment_no INT NOT NULL,
treatment_name VARCHAR(120) NOT NULL,
price INT NOT NULL,
specie_id INT NOT NULL,
CONSTRAINT treatmentPK PRIMARY KEY (treatment_id),
CONSTRAINT TreatmentSpecies_IdFk FOREIGN KEY(specie_id) REFERENCES specie(specie_id)
);


CREATE TABLE address(
address_id INT NOT NULL,
street VARCHAR(120) NOT NULL,
city VARCHAR(120) NOT NULL,
zip_code INT NOT NULL,
CONSTRAINT address_IdPK PRIMARY KEY (address_id)
);


CREATE TABLE owner(
owner_id INT NOT NULL,
first_name VARCHAR(120) NOT NULL,
Last_name VARCHAR(120) NOT NULL,
date_of_birth DATETIME NOT NULL,
address_id INT NOT NULL,
owner_tele INT(10) NOT NULL,
email VARCHAR(45) NOT NULL,
CONSTRAINT Owner_IdPk PRIMARY KEY (owner_Id),
CONSTRAINT Owner_address_IdFk FOREIGN KEY(address_id) REFERENCES address(address_id)
);

select *
from owner;

CREATE TABLE pet(
pet_id INT NOT NULL,
pet_name VARCHAR(120) NOT NULL,
owner_id INT NOT NULL,
time_of_birth DATETIME NOT NULL,
specie_id INT NOT NULL,
CONSTRAINT pets_Id_Pk PRIMARY KEY (pet_id),
CONSTRAINT petsSpecies_Id FOREIGN KEY(specie_id) REFERENCES specie(specie_id),
CONSTRAINT petsOwner_Id FOREIGN KEY(owner_id) REFERENCES owner(owner_id)	
);


CREATE TABLE booking (
booking_id INT NOT NULL,
pet_id INT NOT NULL,
booking_type enum('mobile-call', 'in-person'),
booking_on DATETIME NOT NULL,
CONSTRAINT bookingPK PRIMARY KEY (booking_id),
CONSTRAINT registers_pet_pet_idFK FOREIGN KEY(pet_id) REFERENCES pet(pet_id)
); 


CREATE TABLE appointment(
apt_id INT NOT NULL,
booking_id INT NOT NULL,
date_of_apt TIMESTAMP,
apt_note VARCHAR(120) NOT NULL,
room_name VARCHAR(5) NOT NULL,
vet_id INT NOT NULL,
treatment_id INT NOT NULL,
timeslot_id VARCHAR(5) NOT NULL,
CONSTRAINT appoinmentPK PRIMARY KEY (booking_id),
FOREIGN KEY (Timeslot_Id) REFERENCES timeslot(timeslot_id),
CONSTRAINT AppointmentsApt_nameFk FOREIGN KEY(room_name) REFERENCES room(room_name),
CONSTRAINT AppointmentsTreatment_no_Fk FOREIGN KEY( treatment_id) REFERENCES  treatment(treatment_id),
CONSTRAINT AppointmentsBooking_Id_IdFk FOREIGN KEY(booking_id) REFERENCES booking(booking_id),
CONSTRAINT AppointmentsVet_Id_IdFk FOREIGN KEY(vet_id) REFERENCES vet(vet_id)
);


-- Sample Data

-- The vet relation.
INSERT INTO vet VALUES
(1, 'Lichard Orchard', 4734786, '32/7 Montario'),
(2, 'Yanging Hong', 3245678, '233 Seattle'),
(3, 'Nicloe Lasts', 2347890, '10/11 Newyork'),
(4, 'Michel Chore', 5678900, '122 Newyork'),
(5, 'Namtan Mongle',8903456, '99 California'),
(6, 'Akersky Mongle', 39231567, '154 Texas'),
(7, 'Saimon Kloene', 87633333, '78/5 Arizona'),
(8, 'Montua Locha', 2456823, '34/6Oregon'),
(9, 'Jack Rowlelll', 4567902, '23/7 Alaska')
;


-- The room relation.
INSERT INTO room VALUES
('A'),
('B'),
('C'),
('D'),
('E')
;


-- The timeslot relation 
insert into timeslot Values
('AA','09:00:00','09:30:00'),
('BB','09:30:00', '10:00:00'),
('CC','10:00:00','10:30:00'),
('DD','10:30:00', '11:00:00'),
('EE','11:00:00','11:30:00'),
('FF','11:30:00', '12:00:00'),
('GG','12:30:00', '13:00:00'),
('HH','13:00:00', '13:30:00'),
('II','13:30:00', '14:00:00'),
('JJ','14:00:00','14:30:00'),
('KK','14:30:00', '15:00:00'),
('LL','15:00:00', '15:30:00'),
('MM','15:30:00', '16:00:00'),
('NN','16:00:00', '16:30:00')
;
    

-- The specie relation.
INSERT INTO specie VALUES
(441, 'cat'),
(442, 'Dog'),
(443, 'Crocodile'),
(444, 'Parrot'),
(445, 'Snake'),
(446, 'Cattle'),
(447, 'Hamster'),
(448, 'Rabbit'),
(449, 'Turtle'),
(410, 'Goldfish'),
(411, 'Guinea Pig'),
(412, 'Maine Coons'),
(413, 'Geese'),
(414, 'Blue whale'),
(415, 'Goat'),
(416, 'Horses'),
(417, 'Lguanas'),
(418, 'Lizards'),
(419, 'Mule'),
(420, 'Ponies'),
(421, 'Dolphin')
;


-- The treatment relation.
INSERT INTO treatment VALUES 
(1, '1', 'Vaccinations',150,  441),
(2, '2', 'Parasite prevention',590, 441),
(3, '3', 'Diet and nutrition',1999, 441),
(4, '4', 'Dental health and cleaning',2900, 441),
(5, '5', 'Behaviorol counseling',2000, 441),
(6, '6', 'Lab Testing',3800, 441),
(7, '7', 'Physical examination',499, 441),
(8, '8', 'Specialized surgies',4000, 441),
(9, '9', 'Oncology',1500, 441),
(10, '10','Cadiology',1500, 441),

(11, '1', 'Vaccinations',140,442),
(12, '2', 'Parasite prevention',500, 442),
(13, '3', 'Diet and nutrition',1009, 442),
(14, '4', 'Dental health and cleaning',2000, 442),
(15, '5', 'Behaviorol counseling',1000, 442),
(16, '6', 'Lab Testing',3000, 442),
(17, '7', 'Physical examination',4990, 442),
(18, '8', 'Specialized surgies',2000, 442),
(19, '9', 'Oncology',900, 442),
(20, '10', 'Cadiology',500, 442),

(21, '1', 'Vaccinations',160, 443),
(22, '2', 'Parasite prevention',500,443),
(23, '3', 'Diet and nutrition',999,443),
(24, '4', 'Dental health and cleaning',200, 443),
(25, '5', 'Behaviorol counseling',2000, 443),
(26, '6', 'Lab Testing',3000, 443),
(27, '7', 'Physical examination',600,443),
(28, '8', 'Specialized surgies',700, 443),
(29, '9', 'Oncology',800, 443),
(30, '10', 'Cadiology',900, 443),

(31, '1', 'Vaccinations',200, 444),
(32, '2', 'Parasite prevention',490,444),
(33, '3', 'Diet and nutrition',699, 444),
(34, '4', 'Dental health and cleaning',500,444),
(35, '5', 'Behaviorol counseling',2000, 444),
(36, '6', 'Lab Testing',3000, 444),
(37, '7', 'Physical examination',559, 444),
(38, '8', 'Specialized surgies',400, 444),
(39, '9', 'Oncology',170, 444),
(40, '10', 'Cadiology',500, 444),

(41, '1', 'Vaccinations',150, 445),
(42, '2', 'Parasite prevention',550,445),
(43, '3', 'Diet and nutrition',1800, 445),
(44, '4', 'Dental health and cleaning',2900, 445),
(45, '5', 'Behaviorol counseling',2000, 445),
(46, '6', 'Lab Testing',3800, 445),
(47, '7', 'Physical examination',499, 445),
(48, '8', 'Specialized surgies',4000, 445),
(49, '9', 'Oncology',1500, 445),
(50, '10', 'Cadiology',1500, 445),

(51, '1', 'Vaccinations',180, 446),
(52, '2', 'Parasite prevention',600, 446),
(53, '3', 'Diet and nutrition',1899, 446),
(54, '4', 'Dental health and cleaning',2000, 446),
(55, '5', 'Behaviorol counseling',2000, 446),
(56, '6', 'Lab Testing',3800, 446),
(57, '7', 'Physical examination',499, 446),
(58, '8', 'Specialized surgies',2000,446),
(59, '9', 'Oncology',1500,446),
(60, '10', 'Cadiology',1500,446),

(61, '1', 'Vaccinations',150, 447),
(62, '2', 'Parasite prevention',590, 447),
(63, '3', 'Diet and nutrition',1999, 447),
(64, '4', 'Dental health and cleaning',2900, 447),
(65, '5', 'Behaviorol counseling',2000, 447),
(66, '6', 'Lab Testing',3800, 447),
(67, '7', 'Physical examination',499, 447),
(68, '8', 'Specialized surgies',4000, 447),
(69, '9', 'Oncology',1500, 447),
(70, '10', 'Cadiology',1500, 447),

(71, '1', 'Vaccinations',150, 448),
(72, '2', 'Parasite prevention',500, 448),
(73, '3', 'Diet and nutrition',1799, 448),
(74, '4', 'Dental health and cleaning',200, 448),
(75, '5', 'Behaviorol counseling',2000, 448),
(76, '6', 'Lab Testing',3800, 448),
(77, '7', 'Physical examination',499, 448),
(78, '8', 'Specialized surgies',4000, 448),
(79, '9', 'Oncology',1600, 448),
(80, '10', 'Cadiology',1700, 448),

(81, '1', 'Vaccinations',150, 449),
(82, '2', 'Parasite prevention',590, 449),
(83, '3', 'Diet and nutrition',1999, 449),
(84, '4', 'Dental health and cleaning',2000, 449),
(85, '5', 'Behaviorol counseling',1000, 449),
(86, '6', 'Lab Testing',3000,449),
(87, '7', 'Physical examination',599,449),
(88, '8', 'Specialized surgies',2000, 449),
(89, '9', 'Oncology',1200, 449),
(90, '10', 'Cadiology',1300,449),

(91, '1', 'Vaccinations',200, 410),
(92, '2', 'Parasite prevention',290,410),
(93, '3', 'Diet and nutrition',1000, 410),
(94, '4', 'Dental health and cleaning',1900, 410),
(95, '5', 'Behaviorol counseling',2000, 410),
(96, '6', 'Lab Testing',2800, 410),
(97, '7', 'Physical examination',400, 410),
(98, '8', 'Specialized surgies',5000, 410),
(99, '9', 'Oncology',2000, 410),
(100, '10', 'Cadiology',2500, 410),

(101, '1', 'Vaccinations',250, 411),
(102, '2', 'Parasite prevention',790, 411),
(103, '3', 'Diet and nutrition',1500, 411),
(104, '4', 'Dental health and cleaning',1900, 411),
(105, '5', 'Behaviorol counseling',3000, 411),
(106, '6', 'Lab Testing',3000, 411),
(107, '7', 'Physical examination',399, 411),
(108, '8', 'Specialized surgies',2000, 411),
(109, '9', 'Oncology',1000, 411),
(110, '10', 'Cadiology',1000, 411),

(111, '1', 'Vaccinations',150,  412),
(112, '2', 'Parasite prevention',390, 412),
(113, '3', 'Diet and nutrition',1399, 412),
(114, '4', 'Dental health and cleaning',2000, 412),
(115, '5', 'Behaviorol counseling',2400, 412),
(116, '6', 'Lab Testing',1800, 412),
(117, '7', 'Physical examination',399, 412),
(118, '8', 'Specialized surgies',2000, 412),
(119, '9', 'Oncology',1000, 412),
(120, '10', 'Cadiology',1000, 412),

(121, '1', 'Vaccinations',120, 413),
(122, '2', 'Parasite prevention',500, 413),
(123, '3', 'Diet and nutrition',1000, 413),
(124, '4', 'Dental health and cleaning',1900, 413),
(125, '5', 'Behaviorol counseling',1000, 413),
(126, '6', 'Lab Testing',1800,  413),
(127, '7', 'Physical examination',399, 413),
(128, '8', 'Specialized surgies',2000, 413),
(129, '9', 'Oncology',1000, 413),
(130, '10', 'Cadiology',1700, 413),

(131, '1', 'Vaccinations',250,  414),
(132, '2', 'Parasite prevention',500, 414),
(133, '3', 'Diet and nutrition',1200,  414),
(134, '4', 'Dental health and cleaning',1200, 414),
(135, '5', 'Behaviorol counseling',2200, 414),
(136, '6', 'Lab Testing',1000, 414),
(137, '7', 'Physical examination',300, 414),
(138, '8', 'Specialized surgies',2000, 414),
(139, '9', 'Oncology',1000, 414),
(140, '10', 'Cadiology',1000, 414),

(141, '1', 'Vaccinations',150,  415),
(142, '2', 'Parasite prevention',500, 415),
(143, '3', 'Diet and nutrition',2299, 415),
(144, '4', 'Dental health and cleaning',2999, 415),
(145, '5', 'Behaviorol counseling',1000, 415),
(146, '6', 'Lab Testing',1800, 415),
(147, '7', 'Physical examination',399, 415),
(148, '8', 'Specialized surgies',2000, 415),
(149, '9', 'Oncology',2500,  415),
(150, '10', 'Cadiology',1000, 415),

(151, '1', 'Vaccinations',150,  416),
(152, '2', 'Parasite prevention',390,  416),
(153, '3', 'Diet and nutrition',1000, 416),
(154, '4', 'Dental health and cleaning',1900, 416),
(155, '5', 'Behaviorol counseling',1000, 416),
(156, '6', 'Lab Testing',1800, 416),
(157, '7', 'Physical examination',399, 416),
(158, '8', 'Specialized surgies',2000, 416),
(159, '9', 'Oncology',1000,  416),
(160, '10', 'Cadiology',1000, 416),

(161, '1', 'Vaccinations',100,  417),
(162, '2', 'Parasite prevention',500, 417),
(163, '3', 'Diet and nutrition',100, 417),
(164, '4', 'Dental health and cleaning',1900, 417),
(165, '5', 'Behaviorol counseling',1000, 417),
(166, '6', 'Lab Testing',2900, 417),
(167, '7', 'Physical examination',400, 417),
(168, '8', 'Specialized surgies',2000, 417),
(169, '9', 'Oncology',1000,  417),
(170, '10', 'Cadiology',1300, 417),

(171, '1', 'Vaccinations',150, 418),
(172, '2', 'Parasite prevention',590, 418),
(173, '3', 'Diet and nutrition',1999, 418),
(174, '4', 'Dental health and cleaning',2400, 418),
(175, '5', 'Behaviorol counseling',2200, 418),
(176, '6', 'Lab Testing',3200, 418),
(177, '7', 'Physical examination',400, 418),
(178, '8', 'Specialized surgies',2000, 418),
(179, '9', 'Oncology',1200, 418),
(180, '10', 'Cadiology',1200, 418),

(181, '1', 'Vaccinations',180,  419),
(182, '2', 'Parasite prevention',500, 419),
(183, '3', 'Diet and nutrition',1900, 419),
(184, '4', 'Dental health and cleaning',1900, 419),
(185, '5', 'Behaviorol counseling',1000, 419),
(186, '6', 'Lab Testing',2800, 419),
(187, '7', 'Physical examination',299, 419),
(188, '8', 'Specialized surgies',2000, 419),
(189, '9', 'Oncology',2500, 419),
(190, '10', 'Cadiology',1000, 419),

(191, '1', 'Vaccinations',400,  420),
(192, '2', 'Parasite prevention',1590, 420),
(193, '3', 'Diet and nutrition',1299, 420),
(194, '4', 'Dental health and cleaning',1900, 420),
(195, '5', 'Behaviorol counseling',1000,  420),
(196, '6', 'Lab Testing',2800, 420),
(197, '7', 'Physical examination',899, 420),
(198, '8', 'Specialized surgies',2000, 420),
(199, '9', 'Oncology',1000, 420),
(200, '10', 'Cadiology',1600, 420),

(201, '1', 'Vaccinations',250,  421),
(202, '2', 'Parasite prevention',1590,  421),
(203, '3', 'Diet and nutrition',199, 421),
(204, '4', 'Dental health and cleaning',2000,  421),
(205, '5', 'Behaviorol counseling',1000, 421),
(206, '6', 'Lab Testing',3800,421),
(207, '7', 'Physical examination',599,  421),
(208, '8', 'Specialized surgies',2400, 421),
(209, '9', 'Oncology',1500, 421),
(210, '10', 'Cadiology',1500, 421)
;


-- The address relation 
INSERT INTO address VALUES
(1,'Lauren Jhon street','New york', 1111),
(2,'pokis street', 'Sodo', 9372),
(3,'Montino street', 'Taxas',4234),
(4,'East well','Vaginia', '2253'),
(5,'Edinberg street','South well', '2253'),
(6,'Lansa street','Hollolywood', '3422'),
(7,'Monguepa street', 'Lacos','5432'),
(8,'Goya street','Motorito','9832'),
(9,'North traee street','Rudjo','4325'),
(10,'South well street','Monto', '5904'),
(11,'Motina street','Sesore','3678'),
(12,'summerbreaze street', 'Nonjo','6845')
;


-- The owner relation 
INSERT INTO owner VALUES
(1, 'Laura', 'klies', '1995-12-04', 1, '11234343','laura@gmail.com'),
(2, 'Ola', 'Guid', '1990-10-02', 2, '93723823','Ola@gmail.com'),
(3, 'Mollow', 'Cown', '1945-12-10', 3, '42344334','Mollow@gmail.com'),
(4, 'Susan', 'Lavies', '1980-10-14', 4, '34323284','susan@gmail.com'),
(5, 'Michels', 'Cores', '1995-12-17', 5,347654325,'Michel@gmail.com'),
(6, 'Patino', 'Chavakoky', '2000-02-01', 5, '32323213','chavaky@gmail.com'),
(7, 'Litina', 'Lavius', '2001-01-08', 5, '3321224','litina@gmail.com'),
(8, 'Monica', 'loca', '2002-05-04', 6,  '9382324','monica@gmail.com'),
(9, 'Jack', 'Vana', '2002-09-18', 7, '4342324','Jack@gmail.com'),
(10, 'Bob', 'Lasveka', '2002-12-04', 8, '4234244','bob@gmail.com'),
(11, 'Mike', 'Barcha', '2006-12-04', 9, '6783324','mike@gmail.com'),
(12, 'Laren', 'Marna', '2010-12-04', 10, '11234344','laren@gmail.com'),
(13, 'Jessica', 'Dip', '2011-12-12', 11, '11234324','jessica@gmail.com'),
(14, 'Per', 'Cuper', '2015-09-10', 12, '1123432','Per@gmail.com'),
(15, 'Havy', 'Rusvok', '2016-11-04', 1, '1234324','Havy@gmail.com'),
(16, 'Rosa', 'Noiny', '2018-12-04', 4, '3234324','rosa@gmail.com'),
(17, 'Rasaka', 'Drawn', '2019-10-04', 5, '1132432','rasaka@gmail.com'),
(18, 'Rokca', 'Raise', '2019-05-01', 7, '43453334','Rokna@gmail.com'),
(19, 'Shawn', 'Pallow', '2022-10-04', 9, '43203443','Shaw@gmail.com'),
(20, 'Mandess', 'Lime', '2022-10-04', 10, '97456243','Mandess@gmail.com'),
(21, 'Moutn', 'Laurence', '2020-01-14', 11,'09843271','Moutn@gmail.com'),
(22, 'Martha', 'Rust', '2020-03-12', 12, '57954327','Martha@gmail.com'),
(23, 'Jhon', 'Brow', '2020-05-18', 12, '97563271','Jhon@gmail.com'),
(24, 'Hal', 'Nova', '2019-08-01', 10, '34586473','Hal@gmail.com'),
(25, 'Vigo', 'Cobana', '2021-09-21', 10, '78479375','Vigo@gmail.com'),
(26, 'Tina', 'Khaljo', '2021-11-23', 11, '78743624','Tina@gmail.com'),
(27, 'Lawchar', 'Sjore', '2022-12-30', 9, '57768432','Lawchar@gmail.com'),
(28, 'Luca', 'Titi', '2022-11-22', 8, '10957847','Luca@gmail.com'),
(29, 'Mona', 'Noha', '2022-04-27', 7, '87675432','Mona@gmail.com'),
(30, 'Rob', 'Bache', '2021-08-25', 6, '54137456','Rob@gmail.com')
;


-- The pet relation.  
INSERT INTO pet VALUES
(1, 'Happy',1, '2018-10-02 10:00:00', 441),
(2, 'Lata',2, '2020-01-10 10:00:00', 421),
(3, 'Mata',3, '2020-01-10 10:00:00', 421),
(4, 'Namwan',4, '2001-09-10 10:00:00', 418),
(5, 'Moo', 5,'2008-10-02 12:00:00', 418),
(6, 'Yoong',6, '2018-01-02 12:00:00', 419),
(7, 'Gizmo',7,'2018-11-01 11:00:00', 420),
(8, 'Lacost',8, '2018-12-10 05:00:00', 441),
(9, 'Kiity', 9,'2018-05-04 03:00:00', 410),
(10, 'Nancy', 10,'2017-07-11 06:00:00', 448),
(11, 'Lulu', 11,'2020-04-10 23:00:00', 446),
(12, 'Lala', 12,'2021-06-10 23:00:00', 442),
(13, 'Gustcha',13, '2021-07-12 10:00:00', 443),
(14, 'Mama', 14,'2014-10-03 00:00:00', 444),
(15, 'Sinsen',15, '2016-03-10 01:00:00', 445),
(16, 'Raimo', 16,'2017-03-07 09:00:00', 446),
(17, 'Lucy', 17,'2019-02-08 13:00:00', 447),
(18, 'Taro', 18,'2020-05-10 22:00:00', 448),
(19, 'Damn',19, '2017-05-08 21:00:00', 449),
(20, 'Lazzy', 20,'2020-05-12 10:00:00', 417),
(21, 'nanzy', 21,'2020-04-12 05:00:00', 416),
(22, 'Peepo', 22,'2020-03-22 01:00:00', 415),
(23, 'Zuzy', 23,'2020-01-15 22:00:00', 414),
(24, 'Boobo', 24,'2020-02-17 21:00:00', 413),
(25, 'Wan', 25,'2020-09-13 22:00:00', 412),
(26, 'cuby', 26,'2020-09-12 16:00:00', 411),
(27, 'Vivi', 27,'2020-09-17 15:00:00', 410),
(28, 'nanzy', 28,'2020-09-18 12:00:00', 442),
(29, 'Mama', 29,'2020-09-19 19:00:00', 441),
(30, 'Lala', 30,'2018-08-11 19:00:00', 441),
(31, 'Laura', 1,'2014-07-11 17:00:00', 419),
(32, 'Tuna', 2,'2019-07-01 17:00:00', 441),
(33, 'Guicy',3, '2016-05-11 10:00:00', 419),
(34, 'Lily', 4,'2016-11-12 11:50:00', 420),
(35, 'Goby', 5,'2022-01-12 23:00:00', 421)
;  


-- The vet_specialization relation.
INSERT INTO vet_specialization VALUES
(1,1,410),
(2,1,411),
(3,1,412),
(4,1,413),
(5,1,414),
(6,1,415),
(7,1,416),
(8,1,417),
(9,1,418),
(10,1,419),
(11,1,420),
(12,1,421),
(13,1,442),
(14,1,443),
(15,1,444),
(16,1,445),
(17,1,446),
(18,1,447),
(19,1,448),
(20,1,449),
(21,1,441),

(22,2,410),
(23,2,411),
(24,2,412),
(25,2,413),
(26,2,414),
(27,2,415),
(28,2,416),
(29,2,417),
(30,2,418),
(31,2,419),
(32,2,420),
(33,2,421),
(34,2,442),
(35,2,443),
(36,2,444),
(37,2,445),
(38,2,446),
(39,2,447),
(40,2,448),
(41,2,449),
(42,2,441),

(43,3,410),
(44,3,411),
(45,3,412),
(46,3,413),
(47,3,414),
(48,3,415),
(49,3,416),
(50,3,417),
(189,3,418),
(51,3,419),
(52,3,420),
(53,3,421),
(54,3,442),
(55,3,443),
(56,3,444),
(57,3,445),
(58,3,446),
(59,3,447),
(60,3,448),
(61,3,449),
(62,3,441),

(63,4,410),
(64,4,411),
(65,4,412),
(66,4,413),
(67,4,414),
(68,4,415),
(69,4,416),
(70,4,417),
(71,4,418),
(72,4,419),
(73,4,420),
(74,4,421),
(75,4,442),
(76,4,443),
(77,4,444),
(78,4,445),
(79,4,446),
(80,4,447),
(81,4,448),
(82,4,449),
(83,4,441),

(84,5,410),
(85,5,411),
(86,5,412),
(87,5,413),
(88,5,414),
(89,5,415),
(90,5,416),
(91,5,417),
(92,5,418),
(93,5,419),
(94,5,420),
(95,5,421),
(96,5,442),
(97,5,443),
(98,5,444),
(99,5,445),
(100,5,446),
(101,5,447),
(102,5,448),
(103,5,449),
(104,5,441),

(105,6,410),
(106,6,411),
(107,6,412),
(108,6,413),
(109,6,414),
(110,6,415),
(111,6,416),
(112,6,417),
(113,6,418),
(114,6,419),
(115,6,420),
(116,6,421),
(117,6,442),
(118,6,443),
(119,6,444),
(120,6,445),
(121,6,446),
(122,6,447),
(123,6,448),
(124,6,449),
(125,6,441),

(126,7,410),
(127,7,411),
(128,7,412),
(129,7,413),
(130,7,414),
(131,7,415),
(132,7,416),
(133,7,417),
(134,7,418),
(135,7,419),
(136,7,420),
(137,7,421),
(138,7,442),
(139,7,443),
(140,7,444),
(141,7,445),
(142,7,446),
(143,7,447),
(144,7,448),
(145,7,449),
(146,7,441),

(147,8,410),
(148,8,411),
(149,8,412),
(150,8,413),
(151,8,414),
(152,8,415),
(153,8,416),
(154,8,417),
(155,8,418),
(156,8,419),
(157,8,420),
(158,8,421),
(159,8,442),
(160,8,443),
(161,8,444),
(162,8,445),
(163,8,446),
(164,8,447),
(165,8,448),
(166,8,449),
(167,8,441),

(168,9,410),
(169,9,411),
(170,9,412),
(171,9,413),
(172,9,414),
(173,9,415),
(174,9,416),
(175,9,417),
(176,9,418),
(177,9,419),
(178,9,420),
(179,9,421),
(180,9,442),
(181,9,443),
(182,9,444),
(183,9,445),
(184,9,446),
(185,9,447),
(186,9,448),
(187,9,449),
(188,9,441)
;


-- The booking relation. 
INSERT INTO booking VALUES
(1, 1, 'in-person','2021-11-01 09:00:00'),
(2, 31, 'in-person','2021-11-01 09:00:00'),
(3, 3, 'mobile-call','2021-11-08 11:00:00'),
(4, 4, 'mobile-call','2021-11-24 09:00:00'),
(5, 5, 'mobile-call','2022-01-12 09:00:00'),
(6, 6, 'mobile-call','2022-01-12 09:00:00'),
(7, 7, 'in-person','2022-02-12 12:00:00'),
(8, 8, 'mobile-call','2022-02-12 11:00:00'),
(9, 9, 'mobile-call','2022-05-01 10:00:00'),
(10, 10, 'in-person','2022-05-01 10:00:00'),
(11, 11, 'mobile-call','2022-06-19 14:00:00'),
(12, 12, 'mobile-call','2022-06-20 15:00:00'),
(13, 13, 'mobile-call','2022-07-20 16:00:00'),
(14, 14, 'mobile-call','2022-07-28 15:00:00'),
(15, 15, 'in-person','2022-07-28 13:00:00'),
(16, 16, 'mobile-call','2022-07-23 13:00:00'),
(17, 17, 'in-person','2022-07-22 12:00:00'),
(18, 18, 'mobile-call','2022-07-22 10:00:00'),
(19, 19, 'in-person','2022-08-03 10:00:00'),
(20, 20, 'mobile-call','2022-08-03 10:00:00'),
(21, 21, 'mobile-call','2022-09-12 10:00:00'),
(22, 22, 'in-person','2021-11-01 09:00:00'),
(23, 23, 'mobile-call','2022-10-01 09:00:00'),
(24, 24, 'mobile-call','2022-11-22 14:00:00'),
(25, 25, 'mobile-call','2022-11-22 13:00:00'),
(26, 26, 'mobile-call','2022-11-18 13:00:00'),
(27, 27, 'in-person','2021-11-08 09:00:00')
;


-- The appointment relation. 
INSERT INTO appointment VALUES
(1,1,'2021-11-02 09:00:00', 'Health Care', 'A', 1, 2,'AA'),
(1,2,'2021-11-02 09:00:00', 'Health Care', 'B',  1, 1, 'AA'),
(2,3,'2021-11-24 09:00:00', 'Diabetes', 'A',1, 202, 'AA'),
(3,4,'2021-11-24 10:00:00', 'Deantal care', 'A', 9, 206,'CC'),
(4,5,'2021-11-24 10:00:00', 'zoonoses', 'B', 2, 171, 'CC'),
(5,6,'2022-01-13 09:00:00', 'Vomiting', 'E',4, 178,'AA'),
(6,7,'2022-01-13 10:00:00', 'Pain', 'C', 5, 189, 'CC'),
(7,8, '2022-02-13 11:00:00', 'Swaollen lymph nodes', 'C',6, 195,'EE'),
(8,9, '2022-02-13 11:00:00', 'Poor appetite', 'B',7,3, 'EE'),
(9,10,'2022-05-19 09:00:00', 'Body aches', 'A',8, 97, 'AA'),
(10,11,'2022-05-19 09:30:00', 'Abdominal cramps', 'A',2,74, 'BB'),
(11,12,'2022-06-24 09:00:00', 'Health care', 'C',3, 56, 'AA'),
(12,13,'2022-06-24 09:00:00', 'Fever', 'C', 2, 12, 'AA'),
(13,14,'2022-07-29 09:00:00', 'Diarrhea', 'A',  4, 27, 'AA'),
(14,15,'2022-07-29 09:00:00', 'Fever', 'B',  9, 33, 'AA'),
(15,16,'2022-07-29 09:00:00', 'Skin lesions', 'C',  1, 50, 'AA'),
(16,17,'2022-07-25 13:00:00', 'Bite marks', 'A',  5, 60, 'HH'),
(17,18,'2022-07-25 15:00:00', 'Swaollen Urine', 'A',  5, 61, 'LL'),
(18,19,'2022-07-25 15:00:00', 'Swaollen in the eyes', 'E',4, 72, 'LL'),
(19,20,'2022-08-12 10:00:00', 'Fatigue', 'A',  5, 85, 'CC'),
(20,21,'2022-08-12 13:30:00', 'Vomiting', 'B',  5, 162, 'HH'),
(21,22,'2022-09-12 14:30:00', 'Paranoid symtom', 'C',  9, 155, 'KK'),
(22,23,'2022-10-02 13:00:00', 'Dental health', 'A',  7, 141, 'HH'),
(23,24,'2022-10-02 13:00:00', 'Monthy health checking', 'E',  8, 135, 'HH'),
(24,25,'2022-11-23 13:00:00', 'Annualy vaccination', 'D',  6, 124, 'HH'),
(25,26,'2022-11-23 13:30:00', 'Bacteria infection', 'D',  5, 117, 'II'),
(26,27,'2022-11-23 13:30:00', 'wounds that require debriding', 'D',  5, 117, 'II')
;
