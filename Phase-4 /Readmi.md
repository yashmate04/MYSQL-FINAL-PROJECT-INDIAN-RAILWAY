# 🚂 Indian Railway Management System (IRMS) - Phase 4: Database Automation & Control

---

## 📄 Project Description

This repository contains the advanced SQL scripts for **Phase 4** of the Indian Railway Management System (IRMS) database project.

Building on the schema and complex queries from previous phases, Phase 4 focuses on **Database Programming and Control**. It implements core features necessary for database management and integrity, including **Views** for simplified access, **Stored Procedures** for centralized business logic, **Triggers** for automated data integrity and logging, and **Transaction Control Language (TCL)** for ensuring atomic data operations.

## ✨ Core Phase 4 Concepts Implemented

The `phase final 4.sql` script demonstrates over 100 dedicated statements covering critical database programming elements across the 25 tables.

### 1. Stored Procedures (SP)
Stored procedures are utilized to encapsulate complex or frequently used queries, improving performance and security.
* **Data Retrieval:** Procedures to fetch filtered data, such as `GetStationsByState(IN stateName VARCHAR(50))` and `GetTrainsBySource(IN src VARCHAR(50))`.
* **Data Manipulation:** Procedures to manage operational data, like `UpdateTrainStatus(IN p_TrainID INT, IN p_Status VARCHAR(20))`.

### 2. Triggers (Tri)
Triggers are implemented for automated actions, maintaining data integrity, and creating robust audit logs.
* **Audit Logging:** `trg_after_insert_station` and `trg_after_booking_insert` automatically log new insertions into dedicated `StationLogs` and `BookingLogs` tables.
* **Integrity Enforcement:** Triggers prevent unauthorized deletions of critical data, such as `PreventDeliveredDelete` on `FreightBookings` and `PreventActiveDelete` on `Announcements`.

### 3. Views (V)
Views are created to provide simplified, filtered, or aggregated representations of the underlying data, abstracting complexity from end-users.
* **Filtering:** `SuperfastTrains` (shows only trains with `Category = 'Superfast'`).
* **Analysis:** `MajorStations` (filters stations with more than 10 platforms).
* **Operational Status:** `ActiveAnnouncements` and `ConfirmedTickets`.

### 4. Transaction Control Language (TCL) & Constraints
The project includes examples of managing the database state and enforcing business rules.
* **Transactions:** Use of `START TRANSACTION`, `COMMIT`, and `ROLLBACK` is demonstrated to ensure data modification operations are atomic and reliable.
* **Constraints:** Custom constraints like `CHECK (Fare > 0)` on the `Bookings` table and `UNIQUE` constraints on key fields (`Stations.Code`, `Trains.TrainNumber`, `Passengers.Email`) enforce data validity.

### 5. Window Functions (Analytical SQL)
Advanced SQL techniques are continued from Phase 3, primarily using window functions for complex analytical reporting.
* **Ranking:** Using `RANK() OVER (PARTITION BY Category ORDER BY MaxSpeed DESC)` to rank trains within their respective categories.
* **Aggregation:** Calculating running totals (e.g., `SUM(TotalCoaches) OVER (ORDER BY TrainID)`) and partitioned averages (e.g., average fare per coach type).

---

## ⚙️ Database Schema Summary (25 Tables)

The system is built around 25 core tables to manage the entire railway ecosystem, including:

* **Stations, Trains, Passengers, Bookings, Tickets, Routes**
* **Staff, Engineers, MaintenanceLogs**
* **Cargo, Parcels, FreightBookings** (for logistics)
* **Signals, Tracks, Bridges, LevelCrossings** (for infrastructure)

---

## 🚀 Getting Started

### Prerequisites

This project is written in **MySQL (or MariaDB)** and relies on features such as `DELIMITER //` for procedural code creation, `AUTO_INCREMENT`, and standard functions like `DATEDIFF()`.

### Installation

1.  **Setup Database:** Ensure you have a running instance of MySQL.
2.  **Create Database:** Log into your MySQL client and execute the initial commands:
    ```sql
    CREATE DATABASE IndianRailway;
    USE IndianRailway;
    ```
3.  **Run Script:** Execute the entire contents of the `phase final 4.sql` file. This script will:
    * Create all 25 tables with necessary keys and constraints.
    * Insert sample data into the tables.
    * Create all **Stored Procedures**, **Views**, and **Triggers**.
    * Execute the comprehensive set of queries, including testing all Phase 4 concepts.

### Example Stored Procedure

This procedure demonstrates fetching all train details based on the departure station:

```sql
DELIMITER $$
CREATE PROCEDURE GetTrainsBySource(IN src VARCHAR(50))
BEGIN
  SELECT TrainNumber, TrainName, DestinationStation 
  FROM Trains 
  WHERE SourceStation = src;
END $$
DELIMITER ;

-- Example Call
CALL GetTrainsBySource('Chennai');
