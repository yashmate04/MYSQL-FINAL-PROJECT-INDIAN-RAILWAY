-- to create database Consulting Firm Management 
create database IndianRailway;

-- to work on database we need to use it 
use IndianRailway;

-- Delete all records use it
Drop Database IndianRailway;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. Create a new table 'Alerts' to store system-wide notifications.
CREATE TABLE Alerts (
    AlertID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Message TEXT,
    PublishDate DATE,
    UrgencyLevel VARCHAR(20)
);

-- 2. Add a new column 'DriverID' to the 'Trains' table.
ALTER TABLE Trains
ADD COLUMN DriverID INT;

-- 3. Add a foreign key constraint to link the new 'DriverID' column in 'Trains' to a 'Staff' table (assuming StaffID is a suitable key).
ALTER TABLE Trains
ADD CONSTRAINT FK_Trains_Drivers
FOREIGN KEY (DriverID) REFERENCES Staff(StaffID);

-- 4. Change the data type of the 'Contact' column in the 'Staff' table to VARCHAR(20).
ALTER TABLE Staff
MODIFY COLUMN Contact VARCHAR(20);

-- 5. Drop the 'Remarks' column from the 'Engineers' table as it is no longer needed.
ALTER TABLE Engineers
DROP COLUMN Remarks;

-- 6. Rename the 'Complaints' table to 'PassengerComplaints'.
ALTER TABLE Complaints
RENAME TO PassengerComplaints;

-- 7. Add a 'PRIMARY KEY' constraint to the 'Parcels' table on the 'BookingID' column.
ALTER TABLE Parcels
ADD PRIMARY KEY (BookingID);

-- 8. Add a 'NOT NULL' constraint to the 'RouteStatus' column in the 'Routes' table.
ALTER TABLE Routes
MODIFY COLUMN RouteStatus VARCHAR(20) NOT NULL;

-- 9. Create an index on the 'TrainID' column in the 'TrainSchedules' table for faster lookup.
CREATE INDEX idx_train_schedule ON TrainSchedules (TrainID);

-- 10. Drop the newly created 'Alerts' table.
DROP TABLE Alerts;

-- 1. Insert a new record into the 'Stations' table.
INSERT INTO Stations (StationName, Code, City, State, PlatformCount, Zone, OpenedYear, Electrified, Remarks)
VALUES ('Pune Junction', 'PNQ', 'Pune', 'Maharashtra', 6, 'Central', 1858, TRUE, 'Major junction in Pune');

-- 2. Insert two new passenger records into the 'Passengers' table in a single query.
INSERT INTO Passengers (FirstName, LastName, Age, Gender, Phone, Email, IDProofType, IDProofNumber, Nationality)
VALUES
('Rahul', 'Singh', 29, 'M', '9876543211', 'rahul.s@gmail.com', 'Aadhaar', '9988-7766-5544', 'Indian'),
('Sonia', 'Rao', 27, 'F', '9876543222', 'sonia.r@gmail.com', 'Passport', 'X1234567', 'Indian');

-- 3. Update the 'Status' of a specific train to 'Delayed'.
UPDATE Trains
SET Status = 'Delayed'
WHERE TrainNumber = '12951';

-- 4. Update the 'Fare' for all bookings made via 'Credit Card' and with a fare over 1400.
UPDATE Bookings
SET Fare = Fare * 1.05
WHERE PaymentMode = 'Credit Card' AND Fare > 1400;

-- 5. Update the 'IsBooked' status for a seat to TRUE.
UPDATE Seats
SET IsBooked = TRUE,
    PassengerID = 1,
    BookingID = 1
WHERE SeatID = 1;

-- 6. Delete a booking record for a cancelled trip.
DELETE FROM Bookings
WHERE BookingStatus = 'Cancelled' AND BookingID = 8;

-- 7. Delete all records from the 'Tickets' table that have a 'Waiting' status.
DELETE FROM Tickets
WHERE TicketStatus = 'Waiting';

-- 8. Delete all records from the `MaintenanceLogs` for a specific train.
DELETE FROM MaintenanceLogs
WHERE TrainID = 1;

