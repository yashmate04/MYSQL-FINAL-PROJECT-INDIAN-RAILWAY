Here is a `README.md` file you can use for your Phase 5 GitHub repository.

-----

# Consulting Firm Management System: Phase 5 - Advanced SQL

This repository contains the SQL scripts for **Phase 5** of the Consulting Firm Management System database project. This phase focuses on demonstrating a comprehensive range of advanced SQL concepts, including **Data Definition Language (DDL)**, **Data Manipulation Language (DML)**, **Data Query Language (DQL)**, and advanced features like **stored procedures, triggers, transactions, and window functions**.

The scripts are organized into logical sections to showcase different aspects of SQL functionality.

## Table of Contents

  - [DDL (Data Definition Language)](https://www.google.com/search?q=%23ddl-data-definition-language)
  - [DML (Data Manipulation Language)](https://www.google.com/search?q=%23dml-data-manipulation-language)
  - [DQL (Data Query Language)](https://www.google.com/search?q=%23dql-data-query-language)
  - [Clauses & Operators](https://www.google.com/search?q=%23clauses--operators)
  - [Constraints & Cascades](https://www.google.com/search?q=%23constraints--cascades)
  - [Joins](https://www.google.com/search?q=%23joins)
  - [Subqueries](https://www.google.com/search?q=%23subqueries)
  - [Functions](https://www.google.com/search?q=%23functions)
  - [Views & Common Table Expressions (CTE)](https://www.google.com/search?q=%23views--common-table-expressions-cte)
  - [Stored Procedures](https://www.google.com/search?q=%23stored-procedures)
  - [Window Functions](https://www.google.com/search?q=%23window-functions)
  - [Transactions](https://www.google.com/search?q=%23transactions)
  - [Triggers](https://www.google.com/search?q=%23triggers)

-----

## DDL (Data Definition Language)

This section contains 10 queries for managing database structure.

  - `CREATE TABLE`: Creates new tables, such as `EmployeeCertifications` and `OfficeLocations`.
  - `ALTER TABLE`: Modifies existing tables to add columns (`MiddleName`), drop columns (`Objectives`), or add constraints (`UNIQUE`, `CHECK`, `FOREIGN KEY`).
  - `CREATE INDEX`: Creates an index on the `Projects` table to optimize query performance.
  - `RENAME TABLE`: Renames the `Trainings` table to `TrainingPrograms` for better clarity.
  - `DROP TABLE`: Demonstrates how to drop a table if it exists.

## DML (Data Manipulation Language)

This section includes 10 queries for manipulating data within the tables.

  - `INSERT INTO`: Inserts single and bulk records for consultants, clients, projects, and timesheets.
  - `UPDATE`: Modifies data, such as updating a consultant's salary or a project's status.
  - `DELETE FROM`: Removes data based on specified conditions, like deleting old timesheet entries or resources marked as 'Damaged'.

-----

## DQL (Data Query Language)

This section includes 10 fundamental queries for retrieving and analyzing data.

  - `SELECT`: Retrieves data from various tables.
  - `WHERE`: Filters results based on criteria (e.g., active consultants, projects from a specific year).
  - `ORDER BY`: Sorts query results.
  - `COUNT`, `SUM`: Uses aggregate functions to count projects per client or sum total hours worked.
  - `JOIN`: Combines data from multiple tables.
  - `GROUP BY`: Groups rows that have the same values to perform summary operations.

-----

## Clauses & Operators

This section highlights 10 queries using various SQL clauses and operators for more complex filtering.

  - `AND`, `OR`: Combines multiple conditions.
  - `BETWEEN`: Filters data within a specified range (e.g., project budgets).
  - `LIKE`: Performs pattern matching (`'A%'`).
  - `IN`: Specifies multiple possible values in a `WHERE` clause.
  - `ANY`, `ALL`: Compares a value to a list of values returned by a subquery.
  - `NOT LIKE`: Excludes records based on a pattern.

-----

## Constraints & Cascades

This section demonstrates the use of constraints, particularly focusing on foreign key relationships and cascade actions.

  - `ON DELETE CASCADE`: Deletes dependent child records when a parent record is deleted (e.g., deleting a project also deletes its tasks).
  - `ON UPDATE CASCADE`: Updates dependent child records when a parent record is updated.
  - `ON DELETE SET NULL`: Sets the foreign key to `NULL` instead of deleting the child record.
  - `PRIMARY KEY`: Creates composite primary keys on junction tables.
  - Self-referencing foreign keys to create a hierarchical structure.

-----

## Joins

This section contains 10 queries demonstrating various types of SQL joins to combine data from multiple tables.

  - `INNER JOIN`: Retrieves matching records from two tables.
  - `LEFT JOIN`: Retrieves all records from the left table and matching records from the right.
  - `RIGHT JOIN`: Retrieves all records from the right table and matching records from the left.
  - `SELF JOIN`: Joins a table to itself to find related records within the same table.
  - `UNION`: Combines the result sets of two `SELECT` statements (used here to simulate a `FULL OUTER JOIN`).

-----

## Subqueries

This section showcases 10 queries using subqueries to perform operations that cannot be done with simple `WHERE` clauses.

  - `Scalar Subquery`: Returns a single value (e.g., `WHERE Budget > (SELECT AVG(Budget) FROM Projects)`).
  - `Correlated Subquery`: A subquery that depends on the outer query (e.g., `WHERE c.Salary > (SELECT AVG(c2.Salary) FROM Consultants c2 WHERE c2.Specialization = c.Specialization)`).
  - `EXISTS` and `NOT EXISTS`: Checks for the existence of rows returned by a subquery.
  - `ANY` and `ALL`: Used with subqueries to compare against multiple values.

-----

## Functions

This section demonstrates 10 queries using built-in SQL functions for data manipulation and aggregation.

  - **Aggregate Functions**: `COUNT`, `SUM`, `AVG`, `MAX`.
  - **String Functions**: `UPPER`, `LOWER`, `LENGTH`, `CONCAT`.
  - **Date/Time Functions**: `YEAR`, `CURDATE`, `DATEDIFF`, `DATE_SUB`.

-----

## Views & Common Table Expressions (CTE)

This section includes 10 queries for creating and using views and CTEs to simplify complex queries and improve readability.

  - `CREATE VIEW`: Creates virtual tables, such as `ConsultantInfo` and `ProjectSummary`.
  - `WITH ... AS`: Defines a temporary, named result set for use within a single query.
  - `RECURSIVE CTE`: Demonstrates a recursive CTE to generate a sequence of numbers.

-----

## Stored Procedures

This section contains 5 examples of stored procedures to encapsulate and reuse SQL logic.

  - Procedures to `AddClient`, `UpdateProjectStatus`, and `DeleteConsultant`.
  - A procedure with an `OUT` parameter to return the total invoice amount for a client.
  - A procedure to insert a new timesheet entry.

-----

## Window Functions

This section provides 5 queries using window functions to perform calculations across a set of table rows.

  - `ROW_NUMBER()`: Assigns a unique row number.
  - `RANK()`: Assigns a rank to each row within its partition.
  - `LEAD()` and `LAG()`: Accesses data from a subsequent or previous row in the same result set.
  - `PARTITION BY`: Divides the query result set into partitions for independent processing by the window function.

-----

## Transactions

This section includes 5 queries to manage transactions, ensuring data integrity through `COMMIT` and `ROLLBACK`.

  - `START TRANSACTION`: Begins a new transaction.
  - `COMMIT`: Saves changes permanently.
  - `ROLLBACK`: Undoes all changes since the last `COMMIT` or `START TRANSACTION`.
  - `SAVEPOINT`: Sets a temporary placeholder to which you can `ROLLBACK` a part of the transaction.

-----

## Triggers

This section contains 5 examples of triggers to automate actions based on database events (`INSERT`, `UPDATE`, `DELETE`).

  - **`AFTER INSERT`**: Automatically updates a project budget when a new timesheet entry is added.
  - **`BEFORE UPDATE`**: Prevents a project's budget from being drastically reduced.
  - **`AFTER DELETE`**: Logs deleted client IDs to an audit table.
  - **`AFTER UPDATE`**: Marks an invoice as "Paid" when a payment status is updated to "Completed".
  - **`BEFORE INSERT`**: Sets a default value for a column if none is provided.



