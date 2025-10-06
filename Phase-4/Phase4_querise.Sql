
-- to create database Consulting Firm Management 
create database IndianRailway;

-- to work on database we need to use it 
use IndianRailway;

-- Delete all records use it
Drop Table IndianRailway;
-- --------------------------------------------- Database Analysis -----------------------------------------------------
-- 1. Get all stations in Maharashtra
SELECT * FROM Stations WHERE State = 'Maharashtra';

-- 2. Find stations with more than 15 platforms
SELECT StationName, PlatformCount FROM Stations WHERE PlatformCount > 15;

-- 3. List stations opened before 1900
SELECT StationName, OpenedYear FROM Stations WHERE OpenedYear < 1900;

-- 4. Order stations by platform count in descending order
SELECT StationName, PlatformCount FROM Stations ORDER BY PlatformCount DESC;

-- 5. Count number of stations per state
SELECT State, COUNT(*) AS TotalStations FROM Stations GROUP BY State;

-- 6. Create a view for major stations with more than 10 platforms
CREATE VIEW MajorStations AS
SELECT StationID, StationName, City, State, PlatformCount
FROM Stations
WHERE PlatformCount > 10;

-- 7. Select all records from the created view
SELECT * FROM MajorStations;

-- 8. Add UNIQUE constraint on station code
ALTER TABLE Stations ADD CONSTRAINT UQ_StationCode UNIQUE (Code);

-- 9. Add CHECK constraint to ensure platform count is positive
ALTER TABLE Stations ADD CONSTRAINT CHK_PlatformCount CHECK (PlatformCount > 0);

-- 10. Create stored procedure to get stations by state
DELIMITER $$
CREATE PROCEDURE GetStationsByState(IN stateName VARCHAR(50))
BEGIN
  SELECT StationName, City, Zone FROM Stations WHERE State = stateName;
END $$
DELIMITER ;

-- 11. Call stored procedure to fetch stations in Uttar Pradesh
CALL GetStationsByState('Uttar Pradesh');

-- 12. Rank stations by platform count within each state
SELECT StationName, State, PlatformCount,
       RANK() OVER (PARTITION BY State ORDER BY PlatformCount DESC) AS RankInState
FROM Stations;

-- 13. Calculate running total of platforms across stations
SELECT StationName, PlatformCount,
       SUM(PlatformCount) OVER (ORDER BY StationID) AS RunningTotalPlatforms
FROM Stations;

-- 14. Insert a test station record
INSERT INTO Stations (StationName, Code, City, State, PlatformCount, Zone, OpenedYear, Electrified, Remarks)
VALUES ('Test Station', 'TSTN', 'TestCity', 'TestState', 4, 'TestZone', 2020, TRUE, 'For testing');

-- 15. Update remarks for Pune station
UPDATE Stations SET Remarks = 'Updated remark' WHERE StationName = 'Pune';

-- 16. Delete the test station record
DELETE FROM Stations WHERE StationName = 'Test Station';

-- 17. Demonstrate transaction with rollback
START TRANSACTION;
INSERT INTO Stations (StationName, Code, City, State, PlatformCount, Zone, OpenedYear, Electrified, Remarks)
VALUES ('Temp Station', 'TMPST', 'TempCity', 'TempState', 2, 'TestZone', 2021, FALSE, 'Temporary data');
ROLLBACK;