-- 9. Delete a single passenger record by their ID.
DELETE FROM Passengers
WHERE PassengerID = 1;

-- 10. Update the 'TotalCoaches' for a train based on its category.
UPDATE Trains
SET TotalCoaches = 25
WHERE Category = 'Superfast';

-- 1. Select all columns for trains with a maximum speed greater than 120.
SELECT *
FROM Trains
WHERE MaxSpeed > 120;

-- 2. Select the names of stations located in 'Maharashtra' or 'Tamil Nadu'.
SELECT StationName, City, State
FROM Stations
WHERE State IN ('Maharashtra', 'Tamil Nadu');

-- 3. Select all passengers whose age is between 30 and 40.
SELECT FirstName, LastName, Age
FROM Passengers
WHERE Age BETWEEN 30 AND 40;

-- 4. Select the total number of coaches for each train category, ordered by the number of coaches in descending order.
SELECT Category, SUM(TotalCoaches) AS TotalCoaches
FROM Trains
GROUP BY Category
ORDER BY TotalCoaches DESC;

-- 5. Count the number of confirmed bookings for each payment mode.
SELECT PaymentMode, COUNT(*) AS ConfirmedBookingsCount
FROM Bookings
WHERE BookingStatus = 'Confirmed'
GROUP BY PaymentMode;

-- 6. Find the average fare for tickets with a 'Confirmed' status.
SELECT AVG(Fare) AS AverageConfirmedFare
FROM Tickets
WHERE TicketStatus = 'Confirmed';

-- 7. List the top 5 most expensive fares from the 'Bookings' table, ordered from highest to lowest.
SELECT BookingID, Fare
FROM Bookings
ORDER BY Fare DESC
LIMIT 5;

-- 8. Find the minimum and maximum platform counts among all stations.
SELECT MIN(PlatformCount) AS MinPlatforms, MAX(PlatformCount) AS MaxPlatforms
FROM Stations;

-- 9. List the names of all 'AC 2 Tier' coaches with their capacity and available seats.
SELECT CoachNumber, Capacity, AvailableSeats
FROM Coaches
WHERE CoachType = 'AC 2 Tier';

-- 10. Select the count of trains for each 'Category' that has more than 18 coaches.
SELECT Category, COUNT(*) AS NumberOfTrains
FROM Trains
WHERE TotalCoaches > 18
GROUP BY Category;	

-- 1. Find all staff whose 'Role' is either 'Ticket Checker' or 'Attendant'.
SELECT Name, Role
FROM Staff
WHERE Role IN ('Ticket Checker', 'Attendant');

-- 2. Find all trains that do not run 'Daily'.
SELECT TrainName, RunningDays
FROM Trains
WHERE RunningDays NOT IN ('Daily');

-- 3. Select stations with a 'City' starting with 'M' and ending with 'i'.
SELECT StationName, City
FROM Stations
WHERE City LIKE 'M%i';

-- 4. Select train schedules that are 'On Time' AND have a 'PlatformNumber' of '1'.
SELECT *
FROM TrainSchedules
WHERE Status = 'On Time' AND PlatformNumber = '1';

-- 5. Select passenger names where their email contains 'gmail.com' OR their ID proof type is 'Passport'.
SELECT FirstName, LastName, Email, IDProofType
FROM Passengers
WHERE Email LIKE '%gmail.com' OR IDProofType = 'Passport';

-- 6. Select all bookings with a fare BETWEEN 900 and 1200.
SELECT *
FROM Bookings
WHERE Fare BETWEEN 900 AND 1200;

-- 7. Find all coaches with a 'PantryAvailable' status of TRUE.
SELECT CoachNumber, PantryAvailable
FROM Coaches
WHERE PantryAvailable = TRUE;

-- 8. Select all Engineers where the 'Specialization' is 'Mechanical' OR 'Electrical'.
SELECT Name, Specialization
FROM Engineers
WHERE Specialization IN ('Mechanical', 'Electrical');

-- 9. Find trains with 'TotalCoaches' greater than ANY of the trains in the 'Rajdhani' category.
SELECT TrainName, TotalCoaches
FROM Trains
WHERE TotalCoaches > ANY (SELECT TotalCoaches FROM Trains WHERE Category = 'Rajdhani');

