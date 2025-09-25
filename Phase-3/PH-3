-- Single line comment 

/* 
multi 
line 
comment
*/
-- --------------------------------------------- Database Analysis -----------------------------------------------------

-- Table 1: Stations – stationid,StationName, Code, City, State, PlatformCount,OpenedYear,Zone,Electrified, Remarks
-- Table 2: Trains- TrainNumber, TrainName, SourceStation, DestinationStation, TotalCoaches, MaxSpeed, Category, RunningDays, Status
-- Table 3: Passengers- FirstName, LastName, Age, Gender, Phone, Email, IDProofType, IDProofNumber, Nationality                                         
-- Table 4: Bookings - PassengerID, TrainID, CoachType, SeatNumber, JourneyDate, BookingDate, BookingStatus, PaymentMode, Fare
-- Table 5: Tickets - BookingID, PassengerID, TrainID, CoachNumber, SeatNumber, TicketType, TicketStatus, IssueDate, Fare
-- Table 6:  Routes - TrainID, SourceStation, DestinationStation, TotalDistance, TotalStops, StartTime, EndTime, RouteStatus, Remarks
-- Table 7: Coaches - TrainID, CoachNumber, CoachType, Capacity, OccupiedSeats, AvailableSeats, AC, PantryAvailable, Remarks
-- Table 8: Seats- CoachID, SeatNumber, SeatType, IsWindowSeat, IsBooked, PassengerID, BookingID, TrainID, Remarks
-- Table 9: Staff - Name, Role, Department, TrainID, Shift, Contact, Email, JoinDate, Remarks
-- Table 10:Engineers -  Name, Specialization, Department, TrainID, Contact, Email, AssignedDate, Certification, Remarks
-- Table 11: TrainSchedules - TrainID, RouteID, DepartureDate, DepartureTime, ArrivalDate, ArrivalTime, PlatformNumber, Status, Remarks
-- Table 12: Catering - TrainID, VendorID, StaffID, MealType, Menu, Quantity, ServiceTime, Status, Remarks
-- Table 13: Vendors - Name, Contact, Email, ServiceType, LicenseNo, Address, ContractStart, ContractEnd, Remarks
-- Table 14:  MaintenanceLogs - TrainID, EngineerID, Date, Time, IssueReported, ActionTaken, Status, NextDue, Remarks
-- Table 15:  Complaints - PassengerID, TrainID, CoachID, Date, Time, Type, Description, Status, Remarks 
-- Table 16: Cargo - BookingID, TrainID, DepartureStation, ArrivalStation, Weight, GoodsType, DepartureDate, ArrivalDate, Status
-- Table 17: Parcels - BookingID, SenderName, ReceiverName, SourceStation, DestinationStation, Weight, DispatchDate, DeliveryDate, Status
-- Table 18: FreightBookings - CustomerName, GoodsType, Quantity, Weight, SourceStation, DestinationStation, BookingDate, DeliveryDate, Status
-- Table 19: Signals - RouteID, SignalType, Location, Status, LastCheckDate, NextCheckDate, MaintenanceStatus, MaintainedBy, Remarks
-- Table 20: Tracks - RouteID, SectionName, Length_KM, GaugeType, ConditionStatus, LastInspection, NextInspection, MaintainedBy, Remarks 
-- Table 21: Bridges - TrackID, BridgeName, Location, Length_M, Type, ConditionStatus, LastInspection, NextInspection, Remarks 
-- Table 22: LevelCrossings - TrackID, Location, CrossingType, GateStatus, AttendantName, ContactNumber, LastInspection, NextInspection, Remarks 
-- Table 23:  ControlRooms - Location, InCharge, ContactNumber, Shift, NoOfStaff, EquipmentStatus, LastAudit, NextAudit, Remarks 
-- Table 24: Timetables - TrainID, RouteID, DepartureStation, ArrivalStation, DepartureTime, ArrivalTime, Frequency, EffectiveFrom, EffectiveTo
-- Table 25:  Announcements - Title, Description, Date, Time, Station, AffectedTrains, ValidFrom, ValidTo, Status

-- --------------------------------------------- Database Queries -----------------------------------------------------

-- to create database Consulting Firm Management 
create database IndianRailway;

-- to work on database we need to use it 
use IndianRailway;

-- Delete all records use it
Drop Table IndianRailway;
-- --------------------------------------------- Database Analysis -----------------------------------------------------

-- Table 1: Stations
CREATE TABLE Stations (
    StationID INT PRIMARY KEY AUTO_INCREMENT,
    StationName VARCHAR(100),
    Code CHAR(5),
    City VARCHAR(50),
    State VARCHAR(50),
    PlatformCount INT,
    Zone VARCHAR(50),
    OpenedYear YEAR,
    Electrified BOOLEAN,
    Remarks TEXT
);

-- Insert 20 records into Stations
INSERT INTO Stations (stationid,StationName, Code, City, State, PlatformCount,OpenedYear,Zone,Electrified, Remarks)
VALUES
('Mumbai CST', 'CSTM', 'Mumbai', 'Maharashtra', 18, 'Central', 1853, TRUE, 'Major terminus'),
('Howrah Jn', 'HWH', 'Kolkata', 'West Bengal', 23, 'Eastern', 1854, TRUE, 'Oldest station'),
('Chennai Central', 'MAS', 'Chennai', 'Tamil Nadu', 17, 'Southern', 1873, TRUE, 'Busy hub'),
('New Delhi', 'NDLS', 'Delhi', 'Delhi', 16, 'Northern', 1926, TRUE, 'Capital station'),
('Secunderabad', 'SC', 'Hyderabad', 'Telangana', 10, 'South Central', 1874, TRUE, 'Twin city station'),
('Ahmedabad', 'ADI', 'Ahmedabad', 'Gujarat', 12, 'Western', 1864, TRUE, 'Major junction'),
('Lucknow NR', 'LKO', 'Lucknow', 'Uttar Pradesh', 9, 'Northern', 1867, TRUE, 'State capital'),
('Kanpur Central', 'CNB', 'Kanpur', 'Uttar Pradesh', 10, 'North Central', 1930, TRUE, 'Busy station'),
('Patna Jn', 'PNBE', 'Patna', 'Bihar', 10, 'East Central', 1862, TRUE, 'Main Bihar hub'),
('Jaipur', 'JP', 'Jaipur', 'Rajasthan', 7, 'North Western', 1875, TRUE, 'Pink city station'),
('Bhopal', 'BPL', 'Bhopal', 'Madhya Pradesh', 8, 'West Central', 1887, TRUE, 'Capital station'),
('Nagpur', 'NGP', 'Nagpur', 'Maharashtra', 9, 'Central', 1867, TRUE, 'Geographical center'),
('Visakhapatnam', 'VSKP', 'Visakhapatnam', 'Andhra Pradesh', 8, 'East Coast', 1896, TRUE, 'Port city'),
('Kolkata Sealdah', 'SDAH', 'Kolkata', 'West Bengal', 20, 'Eastern', 1869, TRUE, 'Busy suburban'),
('Bengaluru City', 'SBC', 'Bengaluru', 'Karnataka', 10, 'South Western', 1864, TRUE, 'IT hub station'),
('Pune', 'PUNE', 'Pune', 'Maharashtra', 6, 'Central', 1858, TRUE, 'Tech city'),
('Coimbatore', 'CBE', 'Coimbatore', 'Tamil Nadu', 5, 'Southern', 1873, TRUE, 'Industrial city'),
('Guwahati', 'GHY', 'Guwahati', 'Assam', 8, 'Northeast Frontier', 1900, TRUE, 'Gateway to NE'),
('Jodhpur', 'JU', 'Jodhpur', 'Rajasthan', 5, 'North Western', 1885, TRUE, 'Desert city'),
('Agra Cantt', 'AGC', 'Agra', 'Uttar Pradesh', 7, 'North Central', 1904, TRUE, 'Taj city');

-- display table data
Select * from Stations;

-- to delete values from table 
truncate table Stations;

-- to delete table
drop table Stations;

-- 1. Simple SELECT with WHERE
SELECT * FROM Stations WHERE City='Mumbai';

-- 2. Projection with specific columns
SELECT StationName, City, State FROM Stations;

-- 3. Built-in function: UPPER
SELECT UPPER(StationName) AS UpperName FROM Stations;

-- 4. Built-in function: LENGTH
SELECT StationName, LENGTH(StationName) AS NameLength FROM Stations;

-- 5. COUNT aggregate
SELECT State, COUNT(*) AS StationCount FROM Stations GROUP BY State;

-- 6. AVG aggregate
SELECT Zone, AVG(PlatformCount) AS AvgPlatforms FROM Stations GROUP BY Zone;

-- 7. Subquery (stations older than average opened year)
SELECT StationName, OpenedYear FROM Stations
WHERE OpenedYear < (SELECT AVG(OpenedYear) FROM Stations);

-- 8. Subquery (stations with max platforms)
SELECT StationName, PlatformCount FROM Stations
WHERE PlatformCount=(SELECT MAX(PlatformCount) FROM Stations);

-- 9. ORDER BY
SELECT StationName, PlatformCount FROM Stations ORDER BY PlatformCount DESC;

-- 10. LIKE filter
SELECT * FROM Stations WHERE StationName LIKE '%Central%';

-- 11. JOIN self-table (stations in same state)
SELECT s1.StationName AS Station1, s2.StationName AS Station2, s1.State
FROM Stations s1
JOIN Stations s2 ON s1.State=s2.State AND s1.StationID<s2.StationID;

-- 12. JOIN with subquery
SELECT s.StationName, s.City
FROM Stations s
JOIN (SELECT State, MAX(PlatformCount) AS MaxP FROM Stations GROUP BY State) t
ON s.State=t.State AND s.PlatformCount=t.MaxP;

-- 13. EXISTS subquery
SELECT StationName, City FROM Stations s
WHERE EXISTS(SELECT 1 FROM Stations WHERE State='Maharashtra' AND s.State='Maharashtra');

-- 14. IN subquery
SELECT StationName, City FROM Stations
WHERE State IN (SELECT DISTINCT State FROM Stations WHERE Zone='Central');

-- 15. CASE expression
SELECT StationName, 
       CASE WHEN PlatformCount>15 THEN 'Large'
            WHEN PlatformCount BETWEEN 8 AND 15 THEN 'Medium'
            ELSE 'Small' END AS SizeCategory
FROM Stations;

-- 15. CASE expression
SELECT StationName, 
       CASE WHEN PlatformCount>15 THEN 'Large'
            WHEN PlatformCount BETWEEN 8 AND 15 THEN 'Medium'
            ELSE 'Small' END AS SizeCategory
FROM Stations;

-- 17. User-defined function (example: get station age)
DELIMITER //
CREATE FUNCTION get_station_age(opened YEAR)
RETURNS INT DETERMINISTIC
BEGIN
  RETURN YEAR(CURDATE())-opened;
END //
DELIMITER ;
SELECT StationName, get_station_age(OpenedYear) AS StationAge FROM Stations;

-- 18. GROUP_CONCAT built-in
SELECT State, GROUP_CONCAT(StationName SEPARATOR ', ') AS Stations FROM Stations GROUP BY State;

-- 19. HAVING clause
SELECT Zone, COUNT(*) AS Cnt FROM Stations GROUP BY Zone HAVING Cnt>2;

-- 20. COALESCE function
SELECT StationName, COALESCE(Remarks,'No Remarks') AS StationRemarks FROM Stations;


-- Table 2: Trains
CREATE TABLE Trains (
    TrainID INT PRIMARY KEY AUTO_INCREMENT,
    TrainNumber VARCHAR(10),
    TrainName VARCHAR(100),
    SourceStation VARCHAR(50),
    DestinationStation VARCHAR(50),
    TotalCoaches INT,
    MaxSpeed INT,
    Category VARCHAR(50),
    RunningDays VARCHAR(20),
    Status VARCHAR(20)
);

-- Insert 20 records into Trains
INSERT INTO Trains (TrainNumber, TrainName, SourceStation, DestinationStation, TotalCoaches, MaxSpeed, Category, RunningDays, Status)
VALUES
('12951', 'Mumbai Rajdhani', 'Mumbai CST', 'New Delhi', 20, 140, 'Rajdhani', 'Daily', 'Running'),
('12301', 'Howrah Rajdhani', 'Howrah', 'New Delhi', 20, 140, 'Rajdhani', 'Daily', 'Running'),
('12007', 'Shatabdi Express', 'Chennai', 'Mysuru', 16, 130, 'Shatabdi', 'Daily', 'Running'),
('12627', 'Karnataka Exp', 'Bengaluru', 'New Delhi', 24, 110, 'Superfast', 'Daily', 'Running'),
('12723', 'Telangana Exp', 'Hyderabad', 'New Delhi', 22, 110, 'Superfast', 'Daily', 'Running'),
('12953', 'August Kranti Rajdhani', 'Mumbai CST', 'Hazrat Nizamuddin', 20, 130, 'Rajdhani', 'Daily', 'Running'),
('12295', 'Sanghamitra Exp', 'Bengaluru', 'Patna', 24, 110, 'Superfast', 'Daily', 'Running'),
('12615', 'Grand Trunk Exp', 'Chennai', 'New Delhi', 24, 110, 'Mail/Express', 'Daily', 'Running'),
('12511', 'Rapti Sagar Exp', 'Gorakhpur', 'Thiruvananthapuram', 22, 110, 'Mail/Express', 'Daily', 'Running'),
('12259', 'Sealdah Duronto', 'Sealdah', 'New Delhi', 20, 130, 'Duronto', 'Daily', 'Running'),
('12430', 'Rajdhani Exp', 'New Delhi', 'Lucknow', 16, 130, 'Rajdhani', 'Daily', 'Running'),
('12859', 'Gitanjali Exp', 'Mumbai CST', 'Howrah', 24, 110, 'Superfast', 'Daily', 'Running'),
('12801', 'Purushottam Exp', 'Puri', 'New Delhi', 22, 110, 'Superfast', 'Daily', 'Running'),
('12009', 'Shatabdi Exp', 'Mumbai CST', 'Ahmedabad', 16, 130, 'Shatabdi', 'Daily', 'Running'),
('12621', 'Tamil Nadu Exp', 'Chennai', 'New Delhi', 24, 110, 'Superfast', 'Daily', 'Running'),
('12903', 'Golden Temple Mail', 'Mumbai CST', 'Amritsar', 24, 110, 'Mail/Express', 'Daily', 'Running'),
('12171', 'LTT Haridwar AC Exp', 'Mumbai LTT', 'Haridwar', 20, 110, 'AC Exp', 'Weekly', 'Running'),
('12561', 'Swarna Jayanti Exp', 'New Delhi', 'Ranchi', 20, 110, 'Superfast', 'Daily', 'Running'),
('12625', 'Kerala Exp', 'Thiruvananthapuram', 'New Delhi', 24, 110, 'Superfast', 'Daily', 'Running'),
('12909', 'Garib Rath Exp', 'Mumbai Bandra', 'Hazrat Nizamuddin', 20, 120, 'Garib Rath', 'Daily', 'Running');

-- display table data
Select * from Trains;

-- to delete values from table 
truncate table Trains;

-- to delete table
drop table Trains;

-- 1. Simple SELECT
SELECT * FROM Trains;

-- 2. Built-in function: UPPER on TrainName
SELECT TrainID, UPPER(TrainName) AS TrainNameCaps FROM Trains;

-- 3. Built-in function: LENGTH of TrainName
SELECT TrainName, LENGTH(TrainName) AS NameLength FROM Trains;

-- 4. WHERE clause with condition
SELECT TrainName, SourceStation, DestinationStation 
FROM Trains WHERE Category='Rajdhani';

-- 5. ORDER BY MaxSpeed
SELECT TrainName, MaxSpeed FROM Trains ORDER BY MaxSpeed DESC;

-- 6. GROUP BY Category
SELECT Category, COUNT(*) AS TotalTrains FROM Trains GROUP BY Category;

-- 7. HAVING with GROUP BY
SELECT Category, COUNT(*) AS TotalTrains 
FROM Trains GROUP BY Category HAVING COUNT(*)>2;

-- 8. Subquery: Trains with Max Speed
SELECT TrainName, MaxSpeed 
FROM Trains WHERE MaxSpeed=(SELECT MAX(MaxSpeed) FROM Trains);

-- 9. Subquery: Trains from stations where more than 1 train starts
SELECT * FROM Trains 
WHERE SourceStation IN (SELECT SourceStation FROM Trains GROUP BY SourceStation HAVING COUNT(*)>1);

-- 10. JOIN example (self join on SourceStation-DestinationStation)
SELECT t1.TrainName AS Train1, t2.TrainName AS Train2, t1.SourceStation
FROM Trains t1 JOIN Trains t2 ON t1.SourceStation=t2.SourceStation AND t1.TrainID<>t2.TrainID;

-- 11. JOIN (Category grouping)
SELECT t1.TrainName, t2.Category 
FROM Trains t1 INNER JOIN Trains t2 ON t1.Category=t2.Category AND t1.TrainID<>t2.TrainID;

-- 12. Window function: RANK by speed
-- A) If your DB supports window functions (MySQL 8+, Postgres, SQL Server)
-- B) Portable fallback (works in MySQL <8, Postgres, etc.) — computes the same RANK()
SELECT t1.TrainName,
       t1.MaxSpeed,
       (SELECT 1 + COUNT(DISTINCT t2.MaxSpeed)
        FROM Trains t2
        WHERE t2.MaxSpeed > t1.MaxSpeed) AS SpeedRank
FROM Trains t1
ORDER BY SpeedRank;
-- Explanation: counts how many distinct higher speeds exist and adds 1 => same ranking with ties.

-- 13
SELECT t1.TrainName,
       t1.TotalCoaches,
       (SELECT COUNT(DISTINCT t2.TotalCoaches)
        FROM Trains t2
        WHERE t2.TotalCoaches > t1.TotalCoaches) + 1 AS CoachRank
FROM Trains t1
ORDER BY CoachRank;

      

-- 14. COUNT with DISTINCT
SELECT COUNT(DISTINCT SourceStation) AS UniqueSources FROM Trains;

-- 15. UNION
SELECT TrainName, SourceStation FROM Trains WHERE SourceStation='Mumbai CST'
UNION
SELECT TrainName, DestinationStation FROM Trains WHERE DestinationStation='New Delhi';

-- 16. INTERSECT (if DB supports)

SELECT p1.FirstName, p1.Age,
       (SELECT COUNT(DISTINCT p2.Age)
        FROM Passengers p2
        WHERE p2.Age > p1.Age) + 1 AS DenseAgeRank
FROM Passengers p1
ORDER BY DenseAgeRank;

-- 17. EXCEPT/MINUS (if supported)
SELECT t1.TrainName
FROM Trains t1
WHERE t1.SourceStation = 'Chennai'
  AND NOT EXISTS (
      SELECT 1
      FROM Trains t2
      WHERE t2.TrainName = t1.TrainName
        AND t2.DestinationStation = 'New Delhi'
  );


-- 18. User-defined function: Get full route
SELECT fn_train_route(1);  -- Example, shows "Mumbai CST -> New Delhi"

-- 19. Use the UDF
SELECT TrainName, fn_train_route(TrainID) AS Route FROM Trains;

-- 20. Subquery with EXISTS
SELECT TrainName, Category FROM Trains t 
WHERE EXISTS (SELECT 1 FROM Trains t2 WHERE t2.Category='Shatabdi' AND t2.TrainID=t.TrainID);


-- Table 3: Passengers
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Gender CHAR(1),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    IDProofType VARCHAR(50),
    IDProofNumber VARCHAR(50),
    Nationality VARCHAR(50)
);

-- Insert 20 records into Passengers
INSERT INTO Passengers (FirstName, LastName, Age, Gender, Phone, Email, IDProofType, IDProofNumber, Nationality)
VALUES
('Rajesh', 'Sharma', 35, 'M', '9876543210', 'rajesh@gmail.com', 'Aadhaar', '1234-5678-9012', 'Indian'),
('Priya', 'Verma', 28, 'F', '8765432109', 'priya@gmail.com', 'Passport', 'M1234567', 'Indian'),
('Amit', 'Kumar', 40, 'M', '7654321098', 'amitk@gmail.com', 'PAN', 'ABCDE1234F', 'Indian'),
('Sunita', 'Singh', 32, 'F', '6543210987', 'sunita@yahoo.com', 'Aadhaar', '2345-6789-0123', 'Indian'),
('Vikram', 'Joshi', 45, 'M', '5432109876', 'vikramj@hotmail.com', 'Passport', 'N9876543', 'Indian'),
('Meena', 'Rao', 29, 'F', '4321098765', 'meena@gmail.com', 'Aadhaar', '3456-7890-1234', 'Indian'),
('Anil', 'Patel', 38, 'M', '3210987654', 'anilp@gmail.com', 'Voter ID', 'MH1234567', 'Indian'),
('Sneha', 'Desai', 26, 'F', '2109876543', 'sneha@gmail.com', 'Aadhaar', '4567-8901-2345', 'Indian'),
('Ravi', 'Nair', 42, 'M', '1098765432', 'ravinair@gmail.com', 'PAN', 'XYZAB1234C', 'Indian'),
('Kiran', 'Das', 30, 'M', '1987654321', 'kiran.das@gmail.com', 'Aadhaar', '5678-9012-3456', 'Indian'),
('Deepa', 'Mehta', 31, 'F', '9876541230', 'deepa@gmail.com', 'Passport', 'P9876543', 'Indian'),
('Ajay', 'Bansal', 39, 'M', '8765432101', 'ajayb@gmail.com', 'PAN', 'PQRST1234Z', 'Indian'),
('Ruchi', 'Khatri', 27, 'F', '7654321012', 'ruchi.khatri@gmail.com', 'Aadhaar', '6789-0123-4567', 'Indian'),
('Suresh', 'Yadav', 41, 'M', '6543210123', 'sureshy@yahoo.com', 'Voter ID', 'DL2345678', 'Indian'),
('Neha', 'Mishra', 33, 'F', '5432101234', 'neham@gmail.com', 'Aadhaar', '7890-1234-5678', 'Indian'),
('Ashok', 'Gupta', 44, 'M', '4321012345', 'ashokg@hotmail.com', 'Passport', 'Q1234567', 'Indian'),
('Kavita', 'Kapoor', 25, 'F', '3210123456', 'kavitak@gmail.com', 'Aadhaar', '8901-2345-6789', 'Indian'),
('Nitin', 'Rana', 37, 'M', '2101234567', 'nitinr@gmail.com', 'PAN', 'LMNOP1234Y', 'Indian'),
('Geeta', 'Pillai', 29, 'F', '1012345678', 'geetap@gmail.com', 'Aadhaar', '9012-3456-7890', 'Indian'),
('Rohit', 'Saxena', 36, 'M', '9123456789', 'rohit.saxena@gmail.com', 'Voter ID', 'UP3456789', 'Indian');

-- display table data
Select * from Passengers;

-- to delete values from table 
truncate table Passengers;

-- to delete table
drop table Passengers;

-- 1. Select all
SELECT * FROM Passengers;

-- 2. Built-in function: CONCAT full name
SELECT PassengerID, CONCAT(FirstName, ' ', LastName) AS FullName FROM Passengers;

-- 3. Built-in function: UPPER on FirstName
SELECT UPPER(FirstName) AS UpperName FROM Passengers;

-- 4. Built-in function: LENGTH of Email
SELECT Email, LENGTH(Email) AS EmailLength FROM Passengers;

-- 5. WHERE filter on Age
SELECT FirstName, LastName, Age FROM Passengers WHERE Age>35;

-- 6. ORDER BY Age
SELECT FirstName, LastName, Age FROM Passengers ORDER BY Age DESC;

