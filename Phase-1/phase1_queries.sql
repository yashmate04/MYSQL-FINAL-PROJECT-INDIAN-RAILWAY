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
Drop Database IndianRailway;
-- --------------------------------------------- Database Analysis -----------------------------------------------------

CREATE TABLE Stations (
    StationID INT PRIMARY KEY AUTO_INCREMENT,
    StationName VARCHAR(100),
    Code CHAR(5),
    City VARCHAR(50),
    State VARCHAR(50),
    PlatformCount INT,
    Zone VARCHAR(50),
    OpenedYear SMALLINT,   -- changed from YEAR to SMALLINT
    Electrified BOOLEAN,
    Remarks TEXT
);

INSERT INTO Stations (StationName, Code, City, State, PlatformCount, Zone, OpenedYear, Electrified, Remarks)
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

-- Table 22: Bridges
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

-- Table 23: Bridges
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