-- 10. Find trains that have a 'TotalCoaches' count greater than or equal to ALL of the trains in the 'Shatabdi' category.
SELECT TrainName, TotalCoaches
FROM Trains
WHERE TotalCoaches >= ALL (SELECT TotalCoaches FROM Trains WHERE Category = 'Shatabdi');

-- 1. Add a unique constraint to the 'Email' column in the 'Passengers' table.
ALTER TABLE Passengers
ADD CONSTRAINT UQ_Passengers_Email UNIQUE (Email);

-- 2. Add a CHECK constraint to ensure that 'Age' in the 'Passengers' table is a positive number.
ALTER TABLE Passengers
ADD CONSTRAINT CHK_Passengers_Age CHECK (Age > 0);

-- 3. Define 'TrainID' as a primary key in the 'Trains' table.
ALTER TABLE Trains
ADD PRIMARY KEY (TrainID);

-- 4. Add a foreign key to link 'TrainSchedules' with 'Routes' and set ON DELETE CASCADE. This means if a route is deleted, its schedules will also be deleted.
ALTER TABLE TrainSchedules
ADD CONSTRAINT FK_TrainSchedules_Routes
FOREIGN KEY (RouteID) REFERENCES Routes(RouteID) ON DELETE CASCADE;

-- 5. Add a foreign key to link 'Tickets' with 'Bookings' and set ON UPDATE CASCADE. This means if a booking ID changes, the ticket's booking ID will also change.
ALTER TABLE Tickets
ADD CONSTRAINT FK_Tickets_Bookings
FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID) ON UPDATE CASCADE;

-- 6. Add a foreign key to link 'Coaches' with 'Trains' and set ON DELETE SET NULL. This means if a train is deleted, the TrainID in the Coaches table will be set to NULL.
ALTER TABLE Coaches
ADD CONSTRAINT FK_Coaches_Trains
FOREIGN KEY (TrainID) REFERENCES Trains(TrainID) ON DELETE SET NULL;

-- 7. Create a new table 'TicketLogs' with a foreign key to 'Tickets' and ON DELETE CASCADE.
CREATE TABLE TicketLogs (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    TicketID INT,
    LogMessage TEXT,
    LogDate DATE,
    FOREIGN KEY (TicketID) REFERENCES Tickets(TicketID) ON DELETE CASCADE
);

-- 8. Add a default value to the 'TicketStatus' column in the 'Tickets' table.
ALTER TABLE Tickets
MODIFY COLUMN TicketStatus VARCHAR(20) DEFAULT 'Pending';

-- 9. Add a foreign key to link 'Seats' with 'Coaches' and set ON DELETE RESTRICT.
ALTER TABLE Seats
ADD CONSTRAINT FK_Seats_Coaches
FOREIGN KEY (CoachID) REFERENCES Coaches(CoachID) ON DELETE RESTRICT;

-- 10. Drop the foreign key constraint from the 'TrainSchedules' table.
ALTER TABLE TrainSchedules
DROP FOREIGN KEY FK_TrainSchedules_Routes;

-- 1. Use an INNER JOIN to list the name and category of trains along with their source and destination stations.
SELECT T.TrainName, T.Category, R.SourceStation, R.DestinationStation
FROM Trains T
INNER JOIN Routes R ON T.TrainID = R.TrainID;

-- 2. Use a LEFT JOIN to find all passengers and their booking details, including passengers who have not made any bookings yet.
SELECT P.FirstName, P.LastName, B.BookingID, B.BookingDate
FROM Passengers P
LEFT JOIN Bookings B ON P.PassengerID = B.PassengerID;

-- 3. Use a RIGHT JOIN to find all train coaches and the train name they belong to, including coaches that may not be assigned to a specific train.
SELECT C.CoachNumber, C.CoachType, T.TrainName
FROM Coaches C
RIGHT JOIN Trains T ON C.TrainID = T.TrainID;