-- 7. GROUP BY Gender
SELECT Gender, COUNT(*) AS Total FROM Passengers GROUP BY Gender;

-- 8. HAVING with GROUP BY
SELECT IDProofType, COUNT(*) AS CountProofs FROM Passengers GROUP BY IDProofType HAVING COUNT(*)>2;

-- 9. Subquery: Oldest passenger
SELECT * FROM Passengers WHERE Age=(SELECT MAX(Age) FROM Passengers);

-- 10. Subquery: Passengers younger than average
SELECT FirstName, Age FROM Passengers WHERE Age<(SELECT AVG(Age) FROM Passengers);

-- 11. IN with subquery
SELECT * FROM Passengers WHERE IDProofType IN (SELECT DISTINCT IDProofType FROM Passengers WHERE Gender='F');

-- 12. EXISTS subquery
SELECT FirstName, LastName FROM Passengers p WHERE EXISTS (SELECT 1 FROM Passengers WHERE Gender='F' AND p.PassengerID=PassengerID);

-- 13. Self join: passengers with same nationality
SELECT p1.FirstName AS P1, p2.FirstName AS P2, p1.Nationality
FROM Passengers p1 JOIN Passengers p2 ON p1.Nationality=p2.Nationality AND p1.PassengerID<>p2.PassengerID;

-- 14. Join with Trains (example: PassengerID linked to TrainID hypothetical mapping)
SELECT p.FirstName, t.TrainName 
FROM Passengers p JOIN Trains t ON p.PassengerID=t.TrainID;

-- 15. Window function: Rank by Age
SELECT p1.FirstName, p1.Age,
       (SELECT COUNT(DISTINCT p2.Age)
        FROM Passengers p2
        WHERE p2.Age >= p1.Age) AS AgeRank
FROM Passengers p1
ORDER BY AgeRank;


-- 16. Window function: Dense Rank by Age
SELECT p1.FirstName, p1.Age,
       (SELECT COUNT(DISTINCT p2.Age)
        FROM Passengers p2
        WHERE p2.Age >= p1.Age) AS DenseAgeRank
FROM Passengers p1
ORDER BY DenseAgeRank;


-- 17. COUNT DISTINCT
SELECT COUNT(DISTINCT Nationality) AS UniqueNationalities FROM Passengers;

-- 18. UNION
SELECT FirstName, LastName FROM Passengers WHERE Gender='M'
UNION
SELECT FirstName, LastName FROM Passengers WHERE Gender='F';

-- 19. Self join: passengers with same nationality
SELECT p1.FirstName AS P1, p2.FirstName AS P2, p1.Nationality
FROM Passengers p1 JOIN Passengers p2 ON p1.Nationality=p2.Nationality AND p1.PassengerID<>p2.PassengerID;


-- 20. Use UDF
SELECT PassengerID, fn_full_name(PassengerID) AS FullName FROM Passengers;


-- Table 4: Bookings
CREATE TABLE Bookings(
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerID INT,
    TrainID INT,
    CoachType VARCHAR(20),
    SeatNumber VARCHAR(10),
    JourneyDate DATE,
    BookingDate DATE,
    BookingStatus VARCHAR(20),
    PaymentMode VARCHAR(20),
    Fare DECIMAL(10,2)
);

-- Insert 20 sample records into Bookings
INSERT INTO Bookings (PassengerID, TrainID, CoachType, SeatNumber, JourneyDate, BookingDate, BookingStatus, PaymentMode, Fare)
 VALUES
(1, 1, 'Sleeper', 'S1-23', '2025-07-20', '2025-07-10', 'Confirmed', 'UPI', 850.00),
(2, 2, 'AC 2 Tier', 'A2-15', '2025-07-21', '2025-07-11', 'Confirmed', 'Credit Card', 1450.00),
(3, 3, 'AC Chair Car', 'C1-10', '2025-07-22', '2025-07-12', 'Confirmed', 'Debit Card', 950.00),
(4, 4, 'Sleeper', 'S2-35', '2025-07-23', '2025-07-13', 'Waiting', 'Net Banking', 780.00),
(5, 5, 'AC 3 Tier', 'B1-20', '2025-07-24', '2025-07-14', 'Confirmed', 'UPI', 1250.00),
(6, 6, 'Sleeper', 'S3-18', '2025-07-25', '2025-07-15', 'Confirmed', 'Cash', 900.00),
(7, 7, 'AC 2 Tier', 'A1-05', '2025-07-26', '2025-07-16', 'Confirmed', 'Credit Card', 1500.00),
(8, 8, 'Sleeper', 'S4-12', '2025-07-27', '2025-07-17', 'Cancelled', 'UPI', 850.00),
(9, 9, 'AC 3 Tier', 'B2-30', '2025-07-28', '2025-07-18', 'Confirmed', 'Debit Card', 1200.00),
(10, 10, 'AC Chair Car', 'C2-08', '2025-07-29', '2025-07-19', 'Confirmed', 'UPI', 970.00),
(11, 1, 'Sleeper', 'S1-24', '2025-07-30', '2025-07-20', 'Confirmed', 'Net Banking', 880.00),
(12, 2, 'AC 2 Tier', 'A2-16', '2025-07-31', '2025-07-21', 'Waiting', 'UPI', 1470.00),
(13, 3, 'AC Chair Car', 'C1-11', '2025-08-01', '2025-07-22', 'Confirmed', 'Credit Card', 960.00),
(14, 4, 'Sleeper', 'S2-36', '2025-08-02', '2025-07-23', 'Confirmed', 'Debit Card', 770.00),
(15, 5, 'AC 3 Tier', 'B1-21', '2025-08-03', '2025-07-24', 'Confirmed', 'UPI', 1240.00),
(16, 6, 'Sleeper', 'S3-19', '2025-08-04', '2025-07-25', 'Cancelled', 'Net Banking', 890.00),
(17, 7, 'AC 2 Tier', 'A1-06', '2025-08-05', '2025-07-26', 'Confirmed', 'Credit Card', 1490.00),
(18, 8, 'Sleeper', 'S4-13', '2025-08-06', '2025-07-27', 'Confirmed', 'UPI', 860.00),
(19, 9, 'AC 3 Tier', 'B2-31', '2025-08-07', '2025-07-28', 'Waiting', 'Debit Card', 1220.00),
(20, 10, 'AC Chair Car', 'C2-09', '2025-08-08', '2025-07-29', 'Confirmed', 'Credit Card', 980.00);

-- display table data
Select * from Bookings;

-- to delete values from table 
truncate table Bookings;

-- to delete table
drop table Bookings;

-- 1. Simple SELECT with WHERE
SELECT BookingID, PassengerID, TrainID, Fare
FROM Bookings
WHERE BookingStatus='Confirmed';

-- 2. Aggregate with GROUP BY
SELECT CoachType, COUNT(*) AS TotalBookings
FROM Bookings
GROUP BY CoachType;

-- 3. JOIN with Trains table (assuming Trains exists)
SELECT b.BookingID, b.SeatNumber, t.TrainName, t.SourceStation, t.DestinationStation
FROM Bookings b
JOIN Trains t ON b.TrainID = t.TrainID;

-- 4. Subquery: Passengers with fare > average
SELECT PassengerID, Fare
FROM Bookings
WHERE Fare > (SELECT AVG(Fare) FROM Bookings);

-- 5. DISTINCT values
SELECT DISTINCT PaymentMode FROM Bookings;

-- 6. ORDER BY
SELECT BookingID, PassengerID, Fare
FROM Bookings
ORDER BY Fare DESC;

-- 7. LIMIT (Top 5 fares)
SELECT BookingID, PassengerID, Fare
FROM Bookings
ORDER BY Fare DESC
LIMIT 5;

-- 8. Built-in function: CONCAT
SELECT BookingID, CONCAT('Seat ', SeatNumber, ' - ', CoachType) AS SeatInfo
FROM Bookings;

-- 9. Built-in function: DATE_FORMAT
SELECT BookingID, DATE_FORMAT(JourneyDate, '%d-%M-%Y') AS JourneyFormatted
FROM Bookings;

-- 10. COALESCE example
SELECT BookingID, COALESCE(BookingStatus,'Unknown') AS Status
FROM Bookings;

-- 11. COUNT with condition
SELECT COUNT(*) AS CancelledBookings
FROM Bookings
WHERE BookingStatus='Cancelled';

-- 12. Subquery in FROM
SELECT CoachType, AVG(Fare) AS AvgFare
FROM (SELECT CoachType, Fare FROM Bookings) AS temp
GROUP BY CoachType;

-- 13. JOIN with Passengers table (assuming Passengers exists)
SELECT b.BookingID, p.FirstName, p.Age, b.Fare
FROM Bookings b
JOIN Passengers p ON b.PassengerID = p.PassengerID;

-- 14. HAVING clause
SELECT PaymentMode, SUM(Fare) AS TotalFare
FROM Bookings
GROUP BY PaymentMode
HAVING SUM(Fare) > 3000;

-- 15. Subquery with IN
SELECT BookingID, PassengerID
FROM Bookings
WHERE TrainID IN (SELECT TrainID FROM Trains WHERE MaxSpeed > 100);

-- 16. HAVING clause
SELECT PaymentMode, SUM(Fare) AS TotalFare
FROM Bookings
GROUP BY PaymentMode
HAVING SUM(Fare) > 3000;

-- 17. User Defined Function: calculate discount
DELIMITER $$
CREATE FUNCTION fn_discount(f DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN f * 0.9;
END$$
DELIMITER ;

SELECT BookingID, Fare, fn_discount(Fare) AS DiscountedFare
FROM Bookings;

-- 18. CASE expression
SELECT BookingID, Fare,
       CASE 
         WHEN Fare > 1200 THEN 'High'
         WHEN Fare BETWEEN 800 AND 1200 THEN 'Medium'
         ELSE 'Low'
       END AS FareCategory
FROM Bookings;

-- 19. EXISTS example
SELECT BookingID, PassengerID
FROM Bookings b
WHERE EXISTS (SELECT 1 FROM Trains t WHERE t.TrainID = b.TrainID);

-- 20. Subquery with MAX
SELECT *
FROM Bookings
WHERE Fare = (SELECT MAX(Fare) FROM Bookings);


-- Table 5: Tickets
CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    PassengerID INT,
    TrainID INT,
    CoachNumber VARCHAR(10),
    SeatNumber VARCHAR(10),
    TicketType VARCHAR(20),
    TicketStatus VARCHAR(20),
    IssueDate DATE,
    Fare DECIMAL(10,2)
);

INSERT INTO Tickets (BookingID, PassengerID, TrainID, CoachNumber, SeatNumber, TicketType, TicketStatus, IssueDate, Fare)
VALUES
(1, 1, 1, 'S1', '23', 'E-Ticket', 'Confirmed', '2025-07-10', 850.00),
(2, 2, 2, 'A2', '15', 'E-Ticket', 'Confirmed', '2025-07-11', 1450.00),
(3, 3, 3, 'C1', '10', 'Counter', 'Confirmed', '2025-07-12', 950.00),
(4, 4, 4, 'S2', '35', 'E-Ticket', 'Waiting', '2025-07-13', 780.00),
(5, 5, 5, 'B1', '20', 'E-Ticket', 'Confirmed', '2025-07-14', 1250.00),
(6, 6, 6, 'S3', '18', 'Counter', 'Confirmed', '2025-07-15', 900.00),
(7, 7, 7, 'A1', '05', 'E-Ticket', 'Confirmed', '2025-07-16', 1500.00),
(8, 8, 8, 'S4', '12', 'E-Ticket', 'Cancelled', '2025-07-17', 850.00),
(9, 9, 9, 'B2', '30', 'Counter', 'Confirmed', '2025-07-18', 1200.00),
(10, 10, 10, 'C2', '08', 'E-Ticket', 'Confirmed', '2025-07-19', 970.00),
(11, 11, 1, 'S1', '24', 'Counter', 'Confirmed', '2025-07-20', 880.00),
(12, 12, 2, 'A2', '16', 'E-Ticket', 'Waiting', '2025-07-21', 1470.00),
(13, 13, 3, 'C1', '11', 'Counter', 'Confirmed', '2025-07-22', 960.00),
(14, 14, 4, 'S2', '36', 'E-Ticket', 'Confirmed', '2025-07-23', 770.00),
(15, 15, 5, 'B1', '21', 'E-Ticket', 'Confirmed', '2025-07-24', 1240.00),
(16, 16, 6, 'S3', '19', 'Counter', 'Cancelled', '2025-07-25', 890.00),
(17, 17, 7, 'A1', '06', 'E-Ticket', 'Confirmed', '2025-07-26', 1490.00),
(18, 18, 8, 'S4', '13', 'Counter', 'Confirmed', '2025-07-27', 860.00),
(19, 19, 9, 'B2', '31', 'E-Ticket', 'Waiting', '2025-07-28', 1220.00),
(20, 20, 10, 'C2', '09', 'Counter', 'Confirmed', '2025-07-29', 980.00);

-- display table data
Select * from Tickets;

-- to delete values from table 
truncate table Tickets;

-- to delete table
drop table Tickets;

-- 1. Simple SELECT with condition
SELECT TicketID, PassengerID, Fare
FROM Tickets
WHERE TicketStatus='Confirmed';

-- 2. GROUP BY with COUNT
SELECT TicketType, COUNT(*) AS TotalTickets
FROM Tickets
GROUP BY TicketType;

-- 3. JOIN with Bookings table
SELECT t.TicketID, t.SeatNumber, b.BookingStatus, b.PaymentMode
FROM Tickets t
JOIN Bookings b ON t.BookingID = b.BookingID;

-- 4. Subquery: Tickets with fare > average
SELECT TicketID, Fare
FROM Tickets
WHERE Fare > (SELECT AVG(Fare) FROM Tickets);

-- 5. DISTINCT TicketType
SELECT DISTINCT TicketType FROM Tickets;

-- 6. ORDER BY fare
SELECT TicketID, PassengerID, Fare
FROM Tickets
ORDER BY Fare DESC;

-- 7. LIMIT (Top 5 highest fares)
SELECT TicketID, Fare
FROM Tickets
ORDER BY Fare DESC
LIMIT 5;

-- 8. Built-in function: CONCAT
SELECT TicketID, CONCAT(CoachNumber, '-', SeatNumber) AS SeatInfo
FROM Tickets;

-- 9. Built-in function: DATE_FORMAT
SELECT TicketID, DATE_FORMAT(IssueDate, '%d-%M-%Y') AS IssueFormatted
FROM Tickets;

-- 10. COALESCE example
SELECT TicketID, COALESCE(TicketStatus,'Unknown') AS Status
FROM Tickets;

-- 11. COUNT with condition
SELECT COUNT(*) AS CancelledTickets
FROM Tickets
WHERE TicketStatus='Cancelled';

-- 12. Subquery in FROM
SELECT TicketType, AVG(Fare) AS AvgFare
FROM (SELECT TicketType, Fare FROM Tickets) AS temp
GROUP BY TicketType;

-- 13. JOIN with Trains table
SELECT t.TicketID, tr.TrainName, tr.SourceStation, tr.DestinationStation, t.Fare
FROM Tickets t
JOIN Trains tr ON t.TrainID = tr.TrainID;

-- 14. HAVING with SUM
SELECT TicketType, SUM(Fare) AS TotalFare
FROM Tickets
GROUP BY TicketType
HAVING SUM(Fare) > 3000;

-- 15. Subquery with IN
SELECT TicketID, PassengerID
FROM Tickets
WHERE TrainID IN (SELECT TrainID FROM Trains WHERE MaxSpeed > 100);

-- 16. JOIN with Trains table
SELECT t.TicketID, tr.TrainName, tr.SourceStation, tr.DestinationStation, t.Fare
FROM Tickets t
JOIN Trains tr ON t.TrainID = tr.TrainID;

