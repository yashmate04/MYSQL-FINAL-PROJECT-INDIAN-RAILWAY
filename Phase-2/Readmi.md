# Phase 2: Railway Management System - Core SQL Operations

---

## 🚀 Project Overview

This repository represents **Phase 2** of the Railway Management System database project. The primary focus of this phase was to implement and demonstrate a comprehensive set of **SQL operations** including **Data Definition Language (DDL)**, **Data Manipulation Language (DML)**, and **Data Query Language (DQL)**.

The included script, `Phase-2 final-y.sql`, sets up and interacts with key tables, with a special emphasis on managing and querying **Train Announcements**.

## 📁 Files in This Repository

| File Name | Description |
| :--- | :--- |
| **`Phase-2 final-y.sql`** | The complete SQL script containing table creation outlines, data insertion examples, and various query demonstrations. |
| `README.md` | This document. |

## 🏗️ Database Schema Summary

This phase utilizes a relational schema involving several core entities of a railway system. The script outlines operations relevant to the following tables (among others):

* **`Stations`**: Station details, location, and capacity.
* **`Trains`**: Train meta-data (name, speed, coaches, status).
* **`Passengers`**: Personal and identification details of travelers.
* **`Bookings` / `Tickets`**: Transactional data for ticket purchases.
* **`Routes`**: Defines the path, distance, and stops for each train.
* **`Coaches` / `Seats`**: Configuration and availability within trains.
* **`Staff` / `Engineers`**: Employee details and assigned duties.
* **`Announcements`**: The central focus of the operational queries, managing information displayed/broadcasted at stations.

## ✨ Key Operations & Features

The `Phase-2 final-y.sql` script demonstrates the following critical database functionalities:

### 1. Data Definition Language (DDL)
* **Constraint Management:** Adding constraints such as `NOT NULL` on essential fields (e.g., `Station` in the `Announcements` table).
* **Uniqueness Enforcement:** Implementing `UNIQUE` constraints across multiple columns (e.g., ensuring a unique combination of `Title`, `Date`, and `Station` for announcements).

### 2. Data Manipulation Language (DML)
* **CRUD Operations:** Examples of `INSERT`, `UPDATE`, and `DELETE` statements on the `Announcements` table to manage the lifecycle of a public announcement.

### 3. Data Query Language (DQL)
* **Filtering & Searching:** Queries to select announcements based on specific criteria like `Station`, `Status` (`Active`, `Resolved`), and **Time** or **Date Range**.
* **Complex Joins/Operators:** Use of operators like `IN` and functions like `FIND_IN_SET` to filter announcements by multiple affected `TrainIDs`.
* **Aggregation:** Counting announcements based on their `Status`.
* **Ordering & Distinct Selection:** Queries to sort data (e.g., by `Date` descending) and retrieve `DISTINCT` values (e.g., list of stations with announcements).

## 🛠️ Setup and Prerequisites

To run the SQL script locally, you will need:

1.  **A Relational Database Management System (RDBMS):** The script is written in standard SQL and is compatible with systems like **MySQL**, **PostgreSQL**, or **MariaDB**.
2.  **A Client Tool:** Tools like MySQL Workbench, DBeaver, or command-line clients (e.g., `psql`, `mysql`) to execute the script.

## ⚙️ How to Run the Script

1.  **Connect to your RDBMS:** Use your preferred client tool to connect to your database server.
2.  **Create a New Database:** Execute a command like `CREATE DATABASE railway_phase2;` and then `USE railway_phase2;`.
3.  **Execute the Script:** Open `Phase-2 final-y.sql` and execute all the commands in sequence.
    * *Note: The script assumes the tables already exist (as it only contains DML/DQL/DDL examples related to operations). If you need the initial `CREATE TABLE` statements, they should be run first.*
4.  **Verify Operations:** Review the output of the DQL queries at the end of the script to see the results of the data manipulations and constraint enforcements.

---
## Link for Comprehensive video on phase 2
https://drive.google.com/drive/folders/1r75TTb_jxt0bozrVE87X1y8uJlrQMzq-?usp=sharing

## 🤝 Contribution

Feel free to suggest improvements, optimizations to the SQL queries, or additional features for subsequent phases.