-- 4. Use a FULL OUTER JOIN (or a combination of LEFT and RIGHT JOINs for MySQL) to get a list of all trains and all coaches, regardless of whether they are matched.
-- This query combines results from a LEFT and RIGHT join to simulate a FULL OUTER JOIN.
SELECT T.TrainName, C.CoachNumber
FROM Trains T LEFT JOIN Coaches C ON T.TrainID = C.TrainID
UNION
SELECT T.TrainName, C.CoachNumber
FROM Trains T RIGHT JOIN Coaches C ON T.TrainID = C.TrainID;

-- 5. Use a SELF JOIN to find pairs of engineers with the same specialization.
SELECT E1.Name AS Engineer1, E2.Name AS Engineer2, E1.Specialization
FROM Engineers E1
INNER JOIN Engineers E2 ON E1.Specialization = E2.Specialization AND E1.EngineerID < E2.EngineerID;

-- 6. Use an INNER JOIN to list the names of passengers and the train names they are booked on.
SELECT P.FirstName, P.LastName, T.TrainName
FROM Passengers P
JOIN Bookings B ON P.PassengerID = B.PassengerID
JOIN Trains T ON B.TrainID = T.TrainID;

-- 7. Use a JOIN to find the names of all staff assigned to trains that are of 'Rajdhani' category.
SELECT S.Name, S.Role, T.TrainName
FROM Staff S
JOIN Trains T ON S.TrainID = T.TrainID
WHERE T.Category = 'Rajdhani';

-- 8. Use a JOIN to list the names of all engineers and the trains they are assigned to, for trains that have 'Superfast' category.
SELECT E.Name, E.Specialization, T.TrainName
FROM Engineers E
JOIN Trains T ON E.TrainID = T.TrainID
WHERE T.Category = 'Superfast';

-- 9. Use a LEFT JOIN to list all stations and any announcements that affect them, including stations with no announcements.
SELECT S.StationName, A.Title AS AnnouncementTitle
FROM Stations S
LEFT JOIN Announcements A ON S.StationName = A.Station;

-- 10. Use a JOIN to find the total number of seats booked for each train.
SELECT T.TrainName, COUNT(S.SeatID) AS TotalSeatsBooked
FROM Trains T
JOIN Seats S ON T.TrainID = S.TrainID
WHERE S.IsBooked = TRUE
GROUP BY T.TrainName;

-- 1. Nested Subquery: Find the names of passengers who have a booking with a fare greater than the average fare.
SELECT FirstName, LastName
FROM Passengers
WHERE PassengerID IN (SELECT PassengerID FROM Bookings WHERE Fare > (SELECT AVG(Fare) FROM Bookings));

-- 2. Correlated Subquery: Find the `TrainName` for each train that has at least one coach with more than 60 occupied seats.
SELECT TrainName
FROM Trains T
WHERE EXISTS (SELECT 1 FROM Coaches C WHERE C.TrainID = T.TrainID AND C.OccupiedSeats > 60);

-- 3. Find the maximum fare for a confirmed booking.
SELECT MAX(Fare)
FROM Bookings
WHERE BookingStatus = 'Confirmed';

-- 4. Find the names of staff members who are assigned to the train with the most coaches.
SELECT Name
FROM Staff
WHERE TrainID = (SELECT TrainID FROM Trains ORDER BY TotalCoaches DESC LIMIT 1);

-- 5. Find the names of stations that have a platform count greater than the average platform count of all stations.
SELECT StationName
FROM Stations
WHERE PlatformCount > (SELECT AVG(PlatformCount) FROM Stations);

-- 6. Find the 'TrainName' and 'TotalDistance' for trains that have a route distance greater than the average distance of all routes.
SELECT TrainName, TotalDistance
FROM Routes
WHERE TotalDistance > (SELECT AVG(TotalDistance) FROM Routes);

-- 7. Find all bookings where the `PassengerID` is not in the `Tickets` table, indicating a potential issue.
SELECT *
FROM Bookings
WHERE PassengerID NOT IN (SELECT PassengerID FROM Tickets);

-- 8. Find all tickets that have the same fare as any ticket with a 'Confirmed' status.
SELECT *
FROM Tickets
WHERE Fare = ANY (SELECT Fare FROM Tickets WHERE TicketStatus = 'Confirmed');

