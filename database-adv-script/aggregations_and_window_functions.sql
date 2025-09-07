-- ==============================================
-- Task 2: Aggregations and Window Functions
-- File: aggregations_and_window_functions.sql
-- ==============================================

-- 1. Aggregation: Total number of bookings made by each user
SELECT 
    u.user_id,
    u.username,
    COUNT(b.booking_id) AS total_bookings
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.username
ORDER BY total_bookings DESC;

-- ==============================================

-- 2a. Window Function: Rank properties based on the total number of bookings (RANK)
SELECT
    p.property_id,
    p.title AS property_title,
    COUNT(b.booking_id) AS booking_count,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank
FROM Properties p
LEFT JOIN Bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.title
ORDER BY property_rank;

-- ==============================================

-- 2b. Window Function: Row number for properties based on total bookings (ROW_NUMBER)
SELECT
    p.property_id,
    p.title AS property_title,
    COUNT(b.booking_id) AS booking_count,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rownum
FROM Properties p
LEFT JOIN Bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.title
ORDER BY property_rownum;

-- ==============================================
-- END OF FILE
-- ==============================================
