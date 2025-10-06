-- to create database Consulting Firm Management 
create database IndianRailway;

-- to work on database we need to use it 
use IndianRailway;

-- Delete all records use it
Drop Table IndianRailway;
-- --------------------------------------------- Database Analysis -----------------------------------------------------

-- 1. DDL: Add a column for StationType
ALTER TABLE Stations ADD COLUMN StationType VARCHAR(50);

-- 2. DDL: Modify Zone column length
ALTER TABLE Stations MODIFY COLUMN Zone VARCHAR(100);

-- 3. DDL: Drop Remarks column
ALTER TABLE Stations DROP COLUMN Remarks;

-- 4. DML: Insert a new station
INSERT INTO Stations (StationName, Code, City, State, PlatformCount, Zone, OpenedYear, Electrified)
VALUES ('Thane', 'TNA', 'Thane', 'Maharashtra', 7, 'Central', 1853, TRUE);

-- 5. DML: Update PlatformCount for StationID 5
UPDATE Stations SET PlatformCount=12 WHERE StationID=5;

-- 6. DML: Delete station with StationID 20
DELETE FROM Stations WHERE StationID=20;

-- 7. DQL: Select all stations
SELECT * FROM Stations;

-- 8. DQL: Select StationName, City, State, PlatformCount
SELECT StationName, City, State, PlatformCount FROM Stations;

-- 9. DQL: Select stations in Maharashtra
SELECT * FROM Stations WHERE State='Maharashtra';

-- 10. DQL: Count stations by Zone
SELECT Zone, COUNT(*) AS TotalStations FROM Stations GROUP BY Zone;

-- 11. DQL: Select stations opened before 1900
SELECT * FROM Stations WHERE OpenedYear < 1900;

-- 12. DQL: Order stations by PlatformCount descending
SELECT * FROM Stations ORDER BY PlatformCount DESC;

-- 13. DQL: Select distinct states having stations
SELECT DISTINCT State FROM Stations;

-- 14. DQL: Select stations which are electrified
SELECT * FROM Stations WHERE Electrified=TRUE;

-- 15. DQL: Select stations with PlatformCount between 5 and 10
SELECT * FROM Stations WHERE PlatformCount BETWEEN 5 AND 10;

-- 16. Constraint: Make Code column NOT NULL
ALTER TABLE Stations MODIFY COLUMN Code CHAR(5) NOT NULL;

-- 17. Constraint: Add UNIQUE constraint on Code
ALTER TABLE Stations ADD CONSTRAINT unique_station_code UNIQUE (Code);

-- 18. Operator: Select stations in Maharashtra or West Bengal
SELECT * FROM Stations WHERE State IN ('Maharashtra', 'West Bengal');

-- 19. Operator: Select stations not in Rajasthan
SELECT * FROM Stations WHERE State <> 'Rajasthan';

-- 20. Operator: Select stations opened between 1850 and 1900
SELECT * FROM Stations WHERE OpenedYear BETWEEN 1850 AND 1900;

-- 1. DDL: Add a column for TrainType
ALTER TABLE Trains ADD COLUMN TrainType VARCHAR(50);

-- 2. DDL: Modify MaxSpeed column to allow larger speeds
ALTER TABLE Trains MODIFY COLUMN MaxSpeed INT(5);

-- 3. DDL: Drop Status column
ALTER TABLE Trains DROP COLUMN Status;

-- 4. DML: Insert a new train
INSERT INTO Trains (TrainNumber, TrainName, SourceStation, DestinationStation, TotalCoaches, MaxSpeed, Category, RunningDays)
VALUES ('12999', 'Coastal Exp', 'Mumbai CST', 'Goa', 22, 110, 'Superfast', 'Daily');

-- 5. DML: Update TotalCoaches for TrainID 5
UPDATE Trains SET TotalCoaches=24 WHERE TrainID=5;

-- 6. DML: Delete train with TrainID 20
DELETE FROM Trains WHERE TrainID=20;

-- 7. DQL: Select all trains
SELECT * FROM Trains;

-- 8. DQL: Select TrainName, SourceStation, DestinationStation
SELECT TrainName, SourceStation, DestinationStation FROM Trains;

-- 9. DQL: Select trains running from Mumbai CST
SELECT * FROM Trains WHERE SourceStation='Mumbai CST';

-- 10. DQL: Count trains by Category
SELECT Category, COUNT(*) AS TotalTrains FROM Trains GROUP BY Category;

-- 11. DQL: Select trains with MaxSpeed above 120
SELECT * FROM Trains WHERE MaxSpeed > 120;

-- 12. DQL: Order trains by TotalCoaches descending
SELECT * FROM Trains ORDER BY TotalCoaches DESC;

-- 13. DQL: Select distinct categories
SELECT DISTINCT Category FROM Trains;

-- 14. DQL: Select trains running on Daily schedule
SELECT * FROM Trains WHERE RunningDays='Daily';

-- 15. DQL: Select trains with TotalCoaches between 20 and 24
SELECT * FROM Trains WHERE TotalCoaches BETWEEN 20 AND 24;

-- 16. Constraint: Make TrainNumber NOT NULL
ALTER TABLE Trains MODIFY COLUMN TrainNumber VARCHAR(10) NOT NULL;

-- 17. Constraint: Add UNIQUE constraint on TrainNumber
ALTER TABLE Trains ADD CONSTRAINT unique_train_number UNIQUE (TrainNumber);

-- 18. Operator: Select trains from Mumbai CST or Howrah
SELECT * FROM Trains WHERE SourceStation IN ('Mumbai CST', 'Howrah');

-- 19. Operator: Select trains not going to New Delhi
SELECT * FROM Trains WHERE DestinationStation <> 'New Delhi';

-- 20. Operator: Select trains with TotalCoaches between 16 and 22
SELECT * FROM Trains WHERE TotalCoaches BETWEEN 16 AND 22;

-- 1. DDL: Add a new column
ALTER TABLE Passengers ADD COLUMN Address VARCHAR(100);

-- 2. DDL: Modify column size
ALTER TABLE Passengers MODIFY COLUMN Phone VARCHAR(20);

-- 3. DDL: Drop a column
ALTER TABLE Passengers DROP COLUMN Address;

-- 4. DML: Insert a new passenger
INSERT INTO Passengers (FirstName, LastName, Age, Gender, Phone, Email, IDProofType, IDProofNumber, Nationality)
VALUES ('Arjun', 'Kulkarni', 29, 'M', '9988776655', 'arjun@gmail.com', 'Aadhaar', '1111-2222-3333', 'Indian');

-- 5. DML: Update passenger email
UPDATE Passengers SET Email = 'updatedemail@gmail.com' WHERE PassengerID = 1;

-- 6. DML: Delete passenger by ID
DELETE FROM Passengers WHERE PassengerID = 2;

-- 7. DQL: Select all records
SELECT * FROM Passengers;

-- 8. DQL: Select passengers older than 35
SELECT FirstName, LastName, Age FROM Passengers WHERE Age > 35;

-- 9. DQL: Use ORDER BY
SELECT FirstName, LastName, Age FROM Passengers ORDER BY Age DESC;

-- 10. DQL: Use LIKE operator
SELECT FirstName, LastName FROM Passengers WHERE FirstName LIKE 'A%';

-- 11. DQL: Use IN operator
SELECT FirstName, Age FROM Passengers WHERE Age IN (25, 30, 35);

-- 12. DQL: Use BETWEEN
SELECT FirstName, Age FROM Passengers WHERE Age BETWEEN 30 AND 40;

-- 13. DQL: Use aggregate function COUNT
SELECT Gender, COUNT(*) AS Total FROM Passengers GROUP BY Gender;

-- 14. DQL: Use aggregate function AVG
SELECT AVG(Age) AS AverageAge FROM Passengers;

-- 15. DQL: Use alias
SELECT FirstName AS FName, LastName AS LName FROM Passengers;

-- 16. DQL: Use DISTINCT
SELECT DISTINCT Nationality FROM Passengers;

-- 17. Subquery: Find passengers older than average age
SELECT FirstName, Age FROM Passengers WHERE Age > (SELECT AVG(Age) FROM Passengers);

-- 18. Clause: LIMIT
SELECT * FROM Passengers LIMIT 5;