-- 9. Correlated Subquery: Find the `TrainName` for each train that has at least one 'AC 2 Tier' coach.
SELECT TrainName
FROM Trains T
WHERE EXISTS (SELECT 1 FROM Coaches C WHERE C.TrainID = T.TrainID AND C.CoachType = 'AC 2 Tier');

-- 10. Find the total fare collected for each 'PaymentMode' for confirmed bookings.
SELECT PaymentMode, (SELECT SUM(Fare) FROM Bookings WHERE PaymentMode = B.PaymentMode AND BookingStatus = 'Confirmed') AS TotalFare
FROM Bookings B
GROUP BY PaymentMode;

-- 1. Aggregate Function (COUNT): Count the total number of passengers.
SELECT COUNT(*) FROM Passengers;

-- 2. Aggregate Function (SUM): Calculate the total fare from all confirmed bookings.
SELECT SUM(Fare) FROM Bookings WHERE BookingStatus = 'Confirmed';

-- 3. Aggregate Function (AVG): Calculate the average age of all male passengers.
SELECT AVG(Age) FROM Passengers WHERE Gender = 'M';

-- 4. Aggregate Function (MIN): Find the earliest 'OpenedYear' of a station.
SELECT MIN(OpenedYear) FROM Stations;

-- 5. Aggregate Function (MAX): Find the latest 'JoinDate' of a staff member.
SELECT MAX(JoinDate) FROM Staff;

-- 6. Scalar Function (UPPER): Display all station names in uppercase.
SELECT UPPER(StationName) FROM Stations;

-- 7. Scalar Function (LOWER): Display all staff emails in lowercase.
SELECT LOWER(Email) FROM Staff;

-- 8. Scalar Function (LENGTH): Find the length of the longest 'TrainName'.
SELECT MAX(LENGTH(TrainName)) FROM Trains;

-- 9. Scalar Function (CONCAT): Combine the 'FirstName' and 'LastName' of passengers into a single 'FullName' column.
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Passengers;

-- 10. Scalar Function (TRIM): Remove leading and trailing spaces from a staff member's name.
SELECT TRIM(Name) FROM Staff;

-- 1. Create a simple view of all confirmed bookings.
CREATE VIEW ConfirmedBookings AS
SELECT BookingID, PassengerID, TrainID, JourneyDate, Fare
FROM Bookings
WHERE BookingStatus = 'Confirmed';

-- 2. Query the newly created view.
SELECT * FROM ConfirmedBookings;

-- 3. Create a view to show Train and Route details together.
CREATE VIEW TrainRoutes AS
SELECT T.TrainNumber, T.TrainName, R.SourceStation, R.DestinationStation, R.TotalDistance
FROM Trains T
JOIN Routes R ON T.TrainID = R.TrainID;

-- 4. Query the 'TrainRoutes' view to find routes over 1500 KM.
SELECT TrainName, TotalDistance FROM TrainRoutes WHERE TotalDistance > 1500;

-- 5. Update the 'ConfirmedBookings' view to include the 'PaymentMode' column.
ALTER VIEW ConfirmedBookings AS
SELECT BookingID, PassengerID, TrainID, JourneyDate, PaymentMode, Fare
FROM Bookings
WHERE BookingStatus = 'Confirmed';

-- 6. Use a CTE to find the number of trains in each category.
WITH TrainCategoryCount AS (
    SELECT Category, COUNT(*) AS NumberOfTrains
    FROM Trains
    GROUP BY Category
)
SELECT * FROM TrainCategoryCount;

-- 7. Use a CTE to find the average age of passengers for each gender.
WITH AveragePassengerAge AS (
    SELECT Gender, AVG(Age) AS AverageAge
    FROM Passengers
    GROUP BY Gender
)
SELECT * FROM AveragePassengerAge;

-- 8. Use a CTE to find the total capacity of coaches for each train.
WITH TrainCapacity AS (
    SELECT TrainID, SUM(Capacity) AS TotalCapacity
    FROM Coaches
    GROUP BY TrainID
)
SELECT T.TrainName, TC.TotalCapacity
FROM TrainCapacity TC
JOIN Trains T ON TC.TrainID = T.TrainID;