-- 17. User Defined Function: discount on fare
DELIMITER $$
CREATE FUNCTION fn_ticket_discount(f DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN f * 0.9;
END$$
DELIMITER ;

SELECT TicketID, Fare, fn_ticket_discount(Fare) AS DiscountedFare
FROM Tickets;

-- 18. CASE expression
SELECT TicketID, Fare,
       CASE 
         WHEN Fare > 1200 THEN 'High'
         WHEN Fare BETWEEN 800 AND 1200 THEN 'Medium'
         ELSE 'Low'
       END AS FareCategory
FROM Tickets;

-- 19. EXISTS example
SELECT TicketID, PassengerID
FROM Tickets t
WHERE EXISTS (SELECT 1 FROM Bookings b WHERE b.BookingID = t.BookingID);

-- 20. Subquery with MAX
SELECT *
FROM Tickets
WHERE Fare = (SELECT MAX(Fare) FROM Tickets);


-- Table 6: Routes
CREATE TABLE Routes (
    RouteID INT PRIMARY KEY AUTO_INCREMENT,
    TrainID INT,
    SourceStation VARCHAR(50),
    DestinationStation VARCHAR(50),
    TotalDistance INT,
    TotalStops INT,
    StartTime TIME,
    EndTime TIME,
    RouteStatus VARCHAR(20),
    Remarks TEXT
);

INSERT INTO Routes (TrainID, SourceStation, DestinationStation, TotalDistance, TotalStops, StartTime, EndTime, RouteStatus, Remarks)
VALUES
(1, 'Mumbai CST', 'New Delhi', 1384, 8, '16:00:00', '08:35:00', 'Active', 'Rajdhani Route'),
(2, 'Howrah', 'New Delhi', 1448, 10, '16:55:00', '10:15:00', 'Active', 'Rajdhani Route'),
(3, 'Chennai', 'Mysuru', 497, 4, '06:00:00', '12:00:00', 'Active', 'Shatabdi Route'),
(4, 'Bengaluru', 'New Delhi', 2410, 20, '20:30:00', '05:40:00', 'Active', 'Karnataka Express'),
(5, 'Hyderabad', 'New Delhi', 1677, 12, '06:00:00', '07:15:00', 'Active', 'Telangana Express'),
(6, 'Mumbai CST', 'Hazrat Nizamuddin', 1377, 8, '17:40:00', '10:10:00', 'Active', 'August Kranti'),
(7, 'Bengaluru', 'Patna', 2693, 25, '09:00:00', '21:20:00', 'Active', 'Sanghamitra'),
(8, 'Chennai', 'New Delhi', 2182, 17, '19:15:00', '05:45:00', 'Active', 'GT Express'),
(9, 'Gorakhpur', 'Thiruvananthapuram', 3231, 30, '06:35:00', '04:55:00', 'Active', 'Rapti Sagar'),
(10, 'Sealdah', 'New Delhi', 1454, 5, '18:30:00', '10:20:00', 'Active', 'Duronto'),
(11, 'New Delhi', 'Lucknow', 492, 2, '19:50:00', '06:10:00', 'Active', 'Rajdhani Short'),
(12, 'Mumbai CST', 'Howrah', 1968, 22, '06:00:00', '11:25:00', 'Active', 'Gitanjali'),
(13, 'Puri', 'New Delhi', 1859, 14, '21:45:00', '22:00:00', 'Active', 'Purushottam'),
(14, 'Mumbai CST', 'Ahmedabad', 492, 3, '06:00:00', '12:30:00', 'Active', 'Shatabdi Route'),
(15, 'Chennai', 'New Delhi', 2182, 16, '22:00:00', '07:30:00', 'Active', 'Tamil Nadu Exp'),
(16, 'Mumbai CST', 'Amritsar', 1892, 20, '21:25:00', '23:35:00', 'Active', 'Golden Temple'),
(17, 'Mumbai LTT', 'Haridwar', 1617, 10, '07:55:00', '16:30:00', 'Active', 'Haridwar AC'),
(18, 'New Delhi', 'Ranchi', 1316, 10, '20:35:00', '17:00:00', 'Active', 'Swarna Jayanti'),
(19, 'Thiruvananthapuram', 'New Delhi', 3036, 27, '12:20:00', '13:20:00', 'Active', 'Kerala Express'),
(20, 'Mumbai Bandra', 'Hazrat Nizamuddin', 1367, 6, '16:35:00', '09:45:00', 'Active', 'Garib Rath');

-- display table data
Select * from Routes;

-- to delete values from table 
truncate table Routes;

-- to delete table
drop table Routes;

-- 1. Simple SELECT
SELECT RouteID, SourceStation, DestinationStation, TotalDistance FROM Routes;

-- 2. WHERE condition
SELECT RouteID, TrainID, Remarks FROM Routes WHERE TotalStops > 15;

-- 3. ORDER BY
SELECT RouteID, TotalDistance FROM Routes ORDER BY TotalDistance DESC;

-- 4. GROUP BY with COUNT
SELECT SourceStation, COUNT(*) AS TotalRoutes FROM Routes GROUP BY SourceStation;

-- 5. DISTINCT destinations
SELECT DISTINCT DestinationStation FROM Routes;

-- 6. Aggregate with AVG
SELECT AVG(TotalDistance) AS AvgDistance FROM Routes;

-- 7. Subquery: routes longer than average
SELECT RouteID, SourceStation, DestinationStation, TotalDistance
FROM Routes
WHERE TotalDistance > (SELECT AVG(TotalDistance) FROM Routes);

-- 8. JOIN with Trains
SELECT r.RouteID, r.SourceStation, r.DestinationStation, t.TrainName, t.Category
FROM Routes r
JOIN Trains t ON r.TrainID = t.TrainID;

-- 9. JOIN with Bookings (through TrainID)
SELECT r.RouteID, r.SourceStation, r.DestinationStation, COUNT(b.BookingID) AS TotalBookings
FROM Routes r
JOIN Bookings b ON r.TrainID = b.TrainID
GROUP BY r.RouteID, r.SourceStation, r.DestinationStation;

-- 10. Built-in function CONCAT
SELECT RouteID, CONCAT(SourceStation, ' -> ', DestinationStation) AS FullRoute FROM Routes;

-- 11. Built-in function TIMEDIFF
SELECT RouteID, TIMEDIFF(EndTime, StartTime) AS JourneyDuration FROM Routes;

-- 12. COALESCE example
SELECT RouteID, COALESCE(Remarks,'No Remarks') AS RouteRemarks FROM Routes;

-- 13. HAVING with SUM
SELECT SourceStation, SUM(TotalDistance) AS TotalDist
FROM Routes
GROUP BY SourceStation
HAVING SUM(TotalDistance) > 3000;

-- 14. Subquery in FROM
SELECT DestinationStation, MAX(Dist) AS MaxDist
FROM (SELECT DestinationStation, TotalDistance AS Dist FROM Routes) AS temp
GROUP BY DestinationStation;

-- 15. Subquery with IN
SELECT RouteID, SourceStation, DestinationStation
FROM Routes
WHERE TrainID IN (SELECT TrainID FROM Trains WHERE MaxSpeed > 100);

-- 16. EXISTS example
SELECT RouteID, SourceStation, DestinationStation
FROM Routes r
WHERE EXISTS (SELECT 1 FROM Trains t WHERE t.TrainID = r.TrainID AND t.Status='Active');


-- 17. EXISTS example
SELECT RouteID, SourceStation, DestinationStation
FROM Routes r
WHERE EXISTS (SELECT 1 FROM Trains t WHERE t.TrainID = r.TrainID AND t.Status='Active');


-- 18. User Defined Function: calculate journey duration in hours
DELIMITER $$
CREATE FUNCTION fn_route_duration(startT TIME, endT TIME)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN TIMESTAMPDIFF(HOUR, startT, endT);
END$$
DELIMITER ;

SELECT RouteID, fn_route_duration(StartTime, EndTime) AS DurationHrs
FROM Routes;

-- 19. CASE expression
SELECT RouteID, TotalDistance,
       CASE
         WHEN TotalDistance > 2000 THEN 'Very Long'
         WHEN TotalDistance BETWEEN 1000 AND 2000 THEN 'Medium'
         ELSE 'Short'
       END AS DistanceCategory
FROM Routes;

-- 20. EXISTS example
SELECT RouteID, SourceStation
FROM Routes r
WHERE EXISTS (SELECT 1 FROM Trains t WHERE t.TrainID = r.TrainID);

-- Table 7: Coaches
CREATE TABLE Coaches (
    CoachID INT PRIMARY KEY AUTO_INCREMENT,
    TrainID INT,
    CoachNumber VARCHAR(10),
    CoachType VARCHAR(20),
    Capacity INT,
    OccupiedSeats INT,
    AvailableSeats INT,
    AC BOOLEAN,
    PantryAvailable BOOLEAN,
    Remarks TEXT
);

INSERT INTO Coaches (TrainID, CoachNumber, CoachType, Capacity, OccupiedSeats, AvailableSeats, AC, PantryAvailable, Remarks)
VALUES
(1, 'S1', 'Sleeper', 72, 60, 12, FALSE, FALSE, 'General Sleeper'),
(1, 'A1', 'AC 2 Tier', 48, 45, 3, TRUE, FALSE, 'Air-conditioned'),
(2, 'S1', 'Sleeper', 72, 65, 7, FALSE, FALSE, 'General Sleeper'),
(2, 'A2', 'AC 3 Tier', 64, 60, 4, TRUE, FALSE, 'Air-conditioned'),
(3, 'C1', 'AC Chair Car', 78, 75, 3, TRUE, TRUE, 'Shatabdi CC'),
(3, 'C2', 'AC Chair Car', 78, 70, 8, TRUE, TRUE, 'Shatabdi CC'),
(4, 'S2', 'Sleeper', 72, 70, 2, FALSE, FALSE, 'General Sleeper'),
(4, 'B1', 'AC 3 Tier', 64, 63, 1, TRUE, FALSE, 'AC Coach'),
(5, 'S3', 'Sleeper', 72, 68, 4, FALSE, FALSE, 'General Sleeper'),
(5, 'A1', 'AC 2 Tier', 48, 45, 3, TRUE, TRUE, 'AC Coach'),
(6, 'S4', 'Sleeper', 72, 69, 3, FALSE, FALSE, 'General Sleeper'),
(6, 'B2', 'AC 3 Tier', 64, 61, 3, TRUE, FALSE, 'AC Coach'),
(7, 'A1', 'AC 2 Tier', 48, 47, 1, TRUE, TRUE, 'AC Coach'),
(7, 'S5', 'Sleeper', 72, 67, 5, FALSE, FALSE, 'General Sleeper'),
(8, 'C1', 'AC Chair Car', 78, 72, 6, TRUE, TRUE, 'Chair Car'),
(8, 'C2', 'AC Chair Car', 78, 70, 8, TRUE, TRUE, 'Chair Car'),
(9, 'B1', 'AC 3 Tier', 64, 62, 2, TRUE, TRUE, 'AC Coach'),
(9, 'S6', 'Sleeper', 72, 66, 6, FALSE, FALSE, 'General Sleeper'),
(10, 'C3', 'AC Chair Car', 78, 74, 4, TRUE, TRUE, 'Chair Car'),
(10, 'B2', 'AC 3 Tier', 64, 60, 4, TRUE, TRUE, 'AC Coach');

-- display table data
Select * from Coaches;

-- to delete values from table 
truncate table Coaches;

-- to delete table
drop table Coaches;

-- 1. Simple SELECT with WHERE
SELECT CoachNumber, CoachType FROM Coaches WHERE AC = TRUE;

-- 2. INNER JOIN with Trains table
SELECT c.CoachNumber, c.CoachType, t.TrainName
FROM Coaches c
JOIN Trains t ON c.TrainID = t.TrainID;

-- 3. LEFT JOIN to show all trains even if no coaches
SELECT t.TrainName, c.CoachNumber
FROM Trains t
LEFT JOIN Coaches c ON t.TrainID = c.TrainID;

-- 4. Aggregate with GROUP BY
SELECT CoachType, COUNT(*) AS CoachCount
FROM Coaches
GROUP BY CoachType;

-- 5. HAVING with aggregate
SELECT CoachType, AVG(Capacity) AS AvgCap
FROM Coaches
GROUP BY CoachType
HAVING AVG(Capacity) > 60;

-- 6. Subquery: Find coaches with capacity above average
SELECT CoachNumber, Capacity
FROM Coaches
WHERE Capacity > (SELECT AVG(Capacity) FROM Coaches);

-- 7. Correlated Subquery: Max capacity per train
SELECT CoachNumber, Capacity
FROM Coaches c
WHERE Capacity = (SELECT MAX(Capacity) FROM Coaches WHERE TrainID = c.TrainID);

-- 8. Built-in function: CONCAT
SELECT CONCAT(CoachNumber, ' - ', CoachType) AS CoachInfo FROM Coaches;

-- 9. Built-in function: LENGTH
SELECT CoachNumber, LENGTH(Remarks) AS RemarksLength FROM Coaches;

-- 10. Math function: ROUND on occupancy ratio
SELECT CoachNumber, ROUND((OccupiedSeats * 100.0 / Capacity),2) AS OccupancyPercent
FROM Coaches;

-- 11. String function: UPPER
SELECT UPPER(CoachType) AS UpperCoachType FROM Coaches;

-- 12. Date function (using NOW for demo)
SELECT CoachNumber, NOW() AS CurrentDate FROM Coaches;

-- 13. Window function: Rank coaches by available seats
SET @rank = 0, @prev_val = NULL;

SELECT CoachNumber, AvailableSeats,
       @rank := IF(@prev_val = AvailableSeats, @rank, @rank + 1) AS SeatRank,
       @prev_val := AvailableSeats
FROM Coaches
ORDER BY AvailableSeats DESC;


-- 14. Window function: Dense rank by occupied seats
SET @rank = 0;
SET @prev_val = NULL;

SELECT CoachNumber, OccupiedSeats,
       @rank := IF(@prev_val = OccupiedSeats, @rank, @rank + 1) AS OccupiedRank,
       @prev_val := OccupiedSeats
FROM Coaches
ORDER BY OccupiedSeats DESC;


-- 15. Window function: Partition by Train
SELECT CoachNumber, CoachType
FROM Coaches c
WHERE EXISTS (SELECT 1 FROM Trains t WHERE t.TrainID = c.TrainID);

-- 16. Subquery in FROM clause (inline view)
SELECT TrainID, MAXCap
FROM (SELECT TrainID, MAX(Capacity) AS MAXCap FROM Coaches GROUP BY TrainID) AS Temp;

-- 17. EXISTS clause
SELECT CoachNumber, CoachType
FROM Coaches c
WHERE EXISTS (SELECT 1 FROM Trains t WHERE t.TrainID = c.TrainID);

-- 18. User-defined function: Create function to get available seats
DELIMITER //
CREATE FUNCTION fn_available_seats(p_coach VARCHAR(10))
RETURNS INT DETERMINISTIC
BEGIN
  DECLARE avail INT;
  SELECT AvailableSeats INTO avail FROM Coaches WHERE CoachNumber = p_coach LIMIT 1;
  RETURN avail;
END;
//
DELIMITER ;

-- Example usage of UDF
SELECT CoachNumber, fn_available_seats(CoachNumber) AS AvailSeats FROM Coaches;

-- 19. CASE expression
SELECT CoachNumber,
       CASE WHEN AC = TRUE THEN 'Air Conditioned'
            ELSE 'Non-AC' END AS AC_Status
FROM Coaches;

-- 20. UNION example
SELECT CoachNumber, CoachType FROM Coaches WHERE AC = TRUE
UNION
SELECT CoachNumber, CoachType FROM Coaches WHERE PantryAvailable = TRUE;

-- Table 8: Seats
CREATE TABLE Seats (
    SeatID INT PRIMARY KEY AUTO_INCREMENT,
    CoachID INT,
    SeatNumber VARCHAR(10),
    SeatType VARCHAR(20),
    IsWindowSeat BOOLEAN,
    IsBooked BOOLEAN,
    PassengerID INT,
    BookingID INT,
    TrainID INT,
    Remarks TEXT
);

INSERT INTO Seats (CoachID, SeatNumber, SeatType, IsWindowSeat, IsBooked, PassengerID, BookingID, TrainID, Remarks)
VALUES
(1, 'S1-1', 'Sleeper', TRUE, TRUE, 1, 1, 1, 'Booked'),
(1, 'S1-2', 'Sleeper', FALSE, TRUE, 2, 2, 1, 'Booked'),
(1, 'S1-3', 'Sleeper', TRUE, TRUE, 3, 3, 1, 'Booked'),
(1, 'S1-4', 'Sleeper', FALSE, FALSE, NULL, NULL, 1, 'Available'),
(2, 'A1-1', 'AC 2 Tier', TRUE, TRUE, 4, 4, 1, 'Booked'),
(2, 'A1-2', 'AC 2 Tier', FALSE, TRUE, 5, 5, 1, 'Booked'),
(2, 'A1-3', 'AC 2 Tier', TRUE, FALSE, NULL, NULL, 1, 'Available'),
(3, 'S2-1', 'Sleeper', TRUE, TRUE, 6, 6, 2, 'Booked'),
(3, 'S2-2', 'Sleeper', FALSE, FALSE, NULL, NULL, 2, 'Available'),
(3, 'S2-3', 'Sleeper', TRUE, TRUE, 7, 7, 2, 'Booked'),
(4, 'B1-1', 'AC 3 Tier', TRUE, TRUE, 8, 8, 3, 'Booked'),
(4, 'B1-2', 'AC 3 Tier', FALSE, FALSE, NULL, NULL, 3, 'Available'),
(4, 'B1-3', 'AC 3 Tier', TRUE, TRUE, 9, 9, 3, 'Booked'),
(5, 'C1-1', 'Chair Car', TRUE, TRUE, 10, 10, 4, 'Booked'),
(5, 'C1-2', 'Chair Car', FALSE, TRUE, 11, 11, 4, 'Booked'),
(5, 'C1-3', 'Chair Car', TRUE, FALSE, NULL, NULL, 4, 'Available'),
(6, 'S3-1', 'Sleeper', TRUE, TRUE, 12, 12, 5, 'Booked'),
(6, 'S3-2', 'Sleeper', FALSE, TRUE, 13, 13, 5, 'Booked'),
(6, 'S3-3', 'Sleeper', TRUE, FALSE, NULL, NULL, 5, 'Available'),
(7, 'A2-1', 'AC 2 Tier', TRUE, TRUE, 14, 14, 6, 'Booked');

-- display table data
Select * from Seats;

-- to delete values from table 
truncate table Seats;

-- to delete table
drop table Seats;

-- 1. List all booked seats with coach and train info (JOIN)
SELECT s.SeatNumber, c.CoachNumber, t.TrainName
FROM Seats s
JOIN Coaches c ON s.CoachID = c.CoachID
JOIN Trains t ON s.TrainID = t.TrainID
WHERE s.IsBooked = TRUE;

-- 2. Count available seats per coach (GROUP BY)
SELECT CoachID, COUNT(*) AS AvailableSeats
FROM Seats
WHERE IsBooked = FALSE
GROUP BY CoachID;

-- 3. Find trains with more than 5 available seats (Subquery + HAVING)
SELECT t.TrainName
FROM Trains t
WHERE t.TrainID IN (
  SELECT TrainID FROM Seats WHERE IsBooked = FALSE GROUP BY TrainID HAVING COUNT(*) > 5
);

-- 4. Window function: rank seats by SeatNumber
SELECT SeatNumber, RANK() OVER (ORDER BY SeatNumber) AS SeatRank
FROM Seats;

-- 5. Built-in function: find remarks length
SELECT SeatNumber, LENGTH(Remarks) AS RemarkLength FROM Seats;

-- 6. Show window seats booked (Simple filter)
SELECT SeatNumber FROM Seats WHERE IsWindowSeat = TRUE AND IsBooked = TRUE;

-- 7. Total booked vs available seats (CASE + SUM)
SELECT
  SUM(CASE WHEN IsBooked = TRUE THEN 1 ELSE 0 END) AS TotalBooked,
  SUM(CASE WHEN IsBooked = FALSE THEN 1 ELSE 0 END) AS TotalAvailable
FROM Seats;

-- 8. Coaches with at least one available seat (EXISTS subquery)
SELECT c.CoachNumber
FROM Coaches c
WHERE EXISTS (
  SELECT 1 FROM Seats s WHERE s.CoachID = c.CoachID AND s.IsBooked = FALSE
);

-- 9. Seats with null passenger (LEFT JOIN)
SELECT s.SeatNumber, p.FirstName
FROM Seats s
LEFT JOIN Passengers p ON s.PassengerID = p.PassengerID;

-- 10. Find highest SeatID (MAX function)
SELECT MAX(SeatID) AS HighestSeatID FROM Seats;

-- 11. UDF: function to return seat status text
DELIMITER //
CREATE FUNCTION fn_seat_status(p_seat_id INT)
RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
  DECLARE v_status VARCHAR(20);
  SELECT CASE WHEN IsBooked = TRUE THEN 'Booked' ELSE 'Available' END
  INTO v_status
  FROM Seats WHERE SeatID = p_seat_id;
  RETURN v_status;
END //
DELIMITER ;

-- Usage of UDF
SELECT SeatNumber, fn_seat_status(SeatID) AS SeatStatus FROM Seats;

-- 12. Dense rank by TrainID (Window function)
SELECT s.SeatNumber, p.FirstName
FROM Seats s
LEFT JOIN Passengers p ON s.PassengerID = p.PassengerID;


-- 13. Count seats by SeatType (GROUP BY)
SELECT SeatType, COUNT(*) AS TotalSeats
FROM Seats
GROUP BY SeatType;

-- 14. Subquery: List coaches with more than 2 booked seats
SELECT c.CoachNumber
FROM Coaches c
WHERE c.CoachID IN (
  SELECT CoachID FROM Seats WHERE IsBooked = TRUE GROUP BY CoachID HAVING COUNT(*) > 2
);

-- 15. Concatenate seat details (CONCAT function)
SELECT CONCAT(SeatNumber, ' - ', SeatType, ' - ', Remarks) AS SeatInfo
FROM Seats;

-- 16. Find seat with earliest booking (MIN BookingID)
SELECT SeatNumber, BookingID FROM Seats
WHERE BookingID = (SELECT MIN(BookingID) FROM Seats WHERE BookingID IS NOT NULL);

-- 17. Window function: partition by TrainID
SELECT CONCAT(SeatNumber, ' - ', SeatType, ' - ', Remarks) AS SeatInfo
FROM Seats;

-- 18. Subquery: passengers who booked a window seat
SELECT p.FirstName, p.Age
FROM Passengers p
WHERE p.PassengerID IN (
  SELECT PassengerID FROM Seats WHERE IsWindowSeat = TRUE AND IsBooked = TRUE
);

-- 19. Built-in function: uppercase remarks
SELECT SeatNumber, UPPER(Remarks) AS UpperRemarks FROM Seats;

-- 20. Show booked seat percentage per train (Aggregate + ROUND)
SELECT TrainID,
       ROUND(SUM(CASE WHEN IsBooked=TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS BookedPercentage
FROM Seats
GROUP BY TrainID;


-- Table 9: Staff
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Department VARCHAR(50),
    TrainID INT,
    Shift VARCHAR(20),
    Contact VARCHAR(15),
    Email VARCHAR(100),
    JoinDate DATE,
    Remarks TEXT
);

INSERT INTO Staff (Name, Role, Department, TrainID, Shift, Contact, Email, JoinDate, Remarks)
VALUES
('Rakesh Singh', 'Ticket Checker', 'Onboard', 1, 'Morning', '9876543200', 'rakesh.tc@rail.in', '2018-05-10', 'Senior TC'),
('Meena Kumari', 'Attendant', 'Onboard', 1, 'Morning', '8765432100', 'meena.att@rail.in', '2019-06-15', 'Sleeper Attendant'),
('Sunil Yadav', 'Guard', 'Operations', 2, 'Night', '7654321000', 'sunil.guard@rail.in', '2017-03-20', 'Train Guard'),
('Anjali Sharma', 'Ticket Checker', 'Onboard', 2, 'Morning', '6543210000', 'anjali.tc@rail.in', '2020-07-01', 'New Joiner'),
('Deepak Verma', 'Pantry Staff', 'Catering', 3, 'Morning', '5432100000', 'deepak.pantry@rail.in', '2016-08-05', 'Pantry Head'),
('Kavita Joshi', 'Cleaner', 'Housekeeping', 3, 'Night', '4321000000', 'kavita.clean@rail.in', '2019-02-14', 'Sleeper Coach'),
('Rajiv Nair', 'Security', 'Security', 4, 'Night', '3210000000', 'rajiv.sec@rail.in', '2015-04-12', 'RPF'),
('Pooja Mehta', 'Ticket Checker', 'Onboard', 4, 'Morning', '2100000000', 'pooja.tc@rail.in', '2018-11-11', 'Rajdhani TC'),
('Amit Desai', 'Pantry Staff', 'Catering', 5, 'Morning', '1000000001', 'amit.pantry@rail.in', '2017-09-07', 'Pantry Assistant'),
('Sneha Rao', 'Cleaner', 'Housekeeping', 5, 'Night', '1000000002', 'sneha.clean@rail.in', '2019-01-22', 'Coach Cleaner'),
('Vivek Kumar', 'Security', 'Security', 6, 'Night', '1000000003', 'vivek.sec@rail.in', '2015-12-18', 'Train Guard'),
('Manoj Singh', 'Guard', 'Operations', 6, 'Night', '1000000004', 'manoj.guard@rail.in', '2014-04-04', 'Senior Guard'),
('Seema Das', 'Ticket Checker', 'Onboard', 7, 'Morning', '1000000005', 'seema.tc@rail.in', '2018-03-15', 'Duronto TC'),
('Prakash Jain', 'Attendant', 'Onboard', 7, 'Morning', '1000000006', 'prakash.att@rail.in', '2016-05-19', 'AC Attendant'),
('Nisha Kapoor', 'Pantry Staff', 'Catering', 8, 'Morning', '1000000007', 'nisha.pantry@rail.in', '2020-07-25', 'Pantry Junior'),
('Anand Pillai', 'Cleaner', 'Housekeeping', 8, 'Night', '1000000008', 'anand.clean@rail.in', '2019-08-30', 'Chair Car Cleaner'),
('Ritu Singh', 'Security', 'Security', 9, 'Night', '1000000009', 'ritu.sec@rail.in', '2017-06-09', 'RPF Lady Constable'),
('Pawan Yadav', 'Guard', 'Operations', 9, 'Night', '1000000010', 'pawan.guard@rail.in', '2013-02-02', 'Senior Guard'),
('Tanvi Shah', 'Ticket Checker', 'Onboard', 10, 'Morning', '1000000011', 'tanvi.tc@rail.in', '2021-01-01', 'New Recruit'),
('Sandeep Kaur', 'Pantry Staff', 'Catering', 10, 'Morning', '1000000012', 'sandeep.pantry@rail.in', '2018-10-10', 'Pantry Assistant');

-- display table data
Select * from Staff;

-- to delete values from table 
truncate table Staff;

-- to delete table
drop table Staff;

-- 1. List all staff with train name (JOIN)
SELECT s.Name, s.Role, t.TrainName
FROM Staff s
JOIN Trains t ON s.TrainID = t.TrainID;

-- 2. Count staff per department (GROUP BY)
SELECT Department, COUNT(*) AS TotalStaff
FROM Staff
GROUP BY Department;

-- 3. List staff in morning shift (WHERE)
SELECT Name, Role FROM Staff
WHERE Shift = 'Morning';

-- 4. Staff joined after 2018 (WHERE + DATE)
SELECT Name, JoinDate FROM Staff
WHERE JoinDate > '2018-01-01';

-- 5. Window function: row number by JoinDate
SELECT Name, JoinDate,
       ROW_NUMBER() OVER (ORDER BY JoinDate) AS RowNum
FROM Staff;

-- 6. Dense rank staff by TrainID
SELECT Name, TrainID,
       DENSE_RANK() OVER (ORDER BY TrainID) AS TrainRank
FROM Staff;

-- 7. Subquery: Staff working in trains with ID < 5
SELECT Name FROM Staff
WHERE TrainID IN (SELECT TrainID FROM Trains WHERE TrainID < 5);

-- 8. Concatenate Name and Role (CONCAT)
SELECT CONCAT(Name, ' - ', Role) AS StaffInfo FROM Staff;

-- 9. Uppercase staff names (UPPER)
SELECT UPPER(Name) AS UpperName FROM Staff;

-- 10. Lowercase department names (LOWER)
SELECT LOWER(Department) AS DeptLower FROM Staff;

-- 11. Find staff tenure in years (TIMESTAMPDIFF)
SELECT Name, TIMESTAMPDIFF(YEAR, JoinDate, CURDATE()) AS TenureYears FROM Staff;

-- 12. User-defined function: calculate staff tenure
DELIMITER //
CREATE FUNCTION fn_staff_tenure(p_staff_id INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE v_tenure INT;
  SELECT TIMESTAMPDIFF(YEAR, JoinDate, CURDATE()) INTO v_tenure
  FROM Staff
  WHERE StaffID = p_staff_id;
  RETURN v_tenure;
END //
DELIMITER ;

-- 13. Usage of UDF
SELECT Name, fn_staff_tenure(StaffID) AS TenureYears FROM Staff;

-- 14. Count staff per train (GROUP BY + JOIN)
SELECT t.TrainName, COUNT(s.StaffID) AS StaffCount
FROM Staff s
JOIN Trains t ON s.TrainID = t.TrainID
GROUP BY t.TrainName;

-- 15. Staff without email (IS NULL + COALESCE)
SELECT Name, COALESCE(Email,'No Email') AS EmailInfo
FROM Staff;

-- 16. Staff with role 'Guard' and tenure > 5 years (Subquery + UDF)
SELECT Name FROM Staff
WHERE Role='Guard' AND fn_staff_tenure(StaffID) > 5;

-- 17. Staff ranked by tenure (RANK)
SELECT Name, TIMESTAMPDIFF(YEAR, JoinDate, CURDATE()) AS TenureYears,
       RANK() OVER (ORDER BY TIMESTAMPDIFF(YEAR, JoinDate, CURDATE()) DESC) AS RankByTenure
FROM Staff;

-- 18. Latest joined staff (MAX + Subquery)
SELECT Name, JoinDate FROM Staff
WHERE JoinDate = (SELECT MAX(JoinDate) FROM Staff);

-- 19. Staff count per shift (GROUP BY + ORDER BY)
SELECT Shift, COUNT(*) AS StaffPerShift
FROM Staff
GROUP BY Shift
ORDER BY StaffPerShift DESC;

-- 20. Staff details with train and department info (JOIN)
SELECT s.Name, s.Role, s.Department, t.TrainName
FROM Staff s
LEFT JOIN Trains t ON s.TrainID = t.TrainID
ORDER BY s.Department, s.Name;


-- Table 10 : Engineers
CREATE TABLE Engineers (
    EngineerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Specialization VARCHAR(50),
    Department VARCHAR(50),
    TrainID INT,
    Contact VARCHAR(15),
    Email VARCHAR(100),
    AssignedDate DATE,
    Certification VARCHAR(50),
    Remarks TEXT
);

INSERT INTO Engineers (Name, Specialization, Department, TrainID, Contact, Email, AssignedDate, Certification, Remarks)
VALUES
('Rajesh Kumar', 'Mechanical', 'Maintenance', 1, '9123456700', 'rajesh.eng@rail.in', '2020-01-15', 'Loco Expert', 'Senior'),
('Priya Gupta', 'Electrical', 'Maintenance', 1, '9123456701', 'priya.eng@rail.in', '2019-03-10', 'Electrical Cert', 'AC Coach'),
('Anil Sharma', 'Signal', 'Operations', 2, '9123456702', 'anil.eng@rail.in', '2018-05-20', 'Signal Cert', 'Track Signals'),
('Sunita Reddy', 'Mechanical', 'Maintenance', 2, '9123456703', 'sunita.eng@rail.in', '2017-07-25', 'Coach Cert', 'Coach Overhaul'),
('Deepak Singh', 'Electrical', 'Maintenance', 3, '9123456704', 'deepak.eng@rail.in', '2016-09-12', 'AC Cert', 'AC Maintenance'),
('Ravi Verma', 'Signal', 'Operations', 3, '9123456705', 'ravi.eng@rail.in', '2015-11-30', 'Signal Cert', 'Route Signals'),
('Aarti Joshi', 'Mechanical', 'Maintenance', 4, '9123456706', 'aarti.eng@rail.in', '2014-04-18', 'Coach Cert', 'LHB Coach'),
('Kunal Desai', 'Electrical', 'Maintenance', 4, '9123456707', 'kunal.eng@rail.in', '2013-02-25', 'Loco Cert', 'Train Loco'),
('Neha Singh', 'Signal', 'Operations', 5, '9123456708', 'neha.eng@rail.in', '2012-06-05', 'Signal Cert', 'Control Room'),
('Arun Kumar', 'Mechanical', 'Maintenance', 5, '9123456709', 'arun.eng@rail.in', '2011-03-14', 'Coach Cert', 'Old Coaches'),
('Pooja Yadav', 'Electrical', 'Maintenance', 6, '9123456710', 'pooja.eng@rail.in', '2020-02-20', 'AC Cert', 'AC Units'),
('Rahul Nair', 'Signal', 'Operations', 6, '9123456711', 'rahul.eng@rail.in', '2019-05-25', 'Signal Cert', 'Auto Signal'),
('Sneha Mehta', 'Mechanical', 'Maintenance', 7, '9123456712', 'sneha.eng@rail.in', '2018-07-30', 'Coach Cert', 'Coach Link'),
('Amit Jain', 'Electrical', 'Maintenance', 7, '9123456713', 'amit.eng@rail.in', '2017-09-10', 'Loco Cert', 'Traction'),
('Kiran Das', 'Signal', 'Operations', 8, '9123456714', 'kiran.eng@rail.in', '2016-11-15', 'Signal Cert', 'Yard Signal'),
('Bhavna Pillai', 'Mechanical', 'Maintenance', 8, '9123456715', 'bhavna.eng@rail.in', '2015-01-05', 'Coach Cert', 'Fitment'),
('Vikas Kapoor', 'Electrical', 'Maintenance', 9, '9123456716', 'vikas.eng@rail.in', '2014-04-21', 'Loco Cert', 'EMU'),
('Anita Rao', 'Signal', 'Operations', 9, '9123456717', 'anita.eng@rail.in', '2013-07-12', 'Signal Cert', 'Cabling'),
('Rohit Saxena', 'Mechanical', 'Maintenance', 10, '9123456718', 'rohit.eng@rail.in', '2012-09-08', 'Coach Cert', 'LHB Coach'),
('Geeta Shah', 'Electrical', 'Maintenance', 10, '9123456719', 'geeta.eng@rail.in', '2011-12-20', 'AC Cert', 'HVAC System');

-- display table data
Select * from Engineers;

-- to delete values from table 
truncate table Engineers;

-- to delete table
drop table Engineers;

-- 1. List all engineers with train name (JOIN)
SELECT e.Name, e.Specialization, t.TrainName
FROM Engineers e
JOIN Trains t ON e.TrainID = t.TrainID;

-- 2. Count engineers per department
SELECT Department, COUNT(*) AS TotalEngineers
FROM Engineers
GROUP BY Department;

-- 3. List engineers with 'Mechanical' specialization
SELECT Name, Specialization FROM Engineers
WHERE Specialization = 'Mechanical';

-- 4. Engineers assigned after 2018
SELECT Name, AssignedDate FROM Engineers
WHERE AssignedDate > '2018-01-01';

-- 5. Window function: Row number by AssignedDate
SELECT Name, AssignedDate,
       ROW_NUMBER() OVER (ORDER BY AssignedDate) AS RowNum
FROM Engineers;

-- 6. Dense rank by TrainID
SELECT Name, TrainID,
       DENSE_RANK() OVER (ORDER BY TrainID) AS TrainRank
FROM Engineers;

-- 7. Engineers assigned to trains with distance > 2000 (Subquery)
SELECT Name FROM Engineers
WHERE TrainID IN (SELECT TrainID FROM Routes WHERE TotalDistance > 2000);

-- 8. Concatenate Name and Specialization
SELECT CONCAT(Name, ' - ', Specialization) AS EngineerInfo FROM Engineers;

-- 9. Uppercase engineer names
SELECT UPPER(Name) AS UpperName FROM Engineers;

-- 10. Lowercase department names
SELECT LOWER(Department) AS DeptLower FROM Engineers;

-- 11. Calculate tenure in years (TIMESTAMPDIFF)
SELECT Name, TIMESTAMPDIFF(YEAR, AssignedDate, CURDATE()) AS TenureYears FROM Engineers;

-- 12. User-defined function to get engineer tenure
DELIMITER //
CREATE FUNCTION fn_eng_tenure(p_eng_id INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE v_tenure INT;
  SELECT TIMESTAMPDIFF(YEAR, AssignedDate, CURDATE()) INTO v_tenure
  FROM Engineers
  WHERE EngineerID = p_eng_id;
  RETURN v_tenure;
END //
DELIMITER ;

-- 13. Use UDF to get tenure
SELECT Name, fn_eng_tenure(EngineerID) AS TenureYears FROM Engineers;

-- 14. Count engineers per train
SELECT t.TrainName, COUNT(e.EngineerID) AS EngineerCount
FROM Engineers e
JOIN Trains t ON e.TrainID = t.TrainID
GROUP BY t.TrainName;

-- 15. Engineers without email (IS NULL + COALESCE)
SELECT Name, COALESCE(Email,'No Email') AS EmailInfo
FROM Engineers;

-- 16. Engineers with tenure > 5 years (using UDF)
SELECT Name FROM Engineers
WHERE fn_eng_tenure(EngineerID) > 5;

-- 17. Rank engineers by tenure
SELECT Name, TIMESTAMPDIFF(YEAR, AssignedDate, CURDATE()) AS TenureYears,
       RANK() OVER (ORDER BY TIMESTAMPDIFF(YEAR, AssignedDate, CURDATE()) DESC) AS RankByTenure
FROM Engineers;

-- 18. Latest assigned engineer
SELECT Name, AssignedDate FROM Engineers
WHERE AssignedDate = (SELECT MAX(AssignedDate) FROM Engineers);

-- 19. Engineers per specialization
SELECT Specialization, COUNT(*) AS CountPerSpecialization
FROM Engineers
GROUP BY Specialization
ORDER BY CountPerSpecialization DESC;

-- 20. Engineer details with train and department info
SELECT e.Name, e.Specialization, e.Department, t.TrainName
FROM Engineers e
LEFT JOIN Trains t ON e.TrainID = t.TrainID
ORDER BY e.Department, e.Name;


-- Table 11: TrainSchedules
CREATE TABLE TrainSchedules (
    ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
    TrainID INT,
    RouteID INT,
    DepartureDate DATE,
    DepartureTime TIME,
    ArrivalDate DATE,
    ArrivalTime TIME,
    PlatformNumber VARCHAR(5),
    Status VARCHAR(20),
    Remarks TEXT
);

INSERT INTO TrainSchedules (TrainID, RouteID, DepartureDate, DepartureTime, ArrivalDate, ArrivalTime, PlatformNumber, Status, Remarks)
VALUES
(1, 1, '2025-07-20', '16:00:00', '2025-07-21', '08:35:00', '1', 'On Time', 'Rajdhani'),
(2, 2, '2025-07-21', '16:55:00', '2025-07-22', '10:15:00', '2', 'On Time', 'Howrah Rajdhani'),
(3, 3, '2025-07-22', '06:00:00', '2025-07-22', '12:00:00', '3', 'On Time', 'Shatabdi'),
(4, 4, '2025-07-23', '20:30:00', '2025-07-25', '05:40:00', '4', 'On Time', 'Karnataka Exp'),
(5, 5, '2025-07-24', '06:00:00', '2025-07-25', '07:15:00', '5', 'On Time', 'Telangana Exp'),
(6, 6, '2025-07-25', '17:40:00', '2025-07-26', '10:10:00', '6', 'On Time', 'August Kranti'),
(7, 7, '2025-07-26', '09:00:00', '2025-07-27', '21:20:00', '7', 'On Time', 'Sanghamitra'),
(8, 8, '2025-07-27', '19:15:00', '2025-07-28', '05:45:00', '8', 'On Time', 'GT Express'),
(9, 9, '2025-07-28', '06:35:00', '2025-07-30', '04:55:00', '9', 'On Time', 'Rapti Sagar'),
(10, 10, '2025-07-29', '18:30:00', '2025-07-30', '10:20:00', '10', 'On Time', 'Duronto'),
(11, 11, '2025-07-30', '19:50:00', '2025-07-31', '06:10:00', '11', 'On Time', 'NDL-LKO Rajdhani'),
(12, 12, '2025-07-31', '06:00:00', '2025-08-01', '11:25:00', '12', 'On Time', 'Gitanjali'),
(13, 13, '2025-08-01', '21:45:00', '2025-08-02', '22:00:00', '13', 'On Time', 'Purushottam'),
(14, 14, '2025-08-02', '06:00:00', '2025-08-02', '12:30:00', '14', 'On Time', 'Shatabdi'),
(15, 15, '2025-08-03', '22:00:00', '2025-08-04', '07:30:00', '15', 'On Time', 'Tamil Nadu Exp'),
(16, 16, '2025-08-04', '21:25:00', '2025-08-05', '23:35:00', '16', 'On Time', 'Golden Temple'),
(17, 17, '2025-08-05', '07:55:00', '2025-08-06', '16:30:00', '17', 'On Time', 'Haridwar AC'),
(18, 18, '2025-08-06', '20:35:00', '2025-08-07', '17:00:00', '18', 'On Time', 'Swarna Jayanti'),
(19, 19, '2025-08-07', '12:20:00', '2025-08-08', '13:20:00', '19', 'On Time', 'Kerala Express'),
(20, 20, '2025-08-08', '16:35:00', '2025-08-09', '09:45:00', '20', 'On Time', 'Garib Rath');

-- display table data
Select * from TrainSchedules;

-- to delete values from table 
truncate table TrainSchedules;

-- to delete table
drop table TrainSchedules;

-- 1. Join with Trains to get TrainName
SELECT ts.ScheduleID, t.TrainName, ts.DepartureDate, ts.ArrivalDate
FROM TrainSchedules ts
JOIN Trains t ON ts.TrainID = t.TrainID;

-- 2. Join with Routes to get source and destination
SELECT ts.ScheduleID, r.SourceStation, r.DestinationStation, ts.DepartureDate
FROM TrainSchedules ts
JOIN Routes r ON ts.RouteID = r.RouteID;

-- 3. Count schedules per train
SELECT TrainID, COUNT(*) AS TotalSchedules
FROM TrainSchedules
GROUP BY TrainID;

-- 4. Schedules on a specific date
SELECT * FROM TrainSchedules
WHERE DepartureDate = '2025-07-25';

-- 5. Window function: Row number by DepartureDate
SELECT ScheduleID, TrainID, DepartureDate,
       ROW_NUMBER() OVER (ORDER BY DepartureDate) AS RowNum
FROM TrainSchedules;

-- 6. Window function: Rank by PlatformNumber
SELECT ScheduleID, PlatformNumber,
       RANK() OVER (ORDER BY PlatformNumber ASC) AS PlatformRank
FROM TrainSchedules;

-- 7. Schedules for trains covering distance > 1500 km (subquery with Routes)
SELECT * FROM TrainSchedules
WHERE RouteID IN (SELECT RouteID FROM Routes WHERE TotalDistance > 1500);

-- 8. Next schedule after a given date
SELECT * FROM TrainSchedules
WHERE DepartureDate = (SELECT MIN(DepartureDate) 
                       FROM TrainSchedules 
                       WHERE DepartureDate > '2025-07-25');

-- 9. Concatenate TrainID and PlatformNumber
SELECT CONCAT('Train-', TrainID, ' Platform-', PlatformNumber) AS TrainPlatform
FROM TrainSchedules;

-- 10. Format DepartureDate
SELECT DATE_FORMAT(DepartureDate,'%d-%b-%Y') AS FormattedDeparture FROM TrainSchedules;

-- 11. Calculate travel duration in minutes
SELECT ScheduleID, TIMESTAMPDIFF(MINUTE, 
       CONCAT(DepartureDate,' ',DepartureTime), 
       CONCAT(ArrivalDate,' ',ArrivalTime)) AS TravelMinutes
FROM TrainSchedules;

-- 12. Schedules currently 'On Time'
SELECT * FROM TrainSchedules WHERE Status = 'On Time';

-- 13. User-defined function: Get schedule duration in hours
DELIMITER //
CREATE FUNCTION fn_schedule_duration(p_schedule_id INT) RETURNS DECIMAL(5,2) DETERMINISTIC
BEGIN
  DECLARE v_hours DECIMAL(5,2);
  SELECT TIMESTAMPDIFF(MINUTE, CONCAT(DepartureDate,' ',DepartureTime), CONCAT(ArrivalDate,' ',ArrivalTime))/60
  INTO v_hours
  FROM TrainSchedules
  WHERE ScheduleID = p_schedule_id;
  RETURN v_hours;
END //
DELIMITER ;

-- 14. Use UDF to get duration
SELECT ScheduleID, fn_schedule_duration(ScheduleID) AS DurationHours FROM TrainSchedules;

-- 15. Latest departure schedule
SELECT * FROM TrainSchedules
WHERE DepartureDate = (SELECT MAX(DepartureDate) FROM TrainSchedules);

-- 16. Earliest arrival schedule
SELECT * FROM TrainSchedules
WHERE ArrivalDate = (SELECT MIN(ArrivalDate) FROM TrainSchedules);

-- 17. Count schedules per route
SELECT RouteID, COUNT(*) AS ScheduleCount
FROM TrainSchedules
GROUP BY RouteID;

-- 18. Window function: Dense rank by departure time
SELECT ScheduleID, DepartureTime,
       DENSE_RANK() OVER (ORDER BY DepartureTime ASC) AS DepartureRank
FROM TrainSchedules;

-- 19. Schedules for a specific train and platform
SELECT * FROM TrainSchedules
WHERE TrainID = 1 AND PlatformNumber = '1';

-- 20. Full info join: Trains + Routes + Schedules
SELECT ts.ScheduleID, t.TrainName, r.SourceStation, r.DestinationStation,
       ts.DepartureDate, ts.ArrivalDate, ts.PlatformNumber, ts.Status
FROM TrainSchedules ts
JOIN Trains t ON ts.TrainID = t.TrainID
JOIN Routes r ON ts.RouteID = r.RouteID
ORDER BY ts.DepartureDate, ts.DepartureTime;


-- Table 12: Catering
CREATE TABLE Catering (
    CateringID INT PRIMARY KEY AUTO_INCREMENT,
    TrainID INT,
    VendorID INT,
    StaffID INT,
    MealType VARCHAR(20),
    Menu VARCHAR(100),
    Quantity INT,
    ServiceTime TIME,
    Status VARCHAR(20),
    Remarks TEXT
);

INSERT INTO Catering (TrainID, VendorID, StaffID, MealType, Menu, Quantity, ServiceTime, Status, Remarks)
VALUES
(1, 1, 1, 'Breakfast', 'Idli, Dosa, Coffee', 100, '07:00:00', 'Served', 'South Special'),
(2, 2, 2, 'Lunch', 'Veg Thali, Roti, Rice', 150, '13:00:00', 'Served', 'North Thali'),
(3, 3, 3, 'Dinner', 'Chicken Curry, Rice, Dal', 200, '20:00:00', 'Served', 'Non-Veg Meal'),
(4, 4, 4, 'Snacks', 'Samosa, Tea', 250, '17:00:00', 'Served', 'Evening Snacks'),
(5, 5, 5, 'Breakfast', 'Puri Bhaji, Chai', 120, '07:30:00', 'Served', 'North Indian'),
(6, 6, 6, 'Lunch', 'Paneer, Roti, Rice', 180, '12:30:00', 'Served', 'Veg Meal'),
(7, 7, 7, 'Dinner', 'Dal Makhani, Roti', 190, '20:30:00', 'Served', 'Veg Dinner'),
(8, 8, 8, 'Snacks', 'Pakora, Tea', 200, '17:30:00', 'Served', 'Tea Snacks'),
(9, 9, 9, 'Breakfast', 'Upma, Chutney, Coffee', 130, '06:45:00', 'Served', 'South Combo'),
(10, 10, 10, 'Lunch', 'Fish Curry, Rice', 170, '13:15:00', 'Served', 'Coastal Meal'),
(11, 11, 11, 'Dinner', 'Egg Curry, Rice', 160, '21:00:00', 'Served', 'Non-Veg'),
(12, 12, 12, 'Snacks', 'Vada Pav, Chai', 220, '17:45:00', 'Served', 'Mumbai Style'),
(13, 13, 13, 'Breakfast', 'Paratha, Dahi', 140, '07:10:00', 'Served', 'Punjabi'),
(14, 14, 14, 'Lunch', 'Rajma, Rice', 160, '12:45:00', 'Served', 'Punjabi'),
(15, 15, 15, 'Dinner', 'Veg Biryani', 180, '20:15:00', 'Served', 'Special Biryani'),
(16, 16, 16, 'Snacks', 'Momos, Soup', 210, '18:00:00', 'Served', 'Indo-Chinese'),
(17, 17, 17, 'Breakfast', 'Poha, Jalebi', 120, '07:20:00', 'Served', 'MP Style'),
(18, 18, 18, 'Lunch', 'Kadhi, Rice', 170, '12:50:00', 'Served', 'Gujarati Meal'),
(19, 19, 19, 'Dinner', 'Roti, Sabji', 190, '20:40:00', 'Served', 'Regular'),
(20, 20, 20, 'Snacks', 'Sandwich, Tea', 230, '17:10:00', 'Served', 'Quick Bite');

-- display table data
Select * from Catering;

-- to delete values from table 
truncate table Catering;

-- to delete table
drop table Catering;

-- 1. Join with Trains to get TrainName
SELECT c.CateringID, t.TrainName, c.MealType, c.Menu
FROM Catering c
JOIN Trains t ON c.TrainID = t.TrainID;

-- 2. Join with Staff to get Staff Name handling catering
SELECT c.CateringID, s.Name AS StaffName, c.MealType, c.Status
FROM Catering c
JOIN Staff s ON c.StaffID = s.StaffID;

-- 3. Count meals per Train
SELECT TrainID, COUNT(*) AS TotalMeals
FROM Catering
GROUP BY TrainID;

-- 4. Catering served for Breakfast only
SELECT * FROM Catering
WHERE MealType = 'Breakfast';

-- 5. Window function: Row number by ServiceTime
SELECT CateringID, TrainID, ServiceTime,
       ROW_NUMBER() OVER (ORDER BY ServiceTime) AS RowNum
FROM Catering;

-- 6. Window function: Rank by Quantity
SELECT CateringID, Quantity,
       RANK() OVER (ORDER BY Quantity DESC) AS QuantityRank
FROM Catering;

-- 7. Subquery: Catering for trains covering > 1500 km
SELECT * FROM Catering
WHERE TrainID IN (SELECT TrainID FROM Routes WHERE TotalDistance > 1500);

-- 8. Next catering service after 12:00:00
SELECT * FROM Catering
WHERE ServiceTime = (SELECT MIN(ServiceTime) FROM Catering WHERE ServiceTime > '12:00:00');

-- 9. Concatenate TrainID and MealType
SELECT CONCAT('Train-', TrainID, ' ', MealType) AS TrainMeal
FROM Catering;

-- 10. Format ServiceTime
SELECT CateringID, DATE_FORMAT(ServiceTime,'%h:%i %p') AS FormattedTime
FROM Catering;

-- 11. Total quantity served per MealType
SELECT MealType, SUM(Quantity) AS TotalQuantity
FROM Catering
GROUP BY MealType;

-- 12. Catering status 'Served'
SELECT * FROM Catering
WHERE Status = 'Served';

-- 13. User-defined function: Calculate remaining quantity
DELIMITER //
CREATE FUNCTION fn_remaining_quantity(p_catering_id INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE rem_qty INT;
  SELECT Quantity INTO rem_qty FROM Catering WHERE CateringID = p_catering_id;
  RETURN rem_qty; -- assuming all Quantity initially available
END //
DELIMITER ;

-- 14. Use UDF to get remaining quantity
SELECT CateringID, fn_remaining_quantity(CateringID) AS RemainingQty FROM Catering;

-- 15. Latest catering service
SELECT * FROM Catering
WHERE ServiceTime = (SELECT MAX(ServiceTime) FROM Catering);

-- 16. Earliest catering service
SELECT * FROM Catering
WHERE ServiceTime = (SELECT MIN(ServiceTime) FROM Catering);

-- 17. Count of catering per VendorID
SELECT VendorID, COUNT(*) AS TotalServices
FROM Catering
GROUP BY VendorID;

-- 18. Window function: Dense rank by Quantity
SELECT CateringID, Quantity,
       DENSE_RANK() OVER (ORDER BY Quantity DESC) AS DenseQtyRank
FROM Catering;

-- 19. Catering for specific Train and MealType
SELECT * FROM Catering
WHERE TrainID = 1 AND MealType = 'Breakfast';

-- 20. Full info join: Catering + Trains + Staff
SELECT c.CateringID, t.TrainName, s.Name AS StaffName, c.MealType, c.Menu, c.Quantity, c.ServiceTime, c.Status
FROM Catering c
JOIN Trains t ON c.TrainID = t.TrainID
JOIN Staff s ON c.StaffID = s.StaffID
ORDER BY c.ServiceTime;


-- Table 13: Vendors
CREATE TABLE Vendors (
    VendorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Contact VARCHAR(15),
    Email VARCHAR(100),
    ServiceType VARCHAR(50),
    LicenseNo VARCHAR(50),
    Address VARCHAR(200),
    ContractStart DATE,
    ContractEnd DATE,
    Remarks TEXT
);

INSERT INTO Vendors (Name, Contact, Email, ServiceType, LicenseNo, Address, ContractStart, ContractEnd, Remarks)
VALUES
('Food Corp', '9876543210', 'contact@foodcorp.in', 'Catering', 'LIC123', 'Delhi', '2024-01-01', '2026-12-31', 'Main Caterer'),
('Fresh Meals', '8765432101', 'info@freshmeals.in', 'Catering', 'LIC124', 'Mumbai', '2024-01-01', '2026-12-31', 'Veg Special'),
('Healthy Bites', '7654321012', 'hello@healthybites.in', 'Catering', 'LIC125', 'Bengaluru', '2024-01-01', '2026-12-31', 'Snacks'),
('Spice Route', '6543210123', 'sales@spiceroute.in', 'Catering', 'LIC126', 'Chennai', '2024-01-01', '2026-12-31', 'South Meals'),
('Taste On Track', '5432101234', 'support@tasteontrack.in', 'Catering', 'LIC127', 'Hyderabad', '2024-01-01', '2026-12-31', 'Special Meals'),
('Rail Kitchen', '4321012345', 'service@railkitchen.in', 'Catering', 'LIC128', 'Kolkata', '2024-01-01', '2026-12-31', 'Combo Meals'),
('Quick Serve', '3210123456', 'order@quickserve.in', 'Catering', 'LIC129', 'Pune', '2024-01-01', '2026-12-31', 'Snacks'),
('Yummy Rails', '2101234567', 'book@yummyrails.in', 'Catering', 'LIC130', 'Ahmedabad', '2024-01-01', '2026-12-31', 'Specialty'),
('Food Express', '1098765432', 'partner@foodexpress.in', 'Catering', 'LIC131', 'Bhopal', '2024-01-01', '2026-12-31', 'Meals'),
('Eat Well', '9087654321', 'hello@eatwell.in', 'Catering', 'LIC132', 'Lucknow', '2024-01-01', '2026-12-31', 'Healthy'),
('Foodie Hub', '8076543210', 'contact@foodiehub.in', 'Catering', 'LIC133', 'Kanpur', '2024-01-01', '2026-12-31', 'Regional'),
('Delish Foods', '7065432109', 'info@delishfoods.in', 'Catering', 'LIC134', 'Jaipur', '2024-01-01', '2026-12-31', 'Regional'),
('Tasty Trails', '6054321098', 'sales@tastytrails.in', 'Catering', 'LIC135', 'Indore', '2024-01-01', '2026-12-31', 'Combo'),
('Flavor Line', '5043210987', 'support@flavorline.in', 'Catering', 'LIC136', 'Patna', '2024-01-01', '2026-12-31', 'Snacks'),
('Fresh Plate', '4032109876', 'order@freshplate.in', 'Catering', 'LIC137', 'Ranchi', '2024-01-01', '2026-12-31', 'Special Meals'),
('Meal Makers', '3021098765', 'book@mealmakers.in', 'Catering', 'LIC138', 'Guwahati', '2024-01-01', '2026-12-31', 'Regional'),
('Spice Chef', '2010987654', 'partner@spicechef.in', 'Catering', 'LIC139', 'Jodhpur', '2024-01-01', '2026-12-31', 'Special Meals'),
('Rail Feast', '1009876543', 'hello@railfeast.in', 'Catering', 'LIC140', 'Vijayawada', '2024-01-01', '2026-12-31', 'Regional'),
('Chef On Rail', '9998765432', 'info@chefonrail.in', 'Catering', 'LIC141', 'Coimbatore', '2024-01-01', '2026-12-31', 'Healthy'),
('Rail Dine', '8887654321', 'service@raildine.in', 'Catering', 'LIC142', 'Amritsar', '2024-01-01', '2026-12-31', 'Combo');

-- display table data
Select * from Vendors;

-- to delete values from table 
truncate table Vendors;

-- to delete table
drop table Vendors;

-- 1. List all vendors
SELECT * FROM Vendors;

-- 2. Vendors whose contract ends after 2025-12-31
SELECT * FROM Vendors
WHERE ContractEnd > '2025-12-31';

-- 3. Count of vendors per ServiceType
SELECT ServiceType, COUNT(*) AS VendorCount
FROM Vendors
GROUP BY ServiceType;

-- 4. Vendors with contract period > 2 years
SELECT *, DATEDIFF(ContractEnd, ContractStart) AS ContractDays
FROM Vendors
WHERE DATEDIFF(ContractEnd, ContractStart) > 730;

-- 5. Join Vendors with Catering table to see meals served
SELECT v.Name AS VendorName, c.MealType, c.Menu, c.Status
FROM Vendors v
JOIN Catering c ON v.VendorID = c.VendorID;

-- 6. Vendors located in Mumbai or Delhi
SELECT * FROM Vendors
WHERE Address IN ('Mumbai', 'Delhi');

-- 7. Subquery: Vendors serving more than 180 meals in a single service
SELECT * FROM Vendors
WHERE VendorID IN (
    SELECT VendorID FROM Catering
    WHERE Quantity > 180
);

-- 8. Find earliest contract start date
SELECT * FROM Vendors
WHERE ContractStart = (SELECT MIN(ContractStart) FROM Vendors);

-- 9. Concatenate Name and ServiceType
SELECT CONCAT(Name, ' (', ServiceType, ')') AS VendorInfo FROM Vendors;

-- 10. Format contract dates
SELECT Name, DATE_FORMAT(ContractStart,'%d-%m-%Y') AS StartDate,
       DATE_FORMAT(ContractEnd,'%d-%m-%Y') AS EndDate
FROM Vendors;

-- 11. Window function: Rank vendors by contract length
SELECT VendorID, Name, DATEDIFF(ContractEnd, ContractStart) AS ContractDays,
       RANK() OVER (ORDER BY DATEDIFF(ContractEnd, ContractStart) DESC) AS ContractRank
FROM Vendors;

-- 12. Dense rank vendors by VendorID
SELECT VendorID, Name,
       DENSE_RANK() OVER (ORDER BY VendorID ASC) AS DenseRank
FROM Vendors;

-- 13. Count of vendors per first letter of name
SELECT LEFT(Name,1) AS Initial, COUNT(*) AS Count
FROM Vendors
GROUP BY LEFT(Name,1);

-- 14. Subquery: Vendors not yet associated with any Catering service
SELECT * FROM Vendors
WHERE VendorID NOT IN (SELECT DISTINCT VendorID FROM Catering);

-- 15. Latest contract end date
SELECT * FROM Vendors
WHERE ContractEnd = (SELECT MAX(ContractEnd) FROM Vendors);

-- 16. User-defined function: Calculate remaining contract days
DELIMITER //
CREATE FUNCTION fn_remaining_days(p_vendor_id INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE rem_days INT;
  SELECT DATEDIFF(ContractEnd, CURDATE()) INTO rem_days
  FROM Vendors
  WHERE VendorID = p_vendor_id;
  RETURN rem_days;
END //
DELIMITER ;

-- 17. Use UDF to get remaining days for each vendor
SELECT VendorID, Name, fn_remaining_days(VendorID) AS RemainingDays
FROM Vendors;

-- 18. Vendors with email domain 'in'
SELECT * FROM Vendors
WHERE Email LIKE '%.in';

-- 19. Vendors whose name contains 'Food'
SELECT * FROM Vendors
WHERE Name LIKE '%Food%';

-- 20. Full join info with Catering table including meal quantity
SELECT v.VendorID, v.Name AS VendorName, c.MealType, c.Quantity, c.Status
FROM Vendors v
LEFT JOIN Catering c ON v.VendorID = c.VendorID
ORDER BY v.Name, c.ServiceTime;


-- Table 14: MaintenanceLogs
CREATE TABLE MaintenanceLogs (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    TrainID INT,
    EngineerID INT,
    Date DATE,
    Time TIME,
    IssueReported VARCHAR(100),
    ActionTaken VARCHAR(100),
    Status VARCHAR(20),
    NextDue DATE,
    Remarks TEXT
);

INSERT INTO MaintenanceLogs (TrainID, EngineerID, Date, Time, IssueReported, ActionTaken, Status, NextDue, Remarks) 
VALUES
(1, 1, '2025-07-01', '09:00:00', 'Brake check', 'Brake pads replaced', 'Completed', '2025-08-01', 'Monthly check'),
(2, 2, '2025-07-02', '10:00:00', 'AC gas low', 'Gas refilled', 'Completed', '2025-08-02', 'Routine AC service'),
(3, 3, '2025-07-03', '11:00:00', 'Signal glitch', 'Signal circuit fixed', 'Completed', '2025-08-03', 'Signal maintenance'),
(4, 4, '2025-07-04', '12:00:00', 'Wheel misalignment', 'Alignment adjusted', 'Completed', '2025-08-04', 'Underframe check'),
(5, 5, '2025-07-05', '13:00:00', 'Coach AC filter', 'Filter cleaned', 'Completed', '2025-08-05', 'Monthly HVAC'),
(6, 6, '2025-07-06', '14:00:00', 'Door latch broken', 'Latch replaced', 'Completed', '2025-08-06', 'Coach safety'),
(7, 7, '2025-07-07', '15:00:00', 'Fan not working', 'Fan motor replaced', 'Completed', '2025-08-07', 'Coach electrics'),
(8, 8, '2025-07-08', '16:00:00', 'Window cracked', 'Glass changed', 'Completed', '2025-08-08', 'Coach interiors'),
(9, 9, '2025-07-09', '17:00:00', 'Engine noise', 'Engine serviced', 'Completed', '2025-08-09', 'Loco checkup'),
(10, 10, '2025-07-10', '18:00:00', 'Brake rod issue', 'Rod replaced', 'Completed', '2025-08-10', 'Brake check'),
(1, 11, '2025-07-11', '09:30:00', 'Seat loose', 'Seat fixed', 'Completed', '2025-08-11', 'Coach comfort'),
(2, 12, '2025-07-12', '10:30:00', 'AC vent blocked', 'Vent cleaned', 'Completed', '2025-08-12', 'HVAC'),
(3, 13, '2025-07-13', '11:30:00', 'Signal light out', 'Bulb replaced', 'Completed', '2025-08-13', 'Signal safety'),
(4, 14, '2025-07-14', '12:30:00', 'Toilet flush leak', 'Valve replaced', 'Completed', '2025-08-14', 'Sanitation'),
(5, 15, '2025-07-15', '13:30:00', 'Luggage rack loose', 'Rack fixed', 'Completed', '2025-08-15', 'Coach fitments'),
(6, 16, '2025-07-16', '14:30:00', 'Fan switch faulty', 'Switch replaced', 'Completed', '2025-08-16', 'Electricals'),
(7, 17, '2025-07-17', '15:30:00', 'Brake shoe worn', 'Brake shoe changed', 'Completed', '2025-08-17', 'Brake maintenance'),
(8, 18, '2025-07-18', '16:30:00', 'Pantry pipe leak', 'Pipe fixed', 'Completed', '2025-08-18', 'Pantry check'),
(9, 19, '2025-07-19', '17:30:00', 'Signal relay issue', 'Relay replaced', 'Completed', '2025-08-19', 'Signal check'),
(10, 20, '2025-07-20', '18:30:00', 'Coach repaint', 'Paint touch-up done', 'Completed', '2025-08-20', 'Coach bodywork');

-- display table data
Select * from MaintenanceLogs;

-- to delete values from table 
truncate table MaintenanceLogs;

-- to delete table
drop table MaintenanceLogs;

-- 1. List all maintenance logs
SELECT * FROM MaintenanceLogs;

-- 2. Maintenance logs for TrainID = 1
SELECT * FROM MaintenanceLogs
WHERE TrainID = 1;

-- 3. Count of logs per Train
SELECT TrainID, COUNT(*) AS LogCount
FROM MaintenanceLogs
GROUP BY TrainID;

-- 4. Completed maintenance logs
SELECT * FROM MaintenanceLogs
WHERE Status = 'Completed';

-- 5. Join with Engineers to see engineer name
SELECT m.LogID, m.TrainID, e.Name AS EngineerName, m.IssueReported, m.ActionTaken
FROM MaintenanceLogs m
JOIN Engineers e ON m.EngineerID = e.EngineerID;

-- 6. Maintenance logs in July 2025
SELECT * FROM MaintenanceLogs
WHERE MONTH(Date) = 7 AND YEAR(Date) = 2025;

-- 7. Subquery: Logs for trains with more than 2 maintenance actions
SELECT * FROM MaintenanceLogs
WHERE TrainID IN (
    SELECT TrainID
    FROM MaintenanceLogs
    GROUP BY TrainID
    HAVING COUNT(*) > 2
);

-- 8. Next due maintenance in ascending order
SELECT * FROM MaintenanceLogs
ORDER BY NextDue ASC;

-- 9. Concatenate IssueReported and ActionTaken
SELECT CONCAT(IssueReported, ' => ', ActionTaken) AS MaintenanceSummary
FROM MaintenanceLogs;

-- 10. Date and time formatting
SELECT LogID, DATE_FORMAT(Date,'%d-%m-%Y') AS LogDate, TIME_FORMAT(Time,'%h:%i %p') AS LogTime
FROM MaintenanceLogs;

-- 11. Window function: Rank logs by TrainID
SELECT LogID, TrainID, IssueReported,
       RANK() OVER (PARTITION BY TrainID ORDER BY Date ASC) AS LogRank
FROM MaintenanceLogs;

-- 12. Dense rank engineers by number of logs
SELECT EngineerID, COUNT(*) AS LogCount,
       DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS EngineerRank
FROM MaintenanceLogs
GROUP BY EngineerID;

-- 13. Logs with 'Brake' in issue
SELECT * FROM MaintenanceLogs
WHERE IssueReported LIKE '%Brake%';

-- 14. Subquery: Engineers who have handled more than 3 logs
SELECT * FROM Engineers
WHERE EngineerID IN (
    SELECT EngineerID
    FROM MaintenanceLogs
    GROUP BY EngineerID
    HAVING COUNT(*) > 3
);

-- 15. Latest maintenance log date
SELECT * FROM MaintenanceLogs
WHERE Date = (SELECT MAX(Date) FROM MaintenanceLogs);

-- 16. User-defined function: Calculate days until next maintenance
DELIMITER //
CREATE FUNCTION fn_days_until_next(p_log_id INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE rem_days INT;
  SELECT DATEDIFF(NextDue, CURDATE()) INTO rem_days
  FROM MaintenanceLogs
  WHERE LogID = p_log_id;
  RETURN rem_days;
END //
DELIMITER ;

-- 17. Use UDF to get remaining days for each maintenance log
SELECT LogID, TrainID, fn_days_until_next(LogID) AS DaysUntilNext
FROM MaintenanceLogs;

-- 18. Count of logs per Status
SELECT Status, COUNT(*) AS CountLogs
FROM MaintenanceLogs
GROUP BY Status;

-- 19. Engineers with maintenance in the last 10 days
SELECT * FROM MaintenanceLogs
WHERE Date >= CURDATE() - INTERVAL 10 DAY;

-- 20. Full join with Trains to see TrainName and maintenance details
SELECT m.LogID, t.TrainName, m.IssueReported, m.ActionTaken, m.Status
FROM MaintenanceLogs m
LEFT JOIN Trains t ON m.TrainID = t.TrainID
ORDER BY m.Date, t.TrainName;


-- Table 15 : Complaints
CREATE TABLE Complaints (
    ComplaintID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerID INT,
    TrainID INT,
    CoachID INT,
    Date DATE,
    Time TIME,
    Type VARCHAR(50),
    Description VARCHAR(255),
    Status VARCHAR(20),
    Remarks TEXT
);

INSERT INTO Complaints (PassengerID, TrainID, CoachID, Date, Time, Type, Description, Status, Remarks) 
VALUES
(1, 1, 1, '2025-07-01', '09:00:00', 'Cleanliness', 'Dirty coach floor', 'Resolved', 'Immediate cleaning done'),
(2, 2, 2, '2025-07-02', '10:00:00', 'Food', 'Stale meal served', 'Resolved', 'Vendor warned'),
(3, 3, 3, '2025-07-03', '11:00:00', 'Security', 'Unattended luggage', 'Resolved', 'RPF informed'),
(4, 4, 4, '2025-07-04', '12:00:00', 'Service', 'Attendant rude', 'Resolved', 'Staff counseled'),
(5, 5, 5, '2025-07-05', '13:00:00', 'Cleanliness', 'Toilet dirty', 'Resolved', 'Cleaner assigned'),
(6, 6, 6, '2025-07-06', '14:00:00', 'Food', 'Cold food', 'Resolved', 'Fresh meal provided'),
(7, 7, 7, '2025-07-07', '15:00:00', 'Security', 'Pickpocket', 'Resolved', 'RPF alerted'),
(8, 8, 8, '2025-07-08', '16:00:00', 'Service', 'Late service', 'Resolved', 'Staff warned'),
(9, 9, 9, '2025-07-09', '17:00:00', 'Cleanliness', 'Seat unclean', 'Resolved', 'Seat cleaned'),
(10, 10, 10, '2025-07-10', '18:00:00', 'Food', 'Wrong order', 'Resolved', 'Corrected'),
(11, 1, 1, '2025-07-11', '09:30:00', 'Security', 'Lost luggage', 'Resolved', 'Located'),
(12, 2, 2, '2025-07-12', '10:30:00', 'Service', 'Delay in bedding', 'Resolved', 'Provided'),
(13, 3, 3, '2025-07-13', '11:30:00', 'Cleanliness', 'Dusty berth', 'Resolved', 'Cleaned'),
(14, 4, 4, '2025-07-14', '12:30:00', 'Food', 'No vegetarian meal', 'Resolved', 'Served'),
(15, 5, 5, '2025-07-15', '13:30:00', 'Security', 'Fighting passengers', 'Resolved', 'RPF intervened'),
(16, 6, 6, '2025-07-16', '14:30:00', 'Service', 'AC not working', 'Resolved', 'Fixed'),
(17, 7, 7, '2025-07-17', '15:30:00', 'Cleanliness', 'Pantry dirty', 'Resolved', 'Cleaned'),
(18, 8, 8, '2025-07-18', '16:30:00', 'Food', 'Food late', 'Resolved', 'Served'),
(19, 9, 9, '2025-07-19', '17:30:00', 'Security', 'Unauthorized person', 'Resolved', 'RPF alerted'),
(20, 10, 10, '2025-07-20', '18:30:00', 'Service', 'Unhelpful staff', 'Resolved', 'Counseled');

-- display table data
Select * from Complaints;

-- to delete values from table 
truncate table Complaints;

-- to delete table
drop table Complaints;

-- 1. List all complaints
SELECT * FROM Complaints;

-- 2. Complaints for TrainID = 1
SELECT * FROM Complaints
WHERE TrainID = 1;

-- 3. Count complaints per type
SELECT Type, COUNT(*) AS CountComplaints
FROM Complaints
GROUP BY Type;

-- 4. Complaints resolved
SELECT * FROM Complaints
WHERE Status = 'Resolved';

-- 5. Join with Coaches to see coach number
SELECT c.ComplaintID, c.TrainID, co.CoachNumber, c.Type, c.Description, c.Status
FROM Complaints c
JOIN Coaches co ON c.CoachID = co.CoachID;

-- 6. Complaints in July 2025
SELECT * FROM Complaints
WHERE MONTH(Date) = 7 AND YEAR(Date) = 2025;

-- 7. Subquery: Complaints for trains with more than 2 complaints
SELECT * FROM Complaints
WHERE TrainID IN (
    SELECT TrainID
    FROM Complaints
    GROUP BY TrainID
    HAVING COUNT(*) > 2
);

-- 8. Latest complaints first
SELECT * FROM Complaints
ORDER BY Date DESC, Time DESC;

-- 9. Concatenate Type and Description
SELECT CONCAT(Type, ': ', Description) AS ComplaintSummary
FROM Complaints;

-- 10. Format date and time
SELECT ComplaintID, DATE_FORMAT(Date,'%d-%m-%Y') AS ComplaintDate, TIME_FORMAT(Time,'%h:%i %p') AS ComplaintTime
FROM Complaints;

-- 11. Window function: Rank complaints by TrainID
SELECT ComplaintID, TrainID, Type,
       RANK() OVER (PARTITION BY TrainID ORDER BY Date ASC) AS ComplaintRank
FROM Complaints;

-- 12. Dense rank complaints by Type count
SELECT Type, COUNT(*) AS CountType,
       DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS TypeRank
FROM Complaints
GROUP BY Type;

-- 13. Complaints with 'Food' in description
SELECT * FROM Complaints
WHERE Description LIKE '%Food%';

-- 14. Subquery: Trains with more than 3 complaints
SELECT * FROM Trains
WHERE TrainID IN (
    SELECT TrainID
    FROM Complaints
    GROUP BY TrainID
    HAVING COUNT(*) > 3
);

-- 15. Most recent complaint
SELECT * FROM Complaints
WHERE Date = (SELECT MAX(Date) FROM Complaints);

-- 16. User-defined function: Days since complaint
DELIMITER //
CREATE FUNCTION fn_days_since_complaint(p_complaint_id INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE days_diff INT;
  SELECT DATEDIFF(CURDATE(), Date) INTO days_diff
  FROM Complaints
  WHERE ComplaintID = p_complaint_id;
  RETURN days_diff;
END //
DELIMITER ;

-- 17. Use UDF to get days since each complaint
SELECT ComplaintID, TrainID, fn_days_since_complaint(ComplaintID) AS DaysSinceComplaint
FROM Complaints;

-- 18. Count of complaints per status
SELECT Status, COUNT(*) AS CountStatus
FROM Complaints
GROUP BY Status;

-- 19. Complaints in last 10 days
SELECT * FROM Complaints
WHERE Date >= CURDATE() - INTERVAL 10 DAY;

-- 20. Join with Seats to get seat number and complaint details
SELECT co.SeatNumber, c.Type, c.Description, c.Status
FROM Complaints c
LEFT JOIN Seats co ON c.CoachID = co.CoachID
ORDER BY c.Date, co.SeatNumber;


-- Table 16 : Cargo
CREATE TABLE Cargo (
    CargoID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    TrainID INT,
    DepartureStation VARCHAR(50),
    ArrivalStation VARCHAR(50),
    Weight DECIMAL(10,2),
    GoodsType VARCHAR(50),
    DepartureDate DATE,
    ArrivalDate DATE,
    Status VARCHAR(20)
);
INSERT INTO Cargo (BookingID, TrainID, DepartureStation, ArrivalStation, Weight, GoodsType, DepartureDate, ArrivalDate, Status)
 VALUES
(1, 1, 'Delhi', 'Mumbai', 1500.50, 'Electronics', '2025-07-01', '2025-07-02', 'Delivered'),
(2, 2, 'Kolkata', 'Chennai', 2000.00, 'Textiles', '2025-07-02', '2025-07-03', 'Delivered'),
(3, 3, 'Hyderabad', 'Bengaluru', 500.25, 'Medicines', '2025-07-03', '2025-07-04', 'Delivered'),
(4, 4, 'Jaipur', 'Pune', 800.75, 'Machinery', '2025-07-04', '2025-07-05', 'Delivered'),
(5, 5, 'Lucknow', 'Ahmedabad', 1200.00, 'Fruits', '2025-07-05', '2025-07-06', 'Delivered'),
(6, 6, 'Patna', 'Guwahati', 700.60, 'Vegetables', '2025-07-06', '2025-07-07', 'Delivered'),
(7, 7, 'Bhopal', 'Nagpur', 300.80, 'Pharma', '2025-07-07', '2025-07-08', 'Delivered'),
(8, 8, 'Ranchi', 'Vijayawada', 450.90, 'Garments', '2025-07-08', '2025-07-09', 'Delivered'),
(9, 9, 'Indore', 'Coimbatore', 1000.00, 'Books', '2025-07-09', '2025-07-10', 'Delivered'),
(10, 10, 'Surat', 'Kochi', 650.00, 'Furniture', '2025-07-10', '2025-07-11', 'Delivered'),
(11, 11, 'Delhi', 'Mumbai', 1550.00, 'Steel', '2025-07-11', '2025-07-12', 'Delivered'),
(12, 12, 'Kolkata', 'Chennai', 2050.00, 'Cotton', '2025-07-12', '2025-07-13', 'Delivered'),
(13, 13, 'Hyderabad', 'Bengaluru', 550.00, 'Chemicals', '2025-07-13', '2025-07-14', 'Delivered'),
(14, 14, 'Jaipur', 'Pune', 850.00, 'Pesticides', '2025-07-14', '2025-07-15', 'Delivered'),
(15, 15, 'Lucknow', 'Ahmedabad', 1250.00, 'Rice', '2025-07-15', '2025-07-16', 'Delivered'),
(16, 16, 'Patna', 'Guwahati', 750.00, 'Sugar', '2025-07-16', '2025-07-17', 'Delivered'),
(17, 17, 'Bhopal', 'Nagpur', 350.00, 'Grains', '2025-07-17', '2025-07-18', 'Delivered'),
(18, 18, 'Ranchi', 'Vijayawada', 500.00, 'Plastic', '2025-07-18', '2025-07-19', 'Delivered'),
(19, 19, 'Indore', 'Coimbatore', 1050.00, 'Paper', '2025-07-19', '2025-07-20', 'Delivered'),
(20, 20, 'Surat', 'Kochi', 700.00, 'Beverages', '2025-07-20', '2025-07-21', 'Delivered');

-- display table data
Select * from Cargo;

-- to delete values from table 
truncate table Cargo;

-- to delete table
drop table Cargo;

-- 1. List all cargo shipments
SELECT * FROM Cargo;

-- 2. Cargo shipments for TrainID = 1
SELECT * FROM Cargo
WHERE TrainID = 1;

-- 3. Total cargo weight per train
SELECT TrainID, SUM(Weight) AS TotalWeight
FROM Cargo
GROUP BY TrainID;

-- 4. Count of shipments per GoodsType
SELECT GoodsType, COUNT(*) AS CountShipments
FROM Cargo
GROUP BY GoodsType;

-- 5. Cargo shipped from Delhi
SELECT * FROM Cargo
WHERE DepartureStation = 'Delhi';

-- 6. Join with Trains to get train details
SELECT ca.CargoID, ca.Weight, ca.GoodsType, t.TrainName, t.SourceStation, t.DestinationStation
FROM Cargo ca
JOIN Trains t ON ca.TrainID = t.TrainID;

-- 7. Subquery: Cargo with weight above average
SELECT * FROM Cargo
WHERE Weight > (SELECT AVG(Weight) FROM Cargo);

-- 8. Latest shipments first
SELECT * FROM Cargo
ORDER BY DepartureDate DESC, ArrivalDate DESC;

-- 9. Concatenate Departure and Arrival
SELECT CONCAT(DepartureStation, ' -> ', ArrivalStation) AS Route, GoodsType, Weight
FROM Cargo;

-- 10. Format departure and arrival dates
SELECT CargoID, DATE_FORMAT(DepartureDate,'%d-%m-%Y') AS Departure, DATE_FORMAT(ArrivalDate,'%d-%m-%Y') AS Arrival
FROM Cargo;

-- 11. Window function: Rank cargo by weight
SELECT CargoID, GoodsType, Weight,
       RANK() OVER (ORDER BY Weight DESC) AS WeightRank
FROM Cargo;

-- 12. Dense rank cargo by weight per TrainID
SELECT TrainID, CargoID, Weight,
       DENSE_RANK() OVER (PARTITION BY TrainID ORDER BY Weight DESC) AS RankPerTrain
FROM Cargo;

-- 13. Cargo containing 'Electronics'
SELECT * FROM Cargo
WHERE GoodsType LIKE '%Electronics%';

-- 14. Subquery: Trains with more than 2 cargo shipments
SELECT TrainID FROM Trains
WHERE TrainID IN (
    SELECT TrainID
    FROM Cargo
    GROUP BY TrainID
    HAVING COUNT(*) > 2
);

-- 15. Most recent cargo shipment
SELECT * FROM Cargo
WHERE DepartureDate = (SELECT MAX(DepartureDate) FROM Cargo);

-- 16. User-defined function: Days in transit
DELIMITER //
CREATE FUNCTION fn_days_in_transit(p_cargo_id INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE days_diff INT;
  SELECT DATEDIFF(ArrivalDate, DepartureDate) INTO days_diff
  FROM Cargo
  WHERE CargoID = p_cargo_id;
  RETURN days_diff;
END //
DELIMITER ;

-- 17. Use UDF to get transit days for each cargo
SELECT CargoID, GoodsType, fn_days_in_transit(CargoID) AS TransitDays
FROM Cargo;

-- 18. Count of cargo per status
SELECT Status, COUNT(*) AS CountStatus
FROM Cargo
GROUP BY Status;

-- 19. Cargo departing in last 10 days
SELECT * FROM Cargo
WHERE DepartureDate >= CURDATE() - INTERVAL 10 DAY;

-- 20. Join with TrainSchedules to get departure time
SELECT ca.CargoID, ca.GoodsType, ca.Weight, ts.DepartureTime, ts.ArrivalTime
FROM Cargo ca
LEFT JOIN TrainSchedules ts ON ca.TrainID = ts.TrainID
ORDER BY ca.DepartureDate;


-- Table 17: Parcels
CREATE TABLE Parcels (
    ParcelID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    SenderName VARCHAR(100),
    ReceiverName VARCHAR(100),
    SourceStation VARCHAR(50),
    DestinationStation VARCHAR(50),
    Weight DECIMAL(10,2),
    DispatchDate DATE,
    DeliveryDate DATE,
    Status VARCHAR(20)
);

INSERT INTO Parcels (BookingID, SenderName, ReceiverName, SourceStation, DestinationStation, Weight, DispatchDate, DeliveryDate, Status)
 VALUES
(1, 'Amit', 'Rajesh', 'Delhi', 'Mumbai', 15.50, '2025-07-01', '2025-07-02', 'Delivered'),
(2, 'Sunita', 'Pooja', 'Kolkata', 'Chennai', 12.00, '2025-07-02', '2025-07-03', 'Delivered'),
(3, 'Rahul', 'Deepak', 'Hyderabad', 'Bengaluru', 5.75, '2025-07-03', '2025-07-04', 'Delivered'),
(4, 'Kiran', 'Anjali', 'Jaipur', 'Pune', 8.50, '2025-07-04', '2025-07-05', 'Delivered'),
(5, 'Ravi', 'Manoj', 'Lucknow', 'Ahmedabad', 10.00, '2025-07-05', '2025-07-06', 'Delivered'),
(6, 'Priya', 'Sneha', 'Patna', 'Guwahati', 6.80, '2025-07-06', '2025-07-07', 'Delivered'),
(7, 'Ankit', 'Vikas', 'Bhopal', 'Nagpur', 4.50, '2025-07-07', '2025-07-08', 'Delivered'),
(8, 'Suman', 'Rohit', 'Ranchi', 'Vijayawada', 7.00, '2025-07-08', '2025-07-09', 'Delivered'),
(9, 'Vinod', 'Sanjay', 'Indore', 'Coimbatore', 12.25, '2025-07-09', '2025-07-10', 'Delivered'),
(10, 'Nisha', 'Meena', 'Surat', 'Kochi', 9.50, '2025-07-10', '2025-07-11', 'Delivered'),
(11, 'Gaurav', 'Sahil', 'Delhi', 'Mumbai', 16.00, '2025-07-11', '2025-07-12', 'Delivered'),
(12, 'Pinky', 'Asha', 'Kolkata', 'Chennai', 11.00, '2025-07-12', '2025-07-13', 'Delivered'),
(13, 'Kunal', 'Bhavesh', 'Hyderabad', 'Bengaluru', 6.00, '2025-07-13', '2025-07-14', 'Delivered'),
(14, 'Mahesh', 'Aditi', 'Jaipur', 'Pune', 8.00, '2025-07-14', '2025-07-15', 'Delivered'),
(15, 'Snehal', 'Ajay', 'Lucknow', 'Ahmedabad', 10.50, '2025-07-15', '2025-07-16', 'Delivered'),
(16, 'Divya', 'Geeta', 'Patna', 'Guwahati', 7.00, '2025-07-16', '2025-07-17', 'Delivered'),
(17, 'Harsh', 'Deepa', 'Bhopal', 'Nagpur', 4.80, '2025-07-17', '2025-07-18', 'Delivered'),
(18, 'Ramesh', 'Shweta', 'Ranchi', 'Vijayawada', 7.20, '2025-07-18', '2025-07-19', 'Delivered'),
(19, 'Suresh', 'Neha', 'Indore', 'Coimbatore', 13.00, '2025-07-19', '2025-07-20', 'Delivered'),
(20, 'Rekha', 'Nitin', 'Surat', 'Kochi', 9.75, '2025-07-20', '2025-07-21', 'Delivered');

-- display table data
Select * from Parcels;

-- to delete values from table 
truncate table Parcels;

-- to delete table
drop table Parcels;

-- 1. List all parcels
SELECT * FROM Parcels;

-- 2. Parcels sent from Delhi
SELECT * FROM Parcels
WHERE SourceStation = 'Delhi';

-- 3. Parcels delivered to Mumbai
SELECT * FROM Parcels
WHERE DestinationStation = 'Mumbai';

-- 4. Total weight of all parcels
SELECT SUM(Weight) AS TotalWeight FROM Parcels;

-- 5. Average parcel weight
SELECT AVG(Weight) AS AvgWeight FROM Parcels;

-- 6. Count of parcels per source station
SELECT SourceStation, COUNT(*) AS CountParcels
FROM Parcels
GROUP BY SourceStation;

-- 7. Count of parcels per destination station
SELECT DestinationStation, COUNT(*) AS CountParcels
FROM Parcels
GROUP BY DestinationStation;

-- 8. Heaviest parcels (weight > average)
SELECT * FROM Parcels
WHERE Weight > (SELECT AVG(Weight) FROM Parcels);

-- 9. Parcels dispatched in July 2025
SELECT * FROM Parcels
WHERE MONTH(DispatchDate) = 7 AND YEAR(DispatchDate) = 2025;

-- 10. Parcels ordered by weight descending
SELECT * FROM Parcels
ORDER BY Weight DESC;

-- 11. Concatenate sender and receiver
SELECT CONCAT(SenderName, ' -> ', ReceiverName) AS Route, Weight, Status
FROM Parcels;

-- 12. Days taken for delivery per parcel
SELECT ParcelID, DATEDIFF(DeliveryDate, DispatchDate) AS DeliveryDays
FROM Parcels;

-- 13. Window function: Rank parcels by weight
SELECT ParcelID, SenderName, ReceiverName, Weight,
       RANK() OVER (ORDER BY Weight DESC) AS WeightRank
FROM Parcels;

-- 14. Dense rank parcels by weight per source station
SELECT SourceStation, ParcelID, Weight,
       DENSE_RANK() OVER (PARTITION BY SourceStation ORDER BY Weight DESC) AS RankPerSource
FROM Parcels;

-- 15. Join with Cargo table to get train info (assuming Cargo has TrainID)
SELECT p.ParcelID, p.SenderName, p.ReceiverName, c.TrainID, c.DepartureStation, c.ArrivalStation
FROM Parcels p
LEFT JOIN Cargo c ON p.BookingID = c.BookingID;

-- 16. Subquery: Parcels heavier than 10 kg
SELECT * FROM Parcels
WHERE Weight > (SELECT MAX(Weight) - 5 FROM Parcels);

-- 17. Most recent dispatch
SELECT * FROM Parcels
WHERE DispatchDate = (SELECT MAX(DispatchDate) FROM Parcels);

-- 18. User-defined function: Delivery duration in days
DELIMITER //
CREATE FUNCTION fn_delivery_days(p_parcel_id INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE days_diff INT;
  SELECT DATEDIFF(DeliveryDate, DispatchDate) INTO days_diff
  FROM Parcels
  WHERE ParcelID = p_parcel_id;
  RETURN days_diff;
END //
DELIMITER ;

-- 19. Use UDF to get delivery days per parcel
SELECT ParcelID, SenderName, ReceiverName, fn_delivery_days(ParcelID) AS DeliveryDays
FROM Parcels;

-- 20. Count of parcels by status
SELECT Status, COUNT(*) AS CountStatus
FROM Parcels
GROUP BY Status;


-- Table 18: FreightBookings
CREATE TABLE FreightBookings (
    FreightID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    GoodsType VARCHAR(50),
    Quantity INT,
    Weight DECIMAL(10,2),
    SourceStation VARCHAR(50),
    DestinationStation VARCHAR(50),
    BookingDate DATE,
    DeliveryDate DATE,
    Status VARCHAR(20)
);

INSERT INTO FreightBookings (CustomerName, GoodsType, Quantity, Weight, SourceStation, DestinationStation, BookingDate, DeliveryDate, Status) 
VALUES
('ABC Ltd', 'Coal', 100, 5000.00, 'Delhi', 'Mumbai', '2025-07-01', '2025-07-02', 'Delivered'),
('XYZ Traders', 'Steel', 80, 4000.00, 'Kolkata', 'Chennai', '2025-07-02', '2025-07-03', 'Delivered'),
('PQR Pvt Ltd', 'Cement', 50, 2500.00, 'Hyderabad', 'Bengaluru', '2025-07-03', '2025-07-04', 'Delivered'),
('LMN Corp', 'Machinery', 30, 1500.00, 'Jaipur', 'Pune', '2025-07-04', '2025-07-05', 'Delivered'),
('RST Group', 'Fertilizers', 70, 3500.00, 'Lucknow', 'Ahmedabad', '2025-07-05', '2025-07-06', 'Delivered'),
('UVW Exports', 'Textiles', 60, 3000.00, 'Patna', 'Guwahati', '2025-07-06', '2025-07-07', 'Delivered'),
('DEF Logistics', 'Food Grains', 90, 4500.00, 'Bhopal', 'Nagpur', '2025-07-07', '2025-07-08', 'Delivered'),
('GHI Supply', 'Furniture', 20, 1000.00, 'Ranchi', 'Vijayawada', '2025-07-08', '2025-07-09', 'Delivered'),
('JKL Cargo', 'Chemicals', 40, 2000.00, 'Indore', 'Coimbatore', '2025-07-09', '2025-07-10', 'Delivered'),
('MNO Movers', 'Beverages', 35, 1750.00, 'Surat', 'Kochi', '2025-07-10', '2025-07-11', 'Delivered'),
('Alpha Ltd', 'Pharma', 25, 1250.00, 'Delhi', 'Mumbai', '2025-07-11', '2025-07-12', 'Delivered'),
('Beta Traders', 'Plastics', 45, 2250.00, 'Kolkata', 'Chennai', '2025-07-12', '2025-07-13', 'Delivered'),
('Gamma Pvt Ltd', 'Electronics', 30, 1500.00, 'Hyderabad', 'Bengaluru', '2025-07-13', '2025-07-14', 'Delivered'),
('Delta Corp', 'Toys', 50, 2500.00, 'Jaipur', 'Pune', '2025-07-14', '2025-07-15', 'Delivered'),
('Epsilon Group', 'Paper', 55, 2750.00, 'Lucknow', 'Ahmedabad', '2025-07-15', '2025-07-16', 'Delivered'),
('Zeta Exports', 'Rubber', 65, 3250.00, 'Patna', 'Guwahati', '2025-07-16', '2025-07-17', 'Delivered'),
('Eta Logistics', 'Books', 70, 3500.00, 'Bhopal', 'Nagpur', '2025-07-17', '2025-07-18', 'Delivered'),
('Theta Supply', 'Leather', 60, 3000.00, 'Ranchi', 'Vijayawada', '2025-07-18', '2025-07-19', 'Delivered'),
('Iota Cargo', 'Glass', 40, 2000.00, 'Indore', 'Coimbatore', '2025-07-19', '2025-07-20', 'Delivered'),
('Kappa Movers', 'Metals', 55, 2750.00, 'Surat', 'Kochi', '2025-07-20', '2025-07-21', 'Delivered');

-- display table data
Select * from FreightBookings;

-- to delete values from table 
truncate table FreightBookings;

-- to delete table
drop table FreightBookings;

-- 1. List all freight bookings
SELECT * FROM FreightBookings;

-- 2. Bookings from Delhi
SELECT * FROM FreightBookings
WHERE SourceStation = 'Delhi';

-- 3. Bookings to Mumbai
SELECT * FROM FreightBookings
WHERE DestinationStation = 'Mumbai';

-- 4. Total weight of all bookings
SELECT SUM(Weight) AS TotalWeight FROM FreightBookings;

-- 5. Average weight per booking
SELECT AVG(Weight) AS AvgWeight FROM FreightBookings;

-- 6. Count bookings per source station
SELECT SourceStation, COUNT(*) AS CountBookings
FROM FreightBookings
GROUP BY SourceStation;

-- 7. Count bookings per destination station
SELECT DestinationStation, COUNT(*) AS CountBookings
FROM FreightBookings
GROUP BY DestinationStation;

-- 8. Bookings heavier than average
SELECT * FROM FreightBookings
WHERE Weight > (SELECT AVG(Weight) FROM FreightBookings);

-- 9. Bookings made in July 2025
SELECT * FROM FreightBookings
WHERE MONTH(BookingDate) = 7 AND YEAR(BookingDate) = 2025;

-- 10. Bookings ordered by weight descending
SELECT * FROM FreightBookings
ORDER BY Weight DESC;

-- 11. Concatenate Customer and GoodsType
SELECT CONCAT(CustomerName, ' - ', GoodsType) AS CustomerGoods, Weight, Status
FROM FreightBookings;

-- 12. Delivery duration in days
SELECT FreightID, DATEDIFF(DeliveryDate, BookingDate) AS DeliveryDays
FROM FreightBookings;

-- 13. Window function: rank bookings by weight
SELECT FreightID, CustomerName, GoodsType, Weight,
       RANK() OVER (ORDER BY Weight DESC) AS WeightRank
FROM FreightBookings;

-- 14. Dense rank bookings by weight per source station
SELECT SourceStation, FreightID, Weight,
       DENSE_RANK() OVER (PARTITION BY SourceStation ORDER BY Weight DESC) AS RankPerSource
FROM FreightBookings;

-- 15. Join with Cargo table to get TrainID info (if Cargo table exists)
SELECT f.FreightID, f.CustomerName, f.GoodsType, c.TrainID, c.DepartureStation, c.ArrivalStation
FROM FreightBookings f
LEFT JOIN Cargo c ON f.SourceStation = c.DepartureStation AND f.DestinationStation = c.ArrivalStation;

-- 16. Subquery: Bookings with weight above 3000
SELECT * FROM FreightBookings
WHERE Weight > (SELECT AVG(Weight) + 500 FROM FreightBookings);

-- 17. Most recent booking
SELECT * FROM FreightBookings
WHERE BookingDate = (SELECT MAX(BookingDate) FROM FreightBookings);

-- 18. User-defined function: Delivery days
DELIMITER //
CREATE FUNCTION fn_freight_delivery_days(p_freight_id INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE days_diff INT;
  SELECT DATEDIFF(DeliveryDate, BookingDate) INTO days_diff
  FROM FreightBookings
  WHERE FreightID = p_freight_id;
  RETURN days_diff;
END //
DELIMITER ;

-- 19. Use UDF to get delivery days per freight
SELECT FreightID, CustomerName, GoodsType, fn_freight_delivery_days(FreightID) AS DeliveryDays
FROM FreightBookings;

-- 20. Count of bookings by status
SELECT Status, COUNT(*) AS CountStatus
FROM FreightBookings
GROUP BY Status;


-- Table 19: Signals
CREATE TABLE Signals (
    SignalID INT PRIMARY KEY AUTO_INCREMENT,
    RouteID INT,
    SignalType VARCHAR(50),
    Location VARCHAR(100),
    Status VARCHAR(20),
    LastCheckDate DATE,
    NextCheckDate DATE,
    MaintenanceStatus VARCHAR(20),
    MaintainedBy VARCHAR(50),
    Remarks TEXT
);

INSERT INTO Signals (RouteID, SignalType, Location, Status, LastCheckDate, NextCheckDate, MaintenanceStatus, MaintainedBy, Remarks) 
VALUES
(1, 'Semaphore', 'Delhi Yard', 'Operational', '2025-06-30', '2025-07-30', 'Good', 'Engg Team A', 'OK'),
(2, 'LED', 'Howrah Station', 'Operational', '2025-06-29', '2025-07-29', 'Good', 'Engg Team B', 'OK'),
(3, 'Color Light', 'Secunderabad', 'Operational', '2025-06-28', '2025-07-28', 'Good', 'Engg Team C', 'OK'),
(4, 'Semaphore', 'Pune Yard', 'Operational', '2025-06-27', '2025-07-27', 'Good', 'Engg Team A', 'OK'),
(5, 'LED', 'Ahmedabad', 'Operational', '2025-06-26', '2025-07-26', 'Good', 'Engg Team B', 'OK'),
(6, 'Color Light', 'Guwahati', 'Operational', '2025-06-25', '2025-07-25', 'Good', 'Engg Team C', 'OK'),
(7, 'Semaphore', 'Nagpur', 'Operational', '2025-06-24', '2025-07-24', 'Good', 'Engg Team A', 'OK'),
(8, 'LED', 'Vijayawada', 'Operational', '2025-06-23', '2025-07-23', 'Good', 'Engg Team B', 'OK'),
(9, 'Color Light', 'Coimbatore', 'Operational', '2025-06-22', '2025-07-22', 'Good', 'Engg Team C', 'OK'),
(10, 'Semaphore', 'Kochi Yard', 'Operational', '2025-06-21', '2025-07-21', 'Good', 'Engg Team A', 'OK'),
(11, 'LED', 'Delhi Yard', 'Operational', '2025-06-20', '2025-07-20', 'Good', 'Engg Team B', 'OK'),
(12, 'Color Light', 'Howrah', 'Operational', '2025-06-19', '2025-07-19', 'Good', 'Engg Team C', 'OK'),
(13, 'Semaphore', 'Secunderabad', 'Operational', '2025-06-18', '2025-07-18', 'Good', 'Engg Team A', 'OK'),
(14, 'LED', 'Pune Yard', 'Operational', '2025-06-17', '2025-07-17', 'Good', 'Engg Team B', 'OK'),
(15, 'Color Light', 'Ahmedabad', 'Operational', '2025-06-16', '2025-07-16', 'Good', 'Engg Team C', 'OK'),
(16, 'Semaphore', 'Guwahati', 'Operational', '2025-06-15', '2025-07-15', 'Good', 'Engg Team A', 'OK'),
(17, 'LED', 'Nagpur', 'Operational', '2025-06-14', '2025-07-14', 'Good', 'Engg Team B', 'OK'),
(18, 'Color Light', 'Vijayawada', 'Operational', '2025-06-13', '2025-07-13', 'Good', 'Engg Team C', 'OK'),
(19, 'Semaphore', 'Coimbatore', 'Operational', '2025-06-12', '2025-07-12', 'Good', 'Engg Team A', 'OK'),
(20, 'LED', 'Kochi Yard', 'Operational', '2025-06-11', '2025-07-11', 'Good', 'Engg Team B', 'OK');

-- display table data
Select * from Signals;

-- to delete values from table 
truncate table Signals;

-- to delete table
drop table Signals;

-- 1. Select all signals
SELECT * FROM Signals;

-- 2. Signals of type 'LED'
SELECT * FROM Signals
WHERE SignalType = 'LED';

-- 3. Signals maintained by 'Engg Team A'
SELECT * FROM Signals
WHERE MaintainedBy = 'Engg Team A';

-- 4. Count signals per SignalType
SELECT SignalType, COUNT(*) AS CountSignals
FROM Signals
GROUP BY SignalType;

-- 5. Count signals per MaintenanceStatus
SELECT MaintenanceStatus, COUNT(*) AS CountStatus
FROM Signals
GROUP BY MaintenanceStatus;

-- 6. Signals due for check after '2025-07-20'
SELECT * FROM Signals
WHERE NextCheckDate > '2025-07-20';

-- 7. Signals with last check before '2025-06-20'
SELECT * FROM Signals
WHERE LastCheckDate < '2025-06-20';

-- 8. Signals with same Location as 'Delhi Yard'
SELECT * FROM Signals
WHERE Location = (SELECT Location FROM Signals WHERE SignalID = 1);

-- 9. Signals ordered by NextCheckDate ascending
SELECT * FROM Signals
ORDER BY NextCheckDate ASC;

-- 10. Concatenate Location and SignalType
SELECT CONCAT(Location, ' - ', SignalType) AS LocationSignal, Status
FROM Signals;

-- 11. Days until next check
SELECT SignalID, DATEDIFF(NextCheckDate, CURDATE()) AS DaysToNextCheck
FROM Signals;

-- 12. Window function: rank signals by NextCheckDate
SELECT SignalID, Location, NextCheckDate,
       RANK() OVER (ORDER BY NextCheckDate ASC) AS CheckRank
FROM Signals;

-- 13. Dense rank signals by LastCheckDate per MaintainedBy
SELECT MaintainedBy, SignalID, LastCheckDate,
       DENSE_RANK() OVER (PARTITION BY MaintainedBy ORDER BY LastCheckDate ASC) AS RankPerTeam
FROM Signals;

-- 14. Join with TrainSchedules to find signals on active routes (assuming RouteID exists in TrainSchedules)
SELECT s.SignalID, s.RouteID, s.SignalType, t.TrainID, t.Status
FROM Signals s
LEFT JOIN TrainSchedules t ON s.RouteID = t.RouteID;

-- 15. Signals needing maintenance soon (NextCheckDate within 10 days)
SELECT * FROM Signals
WHERE NextCheckDate <= DATE_ADD(CURDATE(), INTERVAL 10 DAY);

-- 16. Subquery: Signals with latest LastCheckDate
SELECT * FROM Signals
WHERE LastCheckDate = (SELECT MAX(LastCheckDate) FROM Signals);

-- 17. Signals by status 'Operational'
SELECT * FROM Signals
WHERE Status = 'Operational';

-- 18. User-defined function to calculate days until next check
DELIMITER //
CREATE FUNCTION fn_days_until_check(p_signal_id INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE days_left INT;
  SELECT DATEDIFF(NextCheckDate, CURDATE()) INTO days_left
  FROM Signals
  WHERE SignalID = p_signal_id;
  RETURN days_left;
END //
DELIMITER ;

-- 19. Use UDF to get days until next check for each signal
SELECT SignalID, Location, fn_days_until_check(SignalID) AS DaysUntilNextCheck
FROM Signals;

-- 20. Count of signals per MaintainedBy
SELECT MaintainedBy, COUNT(*) AS CountSignals
FROM Signals
GROUP BY MaintainedBy;


-- Table 20: Tracks
CREATE TABLE Tracks (
    TrackID INT PRIMARY KEY AUTO_INCREMENT,
    RouteID INT,
    SectionName VARCHAR(100),
    Length_KM DECIMAL(5,2),
    GaugeType VARCHAR(20),
    ConditionStatus VARCHAR(20),
    LastInspection DATE,
    NextInspection DATE,
    MaintainedBy VARCHAR(50),
    Remarks TEXT
);

INSERT INTO Tracks (RouteID, SectionName, Length_KM, GaugeType, ConditionStatus, LastInspection, NextInspection, MaintainedBy, Remarks) 
VALUES
(1, 'Delhi - Agra', 200.50, 'Broad', 'Good', '2025-06-01', '2025-07-01', 'Track Team A', 'No issues'),
(2, 'Kolkata - Durgapur', 170.75, 'Broad', 'Good', '2025-06-02', '2025-07-02', 'Track Team B', 'Ok'),
(3, 'Hyderabad - Warangal', 140.30, 'Broad', 'Good', '2025-06-03', '2025-07-03', 'Track Team C', 'Ok'),
(4, 'Jaipur - Ajmer', 130.00, 'Broad', 'Good', '2025-06-04', '2025-07-04', 'Track Team A', 'Ok'),
(5, 'Lucknow - Kanpur', 80.60, 'Broad', 'Good', '2025-06-05', '2025-07-05', 'Track Team B', 'Ok'),
(6, 'Patna - Gaya', 90.40, 'Broad', 'Good', '2025-06-06', '2025-07-06', 'Track Team C', 'Ok'),
(7, 'Bhopal - Itarsi', 110.00, 'Broad', 'Good', '2025-06-07', '2025-07-07', 'Track Team A', 'Ok'),
(8, 'Ranchi - Bokaro', 95.50, 'Broad', 'Good', '2025-06-08', '2025-07-08', 'Track Team B', 'Ok'),
(9, 'Indore - Ratlam', 120.75, 'Broad', 'Good', '2025-06-09', '2025-07-09', 'Track Team C', 'Ok'),
(10, 'Surat - Vadodara', 140.90, 'Broad', 'Good', '2025-06-10', '2025-07-10', 'Track Team A', 'Ok'),
(11, 'Delhi - Ambala', 200.00, 'Broad', 'Good', '2025-06-11', '2025-07-11', 'Track Team B', 'Ok'),
(12, 'Kolkata - Asansol', 150.00, 'Broad', 'Good', '2025-06-12', '2025-07-12', 'Track Team C', 'Ok'),
(13, 'Hyderabad - Nanded', 180.00, 'Broad', 'Good', '2025-06-13', '2025-07-13', 'Track Team A', 'Ok'),
(14, 'Jaipur - Kota', 200.00, 'Broad', 'Good', '2025-06-14', '2025-07-14', 'Track Team B', 'Ok'),
(15, 'Lucknow - Varanasi', 120.00, 'Broad', 'Good', '2025-06-15', '2025-07-15', 'Track Team C', 'Ok'),
(16, 'Patna - Muzaffarpur', 80.00, 'Broad', 'Good', '2025-06-16', '2025-07-16', 'Track Team A', 'Ok'),
(17, 'Bhopal - Jabalpur', 150.00, 'Broad', 'Good', '2025-06-17', '2025-07-17', 'Track Team B', 'Ok'),
(18, 'Ranchi - Dhanbad', 85.00, 'Broad', 'Good', '2025-06-18', '2025-07-18', 'Track Team C', 'Ok'),
(19, 'Indore - Bhopal', 180.00, 'Broad', 'Good', '2025-06-19', '2025-07-19', 'Track Team A', 'Ok'),
(20, 'Surat - Mumbai', 250.00, 'Broad', 'Good', '2025-06-20', '2025-07-20', 'Track Team B', 'Ok');

-- display table data
Select * from Tracks;

-- to delete values from table 
truncate table Tracks;

-- to delete table
drop table Tracks;

-- 1. Select all tracks
SELECT * FROM Tracks;

-- 2. Tracks maintained by 'Track Team A'
SELECT * FROM Tracks
WHERE MaintainedBy = 'Track Team A';

-- 3. Tracks longer than 150 KM
SELECT * FROM Tracks
WHERE Length_KM > 150;

-- 4. Count tracks per MaintainedBy team
SELECT MaintainedBy, COUNT(*) AS TrackCount
FROM Tracks
GROUP BY MaintainedBy;

-- 5. Total length of tracks per team
SELECT MaintainedBy, SUM(Length_KM) AS TotalLength
FROM Tracks
GROUP BY MaintainedBy;

-- 6. Tracks with next inspection due before '2025-07-10'
SELECT * FROM Tracks
WHERE NextInspection < '2025-07-10';

-- 7. Tracks with last inspection after '2025-06-15'
SELECT * FROM Tracks
WHERE LastInspection > '2025-06-15';

-- 8. Subquery: Tracks with maximum length
SELECT * FROM Tracks
WHERE Length_KM = (SELECT MAX(Length_KM) FROM Tracks);

-- 9. Tracks of GaugeType 'Broad'
SELECT * FROM Tracks
WHERE GaugeType = 'Broad';

-- 10. Concatenate SectionName and ConditionStatus
SELECT CONCAT(SectionName, ' - ', ConditionStatus) AS SectionStatus, MaintainedBy
FROM Tracks;

-- 11. Days until next inspection
SELECT TrackID, DATEDIFF(NextInspection, CURDATE()) AS DaysToNextInspection
FROM Tracks;

-- 12. Window function: rank tracks by length
SELECT TrackID, SectionName, Length_KM,
       RANK() OVER (ORDER BY Length_KM DESC) AS LengthRank
FROM Tracks;

-- 13. Dense rank tracks by LastInspection per MaintainedBy
SELECT MaintainedBy, TrackID, LastInspection,
       DENSE_RANK() OVER (PARTITION BY MaintainedBy ORDER BY LastInspection ASC) AS InspectionRank
FROM Tracks;

-- 14. Join with Routes table to get Route details (assuming RouteID exists in Routes)
SELECT t.TrackID, t.SectionName, r.RouteName, t.MaintainedBy
FROM Tracks t
LEFT JOIN Routes r ON t.RouteID = r.RouteID;

-- 15. Tracks needing maintenance soon (NextInspection within 10 days)
SELECT * FROM Tracks
WHERE NextInspection <= DATE_ADD(CURDATE(), INTERVAL 10 DAY);

-- 16. Tracks inspected most recently
SELECT * FROM Tracks
WHERE LastInspection = (SELECT MAX(LastInspection) FROM Tracks);

-- 17. Tracks in 'Good' condition
SELECT * FROM Tracks
WHERE ConditionStatus = 'Good';

-- 18. User-defined function to calculate days until next inspection
DELIMITER //
CREATE FUNCTION fn_days_until_inspection(p_track_id INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE days_left INT;
  SELECT DATEDIFF(NextInspection, CURDATE()) INTO days_left
  FROM Tracks
  WHERE TrackID = p_track_id;
  RETURN days_left;
END //
DELIMITER ;

-- 19. Use UDF to get days until next inspection for each track
SELECT TrackID, SectionName, fn_days_until_inspection(TrackID) AS DaysUntilNextInspection
FROM Tracks;

-- 20. Count of tracks per MaintainedBy team
SELECT MaintainedBy, COUNT(*) AS TrackCount
FROM Tracks
GROUP BY MaintainedBy;


-- Table 21: Bridges
CREATE TABLE Bridges (
    BridgeID INT PRIMARY KEY AUTO_INCREMENT,
    TrackID INT,
    BridgeName VARCHAR(100),
    Location VARCHAR(100),
    Length_M DECIMAL(6,2),
    Type VARCHAR(50),
    ConditionStatus VARCHAR(20),
    LastInspection DATE,
    NextInspection DATE,
    Remarks TEXT
);

INSERT INTO Bridges (TrackID, BridgeName, Location, Length_M, Type, ConditionStatus, LastInspection, NextInspection, Remarks) 
VALUES
(1, 'Yamuna Bridge', 'Delhi', 1200.50, 'Steel', 'Good', '2025-06-01', '2025-07-01', 'No cracks'),
(2, 'Hooghly Bridge', 'Kolkata', 950.75, 'Suspension', 'Good', '2025-06-02', '2025-07-02', 'Ok'),
(3, 'Musheerabad Bridge', 'Hyderabad', 500.30, 'Concrete', 'Good', '2025-06-03', '2025-07-03', 'Ok'),
(4, 'Ajmer Bridge', 'Ajmer', 400.00, 'Steel', 'Good', '2025-06-04', '2025-07-04', 'Ok'),
(5, 'Kanpur Flyover', 'Kanpur', 350.60, 'Concrete', 'Good', '2025-06-05', '2025-07-05', 'Ok'),
(6, 'Gaya Bridge', 'Gaya', 300.40, 'Steel', 'Good', '2025-06-06', '2025-07-06', 'Ok'),
(7, 'Itarsi Bridge', 'Itarsi', 280.00, 'Concrete', 'Good', '2025-06-07', '2025-07-07', 'Ok'),
(8, 'Bokaro Bridge', 'Bokaro', 320.50, 'Steel', 'Good', '2025-06-08', '2025-07-08', 'Ok'),
(9, 'Ratlam Bridge', 'Ratlam', 400.75, 'Concrete', 'Good', '2025-06-09', '2025-07-09', 'Ok'),
(10, 'Vadodara Flyover', 'Vadodara', 500.90, 'Steel', 'Good', '2025-06-10', '2025-07-10', 'Ok'),
(11, 'Ambala Bridge', 'Ambala', 600.00, 'Concrete', 'Good', '2025-06-11', '2025-07-11', 'Ok'),
(12, 'Asansol Bridge', 'Asansol', 700.00, 'Steel', 'Good', '2025-06-12', '2025-07-12', 'Ok'),
(13, 'Nanded Bridge', 'Nanded', 800.00, 'Concrete', 'Good', '2025-06-13', '2025-07-13', 'Ok'),
(14, 'Kota Bridge', 'Kota', 850.00, 'Steel', 'Good', '2025-06-14', '2025-07-14', 'Ok'),
(15, 'Varanasi Bridge', 'Varanasi', 750.00, 'Concrete', 'Good', '2025-06-15', '2025-07-15', 'Ok'),
(16, 'Muzaffarpur Bridge', 'Muzaffarpur', 650.00, 'Steel', 'Good', '2025-06-16', '2025-07-16', 'Ok'),
(17, 'Jabalpur Bridge', 'Jabalpur', 550.00, 'Concrete', 'Good', '2025-06-17', '2025-07-17', 'Ok'),
(18, 'Dhanbad Bridge', 'Dhanbad', 500.00, 'Steel', 'Good', '2025-06-18', '2025-07-18', 'Ok'),
(19, 'Bhopal Bridge', 'Bhopal', 450.00, 'Concrete', 'Good', '2025-06-19', '2025-07-19', 'Ok'),
(20, 'Mumbai Bridge', 'Mumbai', 1000.00, 'Steel', 'Good', '2025-06-20', '2025-07-20', 'Ok');

-- display table data
Select * from Bridges;

-- to delete values from table 
truncate table Bridges;

-- to delete table
drop table Bridges;

-- 1. Select all bridges
SELECT * FROM Bridges;

-- 2. Bridges maintained on track 1
SELECT * FROM Bridges
WHERE TrackID = 1;

-- 3. Bridges longer than 700 meters
SELECT * FROM Bridges
WHERE Length_M > 700;

-- 4. Count bridges per Type
SELECT Type, COUNT(*) AS BridgeCount
FROM Bridges
GROUP BY Type;

-- 5. Total length of bridges per Type
SELECT Type, SUM(Length_M) AS TotalLength
FROM Bridges
GROUP BY Type;

-- 6. Bridges with next inspection due before '2025-07-10'
SELECT * FROM Bridges
WHERE NextInspection < '2025-07-10';

-- 7. Bridges with last inspection after '2025-06-15'
SELECT * FROM Bridges
WHERE LastInspection > '2025-06-15';

-- 8. Subquery: Bridge with maximum length
SELECT * FROM Bridges
WHERE Length_M = (SELECT MAX(Length_M) FROM Bridges);

-- 9. Bridges of Type 'Steel'
SELECT * FROM Bridges
WHERE Type = 'Steel';

-- 10. Concatenate BridgeName and ConditionStatus
SELECT CONCAT(BridgeName, ' - ', ConditionStatus) AS BridgeStatus, Location
FROM Bridges;

-- 11. Days until next inspection
SELECT BridgeID, DATEDIFF(NextInspection, CURDATE()) AS DaysToNextInspection
FROM Bridges;

-- 12. Window function: rank bridges by length
SELECT BridgeID, BridgeName, Length_M,
       RANK() OVER (ORDER BY Length_M DESC) AS LengthRank
FROM Bridges;

-- 13. Dense rank bridges by LastInspection per Type
SELECT Type, BridgeID, LastInspection,
       DENSE_RANK() OVER (PARTITION BY Type ORDER BY LastInspection ASC) AS InspectionRank
FROM Bridges;

-- 14. Join with Tracks table to get Track Section (assuming Tracks table exists)
SELECT b.BridgeID, b.BridgeName, t.SectionName, b.Type, b.ConditionStatus
FROM Bridges b
LEFT JOIN Tracks t ON b.TrackID = t.TrackID;

-- 15. Bridges needing maintenance soon (NextInspection within 10 days)
SELECT * FROM Bridges
WHERE NextInspection <= DATE_ADD(CURDATE(), INTERVAL 10 DAY);

-- 16. Bridges inspected most recently
SELECT * FROM Bridges
WHERE LastInspection = (SELECT MAX(LastInspection) FROM Bridges);

-- 17. Bridges in 'Good' condition
SELECT * FROM Bridges
WHERE ConditionStatus = 'Good';

-- 18. User-defined function to calculate days until next inspection
DELIMITER //
CREATE FUNCTION fn_days_until_bridge_inspection(p_bridge_id INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE days_left INT;
  SELECT DATEDIFF(NextInspection, CURDATE()) INTO days_left
  FROM Bridges
  WHERE BridgeID = p_bridge_id;
  RETURN days_left;
END //
DELIMITER ;

-- 19. Use UDF to get days until next inspection for each bridge
SELECT BridgeID, BridgeName, fn_days_until_bridge_inspection(BridgeID) AS DaysUntilNextInspection
FROM Bridges;

-- 20. Count of bridges per TrackID
SELECT TrackID, COUNT(*) AS BridgeCount
FROM Bridges
GROUP BY TrackID;

-- Table 22: LevelCrossings
CREATE TABLE LevelCrossings (
    CrossingID INT PRIMARY KEY AUTO_INCREMENT,
    TrackID INT,
    Location VARCHAR(100),
    CrossingType VARCHAR(50),
    GateStatus VARCHAR(20),
    AttendantName VARCHAR(100),
    ContactNumber VARCHAR(15),
    LastInspection DATE,
    NextInspection DATE,
    Remarks TEXT
);

INSERT INTO LevelCrossings (TrackID, Location, CrossingType, GateStatus, AttendantName, ContactNumber, LastInspection, NextInspection, Remarks) 
VALUES
(1, 'NH-2 Delhi', 'Manned', 'Operational', 'Rakesh Kumar', '9876543210', '2025-06-01', '2025-07-01', 'Working fine'),
(2, 'GT Road Kolkata', 'Manned', 'Operational', 'Sunil Das', '9876543211', '2025-06-02', '2025-07-02', 'Working fine'),
(3, 'Warangal Bypass', 'Unmanned', 'Operational', 'Raju Yadav', '9876543212', '2025-06-03', '2025-07-03', 'Signage good'),
(4, 'Ajmer Link Road', 'Manned', 'Operational', 'Prakash Singh', '9876543213', '2025-06-04', '2025-07-04', 'Ok'),
(5, 'Kanpur Outer', 'Unmanned', 'Operational', 'Deepak Sahu', '9876543214', '2025-06-05', '2025-07-05', 'Ok'),
(6, 'Gaya Ring Road', 'Manned', 'Operational', 'Santosh Kumar', '9876543215', '2025-06-06', '2025-07-06', 'Ok'),
(7, 'Itarsi Highway', 'Manned', 'Operational', 'Mukesh Patel', '9876543216', '2025-06-07', '2025-07-07', 'Ok'),
(8, 'Bokaro Main Road', 'Manned', 'Operational', 'Anil Kumar', '9876543217', '2025-06-08', '2025-07-08', 'Ok'),
(9, 'Ratlam Road', 'Unmanned', 'Operational', 'Amit Sharma', '9876543218', '2025-06-09', '2025-07-09', 'Ok'),
(10, 'Vadodara Bypass', 'Manned', 'Operational', 'Suresh Bhai', '9876543219', '2025-06-10', '2025-07-10', 'Ok'),
(11, 'Ambala Crossing', 'Manned', 'Operational', 'Harpreet Singh', '9876543220', '2025-06-11', '2025-07-11', 'Ok'),
(12, 'Asansol Road', 'Unmanned', 'Operational', 'Manish Das', '9876543221', '2025-06-12', '2025-07-12', 'Ok'),
(13, 'Nanded Gate', 'Manned', 'Operational', 'Pradeep Rao', '9876543222', '2025-06-13', '2025-07-13', 'Ok'),
(14, 'Kota Bypass', 'Unmanned', 'Operational', 'Rajeev Jain', '9876543223', '2025-06-14', '2025-07-14', 'Ok'),
(15, 'Varanasi Road', 'Manned', 'Operational', 'Shyam Yadav', '9876543224', '2025-06-15', '2025-07-15', 'Ok'),
(16, 'Muzaffarpur Outer', 'Manned', 'Operational', 'Ravi Kishan', '9876543225', '2025-06-16', '2025-07-16', 'Ok'),
(17, 'Jabalpur Crossing', 'Unmanned', 'Operational', 'Mahesh Gupta', '9876543226', '2025-06-17', '2025-07-17', 'Ok'),
(18, 'Dhanbad Road', 'Manned', 'Operational', 'Sanjay Kumar', '9876543227', '2025-06-18', '2025-07-18', 'Ok'),
(19, 'Bhopal Bypass', 'Manned', 'Operational', 'Gopal Mishra', '9876543228', '2025-06-19', '2025-07-19', 'Ok'),
(20, 'Mumbai Suburb', 'Manned', 'Operational', 'Raj Malhotra', '9876543229', '2025-06-20', '2025-07-20', 'Ok');

-- display table data
Select * from LevelCrossings;

-- to delete values from table 
truncate table LevelCrossings;

-- to delete table
drop table LevelCrossings;

-- 1. Select all level crossings
SELECT * FROM LevelCrossings;

-- 2. Level crossings on TrackID 1
SELECT * FROM LevelCrossings
WHERE TrackID = 1;

-- 3. Manned level crossings
SELECT * FROM LevelCrossings
WHERE CrossingType = 'Manned';

-- 4. Count crossings per TrackID
SELECT TrackID, COUNT(*) AS CrossingCount
FROM LevelCrossings
GROUP BY TrackID;

-- 5. Count crossings per CrossingType
SELECT CrossingType, COUNT(*) AS TypeCount
FROM LevelCrossings
GROUP BY CrossingType;

-- 6. Crossings with next inspection before '2025-07-10'
SELECT * FROM LevelCrossings
WHERE NextInspection < '2025-07-10';

-- 7. Crossings with last inspection after '2025-06-15'
SELECT * FROM LevelCrossings
WHERE LastInspection > '2025-06-15';

-- 8. Subquery: Crossing with earliest next inspection
SELECT * FROM LevelCrossings
WHERE NextInspection = (SELECT MIN(NextInspection) FROM LevelCrossings);

-- 9. Join with Tracks table to get SectionName
SELECT lc.CrossingID, lc.Location, t.SectionName, lc.CrossingType, lc.GateStatus
FROM LevelCrossings lc
LEFT JOIN Tracks t ON lc.TrackID = t.TrackID;

-- 10. Crossings with Operational gates
SELECT * FROM LevelCrossings
WHERE GateStatus = 'Operational';

-- 11. Contact info of attendants
SELECT AttendantName, ContactNumber, Location FROM LevelCrossings;

-- 12. Days until next inspection
SELECT CrossingID, DATEDIFF(NextInspection, CURDATE()) AS DaysToNextInspection
FROM LevelCrossings;

-- 13. Window function: rank crossings by NextInspection
SELECT CrossingID, Location, NextInspection,
       RANK() OVER (ORDER BY NextInspection ASC) AS InspectionRank
FROM LevelCrossings;

-- 14. Dense rank crossings by TrackID
SELECT TrackID, CrossingID, NextInspection,
       DENSE_RANK() OVER (PARTITION BY TrackID ORDER BY NextInspection ASC) AS TrackRank
FROM LevelCrossings;

-- 15. Crossings needing inspection within 7 days
SELECT * FROM LevelCrossings
WHERE NextInspection <= DATE_ADD(CURDATE(), INTERVAL 7 DAY);

-- 16. Latest inspected crossing
SELECT * FROM LevelCrossings
WHERE LastInspection = (SELECT MAX(LastInspection) FROM LevelCrossings);

-- 17. Unmanned crossings
SELECT * FROM LevelCrossings
WHERE CrossingType = 'Unmanned';

-- 18. Built-in function: concatenate Location and Attendant
SELECT CONCAT(Location, ' - ', AttendantName) AS CrossingInfo
FROM LevelCrossings;

-- 19. User-defined function: days until next inspection for a crossing
DELIMITER //
CREATE FUNCTION fn_days_until_crossing_inspection(p_crossing_id INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE days_left INT;
  SELECT DATEDIFF(NextInspection, CURDATE()) INTO days_left
  FROM LevelCrossings
  WHERE CrossingID = p_crossing_id;
  RETURN days_left;
END //
DELIMITER ;

-- 20. Use UDF to get days until next inspection
SELECT CrossingID, Location, fn_days_until_crossing_inspection(CrossingID) AS DaysUntilNextInspection
FROM LevelCrossings;


-- Table 23: ControlRooms 
CREATE TABLE ControlRooms (
    ControlRoomID INT PRIMARY KEY AUTO_INCREMENT,
    Location VARCHAR(100),
    InCharge VARCHAR(100),
    ContactNumber VARCHAR(15),
    Shift VARCHAR(20),
    NoOfStaff INT,
    EquipmentStatus VARCHAR(20),
    LastAudit DATE,
    NextAudit DATE,
    Remarks TEXT
);

INSERT INTO ControlRooms (Location, InCharge, ContactNumber, Shift, NoOfStaff, EquipmentStatus, LastAudit, NextAudit, Remarks) 
VALUES
('Delhi HQ', 'Arun Verma', '9890011111', 'Day', 15, 'Good', '2025-06-01', '2025-07-01', 'All systems fine'),
('Kolkata HQ', 'Shreya Ghosh', '9890022222', 'Night', 12, 'Good', '2025-06-02', '2025-07-02', 'Working fine'),
('Hyderabad HQ', 'Kiran Rao', '9890033333', 'Day', 10, 'Good', '2025-06-03', '2025-07-03', 'Ok'),
('Jaipur HQ', 'Pradeep Singh', '9890044444', 'Night', 8, 'Good', '2025-06-04', '2025-07-04', 'Ok'),
('Lucknow HQ', 'Neha Sharma', '9890055555', 'Day', 9, 'Good', '2025-06-05', '2025-07-05', 'Ok'),
('Patna HQ', 'Ravi Ranjan', '9890066666', 'Night', 7, 'Good', '2025-06-06', '2025-07-06', 'Ok'),
('Bhopal HQ', 'Sunil Patel', '9890077777', 'Day', 11, 'Good', '2025-06-07', '2025-07-07', 'Ok'),
('Ranchi HQ', 'Anita Kumari', '9890088888', 'Night', 6, 'Good', '2025-06-08', '2025-07-08', 'Ok'),
('Indore HQ', 'Sandeep Joshi', '9890099999', 'Day', 10, 'Good', '2025-06-09', '2025-07-09', 'Ok'),
('Surat HQ', 'Alok Mehta', '9890010000', 'Night', 8, 'Good', '2025-06-10', '2025-07-10', 'Ok'),
('Ambala HQ', 'Rohit Sharma', '9890011112', 'Day', 9, 'Good', '2025-06-11', '2025-07-11', 'Ok'),
('Asansol HQ', 'Dipak Ghosh', '9890011212', 'Night', 7, 'Good', '2025-06-12', '2025-07-12', 'Ok'),
('Nanded HQ', 'Vinay Kulkarni', '9890011313', 'Day', 6, 'Good', '2025-06-13', '2025-07-13', 'Ok'),
('Kota HQ', 'Rajesh Gupta', '9890011414', 'Night', 5, 'Good', '2025-06-14', '2025-07-14', 'Ok'),
('Varanasi HQ', 'Amit Tripathi', '9890011515', 'Day', 7, 'Good', '2025-06-15', '2025-07-15', 'Ok'),
('Muzaffarpur HQ', 'Pawan Kumar', '9890011616', 'Night', 8, 'Good', '2025-06-16', '2025-07-16', 'Ok'),
('Jabalpur HQ', 'Prashant Joshi', '9890011717', 'Day', 9, 'Good', '2025-06-17', '2025-07-17', 'Ok'),
('Dhanbad HQ', 'Vivek Sinha', '9890011818', 'Night', 7, 'Good', '2025-06-18', '2025-07-18', 'Ok'),
('Bhopal Sub', 'Shailendra Singh', '9890011919', 'Day', 8, 'Good', '2025-06-19', '2025-07-19', 'Ok'),
('Mumbai HQ', 'Ajay Malhotra', '9890012020', 'Night', 10, 'Good', '2025-06-20', '2025-07-20', 'Ok');

-- display table data
Select * from ControlRooms;

-- to delete values from table 
truncate table ControlRooms;

-- to delete table
drop table ControlRooms;

-- 1. Select all control rooms
SELECT * FROM ControlRooms;

-- 2. Control rooms with more than 10 staff
SELECT * FROM ControlRooms
WHERE NoOfStaff > 10;

-- 3. Control rooms in 'Delhi HQ' or 'Mumbai HQ'
SELECT * FROM ControlRooms
WHERE Location IN ('Delhi HQ', 'Mumbai HQ');

-- 4. Count of control rooms per Shift
SELECT Shift, COUNT(*) AS RoomCount
FROM ControlRooms
GROUP BY Shift;

-- 5. Control rooms with next audit in July 2025
SELECT * FROM ControlRooms
WHERE NextAudit BETWEEN '2025-07-01' AND '2025-07-31';

-- 6. Latest audit date
SELECT * FROM ControlRooms
WHERE LastAudit = (SELECT MAX(LastAudit) FROM ControlRooms);

-- 7. Earliest next audit date
SELECT * FROM ControlRooms
WHERE NextAudit = (SELECT MIN(NextAudit) FROM ControlRooms);

-- 8. Join with another table example (assuming MaintenanceLogs table exists)
SELECT cr.ControlRoomID, cr.Location, cr.InCharge, ml.MaintenanceDate, ml.Status
FROM ControlRooms cr
LEFT JOIN MaintenanceLogs ml ON cr.ControlRoomID = ml.ControlRoomID;

-- 9. Control rooms with 'Good' equipment
SELECT * FROM ControlRooms
WHERE EquipmentStatus = 'Good';

-- 10. Control rooms with staff between 7 and 10
SELECT * FROM ControlRooms
WHERE NoOfStaff BETWEEN 7 AND 10;

-- 11. Built-in function: concatenate Location and InCharge
SELECT ControlRoomID, CONCAT(Location, ' - ', InCharge) AS RoomInfo
FROM ControlRooms;

-- 12. Days until next audit
SELECT ControlRoomID, Location, DATEDIFF(NextAudit, CURDATE()) AS DaysUntilNextAudit
FROM ControlRooms;

-- 13. Window function: rank control rooms by NoOfStaff
SELECT ControlRoomID, Location, NoOfStaff,
       RANK() OVER (ORDER BY NoOfStaff DESC) AS StaffRank
FROM ControlRooms;

-- 14. Dense rank by Shift and NoOfStaff
SELECT Shift, ControlRoomID, NoOfStaff,
       DENSE_RANK() OVER (PARTITION BY Shift ORDER BY NoOfStaff DESC) AS ShiftRank
FROM ControlRooms;

-- 15. Subquery: Control rooms with max staff
SELECT * FROM ControlRooms
WHERE NoOfStaff = (SELECT MAX(NoOfStaff) FROM ControlRooms);

-- 16. Control rooms whose InCharge name starts with 'A'
SELECT * FROM ControlRooms
WHERE InCharge LIKE 'A%';

-- 17. Control rooms with audit due in next 10 days
SELECT * FROM ControlRooms
WHERE DATEDIFF(NextAudit, CURDATE()) <= 10;

-- 18. Aggregate: average number of staff
SELECT AVG(NoOfStaff) AS AvgStaff FROM ControlRooms;

-- 19. User-defined function: Check if equipment is due for audit
DELIMITER //
CREATE FUNCTION fn_audit_due(p_controlroom_id INT) RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
  DECLARE result VARCHAR(20);
  IF DATEDIFF((SELECT NextAudit FROM ControlRooms WHERE ControlRoomID = p_controlroom_id), CURDATE()) <= 0 THEN
    SET result = 'Due';
  ELSE
    SET result = 'Not Due';
  END IF;
  RETURN result;
END //
DELIMITER ;

-- 20. Use UDF to check audit status for each control room
SELECT ControlRoomID, Location, fn_audit_due(ControlRoomID) AS AuditStatus
FROM ControlRooms;

-- Table 24: Timetables
CREATE TABLE Timetables (
    TimetableID INT PRIMARY KEY AUTO_INCREMENT,
    TrainID INT,
    RouteID INT,
    DepartureStation VARCHAR(50),
    ArrivalStation VARCHAR(50),
    DepartureTime TIME,
    ArrivalTime TIME,
    Frequency VARCHAR(20),
    EffectiveFrom DATE,
    EffectiveTo DATE
);

INSERT INTO Timetables (TrainID, RouteID, DepartureStation, ArrivalStation, DepartureTime, ArrivalTime, Frequency, EffectiveFrom, EffectiveTo)
 VALUES
(101, 1, 'Delhi', 'Mumbai', '06:00:00', '18:00:00', 'Daily', '2025-07-01', '2025-12-31'),
(102, 2, 'Kolkata', 'Chennai', '07:00:00', '19:00:00', 'Daily', '2025-07-01', '2025-12-31'),
(103, 3, 'Hyderabad', 'Bengaluru', '08:00:00', '12:00:00', 'Daily', '2025-07-01', '2025-12-31'),
(104, 4, 'Jaipur', 'Pune', '05:30:00', '16:30:00', 'Mon-Sat', '2025-07-01', '2025-12-31'),
(105, 5, 'Lucknow', 'Ahmedabad', '09:00:00', '21:00:00', 'Daily', '2025-07-01', '2025-12-31'),
(106, 6, 'Patna', 'Guwahati', '10:00:00', '22:00:00', 'Daily', '2025-07-01', '2025-12-31'),
(107, 7, 'Bhopal', 'Nagpur', '06:45:00', '12:45:00', 'Daily', '2025-07-01', '2025-12-31'),
(108, 8, 'Ranchi', 'Vijayawada', '07:30:00', '19:30:00', 'Daily', '2025-07-01', '2025-12-31'),
(109, 9, 'Indore', 'Coimbatore', '05:15:00', '20:15:00', 'Daily', '2025-07-01', '2025-12-31'),
(110, 10, 'Surat', 'Kochi', '04:30:00', '22:30:00', 'Daily', '2025-07-01', '2025-12-31'),
(111, 1, 'Delhi', 'Ambala', '09:00:00', '12:00:00', 'Mon-Fri', '2025-07-01', '2025-12-31'),
(112, 2, 'Kolkata', 'Asansol', '10:00:00', '13:00:00', 'Daily', '2025-07-01', '2025-12-31'),
(113, 3, 'Hyderabad', 'Nanded', '06:00:00', '11:00:00', 'Daily', '2025-07-01', '2025-12-31'),
(114, 4, 'Jaipur', 'Kota', '07:30:00', '10:30:00', 'Daily', '2025-07-01', '2025-12-31'),
(115, 5, 'Lucknow', 'Varanasi', '05:45:00', '10:00:00', 'Daily', '2025-07-01', '2025-12-31'),
(116, 6, 'Patna', 'Muzaffarpur', '06:15:00', '08:45:00', 'Daily', '2025-07-01', '2025-12-31'),
(117, 7, 'Bhopal', 'Jabalpur', '07:00:00', '11:00:00', 'Daily', '2025-07-01', '2025-12-31'),
(118, 8, 'Ranchi', 'Dhanbad', '08:00:00', '10:30:00', 'Daily', '2025-07-01', '2025-12-31'),
(119, 9, 'Indore', 'Bhopal', '09:30:00', '11:30:00', 'Mon-Sat', '2025-07-01', '2025-12-31'),
(120, 10, 'Surat', 'Mumbai', '10:00:00', '14:00:00', 'Daily', '2025-07-01', '2025-12-31');

-- display table data
Select * from Timetables;

-- to delete values from table 
truncate table Timetables;

-- to delete table
drop table Timetables;

-- 1. Select all timetables
SELECT * FROM Timetables;

-- 2. Timetables for TrainID = 101
SELECT * FROM Timetables
WHERE TrainID = 101;

-- 3. Timetables departing from 'Delhi'
SELECT * FROM Timetables
WHERE DepartureStation = 'Delhi';

-- 4. Count of timetables per RouteID
SELECT RouteID, COUNT(*) AS TimetableCount
FROM Timetables
GROUP BY RouteID;

-- 5. Timetables effective in July 2025
SELECT * FROM Timetables
WHERE EffectiveFrom <= '2025-07-31' AND EffectiveTo >= '2025-07-01';

-- 6. Earliest departure timetable
SELECT * FROM Timetables
WHERE DepartureTime = (SELECT MIN(DepartureTime) FROM Timetables);

-- 7. Latest arrival timetable
SELECT * FROM Timetables
WHERE ArrivalTime = (SELECT MAX(ArrivalTime) FROM Timetables);

-- 8. Join with Trains table (assume Trains table exists with TrainID and TrainName)
SELECT t.TimetableID, t.DepartureStation, t.ArrivalStation, tr.TrainName, t.DepartureTime, t.ArrivalTime
FROM Timetables t
LEFT JOIN Trains tr ON t.TrainID = tr.TrainID;

-- 9. Timetables with Frequency 'Daily'
SELECT * FROM Timetables
WHERE Frequency = 'Daily';

-- 10. Timetables between 'Delhi' and 'Mumbai'
SELECT * FROM Timetables
WHERE DepartureStation = 'Delhi' AND ArrivalStation = 'Mumbai';

-- 11. Duration of each timetable in hours and minutes
SELECT TimetableID, DepartureStation, ArrivalStation, 
       TIMEDIFF(ArrivalTime, DepartureTime) AS Duration
FROM Timetables;

-- 12. Timetables starting before 07:00 AM
SELECT * FROM Timetables
WHERE DepartureTime < '07:00:00';

-- 13. Window function: rank timetables by DepartureTime
SELECT TimetableID, DepartureStation, ArrivalStation, DepartureTime,
       RANK() OVER (ORDER BY DepartureTime ASC) AS DepartureRank
FROM Timetables;

-- 14. Dense rank timetables by RouteID and DepartureTime
SELECT RouteID, TimetableID, DepartureTime,
       DENSE_RANK() OVER (PARTITION BY RouteID ORDER BY DepartureTime ASC) AS RouteRank
FROM Timetables;

-- 15. Timetables active today (CURDATE within EffectiveFrom/To)
SELECT * FROM Timetables
WHERE CURDATE() BETWEEN EffectiveFrom AND EffectiveTo;

-- 16. Subquery: Timetable with longest duration
SELECT * FROM Timetables
WHERE TIMEDIFF(ArrivalTime, DepartureTime) = (
    SELECT MAX(TIMEDIFF(ArrivalTime, DepartureTime)) FROM Timetables
);

-- 17. Timetables for RouteID = 1
SELECT * FROM Timetables
WHERE RouteID = 1;

-- 18. Built-in function: concatenate DepartureStation and ArrivalStation
SELECT TimetableID, CONCAT(DepartureStation, ' -> ', ArrivalStation) AS Route
FROM Timetables;

-- 19. User-defined function: calculate travel duration in minutes
DELIMITER //
CREATE FUNCTION fn_travel_minutes(p_timetable_id INT) RETURNS INT DETERMINISTIC
BEGIN
  DECLARE minutes INT;
  SELECT TIME_TO_SEC(TIMEDIFF(ArrivalTime, DepartureTime)) / 60 INTO minutes
  FROM Timetables
  WHERE TimetableID = p_timetable_id;
  RETURN minutes;
END //
DELIMITER ;

-- 20. Use UDF to get travel duration for each timetable
SELECT TimetableID, DepartureStation, ArrivalStation, fn_travel_minutes(TimetableID) AS DurationMinutes
FROM Timetables;


-- Table 25: Announcements
CREATE TABLE Announcements (
    AnnouncementID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Description TEXT,
    Date DATE,
    Time TIME,
    Station VARCHAR(50),
    AffectedTrains VARCHAR(100),
    ValidFrom DATE,
    ValidTo DATE,
    Status VARCHAR(20)
);

INSERT INTO Announcements (Title, Description, Date, Time, Station, AffectedTrains, ValidFrom, ValidTo, Status)
 VALUES
('Track Maintenance', 'Track maintenance work at Delhi Yard.', '2025-07-01', '09:00:00', 'Delhi', '101, 111', '2025-07-01', '2025-07-05', 'Active'),
('Power Shutdown', 'Power shutdown for overhead wires.', '2025-07-02', '10:00:00', 'Kolkata', '102, 112', '2025-07-02', '2025-07-06', 'Active'),
('Signal Upgrade', 'Signal upgrade at Secunderabad.', '2025-07-03', '11:00:00', 'Hyderabad', '103, 113', '2025-07-03', '2025-07-07', 'Active'),
('Platform Closure', 'Platform 3 closed for repairs.', '2025-07-04', '12:00:00', 'Jaipur', '104, 114', '2025-07-04', '2025-07-08', 'Active'),
('Special Train', 'Special train added for festival.', '2025-07-05', '13:00:00', 'Lucknow', '105, 115', '2025-07-05', '2025-07-10', 'Active'),
('Catering Delay', 'Delay in catering services.', '2025-07-06', '14:00:00', 'Patna', '106, 116', '2025-07-06', '2025-07-09', 'Active'),
('Signal Failure', 'Temporary signal failure.', '2025-07-07', '15:00:00', 'Bhopal', '107, 117', '2025-07-07', '2025-07-12', 'Active'),
('Track Inspection', 'Track inspection schedule.', '2025-07-08', '16:00:00', 'Ranchi', '108, 118', '2025-07-08', '2025-07-14', 'Active'),
('Bridge Repair', 'Bridge repair near Indore.', '2025-07-09', '17:00:00', 'Indore', '109, 119', '2025-07-09', '2025-07-15', 'Active'),
('Signal Testing', 'Signal testing in Surat.', '2025-07-10', '18:00:00', 'Surat', '110, 120', '2025-07-10', '2025-07-16', 'Active'),
('Holiday Rush', 'Extra coaches for holiday.', '2025-07-11', '09:00:00', 'Delhi', '101, 111', '2025-07-11', '2025-07-17', 'Active'),
('New Route', 'New route introduced.', '2025-07-12', '10:00:00', 'Kolkata', '102, 112', '2025-07-12', '2025-07-18', 'Active'),
('Weather Alert', 'Heavy rains expected.', '2025-07-13', '11:00:00', 'Hyderabad', '103, 113', '2025-07-13', '2025-07-19', 'Active'),
('Staff Strike', 'Possible staff strike.', '2025-07-14', '12:00:00', 'Jaipur', '104, 114', '2025-07-14', '2025-07-20', 'Active'),
('Festival Extra', 'Extra trains for Diwali.', '2025-07-15', '13:00:00', 'Lucknow', '105, 115', '2025-07-15', '2025-07-21', 'Active'),
('VIP Movement', 'VIP movement on platform.', '2025-07-16', '14:00:00', 'Patna', '106, 116', '2025-07-16', '2025-07-22', 'Active'),
('Security Drill', 'Security drill at station.', '2025-07-17', '15:00:00', 'Bhopal', '107, 117', '2025-07-17', '2025-07-23', 'Active'),
('Coach Addition', 'Extra coaches attached.', '2025-07-18', '16:00:00', 'Ranchi', '108, 118', '2025-07-18', '2025-07-24', 'Active'),
('Track Block', 'Track block for work.', '2025-07-19', '17:00:00', 'Indore', '109, 119', '2025-07-19', '2025-07-25', 'Active'),
('Maintenance Notice', 'Scheduled maintenance.', '2025-07-20', '18:00:00', 'Surat', '110, 120', '2025-07-20', '2025-07-26', 'Active');

-- display table data
Select * from Announcements;

-- to delete values from table 
truncate table Announcements;

-- to delete table
drop table Announcements;

-- 1. Select all announcements
SELECT * FROM Announcements;

-- 2. Announcements for 'Delhi' station
SELECT * FROM Announcements
WHERE Station = 'Delhi';

-- 3. Active announcements only
SELECT * FROM Announcements
WHERE Status = 'Active';

-- 4. Count of announcements per station
SELECT Station, COUNT(*) AS AnnouncementCount
FROM Announcements
GROUP BY Station;

-- 5. Announcements valid in July 2025
SELECT * FROM Announcements
WHERE ValidFrom <= '2025-07-31' AND ValidTo >= '2025-07-01';

-- 6. Latest announcement by date
SELECT * FROM Announcements
WHERE Date = (SELECT MAX(Date) FROM Announcements);

-- 7. Earliest ValidFrom date
SELECT * FROM Announcements
WHERE ValidFrom = (SELECT MIN(ValidFrom) FROM Announcements);

-- 8. Join example with Timetables table (affected trains)
SELECT a.AnnouncementID, a.Title, a.Station, t.TrainID, t.DepartureStation, t.ArrivalStation
FROM Announcements a
JOIN Timetables t ON FIND_IN_SET(t.TrainID, a.AffectedTrains);

-- 9. Announcements containing 'Signal' in title
SELECT * FROM Announcements
WHERE Title LIKE '%Signal%';

-- 10. Announcements between specific dates
SELECT * FROM Announcements
WHERE Date BETWEEN '2025-07-05' AND '2025-07-15';

-- 11. Built-in function: concatenate Title and Station
SELECT AnnouncementID, CONCAT(Title, ' at ', Station) AS AnnouncementInfo
FROM Announcements;

-- 12. Days remaining until ValidTo
SELECT AnnouncementID, Title, DATEDIFF(ValidTo, CURDATE()) AS DaysUntilExpiry
FROM Announcements;

-- 13. Window function: rank announcements by Date descending
SELECT AnnouncementID, Title, Date,
       RANK() OVER (ORDER BY Date DESC) AS DateRank
FROM Announcements;

-- 14. Dense rank by Station and Date
SELECT Station, AnnouncementID, Date,
       DENSE_RANK() OVER (PARTITION BY Station ORDER BY Date DESC) AS StationRank
FROM Announcements;

-- 15. Subquery: Announcement affecting most trains
SELECT * FROM Announcements
WHERE LENGTH(AffectedTrains) - LENGTH(REPLACE(AffectedTrains, ',', '')) + 1 =
      (SELECT MAX(LENGTH(AffectedTrains) - LENGTH(REPLACE(AffectedTrains, ',', '')) + 1) 
       FROM Announcements);

-- 16. Announcements with Title starting with 'Track'
SELECT * FROM Announcements
WHERE Title LIKE 'Track%';

-- 17. Announcements expiring in next 5 days
SELECT * FROM Announcements
WHERE DATEDIFF(ValidTo, CURDATE()) <= 5;

-- 18. Aggregate: total number of announcements
SELECT COUNT(*) AS TotalAnnouncements FROM Announcements;

-- 19. User-defined function: check if announcement is currently active
DELIMITER //
CREATE FUNCTION fn_is_active(p_announcement_id INT) RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
  DECLARE result VARCHAR(20);
  IF CURDATE() BETWEEN 
     (SELECT ValidFrom FROM Announcements WHERE AnnouncementID = p_announcement_id)
     AND 
     (SELECT ValidTo FROM Announcements WHERE AnnouncementID = p_announcement_id) THEN
    SET result = 'Active';
  ELSE
    SET result = 'Inactive';
  END IF;
  RETURN result;
END //
DELIMITER ;

-- 20. Use UDF to check current status of all announcements
SELECT AnnouncementID, Title, fn_is_active(AnnouncementID) AS CurrentStatus
FROM Announcements;
