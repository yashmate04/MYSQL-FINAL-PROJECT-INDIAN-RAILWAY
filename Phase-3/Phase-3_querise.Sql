
-- to create database Consulting Firm Management 
create database IndianRailway;

-- to work on database we need to use it 
use IndianRailway;

-- Delete all records use it
Drop Table IndianRailway;
-- --------------------------------------------- Database Analysis -----------------------------------------------------

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
