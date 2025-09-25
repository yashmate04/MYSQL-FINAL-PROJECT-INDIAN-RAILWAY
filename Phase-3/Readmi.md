# 🚂 Indian Railway Management System (IRMS) - Phase 3: Advanced SQL Analysis

---

## 📄 Project Description

This repository contains the advanced SQL scripts for **Phase 3** of the Indian Railway Management System (IRMS) database project.

This phase focuses heavily on demonstrating proficiency in advanced SQL techniques, including complex joins, subqueries, **Window Functions** for ranking and analytical operations, and **User-Defined Functions (UDFs)** for custom logic implementation. The database models a comprehensive railway operation, covering everything from passenger bookings and train schedules to maintenance logs and staff management.

## ✨ Key Features & Concepts Covered

The `project phase-3 final.sql` file includes schema definition, sample data, and over **20 unique analytical queries** for each of the major tables, demonstrating the following advanced concepts:

### 1. Advanced Queries and Joins
* **Complex Joins:** Extensive use of `INNER JOIN`, `LEFT JOIN`, and **Self-Joins** (e.g., finding stations in the same state).
* **Subqueries:** Implementation of nested queries, including those using `IN`, `EXISTS`, and subqueries in the `FROM` and `WHERE` clauses for data filtering and analysis.
* **Aggregation and Filtering:** Using `GROUP BY` and the `HAVING` clause to filter aggregated results (e.g., finding zones with more than two stations).

### 2. Window Functions (Analytical SQL)
* **Ranking:** Usage of analytical techniques to perform ranking operations on data without complex self-joins.
    * **`RANK()` / `DENSE_RANK()`:** Used to rank passengers by age, trains by speed, or maintenance logs by date (simulated with portable fallbacks and explicit ranking logic for compatibility).

### 3. User-Defined Functions (UDFs)
* The script includes custom UDFs to encapsulate business logic directly into the database:
    * `get_station_age(opened YEAR)`: Calculates the age of a railway station.
    * `fn_discount(fare DECIMAL)`: Applies a calculation (e.g., a 10% discount) to a ticket fare.
    * `fn_remaining_days(p_vendor_id INT)`: Calculates remaining contract days for vendors.
    * `fn_is_active(p_announcement_id INT)`: Checks if an announcement is currently valid based on `ValidFrom` and `ValidTo` dates.

### 4. Control Flow and Data Manipulation
* Implementation of the **`CASE` expression** for conditional logic and categorization (e.g., classifying station size or ticket fares).
* Use of built-in functions like `CONCAT()`, `UPPER()`, `LENGTH()`, `DATE_FORMAT()`, `COALESCE()`, and `DATEDIFF()`.

---

## ⚙️ Database Schema Summary (25 Tables)

The system is built around 25 core tables to manage the entire railway ecosystem. Key entity tables include:

| Table Name | Description |
| :--- | :--- |
| **Stations** | Station details, location, and platform count. |
| **Trains** | Train details, number, name, speed, and category. |
| **Passengers** | Personal and contact information for travelers. |
| **Bookings** | Transactional data like fares, payment mode, and booking status. |
| **Routes** | Route information, total distance, and total stops. |
| **Staff/Engineers** | Details for railway staff, onboard personnel, and maintenance engineers. |
| **MaintenanceLogs** | Records of reported issues and actions taken on trains. |
| **Timetables/Schedules** | Train departure and arrival times. |
| **Complaints/Announcements** | Records for passenger feedback and system announcements. |

---

## 🚀 Getting Started

### Prerequisites

This project is written in **MySQL (or MariaDB)** and utilizes features like `DELIMITER //`, `AUTO_INCREMENT`, and date functions (`CURDATE()`, `YEAR()`, `DATEDIFF()`) which are standard in modern MySQL distributions.

### Installation

1.  **Setup Database:** Ensure you have a running instance of MySQL.
2.  **Create Database:** Log into your MySQL client (e.g., MySQL Workbench, DBeaver, or command line) and execute the initial command to create the database:
    ```sql
    CREATE DATABASE IndianRailway;
    USE IndianRailway;
    ```
3.  **Run Script:** Execute the entire contents of the `project phase-3 final.sql` file. This script will:
    * Create all 25 tables.
    * Insert sample data into the main tables (Stations, Trains, Passengers, Bookings, Tickets, etc.).
    * Create all User-Defined Functions (UDFs).
    * Execute the comprehensive set of 100+ analytical queries (the query results will be displayed in your client).

### Example Query Showcase

Below is an example of an advanced query used in the project, demonstrating the use of a UDF and a `CASE` expression on the `Bookings` table:

```sql
SELECT BookingID, 
       Fare, 
       fn_discount(Fare) AS DiscountedFare, -- Uses a UDF
       CASE 
         WHEN Fare > 1200 THEN 'High'
         WHEN Fare BETWEEN 800 AND 1200 THEN 'Medium'
         ELSE 'Low'
       END AS FareCategory -- Uses a CASE expression
FROM Bookings;
