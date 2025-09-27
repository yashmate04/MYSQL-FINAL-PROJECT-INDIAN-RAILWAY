# Indian Railway Management System - SQL Scripts

This repository contains a comprehensive set of SQL scripts for managing an Indian Railway database. These scripts are organized by topic, covering various aspects of database management, from schema design and data manipulation to advanced queries and stored procedures.

-----

## **Table of Contents**

1.  [DDL: Data Definition Language](https://www.google.com/search?q=%23ddl-data-definition-language)
2.  [DML: Data Manipulation Language](https://www.google.com/search?q=%23dml-data-manipulation-language)
3.  [DQL: Data Query Language](https://www.google.com/search?q=%23dql-data-query-language)
4.  [Advanced DQL with Operators](https://www.google.com/search?q=%23advanced-dql-with-operators)
5.  [Constraints and Keys](https://www.google.com/search?q=%23constraints-and-keys)
6.  [SQL Joins](https://www.google.com/search?q=%23sql-joins)
7.  [Subqueries](https://www.google.com/search?q=%23subqueries)
8.  [SQL Functions](https://www.google.com/search?q=%23sql-functions)
9.  [Views and CTEs](https://www.google.com/search?q=%23views-and-ctes)
10. [Stored Procedures](https://www.google.com/search?q=%23stored-procedures)
11. [Window Functions](https://www.google.com/search?q=%23window-functions)
12. [Transactions](https://www.google.com/search?q=%23transactions)
13. [Triggers](https://www.google.com/search?q=%23triggers)

-----

### **DDL: Data Definition Language**

This section includes scripts for creating and modifying the database schema.

  - **`CREATE TABLE`**: Creates the `Alerts` table.
  - **`ALTER TABLE`**: Adds and modifies columns (`DriverID`, `Contact`), and renames tables (`Complaints` to `PassengerComplaints`).
  - **`DROP`**: Deletes tables and columns (`Alerts`, `Remarks`).
  - **`PRIMARY KEY`**: Adds a primary key to the `Parcels` table.
  - **`NOT NULL`**: Adds a `NOT NULL` constraint to the `RouteStatus` column.
  - **`CREATE INDEX`**: Creates an index on the `TrainSchedules` table for faster lookups.

### **DML: Data Manipulation Language**

These scripts focus on managing the data within the tables.

  - **`INSERT`**: Inserts single and multiple records into the `Stations` and `Passengers` tables.
  - **`UPDATE`**: Modifies existing records, such as changing a train's status or updating fares based on a condition.
  - **`DELETE`**: Removes records, including a single record by ID or multiple records based on a condition.

### **DQL: Data Query Language**

This section contains basic queries to retrieve data from the database.

  - **`SELECT`**: Retrieves data based on simple conditions, such as `MaxSpeed` or `State`.
  - **`GROUP BY`**: Groups data to calculate aggregates like `SUM` or `COUNT`.
  - **`ORDER BY`**: Sorts the results of a query.
  - **`LIMIT`**: Restricts the number of rows returned.
  - **`MIN/MAX`**: Finds the minimum and maximum values in a column.

### **Advanced DQL with Operators**

These queries use more complex operators for data filtering.

  - **`IN`**: Selects records that match any value in a list (e.g., `Role IN ('Ticket Checker', 'Attendant')`).
  - **`NOT IN`**: Selects records that do not match any value in a list.
  - **`LIKE`**: Performs pattern matching (e.g., `City LIKE 'M%i'`).
  - **`BETWEEN`**: Selects values within a specified range.
  - **`ANY/ALL`**: Compares a value to every value in a subquery result.

### **Constraints and Keys**

Scripts for enforcing data integrity and relationships between tables.

  - **`UNIQUE`**: Ensures all values in a column are unique.
  - **`CHECK`**: Enforces a condition on the values in a column.
  - **`PRIMARY KEY`**: Defines a column or set of columns that uniquely identifies each row.
  - **`FOREIGN KEY`**: Establishes relationships between tables with different `ON DELETE` and `ON UPDATE` actions (`CASCADE`, `SET NULL`, `RESTRICT`).

### **SQL Joins**

This section demonstrates how to combine rows from multiple tables.

  - **`INNER JOIN`**: Returns records with matching values in both tables.
  - **`LEFT JOIN`**: Returns all records from the left table and the matched records from the right table.
  - **`RIGHT JOIN`**: Returns all records from the right table and the matched records from the left table.
  - **`FULL OUTER JOIN`**: (Simulated with `UNION`) Returns all records when there is a match in either the left or right table.
  - **`SELF JOIN`**: Joins a table to itself to compare records within the same table.

### **Subqueries**

Scripts using subqueries to perform complex queries.

  - **Nested Subquery**: A subquery used within the `WHERE` clause of the outer query.
  - **Correlated Subquery**: A subquery that depends on the outer query for its values.
  - **`EXISTS`**: Used to check for the existence of any rows in a subquery.

### **SQL Functions**

This section covers the use of built-in functions.

  - **Aggregate Functions**: `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX` for performing calculations on sets of rows.
  - **Scalar Functions**: `UPPER`, `LOWER`, `LENGTH`, `CONCAT`, and `TRIM` for operating on single values.

### **Views and CTEs**

Scripts for creating reusable query objects.

  - **`CREATE VIEW`**: Creates a virtual table based on the result of a `SELECT` statement.
  - **`WITH (CTE)`**: Defines a temporary named result set that exists within the scope of a single query.
  - **`ALTER VIEW`**: Modifies an existing view.
  - **`DROP VIEW`**: Deletes a view.

### **Stored Procedures**

This section contains scripts for creating and calling stored procedures.

  - **`CREATE PROCEDURE`**: Defines a reusable set of SQL statements.
  - **`CALL`**: Executes a stored procedure with given parameters.

### **Window Functions**

Scripts using window functions to perform calculations across a set of table rows.

  - **`ROW_NUMBER()`**: Assigns a unique, sequential integer to each row.
  - **`RANK()`**: Ranks rows within a partition, with ties receiving the same rank.
  - **`DENSE_RANK()`**: Similar to `RANK()`, but without gaps in the ranking sequence.
  - **`LEAD()`**: Accesses data from a subsequent row in the result set.
  - **`LAG()`**: Accesses data from a previous row in the result set.

### **Transactions**

These scripts demonstrate how to group SQL statements into a single, all-or-nothing unit of work.

  - **`START TRANSACTION`**: Begins a new transaction.
  - **`COMMIT`**: Saves all changes made during the transaction.
  - **`ROLLBACK`**: Undoes all changes since the last `START TRANSACTION` or `SAVEPOINT`.
  - **`SAVEPOINT`**: Sets a marker within a transaction to which you can roll back.

### **Triggers**

Scripts for creating and managing triggers, which are special stored procedures that are automatically executed in response to certain events on a table.

  - **`BEFORE/AFTER INSERT`**: Executes before or after a new record is inserted.
  - **`BEFORE/AFTER UPDATE`**: Executes before or after an existing record is updated.
  - **`AFTER DELETE`**: Executes after a record is deleted.

Feel free to explore and use these scripts as a reference for database management and querying in a railway context.