-- 18. Create a log table for station actions
CREATE TABLE StationLogs (
  LogID INT AUTO_INCREMENT PRIMARY KEY,
  StationID INT,
  Action VARCHAR(20),
  LogTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 19. Create trigger to insert log after new station is added
DELIMITER $$
CREATE TRIGGER trg_after_insert_station
AFTER INSERT ON Stations
FOR EACH ROW
BEGIN
  INSERT INTO StationLogs (StationID, Action) VALUES (NEW.StationID, 'INSERT');
END $$
DELIMITER ;

-- 20. Insert a record to test trigger and check logs
INSERT INTO Stations (StationName, Code, City, State, PlatformCount, Zone, OpenedYear, Electrified, Remarks)
VALUES ('Trigger Test', 'TRGT', 'TriggerCity', 'TriggerState', 3, 'TestZone', 2022, TRUE, 'Inserted for trigger test');
SELECT * FROM StationLogs;

-- 1. Get all Rajdhani trains
SELECT * FROM Trains WHERE Category = 'Rajdhani';

-- 2. Find trains with more than 20 coaches
SELECT TrainName, TotalCoaches FROM Trains WHERE TotalCoaches > 20;

-- 3. List trains starting from Mumbai CST
SELECT TrainNumber, TrainName FROM Trains WHERE SourceStation = 'Mumbai CST';

-- 4. Order trains by max speed descending
SELECT TrainName, MaxSpeed FROM Trains ORDER BY MaxSpeed DESC;

-- 5. Count trains by category
SELECT Category, COUNT(*) AS TotalTrains FROM Trains GROUP BY Category;

-- 6. Create a view of superfast trains
CREATE VIEW SuperfastTrains AS
SELECT TrainID, TrainName, SourceStation, DestinationStation, MaxSpeed
FROM Trains
WHERE Category = 'Superfast';

-- 7. Select all records from the view
SELECT * FROM SuperfastTrains;

-- 8. Add UNIQUE constraint on TrainNumber
ALTER TABLE Trains ADD CONSTRAINT UQ_TrainNumber UNIQUE (TrainNumber);

-- 9. Add CHECK constraint to ensure speed is positive
ALTER TABLE Trains ADD CONSTRAINT CHK_MaxSpeed CHECK (MaxSpeed > 0);

-- 10. Create stored procedure to get trains by source station
DELIMITER $$
CREATE PROCEDURE GetTrainsBySource(IN src VARCHAR(50))
BEGIN
  SELECT TrainNumber, TrainName, DestinationStation FROM Trains WHERE SourceStation = src;
END $$
DELIMITER ;

-- 11. Call stored procedure for Chennai trains
CALL GetTrainsBySource('Chennai');

-- 12. Rank trains by max speed within each category
SELECT TrainName, Category, MaxSpeed,
       RANK() OVER (PARTITION BY Category ORDER BY MaxSpeed DESC) AS RankInCategory
FROM Trains;

-- 13. Running total of coaches ordered by TrainID
SELECT TrainName, TotalCoaches,
       SUM(TotalCoaches) OVER (ORDER BY TrainID) AS RunningTotalCoaches
FROM Trains;

-- 14. Insert a new test train
INSERT INTO Trains (TrainNumber, TrainName, SourceStation, DestinationStation, TotalCoaches, MaxSpeed, Category, RunningDays, Status)
VALUES ('99999', 'Test Express', 'TestCity', 'TestDest', 10, 100, 'Test', 'Weekly', 'Running');

-- 15. Update category of Gitanjali Exp
UPDATE Trains SET Category = 'Mail/Express' WHERE TrainName = 'Gitanjali Exp';

-- 16. Delete the test train
DELETE FROM Trains WHERE TrainNumber = '99999';

-- 17. Demonstrate transaction with rollback
START TRANSACTION;
INSERT INTO Trains (TrainNumber, TrainName, SourceStation, DestinationStation, TotalCoaches, MaxSpeed, Category, RunningDays, Status)
VALUES ('88888', 'Temp Express', 'TempCity', 'TempDest', 12, 105, 'Test', 'Daily', 'Running');
ROLLBACK;

-- 18. Create log table for trains
CREATE TABLE TrainLogs (
  LogID INT AUTO_INCREMENT PRIMARY KEY,
  TrainID INT,
  Action VARCHAR(20),
  LogTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 19. Create trigger to log inserts into TrainLogs
DELIMITER $$
CREATE TRIGGER trg_after_insert_train
AFTER INSERT ON Trains
FOR EACH ROW
BEGIN
  INSERT INTO TrainLogs (TrainID, Action) VALUES (NEW.TrainID, 'INSERT');
END $$
DELIMITER ;

-- 20. Insert a record to test trigger and check logs
INSERT INTO Trains (TrainNumber, TrainName, SourceStation, DestinationStation, TotalCoaches, MaxSpeed, Category, RunningDays, Status)
VALUES ('77777', 'Trigger Test Exp', 'TrigSrc', 'TrigDest', 8, 95, 'Test', 'Daily', 'Running');
SELECT * FROM TrainLogs;

-- 1. Get all female passengers
SELECT * FROM Passengers WHERE Gender = 'F';

-- 2. Find passengers older than 40
SELECT FirstName, LastName, Age FROM Passengers WHERE Age > 40;

-- 3. List passengers with Aadhaar as ID proof
SELECT FirstName, LastName, IDProofNumber FROM Passengers WHERE IDProofType = 'Aadhaar';

-- 4. Order passengers by age descending
SELECT FirstName, LastName, Age FROM Passengers ORDER BY Age DESC;

-- 5. Count passengers by ID proof type
SELECT IDProofType, COUNT(*) AS TotalPassengers FROM Passengers GROUP BY IDProofType;

-- 6. Create a view of passengers with Passport
CREATE VIEW PassportPassengers AS
SELECT PassengerID, FirstName, LastName, Email, IDProofNumber
FROM Passengers
WHERE IDProofType = 'Passport';

-- 7. Select all records from the created view
SELECT * FROM PassportPassengers;

-- 8. Add UNIQUE constraint on Email
ALTER TABLE Passengers ADD CONSTRAINT UQ_Email UNIQUE (Email);

-- 9. Add CHECK constraint to ensure age is greater than 0
ALTER TABLE Passengers ADD CONSTRAINT CHK_Age CHECK (Age > 0);

-- 10. Create stored procedure to get passengers by nationality
DELIMITER $$
CREATE PROCEDURE GetPassengersByNationality(IN nat VARCHAR(50))
BEGIN
  SELECT FirstName, LastName, Age, Gender FROM Passengers WHERE Nationality = nat;
END $$
DELIMITER ;

-- 11. Call stored procedure for Indian passengers
CALL GetPassengersByNationality('Indian');

-- 12. Rank passengers by age within each gender
SELECT FirstName, LastName, Gender, Age,
       RANK() OVER (PARTITION BY Gender ORDER BY Age DESC) AS RankInGender
FROM Passengers;

-- 13. Running total of passenger ages ordered by PassengerID
SELECT FirstName, LastName, Age,
       SUM(Age) OVER (ORDER BY PassengerID) AS RunningTotalAge
FROM Passengers;

-- 14. Insert a new test passenger
INSERT INTO Passengers (FirstName, LastName, Age, Gender, Phone, Email, IDProofType, IDProofNumber, Nationality)
VALUES ('Test', 'User', 30, 'M', '9000000000', 'testuser@gmail.com', 'Aadhaar', '9999-9999-9999', 'Indian');

-- 15. Update nationality of Priya Verma
UPDATE Passengers SET Nationality = 'NRI' WHERE FirstName = 'Priya' AND LastName = 'Verma';

-- 16. Delete the test passenger
DELETE FROM Passengers WHERE Email = 'testuser@gmail.com';

-- 17. Demonstrate transaction with rollback
START TRANSACTION;
INSERT INTO Passengers (FirstName, LastName, Age, Gender, Phone, Email, IDProofType, IDProofNumber, Nationality)
VALUES ('Temp', 'User', 22, 'F', '9111111111', 'tempuser@gmail.com', 'PAN', 'TEMP1234X', 'Indian');
ROLLBACK;

-- 18. Create log table for passenger actions
CREATE TABLE PassengerLogs (
  LogID INT AUTO_INCREMENT PRIMARY KEY,
  PassengerID INT,
  Action VARCHAR(20),
  LogTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 19. Create trigger to log inserts into PassengerLogs
DELIMITER $$
CREATE TRIGGER trg_after_insert_passenger
AFTER INSERT ON Passengers
FOR EACH ROW
BEGIN
  INSERT INTO PassengerLogs (PassengerID, Action) VALUES (NEW.PassengerID, 'INSERT');
END $$
DELIMITER ;

-- 20. Insert a record to test trigger and check logs
INSERT INTO Passengers (FirstName, LastName, Age, Gender, Phone, Email, IDProofType, IDProofNumber, Nationality)
VALUES ('Trigger', 'Test', 27, 'F', '9222222222', 'triggertest@gmail.com', 'Voter ID', 'TESTVOTER1', 'Indian');
SELECT * FROM PassengerLogs;

-- 1. View confirmed bookings (V)
SELECT * FROM Bookings WHERE BookingStatus = 'Confirmed';

-- 2. View cancelled bookings (V)
SELECT * FROM Bookings WHERE BookingStatus = 'Cancelled';

-- 3. Count total bookings (C)
SELECT COUNT(*) AS TotalBookings FROM Bookings;

-- 4. Count bookings by payment mode (C)
SELECT PaymentMode, COUNT(*) AS Total FROM Bookings GROUP BY PaymentMode;

-- 5. Stored procedure to get bookings by passenger ID (SP)
DELIMITER $$
CREATE PROCEDURE GetBookingsByPassenger(IN pid INT)
BEGIN
  SELECT * FROM Bookings WHERE PassengerID = pid;
END $$
DELIMITER ;

-- 6. Call stored procedure for passenger ID = 1 (SP)
CALL GetBookingsByPassenger(1);

-- 7. Window function to rank fares by JourneyDate (WF)
SELECT BookingID, PassengerID, Fare, JourneyDate,
       RANK() OVER (ORDER BY Fare DESC) AS FareRank
FROM Bookings;

-- 8. Window function to show running total of fares (WF)
SELECT BookingID, PassengerID, Fare,
       SUM(Fare) OVER (ORDER BY BookingID) AS RunningFare
FROM Bookings;

-- 9. Display bookings with JourneyDate after 2025-08-01 (D)
SELECT * FROM Bookings WHERE JourneyDate > '2025-08-01';

-- 10. Display bookings with BookingDate before 2025-07-15 (D)
SELECT * FROM Bookings WHERE BookingDate < '2025-07-15';

-- 11. Create CHECK constraint for Fare > 0 (TCL - constraint)
ALTER TABLE Bookings ADD CONSTRAINT CHK_Fare CHECK (Fare > 0);

-- 12. Create UNIQUE constraint on SeatNumber with JourneyDate (TCL - constraint)
ALTER TABLE Bookings ADD CONSTRAINT UQ_Seat UNIQUE (SeatNumber, JourneyDate);

-- 13. Demonstrate transaction with rollback (TCL)
START TRANSACTION;
INSERT INTO Bookings (PassengerID, TrainID, CoachType, SeatNumber, JourneyDate, BookingDate, BookingStatus, PaymentMode, Fare)
VALUES (1, 1, 'Sleeper', 'S5-99', '2025-08-20', '2025-08-10', 'Confirmed', 'UPI', 800.00);
ROLLBACK;

-- 14. Demonstrate transaction with commit (TCL)
START TRANSACTION;
INSERT INTO Bookings (PassengerID, TrainID, CoachType, SeatNumber, JourneyDate, BookingDate, BookingStatus, PaymentMode, Fare)
VALUES (2, 2, 'AC 2 Tier', 'A3-50', '2025-08-21', '2025-08-11', 'Confirmed', 'Cash', 1500.00);
COMMIT;

-- 15. Create trigger to log new booking inserts (Tri)
CREATE TABLE BookingLogs (
  LogID INT AUTO_INCREMENT PRIMARY KEY,
  BookingID INT,
  Action VARCHAR(20),
  LogTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 16. Trigger for insert logging (Tri)
DELIMITER $$
CREATE TRIGGER trg_after_booking_insert
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
  INSERT INTO BookingLogs (BookingID, Action) VALUES (NEW.BookingID, 'INSERT');
END $$
DELIMITER ;

-- 17. Insert record to test trigger (Tri)
INSERT INTO Bookings (PassengerID, TrainID, CoachType, SeatNumber, JourneyDate, BookingDate, BookingStatus, PaymentMode, Fare)
VALUES (3, 3, 'AC Chair Car', 'C3-22', '2025-08-25', '2025-08-15', 'Confirmed', 'UPI', 1000.00);

-- 18. View logs after trigger execution (Tri)
SELECT * FROM BookingLogs;

-- 19. View total fare collected by coach type (V & C)
SELECT CoachType, SUM(Fare) AS TotalFare FROM Bookings GROUP BY CoachType;

-- 20. Window function to get average fare per coach type (WF)
SELECT BookingID, CoachType, Fare,
       AVG(Fare) OVER (PARTITION BY CoachType) AS AvgFarePerCoach
FROM Bookings;

-- 1. View all confirmed tickets (V)
SELECT * FROM Tickets WHERE TicketStatus = 'Confirmed';

-- 2. View all cancelled tickets (V)
SELECT * FROM Tickets WHERE TicketStatus = 'Cancelled';

-- 3. Count total tickets issued (C)
SELECT COUNT(*) AS TotalTickets FROM Tickets;

-- 4. Count tickets by ticket type (C)
SELECT TicketType, COUNT(*) AS Total FROM Tickets GROUP BY TicketType;

-- 5. Stored procedure to get tickets by passenger ID (SP)
DELIMITER $$
CREATE PROCEDURE GetTicketsByPassenger(IN pid INT)
BEGIN
  SELECT * FROM Tickets WHERE PassengerID = pid;
END $$
DELIMITER ;

-- 6. Call stored procedure for PassengerID = 1 (SP)
CALL GetTicketsByPassenger(1);

-- 7. Window function to rank tickets by fare (WF)
SELECT TicketID, PassengerID, Fare,
       RANK() OVER (ORDER BY Fare DESC) AS FareRank
FROM Tickets;

-- 8. Window function to calculate running total of fares (WF)
SELECT TicketID, PassengerID, Fare,
       SUM(Fare) OVER (ORDER BY TicketID) AS RunningFare
FROM Tickets;

-- 9. Display tickets issued after 2025-07-20 (D)
SELECT * FROM Tickets WHERE IssueDate > '2025-07-20';

-- 10. Display tickets with fare greater than 1200 (D)
SELECT * FROM Tickets WHERE Fare > 1200;

-- 11. Add CHECK constraint for Fare > 0 (TCL - constraint)
ALTER TABLE Tickets ADD CONSTRAINT CHK_TicketFare CHECK (Fare > 0);

-- 12. Add UNIQUE constraint for SeatNumber per CoachNumber and IssueDate (TCL - constraint)
ALTER TABLE Tickets ADD CONSTRAINT UQ_TicketSeat UNIQUE (CoachNumber, SeatNumber, IssueDate);

-- 13. Transaction with rollback (TCL)
START TRANSACTION;
INSERT INTO Tickets (BookingID, PassengerID, TrainID, CoachNumber, SeatNumber, TicketType, TicketStatus, IssueDate, Fare)
VALUES (21, 21, 1, 'S5', '40', 'E-Ticket', 'Confirmed', '2025-08-01', 1000.00);
ROLLBACK;

-- 14. Transaction with commit (TCL)
START TRANSACTION;
INSERT INTO Tickets (BookingID, PassengerID, TrainID, CoachNumber, SeatNumber, TicketType, TicketStatus, IssueDate, Fare)
VALUES (22, 22, 2, 'A3', '50', 'Counter', 'Confirmed', '2025-08-02', 1500.00);
COMMIT;

-- 15. Create TicketLogs table for trigger (Tri)
CREATE TABLE TicketLogs (
  LogID INT AUTO_INCREMENT PRIMARY KEY,
  TicketID INT,
  Action VARCHAR(20),
  LogTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 16. Trigger to log new ticket inserts (Tri)
DELIMITER $$
CREATE TRIGGER trg_after_ticket_insert
AFTER INSERT ON Tickets
FOR EACH ROW
BEGIN
  INSERT INTO TicketLogs (TicketID, Action) VALUES (NEW.TicketID, 'INSERT');
END $$
DELIMITER ;

-- 17. Insert a ticket to test trigger (Tri)
INSERT INTO Tickets (BookingID, PassengerID, TrainID, CoachNumber, SeatNumber, TicketType, TicketStatus, IssueDate, Fare)
VALUES (23, 23, 3, 'C3', '22', 'E-Ticket', 'Confirmed', '2025-08-03', 1100.00);

-- 18. View logs created by trigger (Tri)
SELECT * FROM TicketLogs;

-- 19. View total fare collected by ticket type (V & C)
SELECT TicketType, SUM(Fare) AS TotalFare FROM Tickets GROUP BY TicketType;

-- 20. Window function to show average fare per ticket type (WF)
SELECT TicketID, TicketType, Fare,
       AVG(Fare) OVER (PARTITION BY TicketType) AS AvgFarePerType
FROM Tickets;

-- 1. View all routes where SourceStation is Mumbai CST (V)
SELECT * FROM Routes WHERE SourceStation = 'Mumbai CST';

-- 2. View all routes having distance greater than 2000 km (V)
SELECT * FROM Routes WHERE TotalDistance > 2000;

-- 3. Count total number of routes (C)
SELECT COUNT(*) AS TotalRoutes FROM Routes;

-- 4. Count routes grouped by SourceStation (C)
SELECT SourceStation, COUNT(*) AS Total FROM Routes GROUP BY SourceStation;

-- 5. Stored procedure to get routes by TrainID (SP)
DELIMITER $$
CREATE PROCEDURE GetRoutesByTrain(IN tid INT)
BEGIN
  SELECT * FROM Routes WHERE TrainID = tid;
END $$
DELIMITER ;

-- 6. Call stored procedure for TrainID = 5 (SP)
CALL GetRoutesByTrain(5);

-- 7. Window function to rank routes by distance (WF)
SELECT RouteID, TrainID, TotalDistance,
       RANK() OVER (ORDER BY TotalDistance DESC) AS DistanceRank
FROM Routes;

-- 8. Window function to calculate running total of distance (WF)
SELECT RouteID, TrainID, TotalDistance,
       SUM(TotalDistance) OVER (ORDER BY RouteID) AS RunningDistance
FROM Routes;

-- 9. Display all routes with more than 15 stops (D)
SELECT * FROM Routes WHERE TotalStops > 15;

-- 10. Display all routes with EndTime earlier than StartTime (overnight trains) (D)
SELECT * FROM Routes WHERE EndTime < StartTime;

-- 11. Add CHECK constraint to ensure distance > 0 (TCL - constraint)
ALTER TABLE Routes ADD CONSTRAINT CHK_RouteDistance CHECK (TotalDistance > 0);

-- 12. Add UNIQUE constraint to ensure TrainID has only one active route (TCL - constraint)
ALTER TABLE Routes ADD CONSTRAINT UQ_TrainRoute UNIQUE (TrainID, RouteStatus);

-- 13. Transaction with rollback (TCL)
START TRANSACTION;
INSERT INTO Routes (TrainID, SourceStation, DestinationStation, TotalDistance, TotalStops, StartTime, EndTime, RouteStatus, Remarks)
VALUES (21, 'TestCity', 'TestDest', 100, 2, '10:00:00', '12:00:00', 'Active', 'Temp Route');
ROLLBACK;

-- 14. Transaction with commit (TCL)
START TRANSACTION;
INSERT INTO Routes (TrainID, SourceStation, DestinationStation, TotalDistance, TotalStops, StartTime, EndTime, RouteStatus, Remarks)
VALUES (22, 'CityX', 'CityY', 150, 3, '11:00:00', '14:00:00', 'Active', 'New Test Route');
COMMIT;

-- 15. Create RouteLogs table for trigger (Tri)
CREATE TABLE RouteLogs (
  LogID INT AUTO_INCREMENT PRIMARY KEY,
  RouteID INT,
  Action VARCHAR(20),
  LogTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 16. Trigger to log new route insert (Tri)
DELIMITER $$
CREATE TRIGGER trg_after_route_insert
AFTER INSERT ON Routes
FOR EACH ROW
BEGIN
  INSERT INTO RouteLogs (RouteID, Action) VALUES (NEW.RouteID, 'INSERT');
END $$
DELIMITER ;

-- 17. Insert a route to test trigger (Tri)
INSERT INTO Routes (TrainID, SourceStation, DestinationStation, TotalDistance, TotalStops, StartTime, EndTime, RouteStatus, Remarks)
VALUES (23, 'CityZ', 'CityW', 250, 4, '08:00:00', '13:00:00', 'Active', 'Trigger Test Route');

-- 18. View logs created by trigger (Tri)
SELECT * FROM RouteLogs;

-- 19. View average distance per SourceStation (V & C)
SELECT SourceStation, AVG(TotalDistance) AS AvgDistance FROM Routes GROUP BY SourceStation;

-- 20. Window function to calculate average stops per destination (WF)
SELECT RouteID, DestinationStation, TotalStops,
       AVG(TotalStops) OVER (PARTITION BY DestinationStation) AS AvgStopsPerDest
FROM Routes;

-- 1. View all AC coaches (V)
SELECT * FROM Coaches WHERE AC = TRUE;

-- 2. View all coaches with less than 5 available seats (V)
SELECT * FROM Coaches WHERE AvailableSeats < 5;

-- 3. Count total number of coaches (C)
SELECT COUNT(*) AS TotalCoaches FROM Coaches;

-- 4. Count coaches grouped by CoachType (C)
SELECT CoachType, COUNT(*) AS Total FROM Coaches GROUP BY CoachType;

-- 5. Stored procedure to get coaches by TrainID (SP)
DELIMITER $$
CREATE PROCEDURE GetCoachesByTrain(IN tid INT)
BEGIN
  SELECT * FROM Coaches WHERE TrainID = tid;
END $$
DELIMITER ;

-- 6. Call stored procedure for TrainID = 5 (SP)
CALL GetCoachesByTrain(5);

-- 7. Window function to rank coaches by capacity (WF)
SELECT CoachID, TrainID, Capacity,
       RANK() OVER (ORDER BY Capacity DESC) AS CapacityRank
FROM Coaches;

-- 8. Window function to calculate running total of capacity (WF)
SELECT CoachID, TrainID, Capacity,
       SUM(Capacity) OVER (ORDER BY CoachID) AS RunningCapacity
FROM Coaches;

-- 9. Display all coaches where OccupiedSeats > Capacity/2 (D)
SELECT * FROM Coaches WHERE OccupiedSeats > Capacity/2;

-- 10. Display all PantryAvailable coaches (D)
SELECT * FROM Coaches WHERE PantryAvailable = TRUE;

-- 11. Add CHECK constraint to ensure OccupiedSeats <= Capacity (TCL - constraint)
ALTER TABLE Coaches ADD CONSTRAINT CHK_OccupiedSeats CHECK (OccupiedSeats <= Capacity);

-- 12. Add UNIQUE constraint to ensure CoachNumber unique per TrainID (TCL - constraint)
ALTER TABLE Coaches ADD CONSTRAINT UQ_TrainCoach UNIQUE (TrainID, CoachNumber);

-- 13. Transaction with rollback (TCL)
START TRANSACTION;
INSERT INTO Coaches (TrainID, CoachNumber, CoachType, Capacity, OccupiedSeats, AvailableSeats, AC, PantryAvailable, Remarks)
VALUES (11, 'S7', 'Sleeper', 72, 60, 12, FALSE, FALSE, 'Temporary Coach');
ROLLBACK;

-- 14. Transaction with commit (TCL)
START TRANSACTION;
INSERT INTO Coaches (TrainID, CoachNumber, CoachType, Capacity, OccupiedSeats, AvailableSeats, AC, PantryAvailable, Remarks)
VALUES (12, 'B3', 'AC 3 Tier', 64, 55, 9, TRUE, TRUE, 'New AC Coach');
COMMIT;

-- 15. Create CoachLogs table for trigger (Tri)
CREATE TABLE CoachLogs (
  LogID INT AUTO_INCREMENT PRIMARY KEY,
  CoachID INT,
  Action VARCHAR(20),
  LogTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 16. Trigger to log new coach insert (Tri)
DELIMITER $$
CREATE TRIGGER trg_after_coach_insert
AFTER INSERT ON Coaches
FOR EACH ROW
BEGIN
  INSERT INTO CoachLogs (CoachID, Action) VALUES (NEW.CoachID, 'INSERT');
END $$
DELIMITER ;

-- 17. Insert a coach to test trigger (Tri)
INSERT INTO Coaches (TrainID, CoachNumber, CoachType, Capacity, OccupiedSeats, AvailableSeats, AC, PantryAvailable, Remarks)
VALUES (13, 'A2', 'AC 2 Tier', 48, 40, 8, TRUE, FALSE, 'Trigger Test Coach');

-- 18. View logs created by trigger (Tri)
SELECT * FROM CoachLogs;

-- 19. View average capacity per CoachType (V & C)
SELECT CoachType, AVG(Capacity) AS AvgCapacity FROM Coaches GROUP BY CoachType;

-- 20. Window function to calculate average occupied seats per TrainID (WF)
SELECT CoachID, TrainID, OccupiedSeats,
       AVG(OccupiedSeats) OVER (PARTITION BY TrainID) AS AvgOccupiedPerTrain
FROM Coaches;

-- 1. View all booked seats (V)
SELECT * FROM Seats WHERE IsBooked = TRUE;

-- 2. View all available seats (V)
SELECT * FROM Seats WHERE IsBooked = FALSE;

-- 3. Count total number of seats (C)
SELECT COUNT(*) AS TotalSeats FROM Seats;

-- 4. Count seats grouped by SeatType (C)
SELECT SeatType, COUNT(*) AS Total FROM Seats GROUP BY SeatType;

-- 5. Stored procedure to get seats by CoachID (SP)
DELIMITER $$
CREATE PROCEDURE GetSeatsByCoach(IN cid INT)
BEGIN
  SELECT * FROM Seats WHERE CoachID = cid;
END $$
DELIMITER ;

-- 6. Call stored procedure for CoachID = 3 (SP)
CALL GetSeatsByCoach(3);

-- 7. Window function to rank seats by TrainID (WF)
SELECT SeatID, TrainID,
       RANK() OVER (PARTITION BY TrainID ORDER BY SeatID) AS SeatRank
FROM Seats;

-- 8. Window function to calculate total seats booked per TrainID (WF)
SELECT SeatID, TrainID, IsBooked,
       SUM(CASE WHEN IsBooked THEN 1 ELSE 0 END) OVER (PARTITION BY TrainID) AS TotalBookedSeats
FROM Seats;

-- 9. Display all window seats (D)
SELECT * FROM Seats WHERE IsWindowSeat = TRUE;

-- 10. Display all non-window seats that are available (D)
SELECT * FROM Seats WHERE IsWindowSeat = FALSE AND IsBooked = FALSE;

-- 11. Add CHECK constraint to ensure PassengerID is present only if seat is booked (TCL - constraint)
ALTER TABLE Seats ADD CONSTRAINT CHK_PassengerBooking CHECK ((IsBooked = TRUE AND PassengerID IS NOT NULL) OR (IsBooked = FALSE AND PassengerID IS NULL));

-- 12. Add UNIQUE constraint to ensure SeatNumber unique per CoachID (TCL - constraint)
ALTER TABLE Seats ADD CONSTRAINT UQ_CoachSeat UNIQUE (CoachID, SeatNumber);

-- 13. Transaction with rollback (TCL)
START TRANSACTION;
INSERT INTO Seats (CoachID, SeatNumber, SeatType, IsWindowSeat, IsBooked, PassengerID, BookingID, TrainID, Remarks)
VALUES (8, 'S4-1', 'Sleeper', TRUE, TRUE, 15, 15, 7, 'Temp Booking');
ROLLBACK;

-- 14. Transaction with commit (TCL)
START TRANSACTION;
INSERT INTO Seats (CoachID, SeatNumber, SeatType, IsWindowSeat, IsBooked, PassengerID, BookingID, TrainID, Remarks)
VALUES (9, 'B2-1', 'AC 3 Tier', TRUE, TRUE, 16, 16, 8, 'Final Booking');
COMMIT;

-- 15. Create SeatLogs table for trigger (Tri)
CREATE TABLE SeatLogs (
  LogID INT AUTO_INCREMENT PRIMARY KEY,
  SeatID INT,
  Action VARCHAR(20),
  LogTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 16. Trigger to log new seat insert (Tri)
DELIMITER $$
CREATE TRIGGER trg_after_seat_insert
AFTER INSERT ON Seats
FOR EACH ROW
BEGIN
  INSERT INTO SeatLogs (SeatID, Action) VALUES (NEW.SeatID, 'INSERT');
END $$
DELIMITER ;

-- 17. Insert a seat to test trigger (Tri)
INSERT INTO Seats (CoachID, SeatNumber, SeatType, IsWindowSeat, IsBooked, PassengerID, BookingID, TrainID, Remarks)
VALUES (10, 'C2-1', 'Chair Car', TRUE, TRUE, 17, 17, 9, 'Trigger Test Seat');

-- 18. View logs created by trigger (Tri)
SELECT * FROM SeatLogs;

-- 19. View average seats booked per SeatType (V & C)
SELECT SeatType, AVG(CASE WHEN IsBooked THEN 1 ELSE 0 END) AS AvgBooked
FROM Seats GROUP BY SeatType;

-- 20. Window function to calculate average booked seats per CoachID (WF)
SELECT SeatID, CoachID, IsBooked,
       AVG(CASE WHEN IsBooked THEN 1 ELSE 0 END) OVER (PARTITION BY CoachID) AS AvgBookedPerCoach
FROM Seats;

-- 1. View all staff details (V)
SELECT * FROM Staff;

-- 2. View all Ticket Checkers (V)
SELECT * FROM Staff WHERE Role = 'Ticket Checker';

-- 3. Count total staff members (C)
SELECT COUNT(*) AS TotalStaff FROM Staff;

-- 4. Count staff grouped by Department (C)
SELECT Department, COUNT(*) AS DeptCount FROM Staff GROUP BY Department;

-- 5. Stored procedure to get staff by TrainID (SP)
DELIMITER $$
CREATE PROCEDURE GetStaffByTrain(IN tid INT)
BEGIN
  SELECT * FROM Staff WHERE TrainID = tid;
END $$
DELIMITER ;

-- 6. Call stored procedure for TrainID = 3 (SP)
CALL GetStaffByTrain(3);

-- 7. Window function to rank staff by JoinDate (WF)
SELECT StaffID, Name, JoinDate,
       RANK() OVER (ORDER BY JoinDate) AS JoinRank
FROM Staff;

-- 8. Window function to count staff per department (WF)
SELECT StaffID, Department,
       COUNT(*) OVER (PARTITION BY Department) AS StaffInDept
FROM Staff;

-- 9. Display all staff who joined after 2018 (D)
SELECT * FROM Staff WHERE JoinDate > '2018-01-01';

-- 10. Display all staff working Night shifts (D)
SELECT * FROM Staff WHERE Shift = 'Night';

-- 11. Add CHECK constraint for valid Shift values (TCL - constraint)
ALTER TABLE Staff ADD CONSTRAINT CHK_Shift CHECK (Shift IN ('Morning','Night'));

-- 12. Add UNIQUE constraint for Email addresses (TCL - constraint)
ALTER TABLE Staff ADD CONSTRAINT UQ_Email UNIQUE (Email);

-- 13. Transaction with rollback (TCL)
START TRANSACTION;
INSERT INTO Staff (Name, Role, Department, TrainID, Shift, Contact, Email, JoinDate, Remarks)
VALUES ('Temp Staff', 'Attendant', 'Onboard', 11, 'Morning', '9999999999', 'temp.staff@rail.in', '2025-01-01', 'Temporary');
ROLLBACK;

-- 14. Transaction with commit (TCL)
START TRANSACTION;
INSERT INTO Staff (Name, Role, Department, TrainID, Shift, Contact, Email, JoinDate, Remarks)
VALUES ('Final Staff', 'Cleaner', 'Housekeeping', 12, 'Night', '8888888888', 'final.staff@rail.in', '2025-02-01', 'Permanent');
COMMIT;

-- 15. Create StaffLogs table for trigger (Tri)
CREATE TABLE StaffLogs (
  LogID INT AUTO_INCREMENT PRIMARY KEY,
  StaffID INT,
  Action VARCHAR(20),
  LogTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 16. Trigger to log staff insert (Tri)
DELIMITER $$
CREATE TRIGGER trg_after_staff_insert
AFTER INSERT ON Staff
FOR EACH ROW
BEGIN
  INSERT INTO StaffLogs (StaffID, Action) VALUES (NEW.StaffID, 'INSERT');
END $$
DELIMITER ;

-- 17. Insert a staff member to test trigger (Tri)
INSERT INTO Staff (Name, Role, Department, TrainID, Shift, Contact, Email, JoinDate, Remarks)
VALUES ('Trigger Staff', 'Security', 'Security', 13, 'Night', '7777777777', 'trigger.staff@rail.in', '2025-03-01', 'Trigger Test');

-- 18. View StaffLogs entries (Tri)
SELECT * FROM StaffLogs;

-- 19. Count average staff per TrainID (C)
SELECT TrainID, COUNT(*) AS StaffCount FROM Staff GROUP BY TrainID;

-- 20. Window function to calculate average joining year per Department (WF)
SELECT StaffID, Department, YEAR(JoinDate) AS JoinYear,
       AVG(YEAR(JoinDate)) OVER (PARTITION BY Department) AS AvgJoinYear
FROM Staff;

-- 1. View all engineers (V)
SELECT * FROM Engineers;

-- 2. View engineers specialized in Mechanical (V)
SELECT * FROM Engineers WHERE Specialization = 'Mechanical';

-- 3. Count total engineers (C)
SELECT COUNT(*) AS TotalEngineers FROM Engineers;

-- 4. Count engineers by Department (C)
SELECT Department, COUNT(*) AS DeptCount FROM Engineers GROUP BY Department;

-- 5. Stored procedure to fetch engineers by TrainID (SP)
DELIMITER $$
CREATE PROCEDURE GetEngineersByTrain(IN tid INT)
BEGIN
  SELECT * FROM Engineers WHERE TrainID = tid;
END $$
DELIMITER ;

-- 6. Call stored procedure for TrainID = 3 (SP)
CALL GetEngineersByTrain(3);

-- 7. Window function to rank engineers by AssignedDate (WF)
SELECT EngineerID, Name, AssignedDate,
       RANK() OVER (ORDER BY AssignedDate) AS RankByDate
FROM Engineers;

-- 8. Window function to count engineers per specialization (WF)
SELECT EngineerID, Specialization,
       COUNT(*) OVER (PARTITION BY Specialization) AS EngCount
FROM Engineers;

-- 9. Display engineers assigned after 2018 (D)
SELECT * FROM Engineers WHERE AssignedDate > '2018-01-01';

-- 10. Display engineers with Certification 'Signal Cert' (D)
SELECT * FROM Engineers WHERE Certification = 'Signal Cert';

-- 11. Add CHECK constraint for Department values (TCL - constraint)
ALTER TABLE Engineers ADD CONSTRAINT CHK_Department CHECK (Department IN ('Maintenance','Operations'));

-- 12. Add UNIQUE constraint for Email (TCL - constraint)
ALTER TABLE Engineers ADD CONSTRAINT UQ_EngineerEmail UNIQUE (Email);

-- 13. Transaction with rollback (TCL)
START TRANSACTION;
INSERT INTO Engineers (Name, Specialization, Department, TrainID, Contact, Email, AssignedDate, Certification, Remarks)
VALUES ('Temp Engineer', 'Mechanical', 'Maintenance', 11, '9999999999', 'temp.eng@rail.in', '2025-01-01', 'Temp Cert', 'Temporary');
ROLLBACK;

-- 14. Transaction with commit (TCL)
START TRANSACTION;
INSERT INTO Engineers (Name, Specialization, Department, TrainID, Contact, Email, AssignedDate, Certification, Remarks)
VALUES ('Final Engineer', 'Electrical', 'Maintenance', 12, '8888888888', 'final.eng@rail.in', '2025-02-01', 'Final Cert', 'Permanent');
COMMIT;

-- 15. Create EngineersLog table for trigger (Tri)
CREATE TABLE EngineersLog (
  LogID INT AUTO_INCREMENT PRIMARY KEY,
  EngineerID INT,
  Action VARCHAR(20),
  LogTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 16. Trigger to log inserts in Engineers (Tri)
DELIMITER $$
CREATE TRIGGER trg_after_engineer_insert
AFTER INSERT ON Engineers
FOR EACH ROW
BEGIN
  INSERT INTO EngineersLog (EngineerID, Action) VALUES (NEW.EngineerID, 'INSERT');
END $$
DELIMITER ;

-- 17. Insert engineer to test trigger (Tri)
INSERT INTO Engineers (Name, Specialization, Department, TrainID, Contact, Email, AssignedDate, Certification, Remarks)
VALUES ('Trigger Engineer', 'Signal', 'Operations', 13, '7777777777', 'trigger.eng@rail.in', '2025-03-01', 'Trigger Cert', 'Trigger Test');

-- 18. View EngineersLog entries (Tri)
SELECT * FROM EngineersLog;

-- 19. Count engineers grouped by Specialization (C)
SELECT Specialization, COUNT(*) AS EngCount FROM Engineers GROUP BY Specialization;

-- 20. Window function to calculate average assignment year per Department (WF)
SELECT EngineerID, Department, YEAR(AssignedDate) AS AssignedYear,
       AVG(YEAR(AssignedDate)) OVER (PARTITION BY Department) AS AvgAssignedYear
FROM Engineers;

-- 1. View all schedules
SELECT * FROM TrainSchedules;

-- 2. View schedules with status 'On Time'
SELECT * FROM TrainSchedules WHERE Status = 'On Time';

-- 3. Count how many schedules exist
SELECT COUNT(*) AS TotalSchedules FROM TrainSchedules;

-- 4. Count trains scheduled to depart on '2025-07-22'
SELECT COUNT(*) AS DeparturesOnJuly22 FROM TrainSchedules WHERE DepartureDate = '2025-07-22';

-- 5. Find earliest departure time
SELECT MIN(DepartureTime) AS EarliestDeparture FROM TrainSchedules;

-- 6. Find latest arrival time
SELECT MAX(ArrivalTime) AS LatestArrival FROM TrainSchedules;

-- 7. Find distinct platform numbers used
SELECT DISTINCT PlatformNumber FROM TrainSchedules;

-- 8. Order trains by departure date
SELECT * FROM TrainSchedules ORDER BY DepartureDate ASC;

-- 9. Find schedule details for TrainID = 5
SELECT * FROM TrainSchedules WHERE TrainID = 5;

-- 10. Find schedules between 2025-07-22 and 2025-07-25
SELECT * FROM TrainSchedules WHERE DepartureDate BETWEEN '2025-07-22' AND '2025-07-25';

-- 11. Update status of TrainID 10 to 'Delayed'
UPDATE TrainSchedules SET Status = 'Delayed' WHERE TrainID = 10;

-- 12. Delete a schedule with ScheduleID = 20
DELETE FROM TrainSchedules WHERE ScheduleID = 20;

-- 13. Add a new column for TrainType
ALTER TABLE TrainSchedules ADD COLUMN TrainType VARCHAR(50);

-- 14. Rename column Remarks to Notes
ALTER TABLE TrainSchedules CHANGE Remarks Notes TEXT;

-- 15. Calculate total travel hours for each train
SELECT ScheduleID, TIMESTAMPDIFF(HOUR, CONCAT(DepartureDate,' ',DepartureTime), CONCAT(ArrivalDate,' ',ArrivalTime)) AS TravelHours
FROM TrainSchedules;

-- 16. Show average travel time of all trains
SELECT AVG(TIMESTAMPDIFF(HOUR, CONCAT(DepartureDate,' ',DepartureTime), CONCAT(ArrivalDate,' ',ArrivalTime))) AS AvgTravelHours
FROM TrainSchedules;

-- 17. Window function: Rank trains by DepartureDate
SELECT ScheduleID, TrainID, DepartureDate, RANK() OVER (ORDER BY DepartureDate) AS RankByDeparture
FROM TrainSchedules;

-- 18. Window function: Row number for each train by departure time
SELECT TrainID, DepartureTime, ROW_NUMBER() OVER (PARTITION BY TrainID ORDER BY DepartureTime) AS RowNum
FROM TrainSchedules;

-- 19. Window function: Row number for each train by departure time
SELECT TrainID, DepartureTime, ROW_NUMBER() OVER (PARTITION BY TrainID ORDER BY DepartureTime) AS RowNum
FROM TrainSchedules;

-- 20. Create stored procedure to update train status
DELIMITER $$
CREATE PROCEDURE UpdateTrainStatus(IN p_TrainID INT, IN p_Status VARCHAR(20))
BEGIN
    UPDATE TrainSchedules SET Status = p_Status WHERE TrainID = p_TrainID;
END $$
DELIMITER ;

-- 1. View all catering records
SELECT * FROM Catering;

-- 2. View only breakfast meals
SELECT * FROM Catering WHERE MealType = 'Breakfast';

-- 3. Count total catering services
SELECT COUNT(*) AS TotalCatering FROM Catering;

-- 4. Count meals served by each meal type
SELECT MealType, COUNT(*) AS CountMeals FROM Catering GROUP BY MealType;

-- 5. Find maximum quantity of meals served
SELECT MAX(Quantity) AS MaxQuantity FROM Catering;

-- 6. Find minimum quantity of meals served
SELECT MIN(Quantity) AS MinQuantity FROM Catering;

-- 7. Find distinct meal types available
SELECT DISTINCT MealType FROM Catering;

-- 8. Show all services ordered by ServiceTime
SELECT * FROM Catering ORDER BY ServiceTime ASC;

-- 9. Find catering details for TrainID = 10
SELECT * FROM Catering WHERE TrainID = 10;

-- 10. Find meals served between 12:00 and 14:00
SELECT * FROM Catering WHERE ServiceTime BETWEEN '12:00:00' AND '14:00:00';

-- 11. Update status of CateringID = 5 to 'Pending'
UPDATE Catering SET Status = 'Pending' WHERE CateringID = 5;

-- 12. Delete catering record of CateringID = 20
DELETE FROM Catering WHERE CateringID = 20;

-- 13. Add a new column for Price
ALTER TABLE Catering ADD COLUMN Price DECIMAL(8,2);

-- 14. Rename column Remarks to Notes
ALTER TABLE Catering CHANGE Remarks Notes TEXT;

-- 15. Subquery: Find meals with quantity greater than average quantity
SELECT * FROM Catering 
WHERE Quantity > (SELECT AVG(Quantity) FROM Catering);

-- 16. Subquery: Get vendors who served more than 1 meal type
SELECT VendorID FROM Catering 
GROUP BY VendorID HAVING COUNT(DISTINCT MealType) > 1;

-- 17. Window function: Rank vendors by total quantity served
SELECT VendorID, SUM(Quantity) AS TotalQty,
RANK() OVER (ORDER BY SUM(Quantity) DESC) AS RankByQuantity
FROM Catering GROUP BY VendorID;

-- 18. Window function: Assign row numbers by MealType
SELECT MealType, CateringID, ROW_NUMBER() OVER (PARTITION BY MealType ORDER BY ServiceTime) AS RowNum
FROM Catering;

-- 20. Create stored procedure to update catering status
DELIMITER $$
CREATE PROCEDURE UpdateCateringStatus(IN p_CateringID INT, IN p_Status VARCHAR(20))
BEGIN
    UPDATE Catering SET Status = p_Status WHERE CateringID = p_CateringID;
END $$
DELIMITER ;

-- 1. View all vendors
SELECT * FROM Vendors;

-- 2. View vendors from Mumbai
SELECT * FROM Vendors WHERE Address = 'Mumbai';

-- 3. Count total number of vendors
SELECT COUNT(*) AS TotalVendors FROM Vendors;

-- 4. Count vendors city-wise
SELECT Address, COUNT(*) AS VendorCount FROM Vendors GROUP BY Address;

-- 5. Find earliest contract start date
SELECT MIN(ContractStart) AS EarliestContract FROM Vendors;

-- 6. Find latest contract end date
SELECT MAX(ContractEnd) AS LatestContract FROM Vendors;

-- 7. Show distinct cities where vendors are located
SELECT DISTINCT Address FROM Vendors;

-- 8. Show vendors ordered by ContractEnd descending
SELECT * FROM Vendors ORDER BY ContractEnd DESC;

-- 9. Find vendor details with LicenseNo = 'LIC130'
SELECT * FROM Vendors WHERE LicenseNo = 'LIC130';

-- 10. Find vendors whose contracts expire in 2026
SELECT * FROM Vendors WHERE YEAR(ContractEnd) = 2026;

-- 11. Update remarks of VendorID = 5
UPDATE Vendors SET Remarks = 'Updated Special Meals' WHERE VendorID = 5;

-- 12. Delete vendor with VendorID = 20
DELETE FROM Vendors WHERE VendorID = 20;

-- 13. Add a new column for Rating
ALTER TABLE Vendors ADD COLUMN Rating INT;

-- 14. Rename column Remarks to Notes
ALTER TABLE Vendors CHANGE Remarks Notes TEXT;

-- 15. Subquery: Find vendors whose contract end date is later than average end date
SELECT * FROM Vendors
WHERE ContractEnd > (SELECT AVG(ContractEnd) FROM (SELECT ContractEnd FROM Vendors) AS T);

-- 16. Subquery: Get vendors from cities having more than 1 vendor
SELECT Address FROM Vendors GROUP BY Address HAVING COUNT(*) > 1;

-- 17. Window function: Rank vendors by contract duration
SELECT VendorID, Name, DATEDIFF(ContractEnd, ContractStart) AS Duration,
RANK() OVER (ORDER BY DATEDIFF(ContractEnd, ContractStart) DESC) AS RankByDuration
FROM Vendors;

-- 18. Window function: Assign row numbers to vendors city-wise
SELECT Address, VendorID, ROW_NUMBER() OVER (PARTITION BY Address ORDER BY VendorID) AS RowNum
FROM Vendors;

-- First create the log table if not exists
CREATE TABLE IF NOT EXISTS VendorLog (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    VendorID INT,
    Action VARCHAR(50),
    ActionDate DATETIME
);

-- Change delimiter for trigger creation
DELIMITER $$

CREATE TRIGGER AfterVendorDelete
AFTER DELETE ON Vendors
FOR EACH ROW
BEGIN
    INSERT INTO VendorLog (VendorID, Action, ActionDate)
    VALUES (OLD.VendorID, 'Deleted', NOW());
END $$

-- Reset delimiter back
DELIMITER ;

-- 20. Create stored procedure to update vendor remarks
DELIMITER $$
CREATE PROCEDURE UpdateVendorRemarks(IN p_VendorID INT, IN p_Remarks TEXT)
BEGIN
    UPDATE Vendors SET Notes = p_Remarks WHERE VendorID = p_VendorID;
END $$
DELIMITER ;

-- 1. View: Show all completed maintenance logs
CREATE VIEW CompletedLogs AS
SELECT * FROM MaintenanceLogs WHERE Status = 'Completed';

-- 2. View: Show upcoming maintenance due in July 2025
CREATE VIEW JulyDueLogs AS
SELECT * FROM MaintenanceLogs WHERE MONTH(NextDue) = 7 AND YEAR(NextDue) = 2025;

-- 3. Constraint: Add NOT NULL on IssueReported
ALTER TABLE MaintenanceLogs MODIFY IssueReported VARCHAR(100) NOT NULL;

-- 4. Constraint: Add check to ensure Status is only Completed or Pending
ALTER TABLE MaintenanceLogs ADD CONSTRAINT chk_status CHECK (Status IN ('Completed','Pending'));

-- 5. Constraint: Add foreign key TrainID (assuming Trains table exists)
ALTER TABLE MaintenanceLogs ADD CONSTRAINT fk_train FOREIGN KEY (TrainID) REFERENCES Trains(TrainID);

-- 6. Stored Procedure: Get logs by TrainID
DELIMITER $$
CREATE PROCEDURE GetLogsByTrain(IN tid INT)
BEGIN
    SELECT * FROM MaintenanceLogs WHERE TrainID = tid;
END$$
DELIMITER ;

-- 7. Stored Procedure: Insert new log
DELIMITER $$
CREATE PROCEDURE InsertLog(
    IN tid INT, IN eid INT, IN d DATE, IN t TIME, IN issue VARCHAR(100), IN action VARCHAR(100),
    IN stat VARCHAR(20), IN nd DATE, IN rem TEXT
)
BEGIN
    INSERT INTO MaintenanceLogs (TrainID, EngineerID, Date, Time, IssueReported, ActionTaken, Status, NextDue, Remarks)
    VALUES (tid, eid, d, t, issue, action, stat, nd, rem);
END$$
DELIMITER ;

-- 8. Window Function: Row number by TrainID
SELECT LogID, TrainID, ROW_NUMBER() OVER(PARTITION BY TrainID ORDER BY Date) AS RowNum
FROM MaintenanceLogs;

-- 9. Window Function: Count logs per train
SELECT TrainID, COUNT(*) OVER(PARTITION BY TrainID) AS TotalLogs
FROM MaintenanceLogs;

-- 10. Window Function: Latest log date per train
SELECT TrainID, MAX(Date) OVER(PARTITION BY TrainID) AS LatestLog
FROM MaintenanceLogs;

-- 11. DDL: Add new column for Cost
ALTER TABLE MaintenanceLogs ADD COLUMN Cost DECIMAL(10,2);

-- 12. DDL: Drop column Remarks
ALTER TABLE MaintenanceLogs DROP COLUMN Remarks;

-- 13. TCL: Start transaction, update status, rollback
START TRANSACTION;
UPDATE MaintenanceLogs SET Status = 'Pending' WHERE LogID = 1;
ROLLBACK;

-- 14. TCL: Start transaction, update status, commit
START TRANSACTION;
UPDATE MaintenanceLogs SET Status = 'Completed' WHERE LogID = 2;
COMMIT;

-- 15. TCL: Savepoint usage
START TRANSACTION;
UPDATE MaintenanceLogs SET Status = 'Pending' WHERE LogID = 3;
SAVEPOINT sp1;
UPDATE MaintenanceLogs SET Status = 'Completed' WHERE LogID = 4;
ROLLBACK TO sp1;
COMMIT;

-- 16. Trigger: Before insert, set default status to Pending if null
DELIMITER $$
CREATE TRIGGER BeforeInsertLog
BEFORE INSERT ON MaintenanceLogs
FOR EACH ROW
BEGIN
    IF NEW.Status IS NULL THEN
        SET NEW.Status = 'Pending';
    END IF;
END$$
DELIMITER ;

-- 17. Trigger: After insert, log message in separate table
CREATE TABLE IF NOT EXISTS MaintenanceAudit (
    AuditID INT PRIMARY KEY AUTO_INCREMENT,
    LogID INT,
    Action VARCHAR(50),
    ActionDate DATETIME
);

DELIMITER $$
CREATE TRIGGER AfterInsertLog
AFTER INSERT ON MaintenanceLogs
FOR EACH ROW
BEGIN
    INSERT INTO MaintenanceAudit (LogID, Action, ActionDate)
    VALUES (NEW.LogID, 'Inserted', NOW());
END$$
DELIMITER ;

-- 18. Trigger: After delete, log deletion
DELIMITER $$
CREATE TRIGGER AfterDeleteLog
AFTER DELETE ON MaintenanceLogs
FOR EACH ROW
BEGIN
    INSERT INTO MaintenanceAudit (LogID, Action, ActionDate)
    VALUES (OLD.LogID, 'Deleted', NOW());
END$$
DELIMITER ;

-- 19. View: Logs with engineer info (assuming Engineers table exists)
CREATE VIEW LogsWithEngineers AS
SELECT m.LogID, m.TrainID, e.EngineerName, m.IssueReported, m.ActionTaken
FROM MaintenanceLogs m
JOIN Engineers e ON m.EngineerID = e.EngineerID;

-- 20. Stored Procedure: Get logs by status
DELIMITER $$
CREATE PROCEDURE GetLogsByStatus(IN stat VARCHAR(20))
BEGIN
    SELECT * FROM MaintenanceLogs WHERE Status = stat;
END$$
DELIMITER ;

-- 1. View: All resolved complaints
CREATE VIEW ResolvedComplaints AS
SELECT * FROM Complaints WHERE Status = 'Resolved';

-- 2. View: Complaints by type (Cleanliness only)
CREATE VIEW CleanlinessComplaints AS
SELECT * FROM Complaints WHERE Type = 'Cleanliness';

-- 3. View: Complaints with TrainID and CoachID
CREATE VIEW ComplaintsTrainCoach AS
SELECT ComplaintID, TrainID, CoachID, Type, Status FROM Complaints;

-- 4. Constraint: Make Type NOT NULL
ALTER TABLE Complaints MODIFY Type VARCHAR(50) NOT NULL;

-- 5. Constraint: Status should only be Resolved or Pending
ALTER TABLE Complaints ADD CONSTRAINT chk_status CHECK (Status IN ('Resolved','Pending'));

-- 6. Constraint: Add foreign key TrainID (assuming Trains table exists)
ALTER TABLE Complaints ADD CONSTRAINT fk_complaints_train FOREIGN KEY (TrainID) REFERENCES Trains(TrainID);

-- 7. Stored Procedure: Get complaints by TrainID
DELIMITER $$
CREATE PROCEDURE GetComplaintsByTrain(IN tid INT)
BEGIN
    SELECT * FROM Complaints WHERE TrainID = tid;
END$$
DELIMITER ;

-- 8. Stored Procedure: Insert a new complaint
DELIMITER $$
CREATE PROCEDURE InsertComplaint(
    IN pid INT, IN tid INT, IN cid INT, IN d DATE, IN t TIME, IN tp VARCHAR(50), IN descp VARCHAR(255), IN stat VARCHAR(20), IN rem TEXT
)
BEGIN
    INSERT INTO Complaints (PassengerID, TrainID, CoachID, Date, Time, Type, Description, Status, Remarks)
    VALUES (pid, tid, cid, d, t, tp, descp, stat, rem);
END$$
DELIMITER ;

-- 9. Stored Procedure: Get complaints by type
DELIMITER $$
CREATE PROCEDURE GetComplaintsByType(IN tp VARCHAR(50))
BEGIN
    SELECT * FROM Complaints WHERE Type = tp;
END$$
DELIMITER ;

-- 10. Window Function: Row number of complaints per TrainID
SELECT ComplaintID, TrainID, ROW_NUMBER() OVER(PARTITION BY TrainID ORDER BY Date) AS RowNum
FROM Complaints;

-- 11. Window Function: Count complaints per TrainID
SELECT TrainID, COUNT(*) OVER(PARTITION BY TrainID) AS TotalComplaints
FROM Complaints;

-- 12. Window Function: Latest complaint date per TrainID
SELECT TrainID, MAX(Date) OVER(PARTITION BY TrainID) AS LatestComplaint
FROM Complaints;

-- 13. DDL: Add new column Priority
ALTER TABLE Complaints ADD COLUMN Priority VARCHAR(20);

-- 14. DDL: Drop column Remarks
ALTER TABLE Complaints DROP COLUMN Remarks;

-- 15. TCL: Start transaction, update status, rollback
START TRANSACTION;
UPDATE Complaints SET Status = 'Pending' WHERE ComplaintID = 1;
ROLLBACK;

-- 16. TCL: Start transaction, update status, commit
START TRANSACTION;
UPDATE Complaints SET Status = 'Resolved' WHERE ComplaintID = 2;
COMMIT;

-- 17. TCL: Savepoint usage
START TRANSACTION;
UPDATE Complaints SET Status = 'Pending' WHERE ComplaintID = 3;
SAVEPOINT sp1;
UPDATE Complaints SET Status = 'Resolved' WHERE ComplaintID = 4;
ROLLBACK TO sp1;
COMMIT;

-- 18. Trigger: Before insert, default status Pending if NULL
DELIMITER $$
CREATE TRIGGER BeforeInsertComplaint
BEFORE INSERT ON Complaints
FOR EACH ROW
BEGIN
    IF NEW.Status IS NULL THEN
        SET NEW.Status = 'Pending';
    END IF;
END$$
DELIMITER ;

-- 19. Trigger: After insert, log complaint in audit table
CREATE TABLE IF NOT EXISTS ComplaintAudit (
    AuditID INT PRIMARY KEY AUTO_INCREMENT,
    ComplaintID INT,
    Action VARCHAR(50),
    ActionDate DATETIME
);

DELIMITER $$
CREATE TRIGGER AfterInsertComplaint
AFTER INSERT ON Complaints
FOR EACH ROW
BEGIN
    INSERT INTO ComplaintAudit (ComplaintID, Action, ActionDate)
    VALUES (NEW.ComplaintID, 'Inserted', NOW());
END$$
DELIMITER ;

-- 20. Trigger: After delete, log complaint deletion
DELIMITER $$
CREATE TRIGGER AfterDeleteComplaint
AFTER DELETE ON Complaints
FOR EACH ROW
BEGIN
    INSERT INTO ComplaintAudit (ComplaintID, Action, ActionDate)
    VALUES (OLD.ComplaintID, 'Deleted', NOW());
END$$
DELIMITER ;

-- 1. View: All delivered cargo
CREATE VIEW DeliveredCargo AS
SELECT * FROM Cargo WHERE Status = 'Delivered';

-- 2. View: Cargo with weight above 1000
CREATE VIEW HeavyCargo AS
SELECT CargoID, BookingID, TrainID, Weight, GoodsType FROM Cargo WHERE Weight > 1000;

-- 3. View: Cargo by route (Departure and Arrival stations)
CREATE VIEW CargoRoutes AS
SELECT CargoID, DepartureStation, ArrivalStation, GoodsType, Status FROM Cargo;

-- 4. Constraint: Weight must be greater than 0
ALTER TABLE Cargo ADD CONSTRAINT chk_weight CHECK (Weight > 0);

-- 5. Constraint: Status should be Delivered or Pending
ALTER TABLE Cargo ADD CONSTRAINT chk_status CHECK (Status IN ('Delivered','Pending'));

-- 6. Constraint: Make GoodsType NOT NULL
ALTER TABLE Cargo MODIFY GoodsType VARCHAR(50) NOT NULL;

-- 7. Stored Procedure: Get cargo by TrainID
DELIMITER $$
CREATE PROCEDURE GetCargoByTrain(IN tid INT)
BEGIN
    SELECT * FROM Cargo WHERE TrainID = tid;
END$$
DELIMITER ;

-- 8. Stored Procedure: Insert new cargo record
DELIMITER $$
CREATE PROCEDURE InsertCargo(
    IN bid INT, IN tid INT, IN ds VARCHAR(50), IN asn VARCHAR(50), IN wt DECIMAL(10,2), IN gt VARCHAR(50), IN dd DATE, IN ad DATE, IN st VARCHAR(20)
)
BEGIN
    INSERT INTO Cargo (BookingID, TrainID, DepartureStation, ArrivalStation, Weight, GoodsType, DepartureDate, ArrivalDate, Status)
    VALUES (bid, tid, ds, asn, wt, gt, dd, ad, st);
END$$
DELIMITER ;

-- 9. Stored Procedure: Get cargo by GoodsType
DELIMITER $$
CREATE PROCEDURE GetCargoByGoods(IN gtype VARCHAR(50))
BEGIN
    SELECT * FROM Cargo WHERE GoodsType = gtype;
END$$
DELIMITER ;

-- 10. Window Function: Row number of cargo per train
SELECT CargoID, TrainID, ROW_NUMBER() OVER(PARTITION BY TrainID ORDER BY DepartureDate) AS RowNum
FROM Cargo;

-- 11. Window Function: Total cargo count per train
SELECT TrainID, COUNT(*) OVER(PARTITION BY TrainID) AS CargoCount
FROM Cargo;

-- 12. Window Function: Max cargo weight per train
SELECT TrainID, MAX(Weight) OVER(PARTITION BY TrainID) AS MaxWeight
FROM Cargo;

-- 13. DDL: Add column Priority
ALTER TABLE Cargo ADD COLUMN Priority VARCHAR(20);

-- 14. DDL: Drop column Status
ALTER TABLE Cargo DROP COLUMN Status;

-- 15. TCL: Start transaction, update cargo weight, rollback
START TRANSACTION;
UPDATE Cargo SET Weight = 2000 WHERE CargoID = 1;
ROLLBACK;

-- 16. TCL: Start transaction, update cargo weight, commit
START TRANSACTION;
UPDATE Cargo SET Weight = 1800 WHERE CargoID = 2;
COMMIT;

-- 17. TCL: Savepoint example
START TRANSACTION;
UPDATE Cargo SET Weight = 1600 WHERE CargoID = 3;
SAVEPOINT sp1;
UPDATE Cargo SET Weight = 1700 WHERE CargoID = 4;
ROLLBACK TO sp1;
COMMIT;

-- 18. Window Function: Max cargo weight per train
SELECT TrainID, MAX(Weight) OVER(PARTITION BY TrainID) AS MaxWeight
FROM Cargo;

-- 19. Trigger: After insert, log cargo entry
CREATE TABLE IF NOT EXISTS CargoLog (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    CargoID INT,
    Action VARCHAR(50),
    ActionDate DATETIME
);

DELIMITER $$
CREATE TRIGGER AfterInsertCargo
AFTER INSERT ON Cargo
FOR EACH ROW
BEGIN
    INSERT INTO CargoLog (CargoID, Action, ActionDate)
    VALUES (NEW.CargoID, 'Inserted', NOW());
END$$
DELIMITER ;

-- 20. Trigger: After delete, log cargo deletion
DELIMITER $$
CREATE TRIGGER AfterDeleteCargo
AFTER DELETE ON Cargo
FOR EACH ROW
BEGIN
    INSERT INTO CargoLog (CargoID, Action, ActionDate)
    VALUES (OLD.CargoID, 'Deleted', NOW());
END$$
DELIMITER ;

-- 1. View all parcel records
SELECT * FROM Parcels; -- VC (View Content)

-- 2. View parcels with weight greater than 10 kg
SELECT * FROM Parcels WHERE Weight > 10; -- VC with condition

-- 3. Count total parcels delivered from Delhi
SELECT COUNT(*) AS TotalFromDelhi FROM Parcels WHERE SourceStation = 'Delhi'; -- VC aggregate

-- 4. Change status of a parcel
UPDATE Parcels SET Status = 'In Transit' WHERE ParcelID = 5; -- C (Command - Update)

-- 5. Insert a new parcel
INSERT INTO Parcels (BookingID, SenderName, ReceiverName, SourceStation, DestinationStation, Weight, DispatchDate, DeliveryDate, Status)
VALUES (21, 'Amar', 'Suresh', 'Delhi', 'Hyderabad', 8.40, '2025-07-21', '2025-07-22', 'Pending'); -- C (Command - Insert)

-- 6. Delete a parcel record
DELETE FROM Parcels WHERE ParcelID = 20; -- C (Command - Delete)

-- 7. Stored Procedure to fetch parcels by source station
DELIMITER //
CREATE PROCEDURE GetParcelsBySource(IN src VARCHAR(50))
BEGIN
  SELECT * FROM Parcels WHERE SourceStation = src;
END //
DELIMITER ; -- SP (Stored Procedure)

-- 8. Call stored procedure
CALL GetParcelsBySource('Delhi'); -- SP execution

-- 9. Window function to rank parcels by weight within each source station
SELECT ParcelID, SourceStation, Weight,
RANK() OVER(PARTITION BY SourceStation ORDER BY Weight DESC) AS WeightRank
FROM Parcels; -- WF (Window Function)

-- 10. Window function to calculate running total of weights
SELECT ParcelID, SourceStation, Weight,
SUM(Weight) OVER(ORDER BY DispatchDate) AS RunningTotalWeight
FROM Parcels; -- WF (Window Function)

-- 11. Select parcels dispatched between two dates
SELECT * FROM Parcels WHERE DispatchDate BETWEEN '2025-07-05' AND '2025-07-10'; -- D&TCL (Date & Time Condition)

-- 12. Select parcels delivered late (DeliveryDate > DispatchDate + 1)
SELECT * FROM Parcels WHERE DATEDIFF(DeliveryDate, DispatchDate) > 1; -- D&TCL

-- 13. Create a trigger to update status after insert
DELIMITER //
CREATE TRIGGER AfterParcelInsert
AFTER INSERT ON Parcels
FOR EACH ROW
BEGIN
  UPDATE Parcels SET Status = 'Processing' WHERE ParcelID = NEW.ParcelID;
END //
DELIMITER ; -- Tri (Trigger)

-- 14. Create a view for heavy parcels (weight > 12)
CREATE VIEW HeavyParcels AS
SELECT * FROM Parcels WHERE Weight > 12; -- VC (View creation)

-- 15. Select from HeavyParcels view
SELECT * FROM HeavyParcels; -- VC (View usage)

-- 16. Subquery to find parcels heavier than average weight
SELECT * FROM Parcels WHERE Weight > (SELECT AVG(Weight) FROM Parcels); -- SP (Subquery)

-- 17. Check if any parcels are still pending
SELECT EXISTS(SELECT 1 FROM Parcels WHERE Status = 'Pending') AS PendingExists; -- SP (Subquery)

-- 18. Group parcels by SourceStation and count
SELECT SourceStation, COUNT(*) AS ParcelCount FROM Parcels GROUP BY SourceStation; -- VC aggregate

-- 19. Find the max weight parcel per source station
SELECT SourceStation, MAX(Weight) AS MaxWeight FROM Parcels GROUP BY SourceStation; -- VC aggregate

-- 20. Create a trigger to prevent deleting delivered parcels
DELIMITER //
CREATE TRIGGER PreventDeliveredDelete
BEFORE DELETE ON Parcels
FOR EACH ROW
BEGIN
  IF OLD.Status = 'Delivered' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete delivered parcels';
  END IF;
END //
DELIMITER ; -- Tri (Trigger)

-- 1. View all freight bookings
SELECT * FROM FreightBookings; -- VC (View Content)

-- 2. View freight bookings with weight greater than 3000
SELECT * FROM FreightBookings WHERE Weight > 3000; -- VC with condition

-- 3. Count total bookings from Delhi
SELECT COUNT(*) AS TotalFromDelhi FROM FreightBookings WHERE SourceStation = 'Delhi'; -- VC aggregate

-- 4. Update status of a freight booking
UPDATE FreightBookings SET Status = 'In Transit' WHERE FreightID = 5; -- C (Command - Update)

-- 5. Insert a new freight booking
INSERT INTO FreightBookings (CustomerName, GoodsType, Quantity, Weight, SourceStation, DestinationStation, BookingDate, DeliveryDate, Status)
VALUES ('Omega Ltd', 'Cement', 40, 2000.00, 'Delhi', 'Bengaluru', '2025-07-21', '2025-07-22', 'Pending'); -- C (Command - Insert)

-- 6. Delete a freight booking record
DELETE FROM FreightBookings WHERE FreightID = 20; -- C (Command - Delete)

-- 7. Stored Procedure to fetch freight by source station
DELIMITER //
CREATE PROCEDURE GetFreightBySource(IN src VARCHAR(50))
BEGIN
  SELECT * FROM FreightBookings WHERE SourceStation = src;
END //
DELIMITER ; -- SP (Stored Procedure)

-- 8. Call stored procedure
CALL GetFreightBySource('Delhi'); -- SP execution

-- 9. Window function to rank bookings by weight within each source station
SELECT FreightID, SourceStation, Weight,
RANK() OVER(PARTITION BY SourceStation ORDER BY Weight DESC) AS WeightRank
FROM FreightBookings; -- WF (Window Function)

-- 10. Window function to calculate running total of booked weight
SELECT FreightID, SourceStation, Weight,
SUM(Weight) OVER(ORDER BY BookingDate) AS RunningTotalWeight
FROM FreightBookings; -- WF (Window Function)

-- 11. Select bookings between two dates
SELECT * FROM FreightBookings WHERE BookingDate BETWEEN '2025-07-05' AND '2025-07-10'; -- D&TCL (Date & Time Condition)

-- 12. Select bookings delivered late (DeliveryDate > BookingDate + 1)
SELECT * FROM FreightBookings WHERE DATEDIFF(DeliveryDate, BookingDate) > 1; -- D&TCL

-- 13. Create trigger to update status after insert
DELIMITER //
CREATE TRIGGER AfterFreightInsert
AFTER INSERT ON FreightBookings
FOR EACH ROW
BEGIN
  UPDATE FreightBookings SET Status = 'Processing' WHERE FreightID = NEW.FreightID;
END //
DELIMITER ; -- Tri (Trigger)

-- 14. Create view for heavy freight (Weight > 3000)
CREATE VIEW HeavyFreight AS
SELECT * FROM FreightBookings WHERE Weight > 3000; -- VC (View creation)

-- 15. Select from HeavyFreight view
SELECT * FROM HeavyFreight; -- VC (View usage)

-- 16. Subquery to find bookings heavier than average weight
SELECT * FROM FreightBookings WHERE Weight > (SELECT AVG(Weight) FROM FreightBookings); -- SP (Subquery)

-- 17. Check if any bookings are still pending
SELECT EXISTS(SELECT 1 FROM FreightBookings WHERE Status = 'Pending') AS PendingExists; -- SP (Subquery)

-- 18. Group bookings by SourceStation and count
SELECT SourceStation, COUNT(*) AS BookingCount FROM FreightBookings GROUP BY SourceStation; -- VC aggregate

-- 19. Find max weight booking per source station
SELECT SourceStation, MAX(Weight) AS MaxWeight FROM FreightBookings GROUP BY SourceStation; -- VC aggregate

-- 20. Create trigger to prevent deleting delivered bookings
DELIMITER //
CREATE TRIGGER PreventDeliveredDelete
BEFORE DELETE ON FreightBookings
FOR EACH ROW
BEGIN
  IF OLD.Status = 'Delivered' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete delivered bookings';
  END IF;
END //
DELIMITER ; -- Tri (Trigger)

-- 1. View all signals
SELECT * FROM Signals; -- VC (View Content)

-- 2. View signals by type 'LED'
SELECT * FROM Signals WHERE SignalType = 'LED'; -- VC with condition

-- 3. Count signals per location
SELECT Location, COUNT(*) AS SignalCount FROM Signals GROUP BY Location; -- VC aggregate

-- 4. Update status of a signal
UPDATE Signals SET Status = 'Under Maintenance' WHERE SignalID = 5; -- C (Command - Update)

-- 5. Insert a new signal
INSERT INTO Signals (RouteID, SignalType, Location, Status, LastCheckDate, NextCheckDate, MaintenanceStatus, MaintainedBy, Remarks)
VALUES (21, 'Semaphore', 'Patna Yard', 'Operational', '2025-07-01', '2025-08-01', 'Good', 'Engg Team D', 'New'); -- C (Command - Insert)

-- 6. Delete a signal record
DELETE FROM Signals WHERE SignalID = 20; -- C (Command - Delete)

-- 7. Stored Procedure to fetch signals by maintenance status
DELIMITER //
CREATE PROCEDURE GetSignalsByStatus(IN mstatus VARCHAR(20))
BEGIN
  SELECT * FROM Signals WHERE MaintenanceStatus = mstatus;
END //
DELIMITER ; -- SP (Stored Procedure)

-- 8. Call stored procedure
CALL GetSignalsByStatus('Good'); -- SP execution

-- 9. Window function to rank signals by last check date
SELECT SignalID, Location, LastCheckDate,
RANK() OVER(PARTITION BY Location ORDER BY LastCheckDate DESC) AS LastCheckRank
FROM Signals; -- WF (Window Function)

-- 10. Window function to count signals per type
SELECT SignalID, SignalType,
COUNT(*) OVER(PARTITION BY SignalType) AS TypeCount
FROM Signals; -- WF (Window Function)

-- 11. Select signals checked between two dates
SELECT * FROM Signals WHERE LastCheckDate BETWEEN '2025-06-15' AND '2025-06-20'; -- D&TCL (Date & Time Condition)

-- 12. Select signals due for check in next 7 days
SELECT * FROM Signals WHERE NextCheckDate <= DATE_ADD(CURDATE(), INTERVAL 7 DAY); -- D&TCL

-- 13. Create trigger to update MaintenanceStatus after insert
DELIMITER //
CREATE TRIGGER AfterSignalInsert
AFTER INSERT ON Signals
FOR EACH ROW
BEGIN
  UPDATE Signals SET MaintenanceStatus = 'Pending' WHERE SignalID = NEW.SignalID;
END //
DELIMITER ; -- Tri (Trigger)

-- 14. Create view for signals under maintenance
CREATE VIEW SignalsUnderMaintenance AS
SELECT * FROM Signals WHERE Status = 'Under Maintenance'; -- VC (View creation)

-- 15. Select from SignalsUnderMaintenance view
SELECT * FROM SignalsUnderMaintenance; -- VC (View usage)

-- 16. Subquery to find signals maintained by 'Engg Team A'
SELECT * FROM Signals WHERE MaintainedBy IN (SELECT DISTINCT MaintainedBy FROM Signals WHERE MaintainedBy = 'Engg Team A'); -- SP (Subquery)

-- 17. Check if any signals are non-operational
SELECT EXISTS(SELECT 1 FROM Signals WHERE Status != 'Operational') AS NonOperationalExists; -- SP (Subquery)

-- 18. Group signals by type and count
SELECT SignalType, COUNT(*) AS SignalCount FROM Signals GROUP BY SignalType; -- VC aggregate

-- 19. Find most recent LastCheckDate per signal type
SELECT SignalType, MAX(LastCheckDate) AS MostRecentCheck FROM Signals GROUP BY SignalType; -- VC aggregate

-- 20. Create trigger to prevent deletion of operational signals
DELIMITER //
CREATE TRIGGER PreventOperationalDelete
BEFORE DELETE ON Signals
FOR EACH ROW
BEGIN
  IF OLD.Status = 'Operational' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete operational signals';
  END IF;
END //
DELIMITER ; -- Tri (Trigger)

-- 1. View all tracks
SELECT * FROM Tracks; -- VC (View Content)

-- 2. View tracks with length greater than 150 KM
SELECT * FROM Tracks WHERE Length_KM > 150; -- VC with condition

-- 3. Count of tracks per MaintainedBy team
SELECT MaintainedBy, COUNT(*) AS TrackCount FROM Tracks GROUP BY MaintainedBy; -- VC aggregate

-- 4. Update condition status of a track
UPDATE Tracks SET ConditionStatus = 'Needs Repair' WHERE TrackID = 5; -- C (Command - Update)

-- 5. Insert a new track record
INSERT INTO Tracks (RouteID, SectionName, Length_KM, GaugeType, ConditionStatus, LastInspection, NextInspection, MaintainedBy, Remarks)
VALUES (21, 'Ahmedabad - Rajkot', 180.50, 'Broad', 'Good', '2025-07-01', '2025-08-01', 'Track Team D', 'New Section'); -- C (Command - Insert)

-- 6. Delete a track record
DELETE FROM Tracks WHERE TrackID = 20; -- C (Command - Delete)

-- 7. Stored Procedure to get tracks by condition status
DELIMITER //
CREATE PROCEDURE GetTracksByCondition(IN cstatus VARCHAR(20))
BEGIN
  SELECT * FROM Tracks WHERE ConditionStatus = cstatus;
END //
DELIMITER ; -- SP (Stored Procedure)

-- 8. Call stored procedure for 'Good' tracks
CALL GetTracksByCondition('Good'); -- SP execution

-- 9. Window function to rank tracks by Length_KM per MaintainedBy team
SELECT TrackID, SectionName, MaintainedBy, Length_KM,
RANK() OVER(PARTITION BY MaintainedBy ORDER BY Length_KM DESC) AS LengthRank
FROM Tracks; -- WF (Window Function)

-- 10. Window function to get running total of track lengths per MaintainedBy
SELECT TrackID, SectionName, MaintainedBy, Length_KM,
SUM(Length_KM) OVER(PARTITION BY MaintainedBy ORDER BY TrackID) AS RunningLength
FROM Tracks; -- WF (Window Function)

-- 11. Select tracks inspected between two dates
SELECT * FROM Tracks WHERE LastInspection BETWEEN '2025-06-10' AND '2025-06-15'; -- D&TCL (Date & Time Condition)

-- 12. Select tracks due for next inspection in next 10 days
SELECT * FROM Tracks WHERE NextInspection <= DATE_ADD(CURDATE(), INTERVAL 10 DAY); -- D&TCL

-- 13. Create trigger to update ConditionStatus after insert
DELIMITER //
CREATE TRIGGER AfterTrackInsert
AFTER INSERT ON Tracks
FOR EACH ROW
BEGIN
  UPDATE Tracks SET ConditionStatus = 'Pending Inspection' WHERE TrackID = NEW.TrackID;
END //
DELIMITER ; -- Tri (Trigger)

-- 14. Create view for tracks needing repair
CREATE VIEW TracksNeedingRepair AS
SELECT * FROM Tracks WHERE ConditionStatus = 'Needs Repair'; -- VC (View creation)

-- 15. Select from TracksNeedingRepair view
SELECT * FROM TracksNeedingRepair; -- VC (View usage)

-- 16. Subquery to find tracks maintained by 'Track Team A'
SELECT * FROM Tracks WHERE MaintainedBy IN (SELECT DISTINCT MaintainedBy FROM Tracks WHERE MaintainedBy = 'Track Team A'); -- SP (Subquery)

-- 17. Check if any tracks are 'Needs Repair'
SELECT EXISTS(SELECT 1 FROM Tracks WHERE ConditionStatus = 'Needs Repair') AS TracksNeedingRepairExists; -- SP (Subquery)

-- 18. Group tracks by GaugeType and count
SELECT GaugeType, COUNT(*) AS GaugeCount FROM Tracks GROUP BY GaugeType; -- VC aggregate

-- 19. Find longest track per MaintainedBy team
SELECT MaintainedBy, MAX(Length_KM) AS LongestTrack FROM Tracks GROUP BY MaintainedBy; -- VC aggregate

-- 20. Trigger to prevent deletion of tracks with 'Good' condition
DELIMITER //
CREATE TRIGGER PreventGoodTrackDelete
BEFORE DELETE ON Tracks
FOR EACH ROW
BEGIN
  IF OLD.ConditionStatus = 'Good' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete tracks in Good condition';
  END IF;
END //
DELIMITER ; -- Tri (Trigger)

-- 1. View all bridges
SELECT * FROM Bridges; -- VC (View Content)

-- 2. View bridges longer than 500 meters
SELECT * FROM Bridges WHERE Length_M > 500; -- VC with condition

-- 3. Count of bridges per Type
SELECT Type, COUNT(*) AS BridgeCount FROM Bridges GROUP BY Type; -- VC aggregate

-- 4. Update condition status of a bridge
UPDATE Bridges SET ConditionStatus = 'Needs Repair' WHERE BridgeID = 5; -- C (Command - Update)

-- 5. Insert a new bridge record
INSERT INTO Bridges (TrackID, BridgeName, Location, Length_M, Type, ConditionStatus, LastInspection, NextInspection, Remarks)
VALUES (21, 'Nagpur Flyover', 'Nagpur', 600.00, 'Steel', 'Good', '2025-07-01', '2025-08-01', 'New Bridge'); -- C (Command - Insert)

-- 6. Delete a bridge record
DELETE FROM Bridges WHERE BridgeID = 20; -- C (Command - Delete)

-- 7. Stored Procedure to get bridges by condition status
DELIMITER //
CREATE PROCEDURE GetBridgesByCondition(IN cstatus VARCHAR(20))
BEGIN
  SELECT * FROM Bridges WHERE ConditionStatus = cstatus;
END //
DELIMITER ; -- SP (Stored Procedure)

-- 8. Call stored procedure for 'Good' bridges
CALL GetBridgesByCondition('Good'); -- SP execution

-- 9. Window function to rank bridges by length per Type
SELECT BridgeID, BridgeName, Type, Length_M,
RANK() OVER(PARTITION BY Type ORDER BY Length_M DESC) AS LengthRank
FROM Bridges; -- WF (Window Function)

-- 10. Window function to get running total of bridge lengths per Type
SELECT BridgeID, BridgeName, Type, Length_M,
SUM(Length_M) OVER(PARTITION BY Type ORDER BY BridgeID) AS RunningLength
FROM Bridges; -- WF (Window Function)

-- 11. Select bridges inspected between two dates
SELECT * FROM Bridges WHERE LastInspection BETWEEN '2025-06-10' AND '2025-06-15'; -- D&TCL (Date & Time Condition)

-- 12. Select bridges due for next inspection in next 10 days
SELECT * FROM Bridges WHERE NextInspection <= DATE_ADD(CURDATE(), INTERVAL 10 DAY); -- D&TCL

-- 13. Create trigger to update ConditionStatus after insert
DELIMITER //
CREATE TRIGGER AfterBridgeInsert
AFTER INSERT ON Bridges
FOR EACH ROW
BEGIN
  UPDATE Bridges SET ConditionStatus = 'Pending Inspection' WHERE BridgeID = NEW.BridgeID;
END //
DELIMITER ; -- Tri (Trigger)

-- 14. Create view for bridges needing repair
CREATE VIEW BridgesNeedingRepair AS
SELECT * FROM Bridges WHERE ConditionStatus = 'Needs Repair'; -- VC (View creation)

-- 15. Select from BridgesNeedingRepair view
SELECT * FROM BridgesNeedingRepair; -- VC (View usage)

-- 16. Subquery to find bridges maintained on TrackID 1
SELECT * FROM Bridges WHERE TrackID IN (SELECT DISTINCT TrackID FROM Bridges WHERE TrackID = 1); -- SP (Subquery)

-- 17. Check if any bridges are 'Needs Repair'
SELECT EXISTS(SELECT 1 FROM Bridges WHERE ConditionStatus = 'Needs Repair') AS BridgesNeedingRepairExists; -- SP (Subquery)

-- 18. Group bridges by ConditionStatus and count
SELECT ConditionStatus, COUNT(*) AS StatusCount FROM Bridges GROUP BY ConditionStatus; -- VC aggregate

-- 19. Find longest bridge per Type
SELECT Type, MAX(Length_M) AS LongestBridge FROM Bridges GROUP BY Type; -- VC aggregate

-- 20. Trigger to prevent deletion of bridges in 'Good' condition
DELIMITER //
CREATE TRIGGER PreventGoodBridgeDelete
BEFORE DELETE ON Bridges
FOR EACH ROW
BEGIN
  IF OLD.ConditionStatus = 'Good' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete bridges in Good condition';
  END IF;
END //
DELIMITER ; -- Tri (Trigger)

-- 1. View all level crossings
SELECT * FROM LevelCrossings; -- VC (View Content)

-- 2. View level crossings that are unmanned
SELECT * FROM LevelCrossings WHERE CrossingType = 'Unmanned'; -- VC with Condition

-- 3. Count of level crossings per type
SELECT CrossingType, COUNT(*) AS CountPerType FROM LevelCrossings GROUP BY CrossingType; -- VC aggregate

-- 4. Update gate status for a specific crossing
UPDATE LevelCrossings SET GateStatus = 'Under Maintenance' WHERE CrossingID = 5; -- C (Command Update)

-- 5. Insert a new level crossing record
INSERT INTO LevelCrossings (TrackID, Location, CrossingType, GateStatus, AttendantName, ContactNumber, LastInspection, NextInspection, Remarks)
VALUES (21, 'Patna Ring Road', 'Manned', 'Operational', 'Ajay Kumar', '9876543230', '2025-07-01', '2025-08-01', 'New Crossing'); -- C (Command Insert)

-- 6. Delete a level crossing record
DELETE FROM LevelCrossings WHERE CrossingID = 20; -- C (Command Delete)

-- 7. Stored Procedure to get crossings by gate status
DELIMITER //
CREATE PROCEDURE GetCrossingsByStatus(IN gstatus VARCHAR(20))
BEGIN
  SELECT * FROM LevelCrossings WHERE GateStatus = gstatus;
END //
DELIMITER ; -- SP (Stored Procedure)

-- 8. Call stored procedure for 'Operational' crossings
CALL GetCrossingsByStatus('Operational'); -- SP execution

-- 9. Window function to rank crossings by TrackID
SELECT CrossingID, Location, TrackID,
RANK() OVER(PARTITION BY TrackID ORDER BY CrossingID) AS RankByTrack
FROM LevelCrossings; -- WF (Window Function)

-- 10. Window function to get cumulative crossings per TrackID
SELECT CrossingID, Location, TrackID,
COUNT(*) OVER(PARTITION BY TrackID ORDER BY CrossingID) AS CumulativeCount
FROM LevelCrossings; -- WF (Window Function)

-- 11. Select crossings inspected between two dates
SELECT * FROM LevelCrossings WHERE LastInspection BETWEEN '2025-06-05' AND '2025-06-15'; -- D&TCL (Date & Time Condition)

-- 12. Select crossings with next inspection within next 10 days
SELECT * FROM LevelCrossings WHERE NextInspection <= DATE_ADD(CURDATE(), INTERVAL 10 DAY); -- D&TCL

-- 13. Trigger to set GateStatus after insert
DELIMITER //
CREATE TRIGGER AfterCrossingInsert
AFTER INSERT ON LevelCrossings
FOR EACH ROW
BEGIN
  UPDATE LevelCrossings SET GateStatus = 'Pending Inspection' WHERE CrossingID = NEW.CrossingID;
END //
DELIMITER ; -- Tri (Trigger)

-- 14. Create view for unmanned crossings
CREATE VIEW UnmannedCrossings AS
SELECT * FROM LevelCrossings WHERE CrossingType = 'Unmanned'; -- VC (View creation)

-- 15. Select from UnmannedCrossings view
SELECT * FROM UnmannedCrossings; -- VC (View usage)

-- 16. Subquery to find crossings on TrackID 1
SELECT * FROM LevelCrossings WHERE TrackID IN (SELECT DISTINCT TrackID FROM LevelCrossings WHERE TrackID = 1); -- SP (Subquery)

-- 17. Check if any crossings are under maintenance
SELECT EXISTS(SELECT 1 FROM LevelCrossings WHERE GateStatus = 'Under Maintenance') AS CrossingsUnderMaintenance; -- SP (Subquery)

-- 18. Group crossings by GateStatus and count
SELECT GateStatus, COUNT(*) AS CountPerStatus FROM LevelCrossings GROUP BY GateStatus; -- VC aggregate

-- 19. Find earliest next inspection date
SELECT MIN(NextInspection) AS EarliestNextInspection FROM LevelCrossings; -- VC aggregate

-- 20. Trigger to prevent deletion of operational crossings
DELIMITER //
CREATE TRIGGER PreventOperationalCrossingDelete
BEFORE DELETE ON LevelCrossings
FOR EACH ROW
BEGIN
  IF OLD.GateStatus = 'Operational' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete crossings in Operational status';
  END IF;
END //
DELIMITER ; -- Tri (Trigger)

-- 1. View all control rooms
SELECT * FROM ControlRooms; -- VC (View Content)

-- 2. View control rooms with more than 8 staff
SELECT * FROM ControlRooms WHERE NoOfStaff > 8; -- VC with Condition

-- 3. Count of control rooms per shift
SELECT Shift, COUNT(*) AS CountPerShift FROM ControlRooms GROUP BY Shift; -- VC aggregate

-- 4. Update equipment status for a specific control room
UPDATE ControlRooms SET EquipmentStatus = 'Under Maintenance' WHERE ControlRoomID = 5; -- C (Command Update)

-- 5. Insert a new control room record
INSERT INTO ControlRooms (Location, InCharge, ContactNumber, Shift, NoOfStaff, EquipmentStatus, LastAudit, NextAudit, Remarks)
VALUES ('Guwahati HQ', 'Rohit Sharma', '9890012121', 'Day', 6, 'Good', '2025-07-01', '2025-08-01', 'Newly setup'); -- C (Command Insert)

-- 6. Delete a control room record
DELETE FROM ControlRooms WHERE ControlRoomID = 20; -- C (Command Delete)

-- 7. Stored Procedure to get control rooms by shift
DELIMITER //
CREATE PROCEDURE GetControlRoomsByShift(IN shft VARCHAR(20))
BEGIN
  SELECT * FROM ControlRooms WHERE Shift = shft;
END //
DELIMITER ; -- SP (Stored Procedure)

-- 8. Call stored procedure for 'Night' shift
CALL GetControlRoomsByShift('Night'); -- SP execution

-- 9. Window function to rank control rooms by staff
SELECT ControlRoomID, Location, NoOfStaff,
RANK() OVER(ORDER BY NoOfStaff DESC) AS RankByStaff
FROM ControlRooms; -- WF (Window Function)

-- 10. Window function to get cumulative staff per shift
SELECT ControlRoomID, Location, Shift, NoOfStaff,
SUM(NoOfStaff) OVER(PARTITION BY Shift ORDER BY ControlRoomID) AS CumulativeStaff
FROM ControlRooms; -- WF (Window Function)

-- 11. Select control rooms audited in June 2025
SELECT * FROM ControlRooms WHERE LastAudit BETWEEN '2025-06-01' AND '2025-06-30'; -- D&TCL (Date & Time Condition)

-- 12. Select control rooms with next audit within next 10 days
SELECT * FROM ControlRooms WHERE NextAudit <= DATE_ADD(CURDATE(), INTERVAL 10 DAY); -- D&TCL

-- 13. Trigger to set EquipmentStatus after insert
DELIMITER //
CREATE TRIGGER AfterControlRoomInsert
AFTER INSERT ON ControlRooms
FOR EACH ROW
BEGIN
  UPDATE ControlRooms SET EquipmentStatus = 'Pending Audit' WHERE ControlRoomID = NEW.ControlRoomID;
END //
DELIMITER ; -- Tri (Trigger)

-- 14. Create view for Day shift control rooms
CREATE VIEW DayShiftControlRooms AS
SELECT * FROM ControlRooms WHERE Shift = 'Day'; -- VC (View creation)

-- 15. Select from DayShiftControlRooms view
SELECT * FROM DayShiftControlRooms; -- VC (View usage)

-- 16. Subquery to find control rooms with more than average staff
SELECT * FROM ControlRooms WHERE NoOfStaff > (SELECT AVG(NoOfStaff) FROM ControlRooms); -- SP (Subquery)

-- 17. Check if any control rooms have EquipmentStatus 'Under Maintenance'
SELECT EXISTS(SELECT 1 FROM ControlRooms WHERE EquipmentStatus = 'Under Maintenance') AS RoomsUnderMaintenance; -- SP (Subquery)

-- 18. Group control rooms by EquipmentStatus and count
SELECT EquipmentStatus, COUNT(*) AS CountPerStatus FROM ControlRooms GROUP BY EquipmentStatus; -- VC aggregate

-- 19. Find earliest next audit date
SELECT MIN(NextAudit) AS EarliestNextAudit FROM ControlRooms; -- VC aggregate

-- 20. Trigger to prevent deletion of control rooms with Day shift
DELIMITER //
CREATE TRIGGER PreventDayShiftDelete
BEFORE DELETE ON ControlRooms
FOR EACH ROW
BEGIN
  IF OLD.Shift = 'Day' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete Day shift control rooms';
  END IF;
END //
DELIMITER ; -- Tri (Trigger)

-- 1. View all timetables
SELECT * FROM Timetables; -- VC (View Content)

-- 2. View timetables for a specific train
SELECT * FROM Timetables WHERE TrainID = 101; -- VC with Condition

-- 3. Count of timetables per route
SELECT RouteID, COUNT(*) AS CountPerRoute FROM Timetables GROUP BY RouteID; -- VC aggregate

-- 4. Update frequency of a timetable
UPDATE Timetables SET Frequency = 'Mon-Fri' WHERE TimetableID = 102; -- C (Command Update)

-- 5. Insert a new timetable record
INSERT INTO Timetables (TrainID, RouteID, DepartureStation, ArrivalStation, DepartureTime, ArrivalTime, Frequency, EffectiveFrom, EffectiveTo)
VALUES (121, 11, 'Nagpur', 'Pune', '06:00:00', '12:00:00', 'Daily', '2025-08-01', '2025-12-31'); -- C (Command Insert)

-- 6. Delete a timetable record
DELETE FROM Timetables WHERE TimetableID = 120; -- C (Command Delete)

-- 7. Stored Procedure to get timetable by departure station
DELIMITER //
CREATE PROCEDURE GetTimetableByDeparture(IN depSt VARCHAR(50))
BEGIN
  SELECT * FROM Timetables WHERE DepartureStation = depSt;
END //
DELIMITER ; -- SP (Stored Procedure)

-- 8. Call stored procedure for 'Delhi'
CALL GetTimetableByDeparture('Delhi'); -- SP execution

-- 9. Window function to rank timetables by departure time
SELECT TimetableID, TrainID, DepartureStation, ArrivalStation,
RANK() OVER(ORDER BY DepartureTime ASC) AS RankByDeparture
FROM Timetables; -- WF (Window Function)

-- 10. Window function to get cumulative number of timetables per route
SELECT TimetableID, RouteID, DepartureStation,
COUNT(TimetableID) OVER(PARTITION BY RouteID ORDER BY TimetableID) AS CumulativePerRoute
FROM Timetables; -- WF (Window Function)

-- 11. Select timetables effective in July 2025
SELECT * FROM Timetables WHERE EffectiveFrom <= '2025-07-31' AND EffectiveTo >= '2025-07-01'; -- D&TCL (Date & Time Condition)

-- 12. Select timetables starting before 07:00 AM
SELECT * FROM Timetables WHERE DepartureTime < '07:00:00'; -- D&TCL (Time Condition)

-- 13. Trigger to update Frequency after insert
DELIMITER //
CREATE TRIGGER AfterTimetableInsert
AFTER INSERT ON Timetables
FOR EACH ROW
BEGIN
  IF NEW.Frequency IS NULL THEN
    UPDATE Timetables SET Frequency = 'Daily' WHERE TimetableID = NEW.TimetableID;
  END IF;
END //
DELIMITER ; -- Tri (Trigger)

-- 14. Create view for Daily timetables
CREATE VIEW DailyTimetables AS
SELECT * FROM Timetables WHERE Frequency = 'Daily'; -- VC (View creation)

-- 15. Select from DailyTimetables view
SELECT * FROM DailyTimetables; -- VC (View usage)

-- 16. Subquery to find timetables with duration more than average
SELECT *, TIMEDIFF(ArrivalTime, DepartureTime) AS Duration
FROM Timetables
WHERE TIMEDIFF(ArrivalTime, DepartureTime) > 
(SELECT SEC_TO_TIME(AVG(TIME_TO_SEC(TIMEDIFF(ArrivalTime, DepartureTime)))) FROM Timetables); -- SP (Subquery)

-- 17. Check if any timetable is Mon-Sat
SELECT EXISTS(SELECT 1 FROM Timetables WHERE Frequency = 'Mon-Sat') AS HasMonSat; -- SP (Subquery)

-- 18. Group timetables by Frequency and count
SELECT Frequency, COUNT(*) AS CountPerFrequency FROM Timetables GROUP BY Frequency; -- VC aggregate

-- 19. Find earliest departure time
SELECT MIN(DepartureTime) AS EarliestDeparture FROM Timetables; -- VC aggregate

-- 20. Trigger to prevent deletion of Daily frequency timetables
DELIMITER //
CREATE TRIGGER PreventDailyDelete
BEFORE DELETE ON Timetables
FOR EACH ROW
BEGIN
  IF OLD.Frequency = 'Daily' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete Daily timetables';
  END IF;
END //
DELIMITER ; -- Tri (Trigger)

-- 1. View all announcements
SELECT * FROM Announcements; -- VC (View Content)

-- 2. View announcements for a specific station
SELECT * FROM Announcements WHERE Station = 'Delhi'; -- VC with Condition

-- 3. Count of announcements per station
SELECT Station, COUNT(*) AS AnnouncementCount FROM Announcements GROUP BY Station; -- VC aggregate

-- 4. Update status of an announcement
UPDATE Announcements SET Status = 'Inactive' WHERE AnnouncementID = 1; -- C (Command Update)

-- 5. Insert a new announcement
INSERT INTO Announcements (Title, Description, Date, Time, Station, AffectedTrains, ValidFrom, ValidTo, Status)
VALUES ('Maintenance Alert', 'Maintenance work at Pune', '2025-07-21', '09:00:00', 'Pune', '104,114', '2025-07-21', '2025-07-25', 'Active'); -- C (Command Insert)

-- 6. Delete an announcement
DELETE FROM Announcements WHERE AnnouncementID = 20; -- C (Command Delete)

-- 7. Stored Procedure to get announcements by station
DELIMITER //
CREATE PROCEDURE GetAnnouncementsByStation(IN st VARCHAR(50))
BEGIN
  SELECT * FROM Announcements WHERE Station = st;
END //
DELIMITER ; -- SP (Stored Procedure)

-- 8. Call stored procedure for 'Kolkata'
CALL GetAnnouncementsByStation('Kolkata'); -- SP execution

-- 9. Window function to rank announcements by date
SELECT AnnouncementID, Title, Station, Date,
RANK() OVER(ORDER BY Date ASC) AS RankByDate
FROM Announcements; -- WF (Window Function)

-- 10. Window function to count announcements per station cumulatively
SELECT AnnouncementID, Station, Date,
COUNT(AnnouncementID) OVER(PARTITION BY Station ORDER BY Date) AS CumulativeCount
FROM Announcements; -- WF (Window Function)

-- 11. Select announcements valid in July 2025
SELECT * FROM Announcements WHERE ValidFrom <= '2025-07-31' AND ValidTo >= '2025-07-01'; -- D&TCL (Date & Time Condition)

-- 12. Select announcements after 2 PM
SELECT * FROM Announcements WHERE Time > '14:00:00'; -- D&TCL (Time Condition)

-- 13. Trigger to auto-set Status to 'Active' after insert if null
DELIMITER //
CREATE TRIGGER AfterAnnouncementInsert
AFTER INSERT ON Announcements
FOR EACH ROW
BEGIN
  IF NEW.Status IS NULL THEN
    UPDATE Announcements SET Status = 'Active' WHERE AnnouncementID = NEW.AnnouncementID;
  END IF;
END //
DELIMITER ; -- Tri (Trigger)

-- 14. Create view for Active announcements
CREATE VIEW ActiveAnnouncements AS
SELECT * FROM Announcements WHERE Status = 'Active'; -- VC (View creation)

-- 15. Select from ActiveAnnouncements view
SELECT * FROM ActiveAnnouncements; -- VC (View usage)

-- 16. Subquery to find announcements affecting more than 2 trains
SELECT * FROM Announcements
WHERE CHAR_LENGTH(AffectedTrains) - CHAR_LENGTH(REPLACE(AffectedTrains, ',', '')) + 1 > 2; -- SP (Subquery)

-- 17. Check if any announcement is for 'Signal Upgrade'
SELECT EXISTS(SELECT 1 FROM Announcements WHERE Title = 'Signal Upgrade') AS HasSignalUpgrade; -- SP (Subquery)

-- 18. Group announcements by Status
SELECT Status, COUNT(*) AS CountPerStatus FROM Announcements GROUP BY Status; -- VC aggregate

-- 19. Find earliest announcement date
SELECT MIN(Date) AS EarliestAnnouncement FROM Announcements; -- VC aggregate

-- 20. Trigger to prevent deletion of Active announcements
DELIMITER //
CREATE TRIGGER PreventActiveDelete
BEFORE DELETE ON Announcements
FOR EACH ROW
BEGIN
  IF OLD.Status = 'Active' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete Active announcements';
  END IF;
END //
DELIMITER ; -- Tri (Trigger)

