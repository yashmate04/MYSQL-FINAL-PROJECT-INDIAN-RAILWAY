---

# MySQL Final Project: Indian Railway Database System 🎯

This repository provides a comprehensive MySQL-based project simulating the Indian Railway system. It's ideal for students, learners, and enthusiasts looking to design, build, query, and manage a relational database using real-world concepts.

---

## 📦 Repository Structure

```
/
├── /schemas
│   ├── `create_tables.sql`        — Defines core tables: Stations, Trains, Routes, Tickets, Passengers, etc.
│   └── `drop_tables.sql`          — Safely removes tables for reruns or resets.
│
├── /data
│   └── `sample_data.sql`          — Populates tables with representative test data.
│
├── /queries
│   ├── `basic_queries.sql`        — SELECT, INSERT, UPDATE, DELETE examples.
│   ├── `advanced_queries.sql`     — Aggregate functions, subqueries, views, and transactions.
│   └── `report_queries.sql`       — Realistic business use cases: passenger count, seat availability, fare reports.
│
├── /exercises
│   └── `exercise_instructions.md` — Task list for practice and self-assessment.
│
└── `README.md`                    — This documentation file.
```

---

## ✏️ Getting Started

1. **Clone the repo**

   ```bash
   git clone https://github.com/<your-username>/MYSQL-FINAL-PROJECT-INDIAN-RAILWAY.git
   cd MYSQL-FINAL-PROJECT-INDIAN-RAILWAY
   ```

2. **Create the schema**
   Run:

   ```sql
   SOURCE schemas/create_tables.sql;
   ```

3. **Insert sample data**
   Load:

   ```sql
   SOURCE data/sample_data.sql;
   ```

4. **Explore with queries**

   * Practice fundamental operations:

     ```sql
     SOURCE queries/basic_queries.sql;
     ```
   * Dive deeper:

     ```sql
     SOURCE queries/advanced_queries.sql;
     ```
   * Generate useful reports:

     ```sql
     SOURCE queries/report_queries.sql;
     ```

5. **Try exercises**

   * Open and follow the prompts in:

     ```bash
     less exercises/exercise_instructions.md
     ```
   * Apply your own SQL statements, then validate against expected outputs.

---

## 🧠 What You’ll Learn

* **Database Design**: Schema planning, normalization, specifying primary/foreign keys
* **SQL Proficiency**:

  * *CRUD operations*: Create, Read, Update, Delete
  * *Advanced SQL*: JOINs, GROUP BY, HAVING, subqueries
  * *Transactions & Error Handling*: BEGIN, COMMIT, ROLLBACK
  * *Views*: Simplify complex queries
* **Analytical Reporting**: Generate meaningful statistics—most-traveled routes, ticket trends, etc.

---

## 🎯 Example Queries

* **Available Trains Between Two Stations**

  ```sql
  SELECT t.train_id, t.name, r.departure_time, r.arrival_time
  FROM Trains t
  JOIN Routes r ON t.train_id = r.train_id
  WHERE r.source_station = 'Delhi'
    AND r.dest_station = 'Mumbai'
  ORDER BY r.departure_time;
  ```

* **Count of Passengers per Train**

  ```sql
  SELECT t.train_id, t.name, COUNT(p.passenger_id) AS passengers
  FROM Trains t
  JOIN Tickets tk ON t.train_id = tk.train_id
  JOIN Passengers p ON tk.passenger_id = p.passenger_id
  GROUP BY t.train_id, t.name;
  ```

---

## ✅ Prerequisites

* MySQL 5.7 or above
* Basic SQL knowledge (SELECT, INSERT, UPDATE, DELETE)

### Recommended Tips:

* Use MySQL CLI, MySQL Workbench, or any MySQL-compatible GUI
* Use transactions—specially with data insertions
* Experiment with indexes to see performance impact

---

## 📘 Exercises & Self‑Practice

Refer to `exercises/exercise_instructions.md` for challenges like:

* 🕒 Find top 3 busiest routes during peak hours
* 💳 Calculate total revenue per train or month
* 🧭 Determine frequent passengers (more than *n* trips in *m* months)
* ⚠️ Validate tickets to catch missing or inconsistent entries

---

## 💬 Contributing & Feedback

Feel free to submit issues or pull requests to:

* Add new queries or challenges
* Improve schema normalization
* Provide feedback or suggest features

---

## 📄 License

This project is open-sourced under the **[MIT License](LICENSE)**. Use, modify, and learn freely—attribution appreciated.

---

