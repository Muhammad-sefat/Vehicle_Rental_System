# 🚗 Vehicle Rental System

## 📖 Overview
This project designs and implements a PostgreSQL database for a **Vehicle Rental System**.  
It supports three core entities: **Users**, **Vehicles**, and **Bookings**.  
The database ensures proper business logic and constraints to handle real‑world scenarios.

---

## 🗂 Tables
- 👤 **Users Table**: Stores user role, name, email, password, and phone number.  
- 🚘 **Vehicles Table**: Stores vehicle details including name, type, model, registration number, rental price, and status.  
- 📑 **Bookings Table**: Stores booking information linking users and vehicles, with rental dates, status, and total cost.  

---

## ⚙️ Operations
- 🔗 **JOIN**: Retrieve booking information along with customer name and vehicle name.  
- 🚫 **NOT EXISTS**: Find all vehicles that have never been booked.  
- 🔍 **WHERE**: Retrieve all available vehicles of a specific type (e.g., ). bike 
- 📊 **GROUP BY + HAVING**: Find the total number of bookings for each vehicle and display only those with more than 2 bookings.  

---

## ✅ Conclusion
This database design demonstrates how to manage users, vehicles, and bookings with proper constraints and queries to support a vehicle rental business.
