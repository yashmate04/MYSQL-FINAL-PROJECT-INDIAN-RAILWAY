[![indiatvnews.com/photos/i...](https://images.openai.com/thumbnails/url/6a4xn3icu1mSUVJSUGylr5-al1xUWVCSmqJbkpRnoJdeXJJYkpmsl5yfq5-Zm5ieWmxfaAuUsXL0S7F0Tw4yMY039yxwS_fLyPIq9vHxD8qrivcNNXH1MzV1jXQuiHBL9K9wd3E2LiiNzPYrrSyMd8oyzSmIKsuoClQrBgAGrCoF)](https://www.indiatvnews.com/photos/india-railway-station-from-where-you-can-catch-trains-to-every-corner-of-india-2025-01-23-972678)

# MySQL Final Project: Indian Railway Database System 🎯

Simulate an Indian Railway system using MySQL! This project is perfect for students, learners, and hobbyists who want to practice designing, querying, and managing a real-world relational database.

---

## 📂 Repository Structure

```
/
├── schemas
│   ├── create_tables.sql      — Define tables: Stations, Trains, Routes, Tickets, Passengers, Employees, etc.
│   └── drop_tables.sql        — Drop tables safely for resets or reruns.
│
├── data
│   └── sample_data.sql        — Populate the database with realistic test data.
│
├── queries
│   ├── basic_queries.sql      — Core CRUD operations (SELECT, INSERT, UPDATE, DELETE).
│   ├── advanced_queries.sql   — JOINs, GROUP BY, HAVING, subqueries, transactions.
│   └── report_queries.sql     — Business-style reports: passenger counts, fare summaries, etc.
│
├── exercises
│   └── exercise_instructions.md — Guided tasks for hands-on practice and self-assessment.
│
└── README.md                  — You are here!
```

---

## 🚀 Getting Started

1. **Clone the repository**

   ```bash
   git clone https://github.com/<your-username>/MYSQL-FINAL-PROJECT-INDIAN-RAILWAY.git
   cd MYSQL-FINAL-PROJECT-INDIAN-RAILWAY
   ```

2. **Create the database schema**

   ```sql
   SOURCE schemas/create_tables.sql;
   ```

3. **Insert sample data**

   ```sql
   SOURCE data/sample_data.sql;
   ```

4. **Run example queries**

   * Basic:

     ```sql
     SOURCE queries/basic_queries.sql;
     ```
   * Advanced:

     ```sql
     SOURCE queries/advanced_queries.sql;
     ```
   * Reports:

     ```sql
     SOURCE queries/report_queries.sql;
     ```

5. **Attempt the exercises**

   ```bash
   less exercises/exercise_instructions.md
   ```

   Write queries to complete the tasks and validate your results.

---

## 🧠 Learnings & Concepts Covered

You'll gain hands-on exposure to:

* **Database modeling**: Create normalized schemas with primary/foreign keys.
* **SQL fundamentals**: SELECT, INSERT, UPDATE, DELETE.
* **Advanced SQL**: JOIN, GROUP BY, HAVING, subqueries, views.
* **Transactions**: BEGIN, COMMIT, ROLLBACK for safe data operations.
* **Reporting**: Generate real-world insights—e.g., busiest routes, revenue trends.

---

## 🔍 Sample SQL Queries

* **Find trains between two stations:**

  ```sql
  SELECT t.train_id, t.name, r.departure_time, r.arrival_time
  FROM Trains t
  JOIN Routes r ON t.train_id = r.train_id
  WHERE r.source_station = 'Delhi'
    AND r.dest_station = 'Mumbai'
  ORDER BY r.departure_time;
  ```

* **Count passengers per train:**

  ```sql
  SELECT t.train_id, t.name, COUNT(DISTINCT tk.passenger_id) AS passenger_count
  FROM Trains t
  JOIN Tickets tk ON t.train_id = tk.train_id
  GROUP BY t.train_id, t.name;
  ```

---

## ✅ Prerequisites

* MySQL 5.7 or newer
* Familiarity with basic SQL commands (SELECT, INSERT, UPDATE, DELETE)
* Recommended: Use MySQL Workbench, CLI, or any GUI tool. Use transactions and test performance with indexing.

---

## 🎯 Exercises & Practice Ideas

Explore these exercises in `exercises/exercise_instructions.md`:

* Identify top 3 busiest routes during peak hours
* Calculate total revenue by train and month
* Find frequent travellers (e.g. > *n* trips in *m* months)
* Check for data anomalies like unbooked seats or missing routes

---

## 💬 Contributing & Feedback

Contributions are welcome! Suggestions include:

* Adding new query examples or reports
* Enhancing database schema or normalization
* Improved sample data or documentation

Submit a PR or open an issue to share your ideas.

---

## 📄 License

Distributed under the **[MIT License](LICENSE)**—learn, modify, and share freely. Attribution appreciated!

---

*Tip: Use this project as a template to build your own railway, ticketing, or logistics database—customize it with more entities, tools, or languages as your skills grow.*
