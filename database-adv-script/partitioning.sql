-- ==============================================
-- Task 5: Table Partitioning (Airbnb Database Module)
-- File: partitioning.sql
-- ==============================================

-- 1. Create a new partitioned Bookings table based on start_date
-- We'll use RANGE partitioning by year

CREATE TABLE Bookings_Partitioned (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(50),
    amount NUMERIC,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES Users(user_id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES Properties(property_id)
) PARTITION BY RANGE (start_date);

-- ==============================================
-- 2. Create yearly partitions

CREATE TABLE bookings_2023 PARTITION OF Bookings_Partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF Bookings_Partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF Bookings_Partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- ==============================================
-- 3. Insert sample data (optional, for testing)
-- INSERT INTO Bookings_Partitioned (user_id, property_id, start_date, end_date, status, amount)
-- VALUES (1, 2, '2024-03-15', '2024-03-20', 'Confirmed', 500);

-- ==============================================
-- 4. Test query performance with EXPLAIN ANALYZE

-- Query bookings within a specific year
EXPLAIN ANALYZE
SELECT booking_id, user_id, property_id, start_date, end_date
FROM Bookings_Partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

-- Query bookings by date range across partitions
EXPLAIN ANALYZE
SELECT booking_id, user_id, property_id, start_date, end_date
FROM Bookings_Partitioned
WHERE start_date BETWEEN '2023-06-01' AND '2025-02-01';

-- ==============================================
-- END OF FILE
-- ==============================================
