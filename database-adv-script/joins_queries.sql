-- ==============================================
-- Task 0: Joins (Airbnb Database Module)
-- File: joins_queries.sql
-- ==============================================

-- 1. INNER JOIN
-- Retrieve all bookings with user and property details
SELECT 
    b.booking_id,
    u.user_id,
    u.username,
    p.property_id,
    p.title AS property_title,
    b.start_date,
    b.end_date
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Properties p ON b.property_id = p.property_id;

-- ==============================================

-- 2. LEFT JOIN
-- Retrieve all users and their bookings (if any).
-- This ensures users with no bookings are still listed.
SELECT 
    u.user_id,
    u.username,
    b.booking_id,
    b.start_date,
    b.end_date
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id;

-- ==============================================

-- 3. FULL OUTER JOIN
-- Retrieve all properties and bookings,
-- including properties that have never been booked
-- and bookings linked to deleted/missing properties.
SELECT 
    p.property_id,
    p.title AS property_title,
    b.booking_id,
    b.start_date,
    b.end_date
FROM Properties p
FULL OUTER JOIN Bookings b ON p.property_id = b.property_id;

-- ==============================================
-- END OF FILE
-- ==============================================
