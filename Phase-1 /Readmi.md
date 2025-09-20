# Indian Railway Database Management System – Phase 1

## 📌 Project Overview
This project is part of **Phase 1** of the Indian Railway Database Management System.  
It focuses on designing and implementing a **relational database** that models various aspects of the Indian Railways, including stations, trains, passengers, bookings, staff, schedules, maintenance, and freight operations.  

The project is implemented using **MySQL** and demonstrates schema creation, data population, and query execution.

---

## 🎯 Objectives
- To design a normalized and scalable database for managing Indian Railways.
- To capture real-world entities such as passengers, trains, stations, staff, routes, and freight services.
- To implement CRUD operations (Create, Read, Update, Delete).
- To provide sample data for testing and future system integration.

---

## 📂 Database Schema
The database is named **`IndianRailway`** and contains **25 interrelated tables**, including:

1. **Stations** – Station details such as name, city, state, platforms, etc.  
2. **Trains** – Train information including number, name, type, speed, running days, etc.  
3. **Passengers** – Passenger personal details and identification.  
4. **Bookings** – Ticket booking details including fare, status, and journey info.  
5. **Tickets** – Ticket issuance records.  
6. **Routes** – Source, destination, distance, and stop details.  
7. **Coaches** – Train coach information (AC, Sleeper, etc.).  
8. **Seats** – Seat allocation and availability.  
9. **Staff** – Train and station staff details.  
10. **Engineers** – Technical staff and their specialization.  
11. **TrainSchedules** – Train scheduling information.  
12. **Catering** – Onboard catering services.  
13. **Vendors** – Vendor contracts and details.  
14. **MaintenanceLogs** – Train maintenance history.  
15. **Complaints** – Passenger complaints and resolutions.  
16. **Cargo** – Cargo transport bookings.  
17. **Parcels** – Parcel booking and delivery tracking.  
18. **FreightBookings** – Freight transport services.  
19. **Signals** – Railway signal management.  
20. **Tracks** – Track details and inspections.  
21. **Bridges** – Railway bridge information.  
22. **LevelCrossings** – Level crossing details.  
23. **ControlRooms** – Control room management.  
24. **Timetables** – Train timetables.  
25. **Announcements** – Railway announcements.  

---

## 📊 Features Implemented
- **Database Creation & Schema Design**  
- **Entity Definitions with Primary Keys & Constraints**  
- **Data Insertion** (20+ sample records in major tables)  
- **Basic Queries for Displaying, Truncating, and Dropping Tables**  

---

## ⚙️ Technologies Used
- **Database**: MySQL  
- **Language**: SQL (DDL, DML, DQL)  
- **Environment**: MySQL Workbench / Command Line  

---

## 🚀 How to Use
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/indian-railway-db-phase1.git
   cd indian-railway-db-phase1

