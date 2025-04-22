CREATE DATABASE LagosRideSharing;

Use LagosRideSharing;

CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Rating DECIMAL(3,2),
    TotalRides INT DEFAULT 0
);

CREATE TABLE Riders (
    RiderID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL
);

CREATE TABLE Rides (
    RideID INT PRIMARY KEY AUTO_INCREMENT,
    DriverID INT,
    RiderID INT,
    Fare DECIMAL(10,2),
    Rating DECIMAL(3,2),
    DistanceKM DECIMAL(6,2),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID),
    FOREIGN KEY (RiderID) REFERENCES Riders(RiderID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    RideID INT,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (RideID) REFERENCES Rides(RideID)
);



INSERT INTO Drivers (Name, Rating, TotalRides) VALUES
('John Doe', 4.5, 120),
('Jane Smith', 4.2, 90),
('James Bond', 4.7, 150),
('Samantha James', 4.3, 80),
('Michael Brown', 4.0, 60),
('Nina Williams', 4.6, 200),
('Chris Johnson', 4.1, 110),
('Sarah Davis', 4.8, 100),
('David Lee', 3.9, 70),
('Emma Green', 4.4, 130),
('Olumide Adebayo', 4.7, 150),
('Grace Okafor', 4.3, 140),
('Julius Adedeji', 4.6, 175),
('Tolu Olowolagba', 4.2, 105),
('Fola Akinwunmi', 4.5, 125),
('Oluwaseun Bello', 4.1, 115),
('Kayode Ogunleye', 4.8, 180),
('Chinonso Ifeanyi', 3.8, 85),
('Oluwafunmilayo Bello', 4.3, 140),
('Adeola Akin', 4.6, 160);


SELECT * from Drivers;

INSERT INTO Riders (Name, City) VALUES
('Alice Johnson', 'Lekki'),
('Victor Martins', 'Ikeja'),
('Funke Bello', 'Victoria Island'),
('Tunde Adeyemi', 'Surulere'),
('Grace Olamide', 'Yaba'),
('Kingsley Obi', 'Lekki'),
('Folasade Okoro', 'Ikeja'),
('Emeka Okafor', 'Victoria Island'),
('Temilade Adedeji', 'Lekki'),
('Rita Durojaiye', 'Surulere'),
('Chuka Nwosu', 'Yaba'),
('Ayotunde Adeleke', 'Ikeja'),
('Lola Abiola', 'Lekki'),
('Olumide Bakare', 'Surulere'),
('Chidera Okonkwo', 'Victoria Island'),
('Wale Oni', 'Yaba'),
('Olivia Adebayo', 'Lekki'),
('Temidayo Alabi', 'Ikeja'),
('Micheal Ojo', 'Victoria Island'),
('Tolu Ayinde', 'Surulere'),
('Grace Williams', 'Lekki'),
('Olumide Ayodele', 'Ikeja'),
('James Osundare', 'Yaba'),
('Chika Okafor', 'Surulere'),
('Sandra Ogunleye', 'Victoria Island');


SELECT * from Riders;

INSERT INTO Rides (DriverID, RiderID, Fare, Rating, DistanceKM) VALUES
(1, 1, 3000, 4.5, 10),
(2, 2, 2500, 4.2, 8),
(3, 3, 4500, 4.7, 15),
(4, 4, 3500, 4.3, 12),
(5, 5, 2000, 4.0, 7),
(6, 6, 4000, 4.6, 20),
(7, 7, 2800, 4.1, 9),
(8, 8, 5000, 4.8, 18),
(9, 9, 2200, 3.9, 6),
(10, 10, 3700, 4.4, 14),
(11, 11, 3900, 4.7, 16),
(12, 12, 3600, 4.3, 11),
(13, 13, 4200, 4.6, 17),
(14, 14, 3300, 4.2, 13),
(15, 15, 3800, 4.5, 19),
(16, 16, 2500, 4.1, 8),
(17, 17, 4800, 4.8, 22),
(18, 18, 3100, 3.8, 10),
(19, 19, 3300, 4.3, 14),
(20, 20, 4600, 4.6, 20),
(1, 21, 2900, 4.4, 11),
(2, 22, 3200, 4.1, 12),
(3, 23, 3400, 4.7, 13),
(4, 24, 3100, 4.3, 9),
(5, 25, 3600, 4.2, 15),
(6, 1, 2800, 4.6, 12),
(7, 2, 3500, 4.1, 16),
(8, 3, 5000, 4.8, 18),
(9, 4, 2300, 3.9, 7),
(10, 5, 3800, 4.4, 14),
(11, 6, 4000, 4.7, 20),
(12, 7, 3300, 4.3, 13),
(13, 8, 4100, 4.6, 17),
(14, 9, 3100, 4.2, 11),
(15, 10, 4200, 4.5, 19),
(16, 11, 2900, 4.1, 12),
(17, 12, 4700, 4.8, 21),
(18, 13, 3300, 3.8, 10),
(19, 14, 3200, 4.3, 14),
(20, 15, 4500, 4.6, 20),
(1, 16, 3000, 4.5, 12),
(2, 17, 2500, 4.2, 9),
(3, 18, 4500, 4.7, 15),
(4, 19, 3500, 4.3, 13),
(5, 20, 2000, 4.0, 7),
(6, 21, 4000, 4.6, 20),
(7, 22, 2800, 4.1, 8),
(8, 23, 5000, 4.8, 18),
(9, 24, 2200, 3.9, 6),
(10, 25, 3700, 4.4, 14);

SELECT * FROM Drivers WHERE DriverID NOT IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20);

SELECT * FROM Rides;


INSERT INTO Payments (RideID, Amount, PaymentMethod) VALUES
(1, 3000, 'Card'),
(2, 2500, 'Cash'),
(3, 4500, 'Card'),
(4, 3500, 'Mobile Money'),
(5, 2000, 'Cash'),
(6, 4000, 'Card'),
(7, 2800, 'Mobile Money'),
(8, 5000, 'Card'),
(9, 2200, 'Cash'),
(10, 3700, 'Mobile Money'),
(11, 3900, 'Card'),
(12, 3600, 'Cash'),
(13, 4200, 'Mobile Money'),
(14, 3300, 'Card'),
(15, 3800, 'Mobile Money'),
(16, 2500, 'Cash'),
(17, 4800, 'Card'),
(18, 3100, 'Cash'),
(19, 3300, 'Mobile Money'),
(20, 4600, 'Card'),
(21, 2900, 'Cash'),
(22, 3200, 'Card'),
(23, 3400, 'Mobile Money'),
(24, 3100, 'Cash'),
(25, 3600, 'Card'),
(26, 2800, 'Mobile Money'),
(27, 3500, 'Card'),
(28, 5000, 'Cash'),
(29, 2300, 'Mobile Money'),
(30, 3800, 'Card'),
(31, 4000, 'Cash'),
(32, 3300, 'Mobile Money'),
(33, 4100, 'Card'),
(34, 3100, 'Cash'),
(35, 4200, 'Mobile Money'),
(36, 2900, 'Card'),
(37, 4700, 'Cash'),
(38, 3300, 'Mobile Money'),
(39, 3200, 'Card'),
(40, 4500, 'Cash'),
(41, 3000, 'Card'),
(42, 2500, 'Cash'),
(43, 4500, 'Mobile Money'),
(44, 3500, 'Card'),
(45, 2000, 'Cash'),
(46, 4000, 'Card'),
(47, 2800, 'Mobile Money'),
(48, 5000, 'Card'),
(49, 2200, 'Cash'),
(50, 3700, 'Mobile Money');

SELECT * FROM Payments;