-- 9. Use a CTE to find all the trains with 'Rajdhani' in their name and their MaxSpeed.
WITH RajdhaniTrains AS (
    SELECT TrainName, MaxSpeed
    FROM Trains
    WHERE TrainName LIKE '%Rajdhani%'
)
SELECT * FROM RajdhaniTrains;

-- 10. Drop the 'ConfirmedBookings' view.
DROP VIEW ConfirmedBookings;

-- 1. Create a simple stored procedure to get all trains from a specific category.
DELIMITER //
CREATE PROCEDURE GetTrainsByCategory(IN category_name VARCHAR(50))
BEGIN
    SELECT * FROM Trains WHERE Category = category_name;
END //
DELIMITER ;

-- 2. Execute the stored procedure to get all 'Rajdhani' trains.
CALL GetTrainsByCategory('Rajdhani');

-- 3. Create a stored procedure to insert a new passenger record.
DELIMITER //
CREATE PROCEDURE AddPassenger(
    IN fname VARCHAR(50),
    IN lname VARCHAR(50),
    IN age INT,
    IN gender CHAR(1),
    IN phone VARCHAR(15),
    IN email VARCHAR(100),
    IN id_type VARCHAR(50),
    IN id_number VARCHAR(50),
    IN nationality VARCHAR(50)
)
BEGIN
    INSERT INTO Passengers (FirstName, LastName, Age, Gender, Phone, Email, IDProofType, IDProofNumber, Nationality)
    VALUES (fname, lname, age, gender, phone, email, id_type, id_number, nationality);
END //
DELIMITER ;

-- 4. Execute the stored procedure to add a new passenger.
CALL AddPassenger('Arjun', 'Mehta', 30, 'M', '9988776655', 'arjun.m@gmail.com', 'Aadhaar', '9999-8888-7777', 'Indian');

-- 5. Create a stored procedure to delete a passenger by ID.
DELIMITER //
CREATE PROCEDURE DeletePassengerByID(IN passenger_id INT)
BEGIN
    DELETE FROM Passengers WHERE PassengerID = passenger_id;
END //
DELIMITER ;

-- 1. ROW_NUMBER(): Assign a unique row number to each booking, partitioned by TrainID, ordered by Fare.
SELECT
    BookingID,
    TrainID,
    Fare,
    ROW_NUMBER() OVER (PARTITION BY TrainID ORDER BY Fare DESC) AS RowNum
FROM Bookings;

-- 2. RANK(): Rank the trains by their maximum speed.
SELECT
    TrainName,
    MaxSpeed,
    RANK() OVER (ORDER BY MaxSpeed DESC) AS SpeedRank
FROM Trains;

-- 3. DENSE_RANK(): Rank the trains by their total number of coaches, handling ties.
SELECT
    TrainName,
    TotalCoaches,
    DENSE_RANK() OVER (ORDER BY TotalCoaches DESC) AS CoachRank
FROM Trains;

-- 4. LEAD(): Find the next 'OpenedYear' for each station based on the opening date.
SELECT
    StationName,
    OpenedYear,
    LEAD(OpenedYear, 1, 'N/A') OVER (ORDER BY OpenedYear) AS NextOpenedYear
FROM Stations;

-- 5. LAG(): Find the previous 'Fare' for each booking made by the same passenger, ordered by booking date.
SELECT
    BookingID,
    PassengerID,
    Fare,
    BookingDate,
    LAG(Fare, 1, 0) OVER (PARTITION BY PassengerID ORDER BY BookingDate) AS PreviousFare
FROM Bookings;

-- 1. Begin a transaction. Rollback if an error occurs.
START TRANSACTION;
-- Attempt to insert a new booking.
INSERT INTO Bookings (PassengerID, TrainID, CoachType, SeatNumber, JourneyDate, BookingDate, BookingStatus, PaymentMode, Fare)
VALUES (100, 1, 'Sleeper', 'S1-50', '2025-08-01', '2025-07-30', 'Confirmed', 'UPI', 900.00);
-- Rollback the transaction to undo the change.
ROLLBACK;