-- 19. Cascades: Create table with cascade
CREATE TABLE PassengerLogs (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerID INT,
    Action VARCHAR(50),
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 20. Operator: Use OR
SELECT FirstName, LastName, Age FROM Passengers WHERE Age < 25 OR Age > 40;

-- 1. DDL: Add a new column
ALTER TABLE Bookings ADD COLUMN TravelClass VARCHAR(20);

-- 2. DDL: Modify column type
ALTER TABLE Bookings MODIFY COLUMN Fare DECIMAL(12,2);

-- 3. DDL: Drop a column
ALTER TABLE Bookings DROP COLUMN TravelClass;

-- 4. DML: Insert a new booking
INSERT INTO Bookings (PassengerID, TrainID, CoachType, SeatNumber, JourneyDate, BookingDate, BookingStatus, PaymentMode, Fare)
VALUES (21, 11, 'AC 3 Tier', 'B3-10', '2025-08-10', '2025-08-01', 'Confirmed', 'UPI', 1300.00);

-- 5. DML: Update booking status
UPDATE Bookings SET BookingStatus = 'Cancelled' WHERE BookingID = 1;

-- 6. DML: Delete a booking by ID
DELETE FROM Bookings WHERE BookingID = 2;

-- 7. DQL: Select all bookings
SELECT * FROM Bookings;

-- 8. DQL: Select confirmed bookings
SELECT BookingID, PassengerID, TrainID FROM Bookings WHERE BookingStatus = 'Confirmed';

-- 9. DQL: Order bookings by Fare descending
SELECT BookingID, Fare FROM Bookings ORDER BY Fare DESC;

-- 10. DQL: Use LIKE to find seat numbers starting with 'S1'
SELECT BookingID, SeatNumber FROM Bookings WHERE SeatNumber LIKE 'S1%';

-- 11. DQL: Use IN operator
SELECT BookingID, PaymentMode FROM Bookings WHERE PaymentMode IN ('UPI','Cash');

-- 12. DQL: Use BETWEEN for fare range
SELECT BookingID, Fare FROM Bookings WHERE Fare BETWEEN 800 AND 1200;

-- 13. DQL: Aggregate function SUM
SELECT SUM(Fare) AS TotalRevenue FROM Bookings WHERE BookingStatus = 'Confirmed';

-- 14. DQL: Aggregate function COUNT by status
SELECT BookingStatus, COUNT(*) AS TotalBookings FROM Bookings GROUP BY BookingStatus;

-- 15. DQL: Use alias
SELECT BookingID AS B_ID, PassengerID AS P_ID, Fare AS TicketFare FROM Bookings;

-- 16. DQL: DISTINCT payment modes
SELECT DISTINCT PaymentMode FROM Bookings;

-- 17. Subquery: Get bookings with fare above average
SELECT BookingID, Fare FROM Bookings WHERE Fare > (SELECT AVG(Fare) FROM Bookings);

-- 18. Clause: LIMIT 5
SELECT * FROM Bookings LIMIT 5;

-- 19. Cascades: Create log table with cascade
CREATE TABLE BookingLogs (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    Action VARCHAR(50),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 20. Operator: Use OR
SELECT BookingID, Fare, BookingStatus FROM Bookings WHERE BookingStatus = 'Cancelled' OR Fare > 1400;

-- 1. DDL: Add a new column
ALTER TABLE Tickets ADD COLUMN TravelClass VARCHAR(20);

-- 2. DDL: Modify column type
ALTER TABLE Tickets MODIFY COLUMN Fare DECIMAL(12,2);

-- 3. DDL: Drop a column
ALTER TABLE Tickets DROP COLUMN TravelClass;

-- 4. DML: Insert a new ticket
INSERT INTO Tickets (BookingID, PassengerID, TrainID, CoachNumber, SeatNumber, TicketType, TicketStatus, IssueDate, Fare)
VALUES (21, 21, 11, 'B3', '12', 'E-Ticket', 'Confirmed', '2025-08-01', 1350.00);

-- 5. DML: Update ticket status
UPDATE Tickets SET TicketStatus = 'Cancelled' WHERE TicketID = 1;

-- 6. DML: Delete a ticket
DELETE FROM Tickets WHERE TicketID = 2;

-- 7. DQL: Select all tickets
SELECT * FROM Tickets;

-- 8. DQL: Select confirmed tickets only
SELECT TicketID, PassengerID, TrainID FROM Tickets WHERE TicketStatus = 'Confirmed';

-- 9. DQL: Order tickets by fare descending
SELECT TicketID, Fare FROM Tickets ORDER BY Fare DESC;

-- 10. DQL: Use LIKE operator
SELECT TicketID, SeatNumber FROM Tickets WHERE SeatNumber LIKE '1%';

-- 11. DQL: Use IN operator
SELECT TicketID, TicketType FROM Tickets WHERE TicketType IN ('E-Ticket','Counter');

-- 12. DQL: Use BETWEEN for fare range
SELECT TicketID, Fare FROM Tickets WHERE Fare BETWEEN 800 AND 1200;

-- 13. DQL: Aggregate SUM of fares
SELECT SUM(Fare) AS TotalFareCollected FROM Tickets WHERE TicketStatus = 'Confirmed';

-- 14. DQL: Count tickets by status
SELECT TicketStatus, COUNT(*) AS TotalTickets FROM Tickets GROUP BY TicketStatus;

-- 15. DQL: Alias usage
SELECT TicketID AS T_ID, PassengerID AS P_ID, Fare AS TicketFare FROM Tickets;

-- 16. DQL: DISTINCT ticket types
SELECT DISTINCT TicketType FROM Tickets;

-- 17. Subquery: Tickets with fare above average
SELECT TicketID, Fare FROM Tickets WHERE Fare > (SELECT AVG(Fare) FROM Tickets);

-- 18. Clause: LIMIT 5
SELECT * FROM Tickets LIMIT 5;

-- 19. Operator: Use OR
SELECT TicketID, TicketStatus, Fare FROM Tickets WHERE TicketStatus = 'Waiting' OR Fare > 1400;

-- 20. Create log table with cascade example
CREATE TABLE TicketLogs (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    TicketID INT,
    Action VARCHAR(50),
    FOREIGN KEY (TicketID) REFERENCES Tickets(TicketID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 1. DDL: Create table already done above

-- 2. DDL: Add a new column for RouteCategory
ALTER TABLE Routes ADD RouteCategory VARCHAR(30);

-- 3. DDL: Modify column datatype
ALTER TABLE Routes MODIFY COLUMN Remarks VARCHAR(200);

-- 4. DDL: Drop a column
ALTER TABLE Routes DROP COLUMN RouteCategory;

-- 5. DML: Insert a new record
INSERT INTO Routes (TrainID, SourceStation, DestinationStation, TotalDistance, TotalStops, StartTime, EndTime, RouteStatus, Remarks)
VALUES (21, 'Nagpur', 'New Delhi', 1100, 8, '14:00:00', '06:00:00', 'Active', 'Nagpur Express');

-- 6. DML: Update route status
UPDATE Routes SET RouteStatus='Inactive' WHERE RouteID=5;

-- 7. DML: Delete a route
DELETE FROM Routes WHERE RouteID=20;

-- 8. DQL: Select all routes
SELECT * FROM Routes;

-- 9. DQL: Select specific columns
SELECT SourceStation, DestinationStation, TotalDistance FROM Routes;

-- 10. DQL: Find routes longer than 2000 km
SELECT RouteID, SourceStation, DestinationStation FROM Routes WHERE TotalDistance > 2000;

-- 11. DQL: Routes starting from 'Mumbai CST'
SELECT * FROM Routes WHERE SourceStation='Mumbai CST';

-- 12. DQL: Count total active routes
SELECT COUNT(*) AS ActiveRoutes FROM Routes WHERE RouteStatus='Active';

-- 13. DQL: Order routes by distance
SELECT RouteID, SourceStation, DestinationStation, TotalDistance FROM Routes ORDER BY TotalDistance DESC;

-- 14. DQL: Get maximum distance route
SELECT MAX(TotalDistance) AS MaxDistance FROM Routes;

-- 15. DQL: Get minimum stops route
SELECT MIN(TotalStops) AS MinStops FROM Routes;

-- 16. DQL: Average route distance
SELECT AVG(TotalDistance) AS AvgDistance FROM Routes;

-- 17. C&C: Add NOT NULL constraint
ALTER TABLE Routes MODIFY SourceStation VARCHAR(50) NOT NULL;

-- 18. C&C: Add UNIQUE constraint
ALTER TABLE Routes ADD CONSTRAINT unique_train UNIQUE (TrainID);

-- 19. OP: Routes with distance between 1000 and 2000
SELECT RouteID, SourceStation, DestinationStation FROM Routes WHERE TotalDistance BETWEEN 1000 AND 2000;

-- 20. OP: Routes where destination is New Delhi or Lucknow
SELECT RouteID, SourceStation, DestinationStation FROM Routes WHERE DestinationStation IN ('New Delhi','Lucknow');

-- 1. DDL: Add a new column for CoachClass
ALTER TABLE Coaches ADD CoachClass VARCHAR(20);

-- 2. DDL: Modify datatype of Remarks column
ALTER TABLE Coaches MODIFY Remarks VARCHAR(200);

-- 3. DDL: Drop a column (CoachClass)
ALTER TABLE Coaches DROP COLUMN CoachClass;

-- 4. DDL: Rename table Coaches to TrainCoaches
ALTER TABLE Coaches RENAME TO TrainCoaches;

-- 5. DML: Insert a new coach record
INSERT INTO TrainCoaches (TrainID, CoachNumber, CoachType, Capacity, OccupiedSeats, AvailableSeats, AC, PantryAvailable, Remarks)
VALUES (11, 'S7', 'Sleeper', 72, 50, 22, FALSE, FALSE, 'New Sleeper Coach');

-- 6. DML: Update available seats
UPDATE TrainCoaches SET AvailableSeats = Capacity - OccupiedSeats WHERE CoachID = 3;

-- 7. DML: Delete a specific coach
DELETE FROM TrainCoaches WHERE CoachID = 20;

-- 8. DQL: Select all coaches
SELECT * FROM TrainCoaches;

-- 9. DQL: Select only AC coaches
SELECT CoachID, CoachNumber, CoachType FROM TrainCoaches WHERE AC = TRUE;

-- 10. DQL: Find sleeper coaches with more than 5 available seats
SELECT CoachNumber, AvailableSeats FROM TrainCoaches WHERE CoachType='Sleeper' AND AvailableSeats > 5;

-- 11. DQL: Count total AC coaches
SELECT COUNT(*) AS TotalACCoaches FROM TrainCoaches WHERE AC=TRUE;

-- 12. DQL: Average capacity of coaches
SELECT AVG(Capacity) AS AvgCapacity FROM TrainCoaches;

-- 13. DQL: Maximum occupied seats
SELECT MAX(OccupiedSeats) AS MaxOccupied FROM TrainCoaches;

-- 14. DQL: Minimum available seats
SELECT MIN(AvailableSeats) AS MinAvailable FROM TrainCoaches;

-- 15. DQL: Order coaches by capacity descending
SELECT CoachID, CoachNumber, Capacity FROM TrainCoaches ORDER BY Capacity DESC;

-- 16. C&C: Add NOT NULL constraint
ALTER TABLE TrainCoaches MODIFY CoachType VARCHAR(20) NOT NULL;

-- 17. C&C: Add UNIQUE constraint on CoachNumber
ALTER TABLE TrainCoaches ADD CONSTRAINT unique_coach_number UNIQUE (CoachNumber);

-- 18. OP: Coaches with available seats between 2 and 5
SELECT CoachID, CoachNumber, AvailableSeats FROM TrainCoaches WHERE AvailableSeats BETWEEN 2 AND 5;

-- 19. OP: Coaches that are either 'Sleeper' or 'AC 3 Tier'
SELECT CoachID, CoachNumber, CoachType FROM TrainCoaches WHERE CoachType IN ('Sleeper','AC 3 Tier');

-- 20. OP: Coaches that are AC but without Pantry
SELECT CoachID, CoachNumber, CoachType FROM TrainCoaches WHERE AC=TRUE AND PantryAvailable=FALSE;

-- 1. DDL: Add a new column for SeatClass
ALTER TABLE Seats ADD SeatClass VARCHAR(20);

-- 2. DDL: Modify datatype of Remarks column
ALTER TABLE Seats MODIFY Remarks VARCHAR(200);

-- 3. DDL: Drop column SeatClass
ALTER TABLE Seats DROP COLUMN SeatClass;

-- 4. DDL: Rename table Seats to TrainSeats
ALTER TABLE Seats RENAME TO TrainSeats;

-- 5. DML: Insert a new seat record
INSERT INTO TrainSeats (CoachID, SeatNumber, SeatType, IsWindowSeat, IsBooked, PassengerID, BookingID, TrainID, Remarks)
VALUES (8, 'S4-1', 'Sleeper', TRUE, FALSE, NULL, NULL, 7, 'Available');

-- 6. DML: Update booking status of a seat
UPDATE TrainSeats SET IsBooked = TRUE, PassengerID = 15, BookingID = 15, Remarks = 'Booked'
WHERE SeatID = 4;

-- 7. DML: Delete a seat record
DELETE FROM TrainSeats WHERE SeatID = 20;

-- 8. DQL: Select all seats
SELECT * FROM TrainSeats;

-- 9. DQL: Show only booked seats
SELECT SeatID, SeatNumber, SeatType FROM TrainSeats WHERE IsBooked = TRUE;

-- 10. DQL: Show only available seats
SELECT SeatNumber, SeatType FROM TrainSeats WHERE IsBooked = FALSE;

-- 11. DQL: Count total booked seats
SELECT COUNT(*) AS TotalBookedSeats FROM TrainSeats WHERE IsBooked = TRUE;

-- 12. DQL: Count total available window seats
SELECT COUNT(*) AS WindowAvailable FROM TrainSeats WHERE IsWindowSeat = TRUE AND IsBooked = FALSE;

-- 13. DQL: Find all AC 2 Tier seats
SELECT SeatID, SeatNumber FROM TrainSeats WHERE SeatType = 'AC 2 Tier';

-- 14. DQL: Find maximum SeatID
SELECT MAX(SeatID) AS MaxSeatID FROM TrainSeats;

-- 15. DQL: Order seats by TrainID then SeatNumber
SELECT SeatID, TrainID, SeatNumber FROM TrainSeats ORDER BY TrainID, SeatNumber;

-- 16. C&C: Add NOT NULL constraint
ALTER TABLE TrainSeats MODIFY SeatType VARCHAR(20) NOT NULL;

-- 17. C&C: Add UNIQUE constraint on SeatNumber
ALTER TABLE TrainSeats ADD CONSTRAINT unique_seat_number UNIQUE (SeatNumber);

-- 18. OP: Seats with SeatID between 5 and 10
SELECT SeatID, SeatNumber FROM TrainSeats WHERE SeatID BETWEEN 5 AND 10;

-- 19. OP: Seats that are either Sleeper or Chair Car
SELECT SeatID, SeatNumber, SeatType FROM TrainSeats WHERE SeatType IN ('Sleeper','Chair Car');

-- 20. OP: Window seats that are available
SELECT SeatID, SeatNumber FROM TrainSeats WHERE IsWindowSeat = TRUE AND IsBooked = FALSE;

-- 1. DDL: Add a new column for Salary
ALTER TABLE Staff ADD Salary DECIMAL(10,2);

-- 2. DDL: Modify datatype of Contact
ALTER TABLE Staff MODIFY Contact VARCHAR(20);

-- 3. DDL: Drop column Remarks
ALTER TABLE Staff DROP COLUMN Remarks;

-- 4. DDL: Rename table Staff to TrainStaff
ALTER TABLE Staff RENAME TO TrainStaff;

-- 5. DML: Insert a new staff record
INSERT INTO TrainStaff (Name, Role, Department, TrainID, Shift, Contact, Email, JoinDate, Salary)
VALUES ('Harish Kumar', 'Attendant', 'Onboard', 11, 'Morning', '9000000013', 'harish.att@rail.in', '2022-03-01', 25000.00);

-- 6. DML: Update salary of a staff member
UPDATE TrainStaff SET Salary = 40000.00 WHERE StaffID = 1;

-- 7. DML: Change department of a staff member
UPDATE TrainStaff SET Department = 'Operations' WHERE StaffID = 5;

-- 8. DML: Delete a staff record
DELETE FROM TrainStaff WHERE StaffID = 20;

-- 9. DQL: Select all staff details
SELECT * FROM TrainStaff;

-- 10. DQL: List only Ticket Checkers
SELECT StaffID, Name, TrainID FROM TrainStaff WHERE Role = 'Ticket Checker';

-- 11. DQL: Count total staff working in Catering
SELECT COUNT(*) AS CateringStaff FROM TrainStaff WHERE Department = 'Catering';

-- 12. DQL: Staff who joined after 2018
SELECT Name, Role, JoinDate FROM TrainStaff WHERE JoinDate > '2018-12-31';

-- 13. DQL: Order staff by JoinDate
SELECT StaffID, Name, JoinDate FROM TrainStaff ORDER BY JoinDate ASC;

-- 14. DQL: Get maximum salary
SELECT MAX(Salary) AS MaxSalary FROM TrainStaff;

-- 15. DQL: Get average salary of Security staff
SELECT AVG(Salary) AS AvgSecuritySalary FROM TrainStaff WHERE Department = 'Security';

-- 16. C&C: Add NOT NULL constraint on Name
ALTER TABLE TrainStaff MODIFY Name VARCHAR(100) NOT NULL;

-- 17. C&C: Add UNIQUE constraint on Email
ALTER TABLE TrainStaff ADD CONSTRAINT unique_email UNIQUE (Email);

-- 18. OP: Staff working in either Onboard or Catering
SELECT StaffID, Name, Department FROM TrainStaff WHERE Department IN ('Onboard','Catering');

-- 19. OP: Staff with ID between 5 and 10
SELECT StaffID, Name, Role FROM TrainStaff WHERE StaffID BETWEEN 5 AND 10;

-- 20. OP: Morning shift staff earning more than 25000
SELECT StaffID, Name, Salary FROM TrainStaff WHERE Shift = 'Morning' AND Salary > 25000;

-- 2. DML: Insert one more engineer
INSERT INTO Engineers (Name, Specialization, Department, TrainID, Contact, Email, AssignedDate, Certification, Remarks)
VALUES ('Sanjay Patil', 'Electrical', 'Maintenance', 11, '9123456720', 'sanjay.eng@rail.in', '2021-01-05', 'HVAC Cert', 'New Recruit');

-- 3. DML: Update remarks of one engineer
UPDATE Engineers SET Remarks='Promoted to Senior Engineer' WHERE EngineerID=1;

-- 4. DML: Delete an engineer by ID
DELETE FROM Engineers WHERE EngineerID=20;

-- 5. DQL: Select all engineers
SELECT * FROM Engineers;

-- 6. DQL: Select engineers with specialization = 'Mechanical'
SELECT Name, Department, Certification FROM Engineers WHERE Specialization='Mechanical';

-- 7. DQL: Find engineers assigned after 2018
SELECT Name, AssignedDate FROM Engineers WHERE AssignedDate > '2018-12-31';

-- 8. DQL: Count engineers by department
SELECT Department, COUNT(*) AS Total FROM Engineers GROUP BY Department;

-- 9. DQL: Find earliest assigned engineer
SELECT Name, MIN(AssignedDate) AS EarliestAssigned FROM Engineers;

-- 10. DQL: Find latest assigned engineer
SELECT Name, MAX(AssignedDate) AS LatestAssigned FROM Engineers;

-- 11. Constraints & Commands: Add unique constraint on Email
ALTER TABLE Engineers ADD CONSTRAINT unique_email UNIQUE (Email);

-- 12. Constraints & Commands: Drop unique constraint on Email
ALTER TABLE Engineers DROP INDEX unique_email;

-- 13. Operator: Engineers in TrainID between 3 and 7
SELECT Name, TrainID FROM Engineers WHERE TrainID BETWEEN 3 AND 7;

-- 14. Operator: Engineers whose name starts with 'A'
SELECT Name FROM Engineers WHERE Name LIKE 'A%';

-- 15. Operator: Engineers not in Maintenance department
SELECT Name, Department FROM Engineers WHERE Department <> 'Maintenance';

-- 16. Operator: Engineers with specialization in Mechanical or Electrical
SELECT Name, Specialization FROM Engineers WHERE Specialization IN ('Mechanical', 'Electrical');

-- 17. DQL: Order engineers by AssignedDate descending
SELECT Name, AssignedDate FROM Engineers ORDER BY AssignedDate DESC;

-- 18. DQL: Group engineers by specialization and count
SELECT Specialization, COUNT(*) AS Total FROM Engineers GROUP BY Specialization;

-- 19. DQL: Find engineers with remarks containing 'Coach'
SELECT Name, Remarks FROM Engineers WHERE Remarks LIKE '%Coach%';

-- 20. DDL: Drop the Engineers table
DROP TABLE Engineers;

-- 3. DML: Update status of one train
UPDATE TrainSchedules SET Status='Delayed' WHERE ScheduleID=5;

-- 4. DML: Delete one train schedule
DELETE FROM TrainSchedules WHERE ScheduleID=20;

-- 5. DQL: Select all schedules
SELECT * FROM TrainSchedules;

-- 6. DQL: Select trains departing after 6 PM
SELECT TrainID, DepartureTime FROM TrainSchedules WHERE DepartureTime > '18:00:00';

-- 7. DQL: Count trains scheduled per platform
SELECT PlatformNumber, COUNT(*) AS Total FROM TrainSchedules GROUP BY PlatformNumber;

-- 8. DQL: Find earliest departure
SELECT TrainID, MIN(DepartureTime) AS EarliestDeparture FROM TrainSchedules;

-- 9. DQL: Find latest arrival
SELECT TrainID, MAX(ArrivalTime) AS LatestArrival FROM TrainSchedules;

-- 10. DQL: Select trains arriving next day
SELECT TrainID, DepartureDate, ArrivalDate FROM TrainSchedules WHERE ArrivalDate > DepartureDate;

-- 11. Constraints & Commands: Add NOT NULL on Status
ALTER TABLE TrainSchedules MODIFY Status VARCHAR(20) NOT NULL;

-- 12. Constraints & Commands: Add default value to Status
ALTER TABLE TrainSchedules ALTER COLUMN Status SET DEFAULT 'On Time';

-- 13. Operator: Trains with ID between 5 and 10
SELECT TrainID, DepartureDate FROM TrainSchedules WHERE TrainID BETWEEN 5 AND 10;

-- 14. Operator: Trains not on time
SELECT TrainID, Status FROM TrainSchedules WHERE Status <> 'On Time';

-- 15. Operator: Trains running on platforms 1, 2, 3
SELECT TrainID, PlatformNumber FROM TrainSchedules WHERE PlatformNumber IN ('1','2','3');

-- 16. Operator: Trains with remarks containing 'Express'
SELECT TrainID, Remarks FROM TrainSchedules WHERE Remarks LIKE '%Express%';

-- 17. DQL: Order trains by DepartureDate ascending
SELECT TrainID, DepartureDate FROM TrainSchedules ORDER BY DepartureDate ASC;

-- 18. DQL: Group trains by status
SELECT Status, COUNT(*) AS Total FROM TrainSchedules GROUP BY Status;

-- 19. DQL: Find number of trains scheduled in August 2025
SELECT COUNT(*) AS AugustTrains FROM TrainSchedules WHERE DepartureDate BETWEEN '2025-08-01' AND '2025-08-31';

-- 20. DDL: Drop the table
DROP TABLE TrainSchedules;

-- 1. DML: Insert new catering record
INSERT INTO Catering (TrainID, VendorID, StaffID, MealType, Menu, Quantity, ServiceTime, Status, Remarks)
VALUES (21, 21, 21, 'Dinner', 'Paneer Butter Masala, Roti', 150, '20:45:00', 'Pending', 'Special Order');

-- 2. DML: Update quantity for a meal
UPDATE Catering SET Quantity = 180 WHERE CateringID = 5;

-- 3. DML: Delete a catering record
DELETE FROM Catering WHERE CateringID = 20;

-- 4. DQL: Select all catering records
SELECT * FROM Catering;

-- 5. DQL: Get all breakfast menus
SELECT CateringID, Menu, Quantity FROM Catering WHERE MealType = 'Breakfast';

-- 6. DQL: Count meals served by type
SELECT MealType, COUNT(*) AS Total FROM Catering GROUP BY MealType;

-- 7. DQL: Find max quantity meal
SELECT MealType, MAX(Quantity) AS MaxQuantity FROM Catering;

-- 8. DQL: Find min quantity meal
SELECT MealType, MIN(Quantity) AS MinQuantity FROM Catering;

-- 9. DQL: Meals served after 6 PM
SELECT CateringID, MealType, ServiceTime FROM Catering WHERE ServiceTime > '18:00:00';

-- 10. DQL: Average quantity of lunch meals
SELECT AVG(Quantity) AS AvgLunch FROM Catering WHERE MealType = 'Lunch';

-- 11. Constraints & Commands: Add NOT NULL constraint to MealType
ALTER TABLE Catering MODIFY MealType VARCHAR(20) NOT NULL;

-- 12. Constraints & Commands: Add default status
ALTER TABLE Catering ALTER COLUMN Status SET DEFAULT 'Pending';

-- 13. Operator: Meals with quantity between 150 and 200
SELECT CateringID, MealType, Quantity FROM Catering WHERE Quantity BETWEEN 150 AND 200;

-- 14. Operator: Meals not served
SELECT CateringID, MealType, Status FROM Catering WHERE Status <> 'Served';

-- 15. Operator: Meals in specific categories
SELECT CateringID, MealType FROM Catering WHERE MealType IN ('Breakfast','Dinner');

-- 16. Operator: Meals with menu containing 'Rice'
SELECT CateringID, Menu FROM Catering WHERE Menu LIKE '%Rice%';

-- 17. DQL: Order catering by ServiceTime ascending
SELECT CateringID, MealType, ServiceTime FROM Catering ORDER BY ServiceTime ASC;

-- 18. DQL: Group meals by status
SELECT Status, COUNT(*) AS Total FROM Catering GROUP BY Status;

-- 19. DQL: Total number of catering records
SELECT COUNT(*) AS TotalMeals FROM Catering;

-- 20. DDL: Drop Remarks column
ALTER TABLE Catering DROP COLUMN Remarks;

-- 1. DDL: Add a new column
ALTER TABLE Vendors ADD COLUMN Rating INT;

-- 2. DDL: Modify column size
ALTER TABLE Vendors MODIFY COLUMN Name VARCHAR(150);

-- 3. DDL: Drop a column
ALTER TABLE Vendors DROP COLUMN Rating;

-- 4. DML: Insert a new vendor
INSERT INTO Vendors (Name, Contact, Email, ServiceType, LicenseNo, Address, ContractStart, ContractEnd, Remarks)
VALUES ('Express Meals', '7776543210', 'contact@expressmeals.in', 'Catering', 'LIC150', 'Surat', '2024-02-01', '2026-12-31', 'Fast Delivery');

-- 5. DML: Update vendor remarks
UPDATE Vendors SET Remarks='Premium Partner' WHERE VendorID=2;

-- 6. DML: Delete a vendor by ID
DELETE FROM Vendors WHERE VendorID=20;

-- 7. DQL: Select all vendors
SELECT * FROM Vendors;

-- 8. DQL: Select vendors from Mumbai
SELECT Name, Contact FROM Vendors WHERE Address='Mumbai';

-- 9. DQL: Select vendors with contract ending in 2026
SELECT Name, ContractEnd FROM Vendors WHERE YEAR(ContractEnd)=2026;

-- 10. DQL: Count total vendors
SELECT COUNT(*) AS TotalVendors FROM Vendors;

-- 11. DQL: Get distinct addresses
SELECT DISTINCT Address FROM Vendors;

-- 12. DQL: Order vendors by Name ASC
SELECT Name, ServiceType FROM Vendors ORDER BY Name ASC;

-- 13. DQL: Find vendors with ServiceType = 'Catering' and Remarks LIKE '%Meals%'
SELECT * FROM Vendors WHERE ServiceType='Catering' AND Remarks LIKE '%Meals%';

-- 14. DQL: Vendors whose name starts with 'F'
SELECT * FROM Vendors WHERE Name LIKE 'F%';

-- 15. DQL: Vendors between VendorID 5 and 10
SELECT * FROM Vendors WHERE VendorID BETWEEN 5 AND 10;

-- 16. Constraint: Add NOT NULL constraint
ALTER TABLE Vendors MODIFY COLUMN Name VARCHAR(100) NOT NULL;

-- 17. Constraint: Add UNIQUE constraint on Email
ALTER TABLE Vendors ADD CONSTRAINT unique_email UNIQUE (Email);

-- 18. Operator: Vendors in Delhi or Mumbai
SELECT * FROM Vendors WHERE Address IN ('Delhi','Mumbai');

-- 19. Operator: Vendors not from Kolkata
SELECT * FROM Vendors WHERE Address <> 'Kolkata';

-- 20. Operator: Vendors with Contact starting from '9'
SELECT * FROM Vendors WHERE Contact LIKE '9%';

-- 1. DDL: Add a new column for MaintenanceCost
ALTER TABLE MaintenanceLogs ADD COLUMN MaintenanceCost DECIMAL(10,2);

-- 2. DDL: Modify column size of IssueReported
ALTER TABLE MaintenanceLogs MODIFY COLUMN IssueReported VARCHAR(200);

-- 3. DDL: Drop the column MaintenanceCost
ALTER TABLE MaintenanceLogs DROP COLUMN MaintenanceCost;

-- 4. DML: Insert a new maintenance log
INSERT INTO MaintenanceLogs (TrainID, EngineerID, Date, Time, IssueReported, ActionTaken, Status, NextDue, Remarks)
VALUES (11, 21, '2025-07-21', '09:00:00', 'Horn issue', 'Horn replaced', 'Completed', '2025-08-21', 'Safety check');

-- 5. DML: Update the remarks of a log
UPDATE MaintenanceLogs SET Remarks='Urgent Follow-up' WHERE LogID=5;

-- 6. DML: Delete a log entry by LogID
DELETE FROM MaintenanceLogs WHERE LogID=20;

-- 7. DQL: Select all maintenance logs
SELECT * FROM MaintenanceLogs;

-- 8. DQL: Select only TrainID, IssueReported, Status
SELECT TrainID, IssueReported, Status FROM MaintenanceLogs;

-- 9. DQL: Get logs where Status is 'Completed'
SELECT * FROM MaintenanceLogs WHERE Status='Completed';

-- 10. DQL: Count total maintenance records
SELECT COUNT(*) AS TotalLogs FROM MaintenanceLogs;

-- 11. DQL: Find distinct issues reported
SELECT DISTINCT IssueReported FROM MaintenanceLogs;

-- 12. DQL: Get logs between '2025-07-05' and '2025-07-10'
SELECT * FROM MaintenanceLogs WHERE Date BETWEEN '2025-07-05' AND '2025-07-10';

-- 13. DQL: Order logs by Date descending
SELECT * FROM MaintenanceLogs ORDER BY Date DESC;

-- 14. DQL: Logs with remarks containing 'Brake'
SELECT * FROM MaintenanceLogs WHERE Remarks LIKE '%Brake%';

-- 15. DQL: Find engineers who worked on TrainID = 2
SELECT EngineerID FROM MaintenanceLogs WHERE TrainID=2;

-- 16. Constraint: Make IssueReported NOT NULL
ALTER TABLE MaintenanceLogs MODIFY COLUMN IssueReported VARCHAR(100) NOT NULL;

-- 17. Constraint: Add unique constraint on (TrainID, Date, Time)
ALTER TABLE MaintenanceLogs ADD CONSTRAINT unique_train_time UNIQUE (TrainID, Date, Time);

-- 18. Operator: Get logs where TrainID is in (1, 5, 10)
SELECT * FROM MaintenanceLogs WHERE TrainID IN (1,5,10);

-- 19. Operator: Get logs where EngineerID not equal to 5
SELECT * FROM MaintenanceLogs WHERE EngineerID <> 5;

-- 20. Operator: Get logs where Time is greater than '15:00:00'
SELECT * FROM MaintenanceLogs WHERE Time > '15:00:00';

-- 1. DDL: Add a new column for ComplaintPriority
ALTER TABLE Complaints ADD COLUMN ComplaintPriority VARCHAR(20);

-- 2. DDL: Modify Description length
ALTER TABLE Complaints MODIFY COLUMN Description VARCHAR(500);

-- 3. DDL: Drop the ComplaintPriority column
ALTER TABLE Complaints DROP COLUMN ComplaintPriority;

-- 4. DML: Insert a new complaint record
INSERT INTO Complaints (PassengerID, TrainID, CoachID, Date, Time, Type, Description, Status, Remarks)
VALUES (21, 11, 11, '2025-07-21', '09:00:00', 'Cleanliness', 'Window dusty', 'Pending', 'To be checked');

-- 5. DML: Update status of a complaint
UPDATE Complaints SET Status='Pending' WHERE ComplaintID=5;

-- 6. DML: Delete a complaint record
DELETE FROM Complaints WHERE ComplaintID=20;

-- 7. DQL: Select all complaints
SELECT * FROM Complaints;

-- 8. DQL: Get only ComplaintID, Type, and Status
SELECT ComplaintID, Type, Status FROM Complaints;

-- 9. DQL: Find all food-related complaints
SELECT * FROM Complaints WHERE Type='Food';

-- 10. DQL: Count number of cleanliness complaints
SELECT COUNT(*) AS CleanlinessComplaints FROM Complaints WHERE Type='Cleanliness';

-- 11. DQL: Find distinct complaint types
SELECT DISTINCT Type FROM Complaints;

-- 12. DQL: Get complaints logged between '2025-07-05' and '2025-07-10'
SELECT * FROM Complaints WHERE Date BETWEEN '2025-07-05' AND '2025-07-10';

-- 13. DQL: Order complaints by Date ascending
SELECT * FROM Complaints ORDER BY Date ASC;

-- 14. DQL: Complaints where Remarks mention 'RPF'
SELECT * FROM Complaints WHERE Remarks LIKE '%RPF%';

-- 15. DQL: Find complaints of TrainID = 2
SELECT * FROM Complaints WHERE TrainID=2;

-- 16. Constraint: Make Type column NOT NULL
ALTER TABLE Complaints MODIFY COLUMN Type VARCHAR(50) NOT NULL;

-- 17. Constraint: Add unique constraint on (PassengerID, Date, Time)
ALTER TABLE Complaints ADD CONSTRAINT unique_passenger_complaint UNIQUE (PassengerID, Date, Time);

-- 18. Operator: Get complaints where TrainID is in (1,5,10)
SELECT * FROM Complaints WHERE TrainID IN (1,5,10);

-- 19. Operator: Get complaints where Status is not 'Resolved'
SELECT * FROM Complaints WHERE Status <> 'Resolved';

-- 20. Operator: Get complaints where Time is greater than '15:00:00'
SELECT * FROM Complaints WHERE Time > '15:00:00';

-- 1. DDL: Add a new column for CargoPriority
ALTER TABLE Cargo ADD COLUMN CargoPriority VARCHAR(20);

-- 2. DDL: Modify GoodsType length
ALTER TABLE Cargo MODIFY COLUMN GoodsType VARCHAR(100);

-- 3. DDL: Drop the CargoPriority column
ALTER TABLE Cargo DROP COLUMN CargoPriority;

-- 4. DML: Insert a new cargo record
INSERT INTO Cargo (BookingID, TrainID, DepartureStation, ArrivalStation, Weight, GoodsType, DepartureDate, ArrivalDate, Status)
VALUES (21, 5, 'Mumbai', 'Delhi', 900.50, 'Electronics', '2025-07-21', '2025-07-22', 'In Transit');

-- 5. DML: Update status of a cargo shipment
UPDATE Cargo SET Status='Delayed' WHERE CargoID=4;

-- 6. DML: Delete a cargo record
DELETE FROM Cargo WHERE CargoID=20;

-- 7. DQL: Select all cargo shipments
SELECT * FROM Cargo;

-- 8. DQL: Get CargoID, TrainID, GoodsType, Status
SELECT CargoID, TrainID, GoodsType, Status FROM Cargo;

-- 9. DQL: Find all cargo with GoodsType='Electronics'
SELECT * FROM Cargo WHERE GoodsType='Electronics';

-- 10. DQL: Count cargo shipments for TrainID=1
SELECT COUNT(*) AS TotalCargo FROM Cargo WHERE TrainID=1;

-- 11. DQL: Find distinct DepartureStations
SELECT DISTINCT DepartureStation FROM Cargo;

-- 12. DQL: Cargo shipments between '2025-07-05' and '2025-07-10'
SELECT * FROM Cargo WHERE DepartureDate BETWEEN '2025-07-05' AND '2025-07-10';

-- 13. DQL: Order cargo by Weight descending
SELECT * FROM Cargo ORDER BY Weight DESC;

-- 14. DQL: Cargo shipments arriving in 'Mumbai'
SELECT * FROM Cargo WHERE ArrivalStation='Mumbai';

-- 15. DQL: Cargo for TrainID=2 and Status='Delivered'
SELECT * FROM Cargo WHERE TrainID=2 AND Status='Delivered';

-- 16. Constraint: Make GoodsType NOT NULL
ALTER TABLE Cargo MODIFY COLUMN GoodsType VARCHAR(50) NOT NULL;

-- 17. Constraint: Add unique constraint on (BookingID, TrainID, DepartureDate)
ALTER TABLE Cargo ADD CONSTRAINT unique_cargo UNIQUE (BookingID, TrainID, DepartureDate);

-- 18. Operator: Get cargo where TrainID IN (1,3,5)
SELECT * FROM Cargo WHERE TrainID IN (1,3,5);

-- 19. Operator: Get cargo where Status is not 'Delivered'
SELECT * FROM Cargo WHERE Status <> 'Delivered';

-- 20. Operator: Get cargo where Weight > 1000
SELECT * FROM Cargo WHERE Weight > 1000;

-- 1. DDL: Add a new column for ParcelPriority
ALTER TABLE Parcels ADD COLUMN ParcelPriority VARCHAR(20);

-- 2. DDL: Modify SenderName length
ALTER TABLE Parcels MODIFY COLUMN SenderName VARCHAR(150);

-- 3. DDL: Drop the ParcelPriority column
ALTER TABLE Parcels DROP COLUMN ParcelPriority;

-- 4. DML: Insert a new parcel record
INSERT INTO Parcels (BookingID, SenderName, ReceiverName, SourceStation, DestinationStation, Weight, DispatchDate, DeliveryDate, Status)
VALUES (21, 'Rahul', 'Ritu', 'Delhi', 'Bengaluru', 11.50, '2025-07-21', '2025-07-22', 'In Transit');

-- 5. DML: Update status of a parcel
UPDATE Parcels SET Status='Delayed' WHERE ParcelID=4;

-- 6. DML: Delete a parcel record
DELETE FROM Parcels WHERE ParcelID=20;

-- 7. DQL: Select all parcels
SELECT * FROM Parcels;

-- 8. DQL: Select ParcelID, SenderName, ReceiverName, Status
SELECT ParcelID, SenderName, ReceiverName, Status FROM Parcels;

-- 9. DQL: Find all parcels with Weight > 10
SELECT * FROM Parcels WHERE Weight > 10;

-- 10. DQL: Count parcels sent from 'Delhi'
SELECT COUNT(*) AS TotalParcels FROM Parcels WHERE SourceStation='Delhi';

-- 11. DQL: Find distinct DestinationStations
SELECT DISTINCT DestinationStation FROM Parcels;

-- 12. DQL: Parcels dispatched between '2025-07-05' and '2025-07-10'
SELECT * FROM Parcels WHERE DispatchDate BETWEEN '2025-07-05' AND '2025-07-10';

-- 13. DQL: Order parcels by Weight descending
SELECT * FROM Parcels ORDER BY Weight DESC;

-- 14. DQL: Parcels delivered to 'Mumbai'
SELECT * FROM Parcels WHERE DestinationStation='Mumbai';

-- 15. DQL: Parcels with Status='Delivered'
SELECT * FROM Parcels WHERE Status='Delivered';

-- 16. Constraint: Make ReceiverName NOT NULL
ALTER TABLE Parcels MODIFY COLUMN ReceiverName VARCHAR(100) NOT NULL;

-- 17. Constraint: Add unique constraint on (BookingID, SourceStation, DestinationStation, DispatchDate)
ALTER TABLE Parcels ADD CONSTRAINT unique_parcel UNIQUE (BookingID, SourceStation, DestinationStation, DispatchDate);

-- 18. Operator: Get parcels where SourceStation IN ('Delhi','Kolkata','Mumbai')
SELECT * FROM Parcels WHERE SourceStation IN ('Delhi','Kolkata','Mumbai');

-- 19. Operator: Get parcels where Status is not 'Delivered'
SELECT * FROM Parcels WHERE Status <> 'Delivered';

-- 20. Operator: Get parcels where Weight BETWEEN 5 AND 10
SELECT * FROM Parcels WHERE Weight BETWEEN 5 AND 10;

-- 1. DDL: Add a new column for FreightPriority
ALTER TABLE FreightBookings ADD COLUMN FreightPriority VARCHAR(20);

-- 2. DDL: Modify CustomerName length
ALTER TABLE FreightBookings MODIFY COLUMN CustomerName VARCHAR(150);

-- 3. DDL: Drop the FreightPriority column
ALTER TABLE FreightBookings DROP COLUMN FreightPriority;

-- 4. DML: Insert a new freight booking
INSERT INTO FreightBookings (CustomerName, GoodsType, Quantity, Weight, SourceStation, DestinationStation, BookingDate, DeliveryDate, Status)
VALUES ('Omega Ltd', 'Pharma', 30, 1500.00, 'Delhi', 'Chennai', '2025-07-21', '2025-07-22', 'In Transit');

-- 5. DML: Update status of a booking
UPDATE FreightBookings SET Status='Delayed' WHERE FreightID=4;

-- 6. DML: Delete a freight booking
DELETE FROM FreightBookings WHERE FreightID=20;

-- 7. DQL: Select all freight bookings
SELECT * FROM FreightBookings;

-- 8. DQL: Select FreightID, CustomerName, GoodsType, Status
SELECT FreightID, CustomerName, GoodsType, Status FROM FreightBookings;

-- 9. DQL: Find all bookings with Weight > 3000
SELECT * FROM FreightBookings WHERE Weight > 3000;

-- 10. DQL: Count bookings from 'Delhi'
SELECT COUNT(*) AS TotalBookings FROM FreightBookings WHERE SourceStation='Delhi';

-- 11. DQL: Find distinct DestinationStations
SELECT DISTINCT DestinationStation FROM FreightBookings;

-- 12. DQL: Bookings between '2025-07-05' and '2025-07-10'
SELECT * FROM FreightBookings WHERE BookingDate BETWEEN '2025-07-05' AND '2025-07-10';

-- 13. DQL: Order bookings by Weight descending
SELECT * FROM FreightBookings ORDER BY Weight DESC;

-- 14. DQL: Bookings delivered to 'Mumbai'
SELECT * FROM FreightBookings WHERE DestinationStation='Mumbai';

-- 15. DQL: Bookings with Status='Delivered'
SELECT * FROM FreightBookings WHERE Status='Delivered';

-- 16. Constraint: Make CustomerName NOT NULL
ALTER TABLE FreightBookings MODIFY COLUMN CustomerName VARCHAR(100) NOT NULL;

-- 17. Constraint: Add unique constraint on (CustomerName, SourceStation, DestinationStation, BookingDate)
ALTER TABLE FreightBookings ADD CONSTRAINT unique_freight UNIQUE (CustomerName, SourceStation, DestinationStation, BookingDate);

-- 18. Operator: Bookings where SourceStation IN ('Delhi','Kolkata','Mumbai')
SELECT * FROM FreightBookings WHERE SourceStation IN ('Delhi','Kolkata','Mumbai');

-- 19. Operator: Bookings where Status is not 'Delivered'
SELECT * FROM FreightBookings WHERE Status <> 'Delivered';

-- 20. Operator: Bookings with Weight BETWEEN 1000 AND 3000
SELECT * FROM FreightBookings WHERE Weight BETWEEN 1000 AND 3000;

-- 1. DDL: Add a new column for SignalPriority
ALTER TABLE Signals ADD COLUMN SignalPriority VARCHAR(20);

-- 2. DDL: Modify SignalType length
ALTER TABLE Signals MODIFY COLUMN SignalType VARCHAR(100);

-- 3. DDL: Drop the SignalPriority column
ALTER TABLE Signals DROP COLUMN SignalPriority;

-- 4. DML: Insert a new signal record
INSERT INTO Signals (RouteID, SignalType, Location, Status, LastCheckDate, NextCheckDate, MaintenanceStatus, MaintainedBy, Remarks)
VALUES (21, 'LED', 'Mumbai Yard', 'Operational', '2025-07-01', '2025-08-01', 'Good', 'Engg Team D', 'New Installation');

-- 5. DML: Update status of a signal
UPDATE Signals SET Status='Under Maintenance' WHERE SignalID=5;

-- 6. DML: Delete a signal record
DELETE FROM Signals WHERE SignalID=20;

-- 7. DQL: Select all signals
SELECT * FROM Signals;

-- 8. DQL: Select SignalID, SignalType, Status, Location
SELECT SignalID, SignalType, Status, Location FROM Signals;

-- 9. DQL: Find all signals maintained by 'Engg Team A'
SELECT * FROM Signals WHERE MaintainedBy='Engg Team A';

-- 10. DQL: Count signals per Status
SELECT Status, COUNT(*) AS TotalSignals FROM Signals GROUP BY Status;

-- 11. DQL: Find signals that are 'Operational'
SELECT * FROM Signals WHERE Status='Operational';

-- 12. DQL: Signals last checked before '2025-06-20'
SELECT * FROM Signals WHERE LastCheckDate < '2025-06-20';

-- 13. DQL: Order signals by NextCheckDate ascending
SELECT * FROM Signals ORDER BY NextCheckDate ASC;

-- 14. DQL: Select distinct SignalTypes
SELECT DISTINCT SignalType FROM Signals;

-- 15. DQL: Signals on RouteID 1 or 2
SELECT * FROM Signals WHERE RouteID IN (1,2);

-- 16. Constraint: Make Location NOT NULL
ALTER TABLE Signals MODIFY COLUMN Location VARCHAR(100) NOT NULL;

-- 17. Constraint: Add unique constraint on (RouteID, SignalType, Location)
ALTER TABLE Signals ADD CONSTRAINT unique_signal UNIQUE (RouteID, SignalType, Location);

-- 18. Operator: Signals with NextCheckDate BETWEEN '2025-07-01' AND '2025-07-30'
SELECT * FROM Signals WHERE NextCheckDate BETWEEN '2025-07-01' AND '2025-07-30';

-- 19. Operator: Signals with Status not equal to 'Operational'
SELECT * FROM Signals WHERE Status <> 'Operational';

-- 20. Operator: Signals maintained by Team B or Team C
SELECT * FROM Signals WHERE MaintainedBy IN ('Engg Team B', 'Engg Team C');

-- 1. DDL: Add a new column TrackPriority
ALTER TABLE Tracks ADD COLUMN TrackPriority VARCHAR(20);

-- 2. DDL: Modify Length_KM precision
ALTER TABLE Tracks MODIFY COLUMN Length_KM DECIMAL(6,2);

-- 3. DDL: Drop the TrackPriority column
ALTER TABLE Tracks DROP COLUMN TrackPriority;

-- 4. DML: Insert a new track record
INSERT INTO Tracks (RouteID, SectionName, Length_KM, GaugeType, ConditionStatus, LastInspection, NextInspection, MaintainedBy, Remarks)
VALUES (21, 'Mumbai - Pune', 150.50, 'Broad', 'Good', '2025-07-01', '2025-08-01', 'Track Team D', 'New section');

-- 5. DML: Update ConditionStatus of a track
UPDATE Tracks SET ConditionStatus='Needs Repair' WHERE TrackID=5;

-- 6. DML: Delete a track record
DELETE FROM Tracks WHERE TrackID=20;

-- 7. DQL: Select all tracks
SELECT * FROM Tracks;

-- 8. DQL: Select TrackID, SectionName, Length_KM, ConditionStatus
SELECT TrackID, SectionName, Length_KM, ConditionStatus FROM Tracks;

-- 9. DQL: Tracks maintained by 'Track Team A'
SELECT * FROM Tracks WHERE MaintainedBy='Track Team A';

-- 10. DQL: Count tracks per ConditionStatus
SELECT ConditionStatus, COUNT(*) AS TotalTracks FROM Tracks GROUP BY ConditionStatus;

-- 11. DQL: Tracks with Length_KM greater than 150
SELECT * FROM Tracks WHERE Length_KM > 150;

-- 12. DQL: Tracks last inspected before '2025-06-10'
SELECT * FROM Tracks WHERE LastInspection < '2025-06-10';

-- 13. DQL: Order tracks by NextInspection ascending
SELECT * FROM Tracks ORDER BY NextInspection ASC;

-- 14. DQL: Select distinct GaugeTypes
SELECT DISTINCT GaugeType FROM Tracks;

-- 15. DQL: Tracks on RouteID 1 or 2
SELECT * FROM Tracks WHERE RouteID IN (1,2);

-- 16. Constraint: Make SectionName NOT NULL
ALTER TABLE Tracks MODIFY COLUMN SectionName VARCHAR(100) NOT NULL;

-- 17. Constraint: Add unique constraint on (RouteID, SectionName)
ALTER TABLE Tracks ADD CONSTRAINT unique_track UNIQUE (RouteID, SectionName);

-- 18. Operator: Tracks with NextInspection BETWEEN '2025-07-01' AND '2025-07-31'
SELECT * FROM Tracks WHERE NextInspection BETWEEN '2025-07-01' AND '2025-07-31';

-- 19. Operator: Tracks with ConditionStatus not equal to 'Good'
SELECT * FROM Tracks WHERE ConditionStatus <> 'Good';

-- 20. Operator: Tracks maintained by Team B or Team C
SELECT * FROM Tracks WHERE MaintainedBy IN ('Track Team B', 'Track Team C');

-- 1. DDL: Add a new column LoadCapacity
ALTER TABLE Bridges ADD COLUMN LoadCapacity DECIMAL(10,2);

-- 2. DDL: Modify Length_M precision
ALTER TABLE Bridges MODIFY COLUMN Length_M DECIMAL(7,2);

-- 3. DDL: Drop the LoadCapacity column
ALTER TABLE Bridges DROP COLUMN LoadCapacity;

-- 4. DML: Insert a new bridge record
INSERT INTO Bridges (TrackID, BridgeName, Location, Length_M, Type, ConditionStatus, LastInspection, NextInspection, Remarks)
VALUES (21, 'Navi Mumbai Bridge', 'Navi Mumbai', 900.00, 'Steel', 'Good', '2025-07-01', '2025-08-01', 'Newly constructed');

-- 5. DML: Update ConditionStatus of a bridge
UPDATE Bridges SET ConditionStatus='Needs Repair' WHERE BridgeID=5;

-- 6. DML: Delete a bridge record
DELETE FROM Bridges WHERE BridgeID=20;

-- 7. DQL: Select all bridges
SELECT * FROM Bridges;

-- 8. DQL: Select BridgeID, BridgeName, Location, Length_M, ConditionStatus
SELECT BridgeID, BridgeName, Location, Length_M, ConditionStatus FROM Bridges;

-- 9. DQL: Bridges of type 'Steel'
SELECT * FROM Bridges WHERE Type='Steel';

-- 10. DQL: Count bridges by ConditionStatus
SELECT ConditionStatus, COUNT(*) AS TotalBridges FROM Bridges GROUP BY ConditionStatus;

-- 11. DQL: Bridges with Length_M greater than 800
SELECT * FROM Bridges WHERE Length_M > 800;

-- 12. DQL: Bridges last inspected before '2025-06-10'
SELECT * FROM Bridges WHERE LastInspection < '2025-06-10';

-- 13. DQL: Order bridges by NextInspection ascending
SELECT * FROM Bridges ORDER BY NextInspection ASC;

-- 14. DQL: Select distinct Types of bridges
SELECT DISTINCT Type FROM Bridges;

-- 15. DQL: Bridges on TrackID 1 or 2
SELECT * FROM Bridges WHERE TrackID IN (1,2);

-- 16. Constraint: Make BridgeName NOT NULL
ALTER TABLE Bridges MODIFY COLUMN BridgeName VARCHAR(100) NOT NULL;

-- 17. Constraint: Add unique constraint on (TrackID, BridgeName)
ALTER TABLE Bridges ADD CONSTRAINT unique_bridge UNIQUE (TrackID, BridgeName);

-- 18. Operator: Bridges with NextInspection BETWEEN '2025-07-01' AND '2025-07-31'
SELECT * FROM Bridges WHERE NextInspection BETWEEN '2025-07-01' AND '2025-07-31';

-- 19. Operator: Bridges with ConditionStatus not equal to 'Good'
SELECT * FROM Bridges WHERE ConditionStatus <> 'Good';

-- 20. Operator: Bridges of type 'Steel' or 'Concrete'
SELECT * FROM Bridges WHERE Type IN ('Steel','Concrete');

-- 1. DDL: Add a new column for CrossingHeight
ALTER TABLE LevelCrossings ADD COLUMN CrossingHeight DECIMAL(5,2);

-- 2. DDL: Modify ContactNumber length
ALTER TABLE LevelCrossings MODIFY COLUMN ContactNumber VARCHAR(20);

-- 3. DDL: Drop CrossingHeight column
ALTER TABLE LevelCrossings DROP COLUMN CrossingHeight;

-- 4. DML: Insert a new level crossing
INSERT INTO LevelCrossings (TrackID, Location, CrossingType, GateStatus, AttendantName, ContactNumber, LastInspection, NextInspection, Remarks)
VALUES (21, 'Pune Outer', 'Manned', 'Operational', 'Ajay Kumar', '9876543230', '2025-07-01', '2025-08-01', 'New crossing');

-- 5. DML: Update GateStatus
UPDATE LevelCrossings SET GateStatus='Under Maintenance' WHERE CrossingID=5;

-- 6. DML: Delete a crossing
DELETE FROM LevelCrossings WHERE CrossingID=20;

-- 7. DQL: Select all level crossings
SELECT * FROM LevelCrossings;

-- 8. DQL: Select CrossingID, Location, GateStatus, AttendantName
SELECT CrossingID, Location, GateStatus, AttendantName FROM LevelCrossings;

-- 9. DQL: Select only manned crossings
SELECT * FROM LevelCrossings WHERE CrossingType='Manned';

-- 10. DQL: Count crossings by GateStatus
SELECT GateStatus, COUNT(*) AS TotalCrossings FROM LevelCrossings GROUP BY GateStatus;

-- 11. DQL: Crossings inspected before '2025-06-10'
SELECT * FROM LevelCrossings WHERE LastInspection < '2025-06-10';

-- 12. DQL: Order crossings by NextInspection descending
SELECT * FROM LevelCrossings ORDER BY NextInspection DESC;

-- 13. DQL: Select distinct CrossingTypes
SELECT DISTINCT CrossingType FROM LevelCrossings;

-- 14. DQL: Crossings where AttendantName starts with 'R'
SELECT * FROM LevelCrossings WHERE AttendantName LIKE 'R%';

-- 15. DQL: Crossings on TrackID 1 or 2
SELECT * FROM LevelCrossings WHERE TrackID IN (1,2);

-- 16. Constraint: Make Location NOT NULL
ALTER TABLE LevelCrossings MODIFY COLUMN Location VARCHAR(100) NOT NULL;

-- 17. Constraint: Add unique constraint on (TrackID, Location)
ALTER TABLE LevelCrossings ADD CONSTRAINT unique_crossing UNIQUE (TrackID, Location);

-- 18. Operator: Crossings with NextInspection BETWEEN '2025-07-01' AND '2025-07-31'
SELECT * FROM LevelCrossings WHERE NextInspection BETWEEN '2025-07-01' AND '2025-07-31';

-- 19. Operator: Crossings with GateStatus not equal to 'Operational'
SELECT * FROM LevelCrossings WHERE GateStatus <> 'Operational';

-- 20. Operator: Crossings of type 'Manned' or 'Unmanned'
SELECT * FROM LevelCrossings WHERE CrossingType IN ('Manned','Unmanned');

-- 1. DDL: Add a new column for RoomCapacity
ALTER TABLE ControlRooms ADD COLUMN RoomCapacity INT;

-- 2. DDL: Modify ContactNumber length
ALTER TABLE ControlRooms MODIFY COLUMN ContactNumber VARCHAR(20);

-- 3. DDL: Drop RoomCapacity column
ALTER TABLE ControlRooms DROP COLUMN RoomCapacity;

-- 4. DML: Insert a new control room
INSERT INTO ControlRooms (Location, InCharge, ContactNumber, Shift, NoOfStaff, EquipmentStatus, LastAudit, NextAudit, Remarks)
VALUES ('Pune HQ', 'Manish Kumar', '9890020303', 'Day', 6, 'Good', '2025-07-01', '2025-08-01', 'New room');

-- 5. DML: Update EquipmentStatus
UPDATE ControlRooms SET EquipmentStatus='Under Maintenance' WHERE ControlRoomID=5;

-- 6. DML: Delete a control room
DELETE FROM ControlRooms WHERE ControlRoomID=20;

-- 7. DQL: Select all control rooms
SELECT * FROM ControlRooms;

-- 8. DQL: Select Location, InCharge, Shift, NoOfStaff
SELECT Location, InCharge, Shift, NoOfStaff FROM ControlRooms;

-- 9. DQL: Select control rooms with more than 10 staff
SELECT * FROM ControlRooms WHERE NoOfStaff > 10;

-- 10. DQL: Count rooms by Shift
SELECT Shift, COUNT(*) AS TotalRooms FROM ControlRooms GROUP BY Shift;

-- 11. DQL: Control rooms audited before '2025-06-10'
SELECT * FROM ControlRooms WHERE LastAudit < '2025-06-10';

-- 12. DQL: Order control rooms by NextAudit descending
SELECT * FROM ControlRooms ORDER BY NextAudit DESC;

-- 13. DQL: Select distinct Shifts
SELECT DISTINCT Shift FROM ControlRooms;

-- 14. DQL: Control rooms where InCharge name starts with 'R'
SELECT * FROM ControlRooms WHERE InCharge LIKE 'R%';

-- 15. DQL: Control rooms with NoOfStaff between 7 and 10
SELECT * FROM ControlRooms WHERE NoOfStaff BETWEEN 7 AND 10;

-- 16. Constraint: Make Location NOT NULL
ALTER TABLE ControlRooms MODIFY COLUMN Location VARCHAR(100) NOT NULL;

-- 17. Constraint: Add unique constraint on (Location, InCharge)
ALTER TABLE ControlRooms ADD CONSTRAINT unique_room UNIQUE (Location, InCharge);

-- 18. Operator: Control rooms with EquipmentStatus 'Good' or 'Under Maintenance'
SELECT * FROM ControlRooms WHERE EquipmentStatus IN ('Good','Under Maintenance');

-- 19. Operator: Control rooms not in 'Night' shift
SELECT * FROM ControlRooms WHERE Shift <> 'Night';

-- 20. Operator: Control rooms with LastAudit between '2025-06-01' and '2025-06-30'
SELECT * FROM ControlRooms WHERE LastAudit BETWEEN '2025-06-01' AND '2025-06-30';

-- 1. DDL: Add a column for PlatformNumber
ALTER TABLE Timetables ADD COLUMN PlatformNumber INT;

-- 2. DDL: Modify Frequency column length
ALTER TABLE Timetables MODIFY COLUMN Frequency VARCHAR(30);

-- 3. DDL: Drop PlatformNumber column
ALTER TABLE Timetables DROP COLUMN PlatformNumber;

-- 4. DML: Insert a new timetable entry
INSERT INTO Timetables (TrainID, RouteID, DepartureStation, ArrivalStation, DepartureTime, ArrivalTime, Frequency, EffectiveFrom, EffectiveTo)
VALUES (121, 11, 'Ahmedabad', 'Jaipur', '06:00:00', '12:00:00', 'Daily', '2025-07-01', '2025-12-31');

-- 5. DML: Update ArrivalTime for TrainID 105
UPDATE Timetables SET ArrivalTime='22:15:00' WHERE TrainID=105;

-- 6. DML: Delete timetable for TrainID 120
DELETE FROM Timetables WHERE TrainID=120;

-- 7. DQL: Select all timetable entries
SELECT * FROM Timetables;

-- 8. DQL: Select TrainID, DepartureStation, ArrivalStation, DepartureTime, ArrivalTime
SELECT TrainID, DepartureStation, ArrivalStation, DepartureTime, ArrivalTime FROM Timetables;

-- 9. DQL: Select trains departing from 'Delhi'
SELECT * FROM Timetables WHERE DepartureStation='Delhi';

-- 10. DQL: Count trains by Frequency
SELECT Frequency, COUNT(*) AS TotalTrains FROM Timetables GROUP BY Frequency;

-- 11. DQL: Select timetables effective before '2025-08-01'
SELECT * FROM Timetables WHERE EffectiveFrom < '2025-08-01';

-- 12. DQL: Order timetables by DepartureTime ascending
SELECT * FROM Timetables ORDER BY DepartureTime ASC;

-- 13. DQL: Select distinct DepartureStations
SELECT DISTINCT DepartureStation FROM Timetables;

-- 14. DQL: Trains arriving at 'Mumbai'
SELECT * FROM Timetables WHERE ArrivalStation='Mumbai';

-- 15. DQL: Trains with DepartureTime between '06:00:00' and '08:00:00'
SELECT * FROM Timetables WHERE DepartureTime BETWEEN '06:00:00' AND '08:00:00';

-- 16. Constraint: Make ArrivalStation NOT NULL
ALTER TABLE Timetables MODIFY COLUMN ArrivalStation VARCHAR(50) NOT NULL;

-- 17. Constraint: Add UNIQUE constraint on (TrainID, DepartureStation, ArrivalStation)
ALTER TABLE Timetables ADD CONSTRAINT unique_train_route UNIQUE (TrainID, DepartureStation, ArrivalStation);

-- 18. Operator: Trains with Frequency 'Daily' or 'Mon-Fri'
SELECT * FROM Timetables WHERE Frequency IN ('Daily','Mon-Fri');

-- 19. Operator: Trains not departing from 'Kolkata'
SELECT * FROM Timetables WHERE DepartureStation <> 'Kolkata';

-- 20. Operator: Timetables effective between '2025-07-01' and '2025-09-30'
SELECT * FROM Timetables WHERE EffectiveFrom BETWEEN '2025-07-01' AND '2025-09-30';

-- 1. DDL: Add a column for AnnouncementType
ALTER TABLE Announcements ADD COLUMN AnnouncementType VARCHAR(50);

-- 2. DDL: Modify Title column length
ALTER TABLE Announcements MODIFY COLUMN Title VARCHAR(150);

-- 3. DDL: Drop AnnouncementType column
ALTER TABLE Announcements DROP COLUMN AnnouncementType;

-- 4. DML: Insert a new announcement
INSERT INTO Announcements (Title, Description, Date, Time, Station, AffectedTrains, ValidFrom, ValidTo, Status)
VALUES ('Maintenance Alert', 'Maintenance work on platform 1.', '2025-07-21', '09:30:00', 'Delhi', '101, 111', '2025-07-21', '2025-07-23', 'Active');

-- 5. DML: Update Status to 'Resolved' for AnnouncementID 5
UPDATE Announcements SET Status='Resolved' WHERE AnnouncementID=5;

-- 6. DML: Delete announcement for AnnouncementID 20
DELETE FROM Announcements WHERE AnnouncementID=20;

-- 7. DQL: Select all announcements
SELECT * FROM Announcements;

-- 8. DQL: Select Title, Date, Station, Status
SELECT Title, Date, Station, Status FROM Announcements;

-- 9. DQL: Select announcements at 'Delhi' station
SELECT * FROM Announcements WHERE Station='Delhi';

-- 10. DQL: Count announcements by Status
SELECT Status, COUNT(*) AS TotalAnnouncements FROM Announcements GROUP BY Status;

-- 11. DQL: Select announcements valid between '2025-07-05' and '2025-07-15'
SELECT * FROM Announcements WHERE ValidFrom >= '2025-07-05' AND ValidTo <= '2025-07-15';

-- 12. DQL: Order announcements by Date descending
SELECT * FROM Announcements ORDER BY Date DESC;

-- 13. DQL: Select distinct stations with announcements
SELECT DISTINCT Station FROM Announcements;

-- 14. DQL: Announcements affecting TrainID 101
SELECT * FROM Announcements WHERE FIND_IN_SET('101', AffectedTrains);

-- 15. DQL: Announcements with Time between '10:00:00' and '15:00:00'
SELECT * FROM Announcements WHERE Time BETWEEN '10:00:00' AND '15:00:00';

-- 16. Constraint: Make Station NOT NULL
ALTER TABLE Announcements MODIFY COLUMN Station VARCHAR(50) NOT NULL;

-- 17. Constraint: Add UNIQUE constraint on (Title, Date, Station)
ALTER TABLE Announcements ADD CONSTRAINT unique_announcement UNIQUE (Title, Date, Station);

-- 18. Operator: Announcements with Status 'Active' or 'Resolved'
SELECT * FROM Announcements WHERE Status IN ('Active', 'Resolved');

-- 19. Operator: Announcements not at 'Kolkata'
SELECT * FROM Announcements WHERE Station <> 'Kolkata';

-- 20. Operator: Announcements valid in July 2025
SELECT * FROM Announcements WHERE ValidFrom BETWEEN '2025-07-01' AND '2025-07-31';

