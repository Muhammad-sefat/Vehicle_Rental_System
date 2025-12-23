# 🚗 Vehicle Rental System Database

## 📖 Overview
This project designs and implements a PostgreSQL database for a **Vehicle Rental System**.  
It supports three core entities: **Users**, **Vehicles**, and **Bookings**.  
The database ensures proper business logic and constraints to handle real‑world scenarios such as unique emails, unique vehicle registration numbers, valid booking dates, and referential integrity between tables.

---

## 🗂 Tables
- 👤 **Users Table**  
  Stores user role (Admin or Customer), name, email, password, and phone number.  
  - Each email must be unique.  
  - Role is restricted to either Admin or Customer.  

- 🚘 **Vehicles Table**  
  Stores vehicle details including name, type, model, registration number, rental price, and status.  
  - Each registration number must be unique.  
  - Type is restricted to car, bike, or truck.  
  - Status can only be available, rented, or maintenance.  

- 📑 **Bookings Table**  
  Stores booking information linking users and vehicles, with rental dates, status, and total cost.  
  - References both Users and Vehicles tables via foreign keys.  
  - Ensures end date is not earlier than start date.  
  - Status can only be pending or completed.  

---

## ⚙️ Operations (Queries)

- 🔗 **Query 01: JOIN**  
  Retrieves booking information along with customer name and vehicle name.  
  Demonstrates how to combine data across multiple tables using `INNER JOIN`.

- 🚫 **Query 02: NOT EXISTS**  
  Finds all vehicles that have never been booked.  
  Demonstrates how to use `NOT EXISTS` to filter records based on absence in another table.

- 🔍 **Query 03: WHERE**  
  Retrieves all available vehicles of a specific type (e.g., cars).  
  Demonstrates filtering rows using the `WHERE` clause with multiple conditions.

- 📊 **Query 04: GROUP BY + HAVING**  
  Finds the total number of bookings for each vehicle and displays only those with more than 2 bookings.  
  Demonstrates grouping records and applying conditions on aggregated results using `HAVING`.

---

## 📂 Repository Contents
- `queries.sql` → Contains the full database schema, sample data inserts, and all four SQL queries with solutions.  
- `README.md` → Documentation explaining the project, tables, and operations.

---

## ✅ Conclusion
This database design demonstrates how to manage users, vehicles, and bookings with proper constraints and queries to support a vehicle rental business.  
It covers schema creation, sample data insertion, and essential SQL operations for real‑world scenarios.
