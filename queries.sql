-- Create the database
CREATE DATABASE vehicle_rental_system;

-- Users Table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    role VARCHAR(20) NOT NULL CHECK (role IN ('Admin', 'Customer')),
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(200) NOT NULL,
    phone VARCHAR(30)
);

-- ===== Users: 5 rows =====
INSERT INTO users (role, name, email, password, phone) VALUES
  ('Customer', 'Alice',   'alice@example.com', '12y3ughg3',  '1234567890'),
  ('Admin',    'Bob',  'bob@example.com', '73763vcgf', '0987654321'),
  ('Customer', 'Charlie', 'charlie@example.com', 'password23', '1122334455'),
  ('Customer', 'Diana',   'diana@example.com',  'setere542', '01711111111'),
  ('Customer', 'Evan',    'evan@example.com', 'ter353fcrer', '01722222222');


-- Vehicles Table
CREATE TABLE vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(20) NOT NULL CHECK (type IN ('car', 'bike', 'truck')),
    model VARCHAR(100),
    registration_number VARCHAR(100) NOT NULL UNIQUE,
    rental_price NUMERIC(10,2) NOT NULL CHECK (rental_price > 0),
    status VARCHAR(20) NOT NULL CHECK (status IN ('available', 'rented', 'maintenance'))
);

-- ===== Vehicles: 5 rows =====
INSERT INTO vehicles (name, type, model, registration_number, rental_price, status) VALUES
  ('Toyota Corolla', 'car',  '2022', 'ABC-123',  50, 'available'),
  ('Honda Civic',    'car',  '2021', 'DEF-456',  60, 'rented'),
  ('Yamaha R15',     'bike', '2023', 'GHI-789',  30, 'available'),
  ('Ford F-150',     'truck','2020', 'JKL-012', 100, 'maintenance'),
  ('Suzuki Swift',   'car',  '2022', 'MNO-345',  45, 'available');


-- Bookings Table
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    vehicle_id INTEGER NOT NULL REFERENCES vehicles(vehicle_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'completed')),
    total_cost NUMERIC(12,2) NOT NULL CHECK (total_cost >= 0),
    CHECK (end_date >= start_date)
);

INSERT INTO bookings (user_id, vehicle_id, start_date, end_date, status, total_cost) VALUES
  (1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
  (1, 2, '2023-11-01', '2023-11-03', 'completed', 120),
  (3, 2, '2023-12-01', '2023-12-02', 'completed', 60),
  (1, 1, '2023-12-10', '2023-12-12', 'pending', 100),
  (2, 4, '2024-01-15', '2024-01-18', 'completed', 300);


-- Query 01
SELECT 
    b.booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status
FROM bookings b
INNER JOIN users u 
    ON b.user_id = u.user_id
INNER JOIN vehicles v 
    ON b.vehicle_id = v.vehicle_id
ORDER BY b.booking_id;


-- Query 02
SELECT * FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.vehicle_id
);

  
-- Query 03
SELECT * FROM vehicles
WHERE type = 'car' AND status = 'available';

-- Query 04
SELECT 
    v.name AS vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM vehicles v
INNER JOIN bookings b 
    ON v.vehicle_id = b.vehicle_id
GROUP BY v.name
HAVING COUNT(b.booking_id) > 2
ORDER BY total_bookings DESC;