-- 2. A transaction with a SAVEPOINT.
START TRANSACTION;
INSERT INTO Passengers (FirstName, LastName, Age, Gender, Phone, Email, IDProofType, IDProofNumber, Nationality)
VALUES ('Jane', 'Doe', 25, 'F', '1112223334', 'jane.d@gmail.com', 'Aadhaar', '1111-2222-3333', 'Indian');
SAVEPOINT passenger_insert;
-- Attempt a second operation, which might fail.
INSERT INTO Coaches (TrainID, CoachNumber, CoachType, Capacity, OccupiedSeats, AvailableSeats, AC, PantryAvailable, Remarks)
VALUES (999, 'X1', 'AC Chair Car', 70, 0, 70, TRUE, TRUE, 'New Coach');
-- Rollback to the savepoint if the second operation fails.
ROLLBACK TO SAVEPOINT passenger_insert;
-- Commit the first successful operation.
COMMIT;

-- 3. A successful transaction to update the status of a train.
START TRANSACTION;
UPDATE Trains SET Status = 'Delayed' WHERE TrainID = 1;
COMMIT;

-- 4. A transaction to update a passenger's email and then commit.
START TRANSACTION;
UPDATE Passengers SET Email = 'new_email@gmail.com' WHERE PassengerID = 1;
COMMIT;

-- 5. Another transaction to insert a booking and its corresponding ticket, and then commit both.
START TRANSACTION;
INSERT INTO Bookings (PassengerID, TrainID, CoachType, SeatNumber, JourneyDate, BookingDate, BookingStatus, PaymentMode, Fare)
VALUES (2, 2, 'AC 2 Tier', 'A2-17', '2025-08-01', '2025-07-31', 'Confirmed', 'Credit Card', 1450.00);
INSERT INTO Tickets (BookingID, PassengerID, TrainID, CoachNumber, SeatNumber, TicketType, TicketStatus, IssueDate, Fare)
VALUES (LAST_INSERT_ID(), 2, 2, 'A2', '17', 'E-Ticket', 'Confirmed', '2025-07-31', 1450.00);
COMMIT;

-- 1. AFTER INSERT Trigger: After a new booking is inserted, update the available seats in the 'Coaches' table.
DELIMITER //
CREATE TRIGGER after_booking_insert
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Coaches
    SET AvailableSeats = AvailableSeats - 1, OccupiedSeats = OccupiedSeats + 1
    WHERE TrainID = NEW.TrainID AND CoachType = NEW.CoachType;
END //
DELIMITER ;

-- 2. BEFORE UPDATE Trigger: Before a passenger's age is updated, check if the new age is valid.
DELIMITER //
CREATE TRIGGER before_passenger_age_update
BEFORE UPDATE ON Passengers
FOR EACH ROW
BEGIN
    IF NEW.Age < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Age cannot be a negative number.';
    END IF;
END //
DELIMITER ;

-- 3. AFTER DELETE Trigger: After a ticket is deleted, update the corresponding booking status to 'Cancelled'.
DELIMITER //
CREATE TRIGGER after_ticket_delete
AFTER DELETE ON Tickets
FOR EACH ROW
BEGIN
    UPDATE Bookings
    SET BookingStatus = 'Cancelled'
    WHERE BookingID = OLD.BookingID;
END //
DELIMITER ;

-- 4. BEFORE INSERT Trigger: Before inserting a new train, check if the TrainNumber is not null.
DELIMITER //
CREATE TRIGGER before_train_insert
BEFORE INSERT ON Trains
FOR EACH ROW
BEGIN
    IF NEW.TrainNumber IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'TrainNumber cannot be NULL.';
    END IF;
END //
DELIMITER ;

-- 5. AFTER UPDATE Trigger: After a booking's fare is updated, update the corresponding ticket's fare.
DELIMITER //
CREATE TRIGGER after_booking_fare_update
AFTER UPDATE ON Bookings
FOR EACH ROW
BEGIN
    IF OLD.Fare <> NEW.Fare THEN
        UPDATE Tickets
        SET Fare = NEW.Fare
        WHERE BookingID = NEW.BookingID;
    END IF;
END //
DELIMITER ;
